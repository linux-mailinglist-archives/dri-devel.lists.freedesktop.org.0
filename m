Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92FB2337A6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 19:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0AC6E934;
	Thu, 30 Jul 2020 17:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C8C6E932;
 Thu, 30 Jul 2020 17:26:18 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2302ac0000>; Thu, 30 Jul 2020 10:26:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 30 Jul 2020 10:26:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 30 Jul 2020 10:26:17 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 17:26:17 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 Jul 2020 17:26:17 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.40.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2302b80002>; Thu, 30 Jul 2020 10:26:17 -0700
From: James Jones <jajones@nvidia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
Subject: [PATCH v3] drm/nouveau: Accept 'legacy' format modifiers
Date: Thu, 30 Jul 2020 10:26:17 -0700
Message-ID: <20200730172617.4158-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596129964; bh=yj6I/tswEDZkbNgoWPblFKyTVQJWVK63ClUftv9o7DM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=eBekScyKvdKlGQktObwIA/rZi22Ou4NWHbLoJJ7vpwJpDgYoJRdeyl154WX5bmazZ
 cLJB7dvY0vG5WbBZf1OVWHNlzSQ5fDmjeoAFw++GTiqqkM8BPQeLI8/53rd7ea06yT
 +8pbctqxU/mP2XcQr4DRMGNoonmVJoVgxYGLPGv5y7hUr6QTxOgbaadlViYSIRqEOY
 kunHhExBEq50Jv+1JsLZYeI7kx1p+ZNVqQzosmOWGC/xhZB2v5eROL2QzjRD/cD5ht
 UmCyys56aURDYvjLEuTcQbVtSWrvDdhoJqtJpH4P7vm5xxody9exo3HbBvpS12qEy2
 0uF/cEnkjJxNg==
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
Xorg modesetting and Mesa drivers. Existing Mesa
drivers are still aware of only these older
format modifiers which do not differentiate
between different variations of the block linear
layout. When the format modifier support flag was
flipped in the nouveau kernel driver, the X.org
modesetting driver began attempting to use its
format modifier-enabled framebuffer path. Because
the set of format modifiers advertised by the
kernel prior to this change do not intersect with
the set of format modifiers advertised by Mesa,
allocating GBM buffers using format modifiers
fails and the modesetting driver falls back to
non-modifier allocation. However, it still later
queries the modifier of the GBM buffer when
creating its DRM-KMS framebuffer object, receives
the old-format modifier from Mesa, and attempts
to create a framebuffer with it. Since the kernel
is still not aware of these formats, this fails.

Userspace should not be attempting to query format
modifiers of GBM buffers allocated with a non-
format-modifier-aware allocation path, but to
avoid breaking existing userspace behavior, this
change accepts the old-style format modifiers when
creating framebuffers and applying them to planes
by translating them to the equivalent new-style
modifier. To accomplish this, some layout
parameters must be assumed to match properties of
the device targeted by the relevant ioctls. To
avoid perpetuating misuse of the old-style
modifiers, this change does not advertise support
for them. Doing so would imply compatibility
between devices with incompatible memory layouts.

Tested with Xorg 1.20 modesetting driver,
weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
gnome & KDE wayland desktops from Ubuntu 18.04,
kmscube hacked to use linear mod, and sway 1.5

Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
Link: https://lkml.org/lkml/2020/6/30/1251
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
