Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F4B211CE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 18:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703B010E51F;
	Mon, 11 Aug 2025 16:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YOk9zvjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281EF10E518
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 16:26:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 699B8A57455;
 Mon, 11 Aug 2025 16:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26C9C4CEF8;
 Mon, 11 Aug 2025 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754929575;
 bh=3qWKQM0HeorWqsuGJKtJ97sthSR1l4jtNX1BHSpBD1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YOk9zvjI403VpTO2HOJ64iKT6OeNpu0nCB2AK2EvA4q+UAc/taaEHbm6M0S8r/Asn
 ESm1wZ8m8CcBIe3RCrFuk5taAeBXUPia44525IAPKom/B5NemGwFXe6fsSxxV+0ayZ
 dpPbn+a8rTgfnwh6myX/LjYwa+bRBXr9Q99SBdGOJptXd4XaVdTAl68fOEDWGJgHdK
 GziqtMtCCXkFMa3ubGoAxbWUcUJvcY6VWIJxvwUbd1MFLTRREcmZTHlHLC1+azKeYp
 fdugt0DypSFz5eKM1CUN42LST8V26IrqWmq/J1j4Mqy9t3hMMS4XDIxnEWAIwUclL7
 Bu1R/3Y6IL3Lw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 Daniel Dadap <ddadap@nvidia.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v10 2/4] PCI/VGA: Replace vga_is_firmware_default() with a
 screen info check
Date: Mon, 11 Aug 2025 11:26:04 -0500
Message-ID: <20250811162606.587759-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811162606.587759-1-superm1@kernel.org>
References: <20250811162606.587759-1-superm1@kernel.org>
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

vga_is_firmware_default() checks firmware resources to find the owner
framebuffer resources to find the firmware PCI device.  This is an
open coded implementation of screen_info_pci_dev().  Switch to using
screen_info_pci_dev() instead.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v10:
 * Rebase on 6.17-rc1
---
 drivers/pci/vgaarb.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 78748e8d2dbae..b58f94ee48916 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -556,34 +556,13 @@ EXPORT_SYMBOL(vga_put);
 
 static bool vga_is_firmware_default(struct pci_dev *pdev)
 {
-#if defined(CONFIG_X86)
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
-	struct resource *r;
-	u64 limit;
+#ifdef CONFIG_SCREEN_INFO
+	struct screen_info *si = &screen_info;
 
-	/* Select the device owning the boot framebuffer if there is one */
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)screen_info.ext_lfb_base << 32;
-
-	limit = base + size;
-
-	/* Does firmware framebuffer belong to us? */
-	pci_dev_for_each_resource(pdev, r) {
-		if (resource_type(r) != IORESOURCE_MEM)
-			continue;
-
-		if (!r->start || !r->end)
-			continue;
-
-		if (base < r->start || limit >= r->end)
-			continue;
-
-		return true;
-	}
-#endif
+	return pdev == screen_info_pci_dev(si);
+#else
 	return false;
+#endif
 }
 
 static bool vga_arb_integrated_gpu(struct device *dev)
-- 
2.43.0

