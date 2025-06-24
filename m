Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E8AE70C5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 22:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952C010E143;
	Tue, 24 Jun 2025 20:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d2qJqA+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3677810E12F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 20:31:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 757B9A52184;
 Tue, 24 Jun 2025 20:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F283BC4CEF3;
 Tue, 24 Jun 2025 20:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750797066;
 bh=tNsaHP450SEY2mkWYa5laraTkeQQ7mGoQTMeknOCJe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d2qJqA+vuJBzPZEmJdvOJPs0WGOEq13JW6wHMObIO6JjZjyzC59kYS0rMgQVz9xRc
 PPmmC9MLNNHzvNtgOqZVSyOs8S7mFrn50qWMWq47E1Buka5RUhUI9lvEW4mBtVfbZJ
 RgD1oz/27E8CiqVyZEGdQ0o9sDPc+L+siIN0WMEmIcwPWLyFuIB29YyRyIaRz6bcD0
 R5gihxlSKaMTRXFcBgp9WMd4sNY6liomAd0asqw8rWCA2D+nZKfE37G7FPTw7Jqslh
 qKlKYB6KP2zaaHRV3mcfKIxSNs13z0MmgPEdvVmfZiQ8asJqwD57WLXUI0+HT0MJHl
 34tMP+nNE0+HQ==
From: Mario Limonciello <superm1@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
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
Subject: [PATCH v5 7/9] PCI/VGA: Replace vga_is_firmware_default() with a
 screen info check
Date: Tue, 24 Jun 2025 15:30:40 -0500
Message-ID: <20250624203042.1102346-8-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624203042.1102346-1-superm1@kernel.org>
References: <20250624203042.1102346-1-superm1@kernel.org>
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

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5:
 * split from next patch
---
 drivers/pci/vgaarb.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 78748e8d2dbae..c3457708c01e3 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -556,34 +556,9 @@ EXPORT_SYMBOL(vga_put);
 
 static bool vga_is_firmware_default(struct pci_dev *pdev)
 {
-#if defined(CONFIG_X86)
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
-	struct resource *r;
-	u64 limit;
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
-	return false;
+	return pdev == screen_info_pci_dev(si);
 }
 
 static bool vga_arb_integrated_gpu(struct device *dev)
-- 
2.43.0

