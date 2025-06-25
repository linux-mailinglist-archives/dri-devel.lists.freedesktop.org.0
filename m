Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E2AE80DF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 13:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A269D10E6EE;
	Wed, 25 Jun 2025 11:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bO3/rUN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3878210E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:24:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3B01BA522BA;
 Wed, 25 Jun 2025 11:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0411C4CEEA;
 Wed, 25 Jun 2025 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750850659;
 bh=6MCxHzlhJtbniE95+N2tZVYCQva4I/VEtsiTyl7CH0A=;
 h=From:To:Cc:Subject:Date:From;
 b=bO3/rUN91dW4hkABPvS/nDIIvGsX44ZMZ7/opy/wGI6KYo5zUW0pOpC6TFuQJuqzP
 lSDDSkTFFvpWChJtmEKtZcc+X/oQ4cjTil+mq432PEKMJi2hiHgku2MLqz3TqJbar3
 rD3im3DapboyY2n2V9PApVUcqr4B5Wz/K7gOEdZU4mwz5t1rPCcgOzacNFfFQ0xQIq
 CtPYCw1PtjhYBbFdoCqvgdrebLxuRPtCZYWKBzffW7d6MbAFRtl2Yn6w0NB5Lqftlt
 VUNCNGwTOrKLfiyxTAzVs/2t8tee4Reo4XHGKU0kJTKWyFzyI4eteRhD++ookEJgn9
 +H0p8aN0vJHzg==
From: Hans de Goede <hansg@kernel.org>
To: David Airlie <airlied@redhat.com>
Cc: Hans de Goede <hansg@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] agp/amd64: Only try host-bridges when agp_try_unsupported is
 set
Date: Wed, 25 Jun 2025 13:24:11 +0200
Message-ID: <20250625112411.4123-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
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

On modern AMD Ryzen systems the IOMMU code initializes early on adding
resources to the "00:00.2 IOMMU" PCI-device without binding a driver to
it (because it needs to run early).

Subsequently trying to bind a driver to it will then fail with -EBUSY
because of this check in drivers/base/dd.c: really_probe():

        dev_dbg(dev, "bus: '%s': %s: probing driver %s with device\n",
                drv->bus->name, __func__, drv->name);
        if (!list_empty(&dev->devres_head)) {
                dev_crit(dev, "Resources present before probing\n");
                ret = -EBUSY;
                goto done;
        }

Notice the dev_crit() logging here, this is a problem because anything
logged at critical or higher level will actually get logged to the console
even when quiet is present breaking flicker free boot and this is happening
on most AMD Ryzen systems, e.g. :

[    1.141358] pci 0000:00:00.0: bus: 'pci': really_probe: probing driver agpgart-amd64 with device
[    1.141441] pci 0000:00:00.2: bus: 'pci': really_probe: probing driver agpgart-amd64 with device
[    1.141444] pci 0000:00:00.2: Resources present before probing
[    1.141450] pci 0000:00:01.0: bus: 'pci': really_probe: probing driver agpgart-amd64 with device
[    1.141496] pci 0000:00:02.0: bus: 'pci': really_probe: probing driver agpgart-amd64 with device

The real issue here is that the agpgart-amd64 driver is probing all
PCI-devices because the match in agp_amd64_pci_promisc_table[] matches all
PCI-devices.

As can be seen from the class matches in agp_amd64_pci_table[], AGP support
is always part of the host-bridge. Change the match in
agp_amd64_pci_promisc_table[] to only match on host-bridges, so that
the IOMMU will no longer get probed with the agpgart-amd64 driver.

This not only fixes the troublesome dev_crit() logging it should also speed
up things in general.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Given how old AGP is I would expect the agp_amd64_pci_table[] to be
complete and I wonder if maybe we should not change the default of
the AMD specific agp_try_unsupported to 0? Note the global non AMD
specific agp_try_unsupported_boot flag already defaults to 0.
---
 drivers/char/agp/amd64-agp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index bf490967241a..3f9f4fa3a3f5 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -721,7 +721,7 @@ static const struct pci_device_id agp_amd64_pci_table[] = {
 MODULE_DEVICE_TABLE(pci, agp_amd64_pci_table);
 
 static const struct pci_device_id agp_amd64_pci_promisc_table[] = {
-	{ PCI_DEVICE_CLASS(0, 0) },
+	{ PCI_DEVICE_CLASS((PCI_CLASS_BRIDGE_HOST << 8), ~0) },
 	{ }
 };
 
-- 
2.49.0

