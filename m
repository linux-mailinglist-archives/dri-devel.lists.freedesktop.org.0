Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E147E02B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 09:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB54910E27A;
	Thu, 23 Dec 2021 08:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1603C10E280
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 08:10:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e5so9872955wrc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NkvR1gHSe2IjM5ARC815Kf628ZgjzxkOpI9zgg4nLC0=;
 b=qh2WPW9Y8y6+kjf8icGxT+J/JVRgM7yvr0WY9qXSt0L1B448ofhaSZiR2c9J0MyTPF
 ND9BkmJMTcgj2IMz/5cdxESHk+/inpmTMV0s4n0gnsK2fa2//5QZacUhBRt5Tcpz06rJ
 NGhqldm03XtOv3yewF3mSb7lR8q0NVR9M+Uiq4x+1cRzEICtp8iiT3A15XhPFsEo1hDG
 a+0+2G2gK9qvvaa/ZrhSL6cwhRpj5V028G3N30qQZtnLglxqSqfbX90lCoxdtsRhFrlX
 19xb5CIA8NfnJHvaImiUHZqBwt6Oi2N8kcpDrSFkK6v8JUA7iDwRdFZQhANZVhqSOV02
 rsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NkvR1gHSe2IjM5ARC815Kf628ZgjzxkOpI9zgg4nLC0=;
 b=oPfil9JHrAH/5OBWCTj7E6XAVaR9cgL8utmSCySIAk+xUiK4TQ+Q6pxPDBADNRtmT9
 PPiPuHF/nTWKh/NOKYah+XK6H1xMLPwPzCp2zrynGpf5wCfbMXgjUS2xSO4n6MDBckKU
 ktT0b9rD7HO2Wx8dQzrbWz70TFCNb0+eupn9b9O0CXc5A9FmHzyVsqtSdFURMa9nqsvs
 nktnOxxNH3Hc+X6rhSe1rfMl2xnMCqna/8pD/HziKJ2bXkdv+6vIFsyKTYsghY9+8UXN
 UXICjtdrVGK+I+3FaOolYD08oFcCfToMEuKihKPnysoE1W0qkSYRBeDJjdd3WaBNYYLe
 jQug==
X-Gm-Message-State: AOAM530csLTA4HCql2bvSfwWPE+BBd0OGFGypO2Ihwmu3rxkNhBdvXvx
 jkym80V6GVYAVcbz5KHBqW0=
X-Google-Smtp-Source: ABdhPJxICwXcYDz+FEECFh0a7o7VzKwW8Gumv/0LMIWAV4pYWQOA58t5JSN7+YI79ld2Jgp3Dz4PCw==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr851978wru.475.1640247044620; 
 Thu, 23 Dec 2021 00:10:44 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id r62sm3841313wmr.35.2021.12.23.00.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 00:10:44 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH 1/1] drm/vkms: add zpos plane property
Date: Thu, 23 Dec 2021 09:10:30 +0100
Message-Id: <20211223081030.16629-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223081030.16629-1-jose.exposito89@gmail.com>
References: <20211223081030.16629-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the zpos plane property. Depending on the plane type:

- Primary and cursor planes: Create an immutable zpos property. The
  primary plane is always at the bottom and the cursor plane is always
  on the top.
- Overlay planes: Create a mutable zpos property allowing to change
  their order but always keep them between the primary and cursor
  planes.

As documented, "vkms_crtc_state.active_planes" must be sorted by zpos.
This is achieved by inserting them in the array at their
normalized_zpos index.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c  |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c   |  1 +
 drivers/gpu/drm/vkms/vkms_plane.c | 25 +++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 57bbd32e9beb..4f23488b15f3 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -207,7 +207,6 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
-	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
 								  plane);
@@ -215,7 +214,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		if (!plane_state->visible)
 			continue;
 
-		vkms_state->active_planes[i++] =
+		vkms_state->active_planes[plane_state->normalized_zpos] =
 			to_vkms_plane_state(plane_state);
 	}
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index bb98f6c6c561..a97b338318c6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -157,6 +157,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	 * fbdev helpers. We have to go with 0, meaning "pick the default",
 	 * which ix XRGB8888 in all cases. */
 	dev->mode_config.preferred_depth = 0;
+	dev->mode_config.normalize_zpos = true;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
 	return vkms_output_init(vkmsdev, 0);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 32409e15244b..f491abb35d4a 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -81,6 +81,8 @@ static void vkms_plane_reset(struct drm_plane *plane)
 	}
 
 	__drm_gem_reset_shadow_plane(plane, &vkms_state->base);
+	vkms_state->base.base.zpos = drm_plane_index(plane);
+	vkms_state->base.base.normalized_zpos = drm_plane_index(plane);
 }
 
 static const struct drm_plane_funcs vkms_plane_funcs = {
@@ -158,6 +160,24 @@ static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 };
 
+static int vkms_plane_create_zpos_property(struct vkms_device *vkmsdev,
+					   struct vkms_plane *plane)
+{
+	int ret;
+	unsigned int zpos = drm_plane_index(&plane->base);
+	int overlay_max_zpos = vkmsdev->config->num_overlay_planes;
+
+	if (plane->base.type == DRM_PLANE_TYPE_OVERLAY) {
+		ret = drm_plane_create_zpos_property(&plane->base, zpos,
+						     1, overlay_max_zpos);
+	} else {
+		ret = drm_plane_create_zpos_immutable_property(&plane->base,
+							       zpos);
+	}
+
+	return ret;
+}
+
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 				   enum drm_plane_type type, int index)
 {
@@ -166,6 +186,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	struct vkms_plane *plane;
 	const u32 *formats;
 	int nformats;
+	int ret;
 
 	switch (type) {
 	case DRM_PLANE_TYPE_PRIMARY:
@@ -195,5 +216,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, funcs);
 
+	ret = vkms_plane_create_zpos_property(vkmsdev, plane);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return plane;
 }
-- 
2.25.1

