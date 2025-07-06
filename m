Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC5AFA5D7
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 16:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DE310E39E;
	Sun,  6 Jul 2025 14:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N0ZgnBp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B242410E39A
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 14:36:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 48974A4BE1A;
 Sun,  6 Jul 2025 14:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE09FC4CEF5;
 Sun,  6 Jul 2025 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751812602;
 bh=hely8rCeQBZS770H5X6E0gNUH0kghs8qNa/SePVXMhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N0ZgnBp9YJ0UPchsvkNm4Jl8YLOp3FgQq3vRwPImT8zZTiwUzKbkm61vMgG44uuUp
 Bw6wcv+tkgc0SMhw+205GtPxxKjIixNrNNH1pZDki24F8mHiQFO7K/8AXbqBhb0YMy
 RR3Xsa8FB4MFQe6wKLrCzaH5u9Pnb40v0E6IdAQSO6IEnrrKVva31tS3ETN3R9eXkj
 VISu+08ZhhW5aPP7k12X0jDcTu4dgf6CuOwWx8qBwsuMAT7SfPCY1MHth0X886q7q/
 T4c+3Ee8KmK2VfytHViGO2UxV2hYD2bQgmBULGo6JGYpTK0gTCiM/ShN4NPkmlTgRZ
 CmglaNfB+AmmA==
From: Mario Limonciello <superm1@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 iommu@lists.linux.dev (open list:INTEL IOMMU (VT-d)),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 kvm@vger.kernel.org (open list:VFIO DRIVER),
 linux-sound@vger.kernel.org (open list:SOUND),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v7 7/9] PCI/VGA: Replace vga_is_firmware_default() with a
 screen info check
Date: Sun,  6 Jul 2025 09:36:11 -0500
Message-ID: <20250706143613.1972252-8-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250706143613.1972252-1-superm1@kernel.org>
References: <20250706143613.1972252-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

vga_is_firmware_default() checks firmware resources to find the owner
framebuffer resources to find the firmware PCI device.  This is an
open coded implementation of screen_info_pci_dev().  Switch to using
screen_info_pci_dev() instead.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v6:
 * fix lkp robot error
v5:
 * split from next patch
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

