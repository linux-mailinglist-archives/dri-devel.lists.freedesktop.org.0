Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29152AE286F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 11:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAD410E031;
	Sat, 21 Jun 2025 09:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Sat, 21 Jun 2025 09:45:56 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAF910E031
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 09:45:56 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 3C6B02C06849;
 Sat, 21 Jun 2025 11:40:24 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 1DA393A19EA; Sat, 21 Jun 2025 11:40:24 +0200 (CEST)
Message-Id: <f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sat, 21 Jun 2025 11:40:23 +0200
Subject: [PATCH] agp/amd64: Bind to unsupported devices only if AGP is present
To: David Airlie <airlied@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andi Kleen <ak@linux.intel.com>, Ahmed Salem <x0rw3ll@gmail.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-pci@vger.kernel.org
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

Since commit 172efbb40333 ("AGP: Try unsupported AGP chipsets on x86-64 by
default"), the AGP driver for AMD Opteron/Athlon64 CPUs attempts to bind
to any PCI device.

On modern CPUs exposing an AMD IOMMU, this results in a message with
KERN_CRIT severity:

  pci 0000:00:00.2: Resources present before probing

The driver used to bind only to devices exposing the AGP Capability, but
that restriction was removed by commit 6fd024893911 ("amd64-agp: Probe
unknown AGP devices the right way").

Reinstate checking for AGP presence to avoid the message.

Fixes: 3be5fa236649 (Revert "iommu/amd: Prevent binding other PCI drivers to IOMMU PCI devices")
Reported-by: Fedor Pchelkin <pchelkin@ispras.ru>
Closes: https://lore.kernel.org/r/wpoivftgshz5b5aovxbkxl6ivvquinukqfvb5z6yi4mv7d25ew@edtzr2p74ckg/
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
Compile tested only, I do not have a machine with AMD IOMMU at my disposal.

Reporter is not cc'ed because ispras.ru is an OFAC sanctioned entity,
which prohibits me from two-way engagement with the reporter:
https://sanctionssearch.ofac.treas.gov/Details.aspx?id=50890
https://www.linuxfoundation.org/blog/navigating-global-regulations-and-open-source-us-ofac-sanctions

 drivers/char/agp/amd64-agp.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index bf49096..4bf508b 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -735,6 +735,18 @@ static int agp_amd64_resume(struct device *dev)
 	.driver.pm  = &agp_amd64_pm_ops,
 };
 
+static bool __init agp_dev_present(void)
+{
+	struct pci_dev *pdev = NULL;
+
+	for_each_pci_dev(pdev)
+		if (pci_find_capability(pdev, PCI_CAP_ID_AGP)) {
+			pci_dev_put(pdev);
+			return true;
+		}
+
+	return false;
+}
 
 /* Not static due to IOMMU code calling it early. */
 int __init agp_amd64_init(void)
@@ -761,7 +773,7 @@ int __init agp_amd64_init(void)
 		}
 
 		/* First check that we have at least one AMD64 NB */
-		if (!amd_nb_num()) {
+		if (!amd_nb_num() || !agp_dev_present()) {
 			pci_unregister_driver(&agp_amd64_pci_driver);
 			return -ENODEV;
 		}
-- 
2.47.2

