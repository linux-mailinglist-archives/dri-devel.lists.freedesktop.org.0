Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D8A17C5E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B834510E56C;
	Tue, 21 Jan 2025 10:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eW/p3WW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3323310E562
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AC2C40013;
 Tue, 21 Jan 2025 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTu86rxGrThTu/st6dZ2/+QAyKkenwOIl4BGnYWjBLU=;
 b=eW/p3WW8rPrcBEAC5cCCMLB07ZjJvNwtumgKCTxzHj+CsMPBk7UsKlqzynm/wj08UcSjeo
 oRmOMvDtdBL5j2tBqEKkp9WW9xaP2+c4nStYQoUUDA75jSKpqJOLUqTFTzeOHnhPXD3oNI
 dq5UxNko1K6MtyA1oy/bzOG6oyp+NH7sVIWRYoi67mHMcD32vBTifIBNdDUCMFIY6spLA4
 GRN6l/sJOM7VRPK9QdDO4WYZ/E/vkJ0pWxYYvYX8GF9hoV3qefqRdLGqkD7Izb11CMqf6l
 VTNWMtQfmyD+NzzjlXHBJ5rLei/PET0pktgE9AJmSSFxRING7lHGekEYIwta+Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:31 +0100
Subject: [PATCH v3 07/16] drm/vkms: Introduce config for CRTCs and encoders
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-7-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=24741;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=w4xbkLBcLkFtKggQbw+D/3PysKtGax5BrrOgJn99Iyo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30idgX8gZx7o8GvZwO5CO6VnDiI9veZy3P5S
 6MRefYPTb6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IgAKCRAgrS7GWxAs
 4l5SEAC3lX8EHuOTA3yoEoRY4u+ELjeNwVu3jo0qGBQcu446cH2X+x++Zo43RhRDK84QUUVmATx
 76l+bxoWntaH8ZFAQuhztsfkIbpO2olsqmB2qwCkAXMQ8jcbFROxsIduhcijeBiH6/63ZSf/jZf
 GrROyJFZUwrqUOTB00r8i/HCd0vjuILLPSMBL2SO7GIL0O0IHCpj+Nx7wq6mxrhM+xLIZWM2GSn
 7uDFS4Jgk/BQ/XQWrzgmCJnP6XjgKCj1sEt8TMaMYWGx/0mKPV/WR1xYfXImARzq0jwYrWzZwdF
 87ZXt3JidtngyXAhOS9S4WEcWxDD3Nze40ah/tobLZoMq/EibQSDycdn860A+ufDFK/fl/QWBgk
 yZ2EJN+ASxflg3o/IBOUShnIlEPKr9ezWAHyaQvQTMOxT+ggV38sh5Q/WvWbnTrutdOu1XfctHE
 26nxTNithRAexC4vQsRnOd5VhGCYpG4eF9FXwMXTSim525a4Bdw3TNEaPV7iBbCFcsFMrYymY8P
 iH9ep2i3nl+JihVyg/PzrTbmGoDfnMUlkBUSlXm2QVpt2Rs9/BvgMtgV8lLC4pNCAQajghT0upt
 6kDXsK5IFjHpUlPhK0ndkKeZtKpd1w07VPmu/gbocLcnrAEEdJzk6uhD8U9nserpar8JMID6JMV
 coeyyODq5D5e8zQ==
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
 drivers/gpu/drm/vkms/vkms_crtc.c   |   8 +-
 drivers/gpu/drm/vkms/vkms_drv.h    |   7 +-
 drivers/gpu/drm/vkms/vkms_output.c |  88 ++++++------
 5 files changed, 401 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index c7a39cde8cfbcd0ff4f5ae137cfb709b7a2240e2..314d252aa9b6ed1772c8ef597bd9c6b08145723e 100644
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
 
@@ -84,6 +107,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 	vkms_config_overlay->type = DRM_PLANE_TYPE_OVERLAY;
 	vkms_config_overlay->supported_rotations = DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK;
 	vkms_config_overlay->default_rotation = DRM_MODE_ROTATE_0;
+	xa_init_flags(&vkms_config_overlay->possible_crtcs, XA_FLAGS_ALLOC);
 
 	list_add(&vkms_config_overlay->link, &vkms_config->planes);
 
@@ -91,33 +115,195 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
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
@@ -125,22 +311,47 @@ bool vkms_config_is_valid(struct vkms_config *config)
 		    config_plane->default_rotation)
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
@@ -152,8 +363,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_config_plane *config_plane;
+	struct vkms_config_crtc *config_crtc;
+	struct vkms_config_encoder *config_encoder;
 
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
 		seq_puts(m, "plane:\n");
 		seq_printf(m, "\tname: %s\n", config_plane->name);
@@ -162,6 +374,15 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_printf(m, "\tdefault rotation: 0x%x\n", config_plane->default_rotation);
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
index fd5e0df11647f145d53e71a1b6a244951af3ec0d..90ced83f5eb6dae5ccc14c37169606d833ba355a 100644
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
+	struct vkms_output *output;
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
@@ -32,6 +73,7 @@ struct vkms_config {
  *        plane is primary.
  * @default_rotation: Default rotation that should be used by this plane
  * @supported_rotation: Rotation that this plane will support
+ * @possible_crtcs: List of CRTC that can be used with this plane.
  * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms plane during device creation. This pointer is
  *         not managed by the configuration and must be managed by other means.
@@ -44,6 +86,7 @@ struct vkms_config_plane {
 	unsigned int default_rotation;
 	unsigned int supported_rotations;
 
+	struct xarray possible_crtcs;
 	/* Internal usage */
 	struct vkms_plane *plane;
 };
@@ -78,14 +121,63 @@ bool vkms_config_is_valid(struct vkms_config *vkms_config);
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
index cf229aec71c3f03bb1306095e8dd44d63f80cd2a..f4da196fd7774ee1dcc5148e6420186f1384b3fa 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -9,6 +9,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_drv.h"
+#include "vkms_config.h"
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
@@ -269,9 +270,12 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
-struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
-				   struct drm_plane *cursor)
+struct vkms_output *vkms_crtc_init(struct vkms_device *vkms_device,
+				   struct drm_plane *primary,
+				   struct drm_plane *cursor,
+				   struct vkms_config_crtc *config)
 {
+	struct drm_device *dev = &vkms_device->drm;
 	struct vkms_output *vkms_out;
 	struct drm_crtc *crtc;
 	int ret;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 1b5add9536f503fe224425b924c14a5217bb09b1..3a211cdb41bd1003366d9eaa1425e122d885e4a4 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -191,6 +191,8 @@ struct vkms_output {
 
 struct vkms_config;
 struct vkms_config_plane;
+struct vkms_config_crtc;
+struct vkms_config_encoder;
 
 /**
  * struct vkms_device - Description of a VKMS device
@@ -229,9 +231,10 @@ struct vkms_device {
  * @primary: primary plane to attach to the CRTC
  * @cursor: plane to attach to the CRTC
  */
-struct vkms_output *vkms_crtc_init(struct drm_device *dev,
+struct vkms_output *vkms_crtc_init(struct vkms_device *vkms_device,
 				   struct drm_plane *primary,
-				   struct drm_plane *cursor);
+				   struct drm_plane *cursor,
+				   struct vkms_config_crtc *config);
 
 /**
  * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index cf385f676ef7f45633b4ed69a8047c87fad95dbd..dab949c983a5991696baf937f948c0f78710d6e1 100644
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
-	struct vkms_output *output;
-	struct vkms_plane *primary, *cursor = NULL;
+	unsigned long idx;
 	int ret;
-	int writeback;
-
-	output = vkms_crtc_init(dev, &primary->base,
-				cursor ? &cursor->base : NULL);
-	if (IS_ERR(output)) {
-		DRM_ERROR("Failed to allocate CRTC\n");
-		return PTR_ERR(output);
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
+		config_crtc->output = vkms_crtc_init(vkmsdev, primary, cursor, config_crtc);
+
+		if (IS_ERR(config_crtc->output)) {
+			ret = PTR_ERR(config_crtc->output);
+			return ret;
+		}
+	}
+
+	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
+		xa_for_each(&config_crtc->possible_planes, idx, config_plane) {
+			config_plane->plane->base.possible_crtcs |= drm_crtc_mask(&config_crtc->output->crtc);
+		}
 	}
 
 	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
@@ -74,31 +86,25 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
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
-	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
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
-		writeback = vkms_enable_writeback_connector(vkmsdev, output);
-		if (writeback)
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
+			return ret;
+		}
+		xa_for_each(&config_encoder->possible_crtcs, idx, config_crtc) {
+			config_encoder->encoder->possible_crtcs |= drm_crtc_mask(&config_crtc->output->crtc);
+		}
+		if (IS_ERR(config_encoder->encoder))
+			return PTR_ERR(config_encoder->encoder);
+		ret = drm_connector_attach_encoder(connector, config_encoder->encoder);
+		if (ret)
+			return ret;
 	}
 
 	drm_mode_config_reset(dev);

-- 
2.47.1

