Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9132224397
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 20:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA306E0D9;
	Fri, 17 Jul 2020 18:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AF36E0D9;
 Fri, 17 Jul 2020 18:58:30 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f11f4c90000>; Fri, 17 Jul 2020 11:58:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 17 Jul 2020 11:58:30 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 11:58:30 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 18:58:30 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 17 Jul 2020 18:58:29 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.74]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f11f4d50000>; Fri, 17 Jul 2020 11:58:29 -0700
From: James Jones <jajones@nvidia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
Subject: [PATCH] drm/nouveau: Accept 'legacy' format modifiers
Date: Fri, 17 Jul 2020 11:57:57 -0700
Message-ID: <20200717185757.2786-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595012297; bh=2t0eesWzsoG2op7SkfO1G02lUoOtw11S4/Ld+ehKJYQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=doFMCg1/00YZnQgvEuVxVzhSBKGZktD0kOL0oo/A20RSEBmw9hN7gSzNZhhMILBmq
 T9cvtm507ZRi42WLIDmd76mqiU0GZmToLYC2X3rnT033BCWd1ZWJ9PX1vWH0h2f7iK
 FSyjcUidJrirG0suqMIN1dLeeqWJl/ZoSkMyJRnTdD22gpfW63YAiy5OOKzC9ppy5O
 Ut1S1ub8CRwtyEdZCQPr/RdgBtiPj99nt+ZAgvZZZP9H9AFto8DRBe0fGaMOgoVdjn
 CE79+lJegCD8YCDGic+xgzlhU0LrIx2BuNMEqDlUpp+h9VzV4oCMHSupVSeTkZ0pPm
 WCVfpH/IZ6eaw==
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
Cc: Nouveau <nouveau@lists.freedesktop.org>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
family of modifiers to handle broken userspace
Xorg modesetting and Mesa drivers.

Tested with Xorg 1.20 modesetting driver,
weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
gnome & KDE wayland desktops from Ubuntu 18.04,
and sway 1.5

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 496c4621cc78..31543086254b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
 		   uint32_t *tile_mode,
 		   uint8_t *kind)
 {
+	struct nouveau_display *disp = nouveau_display(drm->dev);
 	BUG_ON(!tile_mode || !kind);
 
+	if ((modifier & (0xffull << 12)) == 0ull) {
+		/* Legacy modifier.  Translate to this device's 'kind.' */
+		modifier |= disp->format_modifiers[0] & (0xffull << 12);
+	}
+
 	if (modifier == DRM_FORMAT_MOD_LINEAR) {
 		/* tile_mode will not be used in this case */
 		*tile_mode = 0;
@@ -227,6 +233,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
 	}
 }
 
+static const u64 legacy_modifiers[] = {
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
+	DRM_FORMAT_MOD_INVALID
+};
+
 static int
 nouveau_validate_decode_mod(struct nouveau_drm *drm,
 			    uint64_t modifier,
@@ -247,8 +263,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
 	     (disp->format_modifiers[mod] != modifier);
 	     mod++);
 
-	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
-		return -EINVAL;
+	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
+		for (mod = 0;
+		     (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
+		     (legacy_modifiers[mod] != modifier);
+		     mod++);
+		if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
+			return -EINVAL;
+	}
 
 	nouveau_decode_mod(drm, modifier, tile_mode, kind);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
