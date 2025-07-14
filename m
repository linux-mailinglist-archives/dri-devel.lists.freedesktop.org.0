Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6DB0494E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 23:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D04A10E4E8;
	Mon, 14 Jul 2025 21:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IvZs3O44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B0210E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 21:22:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A9A2AA573E4;
 Mon, 14 Jul 2025 21:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135E8C4CEF6;
 Mon, 14 Jul 2025 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752528141;
 bh=qH+nP7l6aO/IuqqbAQWnlb+L+ux6ugVAwetscoen+88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IvZs3O44p7tmoIZb3GY57LVIsVIBKAI4pBVbYywJ/+QIuBtDhGRmvlAU1KRtuZIOS
 RvcR3dN21vYvxsi8I60Jx76yVakJsvYSm5UmVEgjVU5d0zia0Vby3Lzzyhi01HlCYF
 pnvJU9RM9H5FHyhsSvhKijPD5n/twfH7FegQAh2B/BVjI0hCteMoq5V/lWTYrrV1pQ
 qmT8InPp6HSWfkMCXjIopbDaWMYzyeAXqj1+eYGQXYFjpQx7IHNlQ9hu7mfOTFNjrY
 0nqOYUbph1gBRxdf9Kf9VgqYIGab2lN9CDoHUPInw8Vz5etkLdzj3A4GgIl6G3NbpP
 RKPG+7FSf71PQ==
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
Subject: [PATCH v8 8/9] fbcon: Use screen info to find primary device
Date: Mon, 14 Jul 2025 16:21:45 -0500
Message-ID: <20250714212147.2248039-9-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714212147.2248039-1-superm1@kernel.org>
References: <20250714212147.2248039-1-superm1@kernel.org>
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

On systems with non VGA GPUs fbcon can't find the primary GPU because
video_is_primary_device() only checks the VGA arbiter.

Add a screen info check to video_is_primary_device() so that callers
can get accurate data on such systems.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v8:
 * add guards for the non CONFIG_SCREEN_INFO case
v5:
 * Only change video-common.c
v4:
 * use helper
---
 arch/x86/video/video-common.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
index 81fc97a2a837a..4bbfffec4b640 100644
--- a/arch/x86/video/video-common.c
+++ b/arch/x86/video/video-common.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/screen_info.h>
 #include <linux/vgaarb.h>
 
 #include <asm/video.h>
@@ -27,6 +28,9 @@ EXPORT_SYMBOL(pgprot_framebuffer);
 
 bool video_is_primary_device(struct device *dev)
 {
+#ifdef CONFIG_SCREEN_INFO
+	struct screen_info *si = &screen_info;
+#endif
 	struct pci_dev *pdev;
 
 	if (!dev_is_pci(dev))
@@ -34,7 +38,18 @@ bool video_is_primary_device(struct device *dev)
 
 	pdev = to_pci_dev(dev);
 
-	return (pdev == vga_default_device());
+	if (!pci_is_display(pdev))
+		return false;
+
+	if (pdev == vga_default_device())
+		return true;
+
+#ifdef CONFIG_SCREEN_INFO
+	if (pdev == screen_info_pci_dev(si))
+		return true;
+#endif
+
+	return false;
 }
 EXPORT_SYMBOL(video_is_primary_device);
 
-- 
2.43.0

