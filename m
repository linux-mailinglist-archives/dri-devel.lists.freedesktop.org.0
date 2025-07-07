Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D4AFB9FC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1896210E065;
	Mon,  7 Jul 2025 17:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mbRe5jSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBBE10E065
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 17:37:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B8F06A5404A;
 Mon,  7 Jul 2025 17:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04924C4CEF1;
 Mon,  7 Jul 2025 17:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751909843;
 bh=k+z3xFk/BOyEbVfaA5uGnuI3Ptkgemb0gzap96x4cZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mbRe5jSQQabxsauyly2tichpP0HtWxF1AMs7C1F32q606aRTUvBlOopp3JMovX5La
 HO6AfAFAoyEt3oz/0bWAQSq/yicvziySGOxa4dPwStBIZTHaB1dD6wI4YZ3gU/EYU/
 iENZWUIDtEV4E6+80hmW0kRidYqlM0IwUXbGRSFzK8MiCb8IPT58+7J9IY5A40G5Kr
 YvPQMSAP3rYaOAWJYYBwmg1NDtVsZR8bVRKsfs716gJVGU8cbQq3fxkdk7Svwke9ou
 g8zpQuh2khDHfTT/4zfEhE7Icn+xt36UkFfhxFUz9Gcp1mfn1W5EtkqSiADLxmqHy9
 tUaZHP1Sdj64Q==
From: Hans de Goede <hansg@kernel.org>
To: David Airlie <airlied@linux.ie>
Cc: Hans de Goede <hansg@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Andi Kleen <ak@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Fedor Pchelkin <pchelkin@ispras.ru>
Subject: [PATCH 1/3] agp/amd64: Check AGP Capability before binding to
 unsupported devices
Date: Mon,  7 Jul 2025 19:37:08 +0200
Message-ID: <20250707173710.313701-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707173710.313701-1-hansg@kernel.org>
References: <20250707173710.313701-1-hansg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lukas Wunner <lukas@wunner.de>

Since commit 172efbb40333 ("AGP: Try unsupported AGP chipsets on x86-64
by default"), the AGP driver for AMD Opteron/Athlon64 CPUs has attempted
to bind to any PCI device possessing an AGP Capability.

Commit 6fd024893911 ("amd64-agp: Probe unknown AGP devices the right
way") subsequently reworked the driver to perform a bind attempt to
any PCI device (regardless of AGP Capability) and reject a device in
the driver's ->probe() hook if it lacks the AGP Capability.

On modern CPUs exposing an AMD IOMMU, this subtle change results in an
annoying message with KERN_CRIT severity:

  pci 0000:00:00.2: Resources present before probing

The message is emitted by the driver core prior to invoking a driver's
->probe() hook.  The check for an AGP Capability in the ->probe() hook
happens too late to prevent the message.

The message has appeared only recently with commit 3be5fa236649 (Revert
"iommu/amd: Prevent binding other PCI drivers to IOMMU PCI devices").
Prior to the commit, no driver could bind to AMD IOMMUs.

The reason for the message is that an MSI is requested early on for the
AMD IOMMU, which results in a call from msi_sysfs_create_group() to
devm_device_add_group().  A devres resource is thus attached to the
driver-less AMD IOMMU, which is normally not allowed, but presumably
cannot be avoided because requesting the MSI from a regular PCI driver
might be too late.

Avoid the message by once again checking for an AGP Capability *before*
binding to an unsupported device.  Achieve that by way of the PCI core's
dynid functionality.

pci_add_dynid() can fail only with -ENOMEM (on allocation failure) or
-EINVAL (on bus_to_subsys() failure).  It doesn't seem worth the extra
code to propagate those error codes out of the for_each_pci_dev() loop,
so simply error out with -ENODEV if there was no successful bind attempt.
In the -ENOMEM case, a splat is emitted anyway, and the -EINVAL case can
never happen because it requires failure of bus_register(&pci_bus_type),
in which case there's no driver probing of PCI devices.

Hans has voiced a preference to no longer probe unsupported devices by
default (i.e. set agp_try_unsupported = 0).  In fact, the help text for
CONFIG_AGP_AMD64 pretends this to be the default.  Alternatively, he
proposes probing only devices with PCI_CLASS_BRIDGE_HOST.  However these
approaches risk regressing users who depend on the existing behavior.

Fixes: 3be5fa236649 (Revert "iommu/amd: Prevent binding other PCI drivers to IOMMU PCI devices")
Reported-by: Fedor Pchelkin <pchelkin@ispras.ru>
Closes: https://lore.kernel.org/r/wpoivftgshz5b5aovxbkxl6ivvquinukqfvb5z6yi4mv7d25ew@edtzr2p74ckg/
Reported-by: Hans de Goede <hansg@kernel.org>
Closes: https://lore.kernel.org/r/20250625112411.4123-1-hansg@kernel.org/
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/r/b29e7fbfc6d146f947603d0ebaef44cbd2f0d754.1751468802.git.lukas@wunner.de
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/char/agp/amd64-agp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index bf490967241a..2505df1f4e69 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -720,11 +720,6 @@ static const struct pci_device_id agp_amd64_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, agp_amd64_pci_table);
 
-static const struct pci_device_id agp_amd64_pci_promisc_table[] = {
-	{ PCI_DEVICE_CLASS(0, 0) },
-	{ }
-};
-
 static DEFINE_SIMPLE_DEV_PM_OPS(agp_amd64_pm_ops, NULL, agp_amd64_resume);
 
 static struct pci_driver agp_amd64_pci_driver = {
@@ -739,6 +734,7 @@ static struct pci_driver agp_amd64_pci_driver = {
 /* Not static due to IOMMU code calling it early. */
 int __init agp_amd64_init(void)
 {
+	struct pci_dev *pdev = NULL;
 	int err = 0;
 
 	if (agp_off)
@@ -767,9 +763,13 @@ int __init agp_amd64_init(void)
 		}
 
 		/* Look for any AGP bridge */
-		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
-		err = driver_attach(&agp_amd64_pci_driver.driver);
-		if (err == 0 && agp_bridges_found == 0) {
+		for_each_pci_dev(pdev)
+			if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
+				pci_add_dynid(&agp_amd64_pci_driver,
+					      pdev->vendor, pdev->device,
+					      pdev->subsystem_vendor,
+					      pdev->subsystem_device, 0, 0, 0);
+		if (agp_bridges_found == 0) {
 			pci_unregister_driver(&agp_amd64_pci_driver);
 			err = -ENODEV;
 		}
-- 
2.49.0

