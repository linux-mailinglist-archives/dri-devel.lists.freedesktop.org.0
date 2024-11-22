Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A3F9D62DE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90D610EC1D;
	Fri, 22 Nov 2024 17:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cL5HINAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B59210EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F5C21C0005;
 Fri, 22 Nov 2024 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pn8Ka5N87FTKf2xTg6xH+39bGCxFQOZIHXERibjz27Q=;
 b=cL5HINAw2574tsUjKVNrvVaZg5hJ79aKjN9HZlVpVFLP3oWBdMbJKMrdID/w+e6bEUH00Y
 KiRileIz4+hziPFC8JvrL+UxWn/NfLuOr0Lqcv2gHRVNVwMR+9M3fY5Pwzo4eDP9pYv/pW
 qKapEXGZfpS7YE51LhCR7geb2I21QFE4sIt2wJLIVdczvpSxzO4tdZvlwP9YwGJYjCRKnz
 IN2upXo8042n9JN3FUUN3JHJ1w8JJxoNnLaTC7f0oN/DNHS15E41bK9bf9LSRK8l0C81Qt
 8vpmgCEYBO03rsw85PhcGJdMXZcNXVrW4WgOMjpgdnUr8d0bPWuumZ41XmVEcA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:13 +0100
Subject: [PATCH RFC v2 09/18] drm/vkms: Introduce config for CRTCs and encoders
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-9-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=25066;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=M/Tppt5qAS8MuTrKnQe5+o8gWpEAQYh6kupwHqBURqc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1Pg0yzCXCBTjMyO3LP3J5NlI7bvPIxDbUXL
 FqF/0bT3miJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TwAKCRAgrS7GWxAs
 4hJ7D/42BmHAsKRvMnh14rw/tcUq20j/Z8/oZzl1MBLxXgOJctYUSPLIF74tFsuyUq5u7fle7F3
 SeSltAcf4CCUCCLvnWz2GYt6qlhiO6c+aLFVvHh6lXx2AQSt7cfNKKAcynZmqKd5PjMXG29Qese
 lVxDwF8t+NmIxXjMUpmfjVEmUon2/QI0P98oKQADJyePE0jmzFJ1OIcPkQB49h46Dgi6KGerI5T
 msobZXxDCedc9DRQ4TBmo9gmnYVg49uo42PRKJ2zWnuxXEFI7ql/T9uaIF5Asmd2c679bjfSprC
 Llut1O+o/krPz87yLy3P4A22LTlGCzi60vZbsbXbIcbegXKDfkFadxY5sin9XOb3+n9UwyTnHNv
 DiW302uIgjFNeiyuTPx5/MSimBgfMaWpCokPe+lbYM6olhnDmVg/DOeqWrZysPJ68HWDhJ+NHsV
 nEkf3L+b8m14BBVnP1B/oonmJBYJMBFIwUaIMk4JormFjWG5V/LjbB6DDYbdV+fNkCub6df3JC6
 O1Y6e7Y/HIgXMO7QVjyFCAqEtCxlMPBJPWOt9LTBqBSe9Z/SK0mudex5zQcDtfSCULak/97dqN6
 LcrQOlSLOkLWuENkbfUALUDdOWoHjUcCiaUJdt/N+eAEI+JYB+eHO8LlQSEqntBVqmgAI28Bhao
 REwXm5zExlC4gIg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The current VKMS driver can only uses one CRTC and one encoder. This patch
introduce in the same time CRTC and encoders as they are tighly linked.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 269 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_config.h | 104 +++++++++++++-
 drivers/gpu/drm/vkms/vkms_crtc.c   |  14 +-
 drivers/gpu/drm/vkms/vkms_drv.h    |   7 +-
 drivers/gpu/drm/vkms/vkms_output.c |  86 ++++++------
 5 files changed, 405 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 10fef173fba921e9abacb5e6dfd292b396694815..e44ed904cefb97b8b6ab8fc27623e315397e0106 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -15,6 +15,8 @@ struct vkms_config *vkms_config_create(void)
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&config->planes);
+	INIT_LIST_HEAD(&config->crtcs);
+	INIT_LIST_HEAD(&config->encoders);
 
 	return config;
 }
@@ -24,12 +26,24 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 					      bool enable_cursor)
 {
 	struct vkms_config_plane *plane;
+	struct vkms_config_encoder *encoder;
+	struct vkms_config_crtc *crtc;
 	struct vkms_config *vkms_config = vkms_config_create();
 
 	if (IS_ERR(vkms_config))
 		return vkms_config;
 
-	vkms_config->writeback = enable_writeback;
+	crtc = vkms_config_create_crtc(vkms_config);
+	if (!crtc)
+		goto err_alloc;
+	crtc->writeback = enable_writeback;
+
+	encoder = vkms_config_create_encoder(vkms_config);
+	if (!encoder)
+		goto err_alloc;
+
+	if (vkms_config_encoder_attach_crtc(encoder, crtc))
+		goto err_alloc;
 
 	plane = vkms_config_create_plane(vkms_config);
 	if (!plane)
@@ -41,6 +55,9 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 		goto err_alloc;
 	sprintf(plane->name, "primary");
 
+	if (vkms_config_plane_attach_crtc(plane, crtc))
+		goto err_alloc;
+
 	if (enable_overlay) {
 		for (int i = 0; i < NUM_OVERLAY_PLANES; i++) {
 			plane = vkms_config_create_plane(vkms_config);
@@ -51,6 +68,9 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 			if (!plane->name)
 				goto err_alloc;
 			snprintf(plane->name, 10, "plane-%d", i);
+
+			if (vkms_config_plane_attach_crtc(plane, crtc))
+				goto err_alloc;
 		}
 	}
 	if (enable_cursor) {
@@ -62,6 +82,9 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 		if (!plane->name)
 			goto err_alloc;
 		sprintf(plane->name, "cursor");
+
+		if (vkms_config_plane_attach_crtc(plane, crtc))
+			goto err_alloc;
 	}
 	return vkms_config;
 
@@ -91,6 +114,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 	vkms_config_overlay->supported_color_range = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 						     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
 	vkms_config_overlay->default_color_range = DRM_COLOR_YCBCR_FULL_RANGE;
+	xa_init_flags(&vkms_config_overlay->possible_crtcs, XA_FLAGS_ALLOC);
 
 	list_add(&vkms_config_overlay->link, &vkms_config->planes);
 
@@ -98,33 +122,195 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
 
-void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_overlay)
+struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *vkms_config)
 {
-	if (!vkms_config_overlay)
+	if (!vkms_config)
+		return NULL;
+
+	struct vkms_config_crtc *vkms_config_crtc = kzalloc(sizeof(*vkms_config_crtc),
+							    GFP_KERNEL);
+
+	if (!vkms_config_crtc)
+		return NULL;
+
+	list_add(&vkms_config_crtc->link, &vkms_config->crtcs);
+	xa_init_flags(&vkms_config_crtc->possible_planes, XA_FLAGS_ALLOC);
+	xa_init_flags(&vkms_config_crtc->possible_encoders, XA_FLAGS_ALLOC);
+
+	return vkms_config_crtc;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_crtc);
+
+struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *vkms_config)
+{
+	if (!vkms_config)
+		return NULL;
+
+	struct vkms_config_encoder *vkms_config_encoder = kzalloc(sizeof(*vkms_config_encoder),
+								  GFP_KERNEL);
+
+	if (!vkms_config_encoder)
+		return NULL;
+
+	list_add(&vkms_config_encoder->link, &vkms_config->encoders);
+	xa_init_flags(&vkms_config_encoder->possible_crtcs, XA_FLAGS_ALLOC);
+
+	return vkms_config_encoder;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_encoder);
+
+void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane,
+			      struct vkms_config *vkms_config)
+{
+	struct vkms_config_crtc *crtc_config;
+	struct vkms_config_plane *plane;
+
+	if (!vkms_config_plane)
+		return;
+	list_del(&vkms_config_plane->link);
+	xa_destroy(&vkms_config_plane->possible_crtcs);
+
+	list_for_each_entry(crtc_config, &vkms_config->crtcs, link) {
+		unsigned long idx = 0;
+
+		xa_for_each(&crtc_config->possible_planes, idx, plane) {
+			if (plane == vkms_config_plane)
+				xa_erase(&crtc_config->possible_planes, idx);
+		}
+	}
+
+	kfree(vkms_config_plane->name);
+	kfree(vkms_config_plane);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_delete_plane);
+
+void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
+			     struct vkms_config *vkms_config)
+{
+	struct vkms_config_crtc *crtc_config;
+	struct vkms_config_plane *plane_config;
+	struct vkms_config_encoder *encoder_config;
+
+	if (!vkms_config_crtc)
+		return;
+	list_del(&vkms_config_crtc->link);
+	xa_destroy(&vkms_config_crtc->possible_planes);
+	xa_destroy(&vkms_config_crtc->possible_encoders);
+
+	list_for_each_entry(plane_config, &vkms_config->planes, link) {
+		unsigned long idx = 0;
+
+		xa_for_each(&plane_config->possible_crtcs, idx, crtc_config) {
+			if (crtc_config == vkms_config_crtc)
+				xa_erase(&plane_config->possible_crtcs, idx);
+		}
+	}
+
+	list_for_each_entry(encoder_config, &vkms_config->encoders, link) {
+		unsigned long idx = 0;
+
+		xa_for_each(&encoder_config->possible_crtcs, idx, crtc_config) {
+			if (crtc_config == vkms_config_crtc)
+				xa_erase(&encoder_config->possible_crtcs, idx);
+		}
+	}
+
+	kfree(vkms_config_crtc);
+}
+
+void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
+				struct vkms_config *vkms_config)
+{
+	if (!vkms_config_encoder)
 		return;
-	list_del(&vkms_config_overlay->link);
-	kfree(vkms_config_overlay->name);
-	kfree(vkms_config_overlay);
+	list_del(&vkms_config_encoder->link);
+	xa_destroy(&vkms_config_encoder->possible_crtcs);
+
+	struct vkms_config_crtc *crtc_config;
+	struct vkms_config_encoder *encoder;
+
+	list_for_each_entry(crtc_config, &vkms_config->crtcs, link) {
+		unsigned long idx = 0;
+
+		xa_for_each(&crtc_config->possible_encoders, idx, encoder) {
+			if (encoder == vkms_config_encoder)
+				xa_erase(&crtc_config->possible_encoders, idx);
+		}
+	}
+
+	kfree(vkms_config_encoder);
 }
 
 void vkms_config_destroy(struct vkms_config *config)
 {
 	struct vkms_config_plane *vkms_config_plane, *tmp_plane;
+	struct vkms_config_encoder *vkms_config_encoder, *tmp_encoder;
+	struct vkms_config_crtc *vkms_config_crtc, *tmp_crtc;
 
 	list_for_each_entry_safe(vkms_config_plane, tmp_plane, &config->planes, link) {
-		vkms_config_delete_plane(vkms_config_plane);
+		vkms_config_delete_plane(vkms_config_plane, config);
+	}
+	list_for_each_entry_safe(vkms_config_encoder, tmp_encoder, &config->encoders, link) {
+		vkms_config_delete_encoder(vkms_config_encoder, config);
+	}
+	list_for_each_entry_safe(vkms_config_crtc, tmp_crtc, &config->crtcs, link) {
+		vkms_config_delete_crtc(vkms_config_crtc, config);
 	}
 
 	kfree(config);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
 
+int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *vkms_config_plane,
+					       struct vkms_config_crtc *vkms_config_crtc)
+{
+	u32 crtc_idx, encoder_idx;
+	int ret;
+
+	ret = xa_alloc(&vkms_config_plane->possible_crtcs, &crtc_idx, vkms_config_crtc,
+		       xa_limit_32b, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	ret = xa_alloc(&vkms_config_crtc->possible_planes, &encoder_idx, vkms_config_plane,
+		       xa_limit_32b, GFP_KERNEL);
+	if (ret) {
+		xa_erase(&vkms_config_plane->possible_crtcs, crtc_idx);
+		return ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_plane_attach_crtc);
+
+int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkms_config_encoder,
+						 struct vkms_config_crtc *vkms_config_crtc)
+{
+	u32 crtc_idx, encoder_idx;
+	int ret;
+
+	ret = xa_alloc(&vkms_config_encoder->possible_crtcs, &crtc_idx, vkms_config_crtc,
+		       xa_limit_32b, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	ret = xa_alloc(&vkms_config_crtc->possible_encoders, &encoder_idx, vkms_config_encoder,
+		       xa_limit_32b, GFP_KERNEL);
+	if (ret) {
+		xa_erase(&vkms_config_encoder->possible_crtcs, crtc_idx);
+		return ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_attach_crtc);
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_plane *config_plane;
 
-	bool has_cursor = false;
-	bool has_primary = false;
+	struct vkms_config_crtc *config_crtc;
+	struct vkms_config_encoder *config_encoder;
 
 	list_for_each_entry(config_plane, &config->planes, link) {
 		// Default rotation not in supported rotations
@@ -144,22 +330,47 @@ bool vkms_config_is_valid(struct vkms_config *config)
 		    BIT(config_plane->default_color_range))
 			return false;
 
-		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY) {
-			// Multiple primary planes for only one CRTC
-			if (has_primary)
-				return false;
-			has_primary = true;
-		}
-		if (config_plane->type == DRM_PLANE_TYPE_CURSOR) {
-			// Multiple cursor planes for only one CRTC
-			if (has_cursor)
-				return false;
-			has_cursor = true;
-		}
+		// No CRTC linked to this plane
+		if (xa_empty(&config_plane->possible_crtcs))
+			return false;
+	}
+
+	list_for_each_entry(config_encoder, &config->encoders, link) {
+		// No CRTC linked to this encoder
+		if (xa_empty(&config_encoder->possible_crtcs))
+			return false;
 	}
 
-	if (!has_primary)
-		return false;
+	list_for_each_entry(config_crtc, &config->crtcs, link) {
+		bool has_primary = false;
+		bool has_cursor = false;
+		unsigned long idx = 0;
+
+		// No encoder attached to this CRTC
+		if (xa_empty(&config_crtc->possible_encoders))
+			return false;
+
+		xa_for_each(&config_crtc->possible_planes, idx, config_plane) {
+			if (config_plane->type == DRM_PLANE_TYPE_PRIMARY) {
+				// Multiple primary planes for only one CRTC
+				if (has_primary)
+					return false;
+
+				has_primary = true;
+			}
+			if (config_plane->type == DRM_PLANE_TYPE_CURSOR) {
+				// Multiple cursor planes for only one CRTC
+				if (has_cursor)
+					return false;
+
+				has_cursor = true;
+			}
+		}
+
+		// No primary plane for this CRTC
+		if (!has_primary)
+			return false;
+	}
 
 	return true;
 }
@@ -171,8 +382,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_config_plane *config_plane;
+	struct vkms_config_crtc *config_crtc;
+	struct vkms_config_encoder *config_encoder;
 
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
 		seq_puts(m, "plane:\n");
 		seq_printf(m, "\tname: %s\n", config_plane->name);
@@ -189,6 +401,15 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   config_plane->default_color_range);
 	}
 
+	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link) {
+		seq_puts(m, "encoder:\n");
+	}
+
+	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
+		seq_puts(m, "crtc:\n");
+		seq_printf(m, "\twriteback: %d\n", config_crtc->writeback);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 8a58c633f9d4649308ce0c536acfcffb03c0617f..8f247fc09373fb2c8145e83be05c6afec1ffac1c 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -9,18 +9,59 @@
 /**
  * struct vkms_config - General configuration for VKMS driver
  *
- * @writeback: If true, a writeback buffer can be attached to the CRTC
  * @planes: List of planes configured for this device. They are created by the function
  *          vkms_config_create_plane().
+ * @crtcs: List of crtcs configured for this device. They are created by the function
+ *         vkms_config_create_crtc().
+ * @encoders: List of encoders configured for this device. They are created by the function
+ *            vkms_config_create_encoder().
  * @dev: Used to store the current vkms device. Only set when the device is instancied.
  */
 struct vkms_config {
-	bool writeback;
-	bool cursor;
-	bool overlay;
 	struct vkms_device *dev;
 
 	struct list_head planes;
+	struct list_head crtcs;
+	struct list_head encoders;
+};
+
+/**
+ * struct vkms_config_crtc
+ *
+ * @link: Link to the others CRTCs
+ * @possible_planes: List of planes that can be used with this CRTC
+ * @possible_encoders: List of encoders that can be used with this CRTC
+ * @crtc: Internal usage. This pointer should never be considered as valid. It can be used to
+ *         store a temporary reference to a vkms crtc during device creation. This pointer is
+ *         not managed by the configuration and must be managed by other means.
+ */
+struct vkms_config_crtc {
+	struct list_head link;
+
+	bool writeback;
+	struct xarray possible_planes;
+	struct xarray possible_encoders;
+
+	/* Internal usage */
+	struct vkms_crtc *crtc;
+};
+
+/**
+ * struct vkms_config_encoder
+ *
+ * @link: Link to the others encoders
+ * @possible_crtcs: List of CRTC that can be used with this encoder
+ * @encoder: Internal usage. This pointer should never be considered as valid. It can be used to
+ *         store a temporary reference to a vkms encoder during device creation. This pointer is
+ *         not managed by the configuration and must be managed by other means.
+ */
+struct vkms_config_encoder {
+	struct list_head link;
+
+	struct xarray possible_crtcs;
+
+	/* Internal usage */
+	struct drm_encoder *encoder;
 };
 
 /**
@@ -36,6 +77,7 @@ struct vkms_config {
  * @supported_color_encoding: Color encoding that this plane will support
  * @default_color_range: Default color range that should be used by this plane
  * @supported_color_range: Color range that this plane will support
+ * @possible_crtcs: List of CRTC that can be used with this plane.
  * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms plane during device creation. This pointer is
  *         not managed by the configuration and must be managed by other means.
@@ -52,6 +94,7 @@ struct vkms_config_plane {
 	enum drm_color_range default_color_range;
 	unsigned int supported_color_range;
 
+	struct xarray possible_crtcs;
 	/* Internal usage */
 	struct vkms_plane *plane;
 };
@@ -86,14 +129,63 @@ bool vkms_config_is_valid(struct vkms_config *vkms_config);
  */
 struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_config);
 
+/**
+ * vkms_config_create_crtc() - Create a crtc configuration
+ *
+ * This will allocate and add a new crtc configuration to @vkms_config.
+ * @vkms_config: Configuration where to insert new crtc configuration
+ */
+struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *vkms_config);
+
+/**
+ * vkms_config_create_encoder() - Create an encoder configuration
+ *
+ * This will allocate and add a new encoder configuration to @vkms_config.
+ * @vkms_config: Configuration where to insert new encoder configuration
+ */
+struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *vkms_config);
+
+int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *vkms_config_plane,
+					       struct vkms_config_crtc *vkms_config_crtc);
+int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkms_config_encoder,
+						 struct vkms_config_crtc *vkms_config_crtc);
+
 /**
  * vkms_config_delete_plane() - Remove a plane configuration and frees its memory
  *
  * This will delete a plane configuration from the parent configuration. This will NOT
- * cleanup and frees the vkms_plane that can be stored in @vkms_config_plane.
+ * cleanup and frees the vkms_plane that can be stored in @vkms_config_plane. It will also remove
+ * any reference to this plane in @vkms_config.
+ *
  * @vkms_config_plane: Plane configuration to cleanup
+ * @vkms_config: Parent configuration
+ */
+void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane,
+			      struct vkms_config *vkms_config);
+/**
+ * vkms_config_delete_crtc() - Remove a CRTC configuration and frees its memory
+ *
+ * This will delete a CRTC configuration from the parent configuration. This will NOT
+ * cleanup and frees the vkms_crtc that can be stored in @vkms_config_crtc. It will also remove
+ * any reference to this CRTC in @vkms_config.
+ *
+ * @vkms_config_crtc: Plane configuration to cleanup
+ * @vkms_config: Parent configuration
+ */
+void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
+			     struct vkms_config *vkms_config);
+/**
+ * vkms_config_delete_encoder() - Remove an encoder configuration and frees its memory
+ *
+ * This will delete an encoder configuration from the parent configuration. This will NOT
+ * cleanup and frees the vkms_encoder that can be stored in @vkms_config_encoder. It will also
+ * remove any reference to this CRTC in @vkms_config.
+ *
+ * @vkms_config_encoder: Plane configuration to cleanup
+ * @vkms_config: Parent configuration
  */
-void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane);
+void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
+				struct vkms_config *vkms_config);
 
 /**
  * vkms_config_alloc_default() - Allocate the configuration for the default device
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 7851bcf335b7aa9a95848b3af8900812115b2189..3825fba57c012f84cbe67114e053dcd7fcfa283d 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 
 #include "vkms_drv.h"
+#include "vkms_config.h"
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
@@ -279,9 +280,12 @@ static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
 	destroy_workqueue(vkms_crtc->composer_workq);
 }
 
-struct vkms_crtc *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
-				 struct drm_plane *cursor)
+struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkms_device,
+				 struct drm_plane *primary,
+				 struct drm_plane *cursor,
+				 struct vkms_config_crtc *config)
 {
+	struct drm_device *dev = &vkms_device->drm;
 	struct vkms_crtc *vkms_crtc;
 	struct drm_crtc *crtc;
 	int ret;
@@ -318,5 +322,11 @@ struct vkms_crtc *vkms_crtc_init(struct drm_device *dev, struct drm_plane *prima
 	if (ret)
 		return ERR_PTR(ret);
 
+	if (config->writeback) {
+		ret = vkms_enable_writeback_connector(vkms_device, vkms_crtc);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	return vkms_crtc;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index acb0258d1ff18f97bde3630b3d2f3b8fcc511e67..a772bf4168e11730c6ee2e3c79abce3a6351203f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -214,6 +214,8 @@ struct vkms_crtc {
 
 struct vkms_config;
 struct vkms_config_plane;
+struct vkms_config_crtc;
+struct vkms_config_encoder;
 
 /**
  * struct vkms_device - Description of a VKMS device
@@ -252,9 +254,10 @@ struct vkms_device {
  * @primary: primary plane to attach to the CRTC
  * @cursor: plane to attach to the CRTC
  */
-struct vkms_crtc *vkms_crtc_init(struct drm_device *dev,
+struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkms_device,
 				 struct drm_plane *primary,
-				 struct drm_plane *cursor);
+				 struct drm_plane *cursor,
+				 struct vkms_config_crtc *config);
 
 /**
  * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 20bd39f06f433b5b9cee2b0e4fa2176999ed85aa..03498a20d78dd8a66f9fc66b360c5ea57fc48d88 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -31,21 +31,13 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
-	struct vkms_config_plane *config_plane;
+	struct vkms_config_encoder *config_encoder;
 	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_config_plane *config_plane;
+	struct vkms_config_crtc *config_crtc;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder;
-	struct vkms_crtc *vkms_crtc;
-	struct vkms_plane *primary, *cursor = NULL;
+	unsigned long idx;
 	int ret;
-	int writeback;
-
-	vkms_crtc = vkms_crtc_init(dev, &primary->base,
-				   cursor ? &cursor->base : NULL);
-	if (IS_ERR(vkms_crtc)) {
-		DRM_ERROR("Failed to allocate CRTC\n");
-		return PTR_ERR(vkms_crtc);
-	}
 
 	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
 		config_plane->plane = vkms_plane_init(vkmsdev, config_plane);
@@ -53,10 +45,30 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			ret = PTR_ERR(config_plane->plane);
 			return ret;
 		}
-		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY)
-			primary = config_plane->plane;
-		else if (config_plane->type == DRM_PLANE_TYPE_CURSOR)
-			cursor = config_plane->plane;
+	}
+
+	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
+		struct drm_plane *primary = NULL, *cursor = NULL;
+
+		xa_for_each(&config_crtc->possible_planes, idx, config_plane) {
+			if (config_plane->type == DRM_PLANE_TYPE_PRIMARY)
+				primary = &config_plane->plane->base;
+			else if (config_plane->type == DRM_PLANE_TYPE_CURSOR)
+				cursor = &config_plane->plane->base;
+		}
+
+		config_crtc->crtc = vkms_crtc_init(vkmsdev, primary, cursor, config_crtc);
+
+		if (IS_ERR(config_crtc->crtc)) {
+			ret = PTR_ERR(config_crtc->crtc);
+			return ret;
+		}
+	}
+
+	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
+		xa_for_each(&config_crtc->possible_planes, idx, config_plane) {
+			config_plane->plane->base.possible_crtcs |= drm_crtc_mask(&config_crtc->crtc->base);
+		}
 	}
 
 	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
@@ -74,33 +86,25 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
-	if (!encoder) {
-		DRM_ERROR("Failed to allocate encoder\n");
-		return -ENOMEM;
-	}
-	ret = drmm_encoder_init(dev, encoder, NULL,
-				DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init encoder\n");
-		return ret;
-	}
-	encoder->possible_crtcs = drm_crtc_mask(&vkms_crtc->base);
-
-	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		DRM_ERROR("Failed to attach connector to encoder\n");
-		return ret;
-	}
-
-	/* Initialize the writeback component */
-	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev, vkms_crtc);
-		if (writeback) {
-			DRM_ERROR("Failed to init writeback connector\n");
+	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link) {
+		config_encoder->encoder = drmm_kzalloc(dev, sizeof(*config_encoder->encoder),
+						       GFP_KERNEL);
+		if (!config_encoder->encoder)
+			return -ENOMEM;
+		ret = drmm_encoder_init(dev, config_encoder->encoder, NULL,
+					DRM_MODE_ENCODER_VIRTUAL, NULL);
+		if (ret) {
+			DRM_ERROR("Failed to init encoder\n");
 			return ret;
 		}
+		xa_for_each(&config_encoder->possible_crtcs, idx, config_crtc) {
+			config_encoder->encoder->possible_crtcs |= drm_crtc_mask(&config_crtc->crtc->base);
+		}
+		if (IS_ERR(config_encoder->encoder))
+			return PTR_ERR(config_encoder->encoder);
+		ret = drm_connector_attach_encoder(connector, config_encoder->encoder);
+		if (ret)
+			return ret;
 	}
 
 	drm_mode_config_reset(dev);

-- 
2.47.0

