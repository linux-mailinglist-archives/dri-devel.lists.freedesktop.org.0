Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F48B8267E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A0010E5B3;
	Thu, 18 Sep 2025 00:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="frukIE40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796110E5B3;
 Thu, 18 Sep 2025 00:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758156229;
 bh=+nNa2TdGIiQKCq/XCDts33GE2BrzsNjijPgPfv3C+1g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=frukIE40Nppdy8PqCDsVz0HcfcV+X8CG1UYd+qidIQbRmwZaAWD+sWwNfRAh1M9UQ
 TeKXDYoAyHVQ5wRPZxSWu0KTcqhny73Uns8trhw5e3GJG9xvdhOZpya4VwoxTP8gZS
 Z9gJP0mbz4qQ7NZ5kQzDeGb09iIDcyVpzP0LwYOO4IaHm/BZ9Wy1FpY6TMbFrUyZzX
 hjy36D8iqt44MSepam/EZq5lVpGHLbHv5+FQmJmemdZumLaqOKinAiAHMLUqa1Bq5e
 3dyySnnldvmAZRqCD3ILvZX7jTUZvyp/mUTFK0gOuaYbNwS7lulF44EC+vmHBFRMIh
 JwyEX3jMqoxCA==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E78317E0EB8;
 Thu, 18 Sep 2025 02:43:42 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:13 -0400
Subject: [PATCH RFC v2 04/20] drm/crtc: Add COLOR_PIPELINE property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-4-ac4471b44758@collabora.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
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

Add a COLOR_PIPELINE property to the CRTC to allow userspace to set a
post-blend color pipeline analogously to how pre-blend color pipelines
are set on planes.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 49 +++++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/drm_crtc.c        | 33 ++++++++++++++++++++++++++
 include/drm/drm_atomic_uapi.h     |  2 ++
 include/drm/drm_crtc.h            | 11 +++++++++
 4 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index b7cc6945864274bedd21dd5b73494f9aae216888..063c142fd9b656e228cfc660d005a3fbb4640d32 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -287,6 +287,33 @@ drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
 
+/**
+ * drm_atomic_set_colorop_for_crtc - set colorop for crtc
+ * @crtc_state: atomic state object for the crtc
+ * @colorop: colorop to use for the crtc
+ *
+ * Helper function to select the color pipeline on a crtc by setting
+ * it to the first drm_colorop element of the pipeline.
+ */
+void
+drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
+				 struct drm_colorop *colorop)
+{
+	struct drm_crtc *crtc = crtc_state->crtc;
+
+	if (colorop)
+		drm_dbg_atomic(crtc->dev,
+			       "Set [COLOROP:%d] for [CRTC:%d:%s] state %p\n",
+			       colorop->base.id, crtc->base.id, crtc->name,
+			       crtc_state);
+	else
+		drm_dbg_atomic(crtc->dev,
+			       "Set [NOCOLOROP] for [CRTC:%d:%s] state %p\n",
+			       crtc->base.id, crtc->name, crtc_state);
+
+	crtc_state->color_pipeline = colorop;
+}
+EXPORT_SYMBOL(drm_atomic_set_colorop_for_crtc);
 
 /**
  * drm_atomic_set_crtc_for_connector - set CRTC for connector
@@ -396,8 +423,8 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
 }
 
 static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
-		struct drm_crtc_state *state, struct drm_property *property,
-		uint64_t val)
+		struct drm_crtc_state *state, struct drm_file *file_priv,
+		struct drm_property *property, uint64_t val)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_mode_config *config = &dev->mode_config;
@@ -406,7 +433,17 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 
 	if (property == config->prop_active)
 		state->active = val;
-	else if (property == config->prop_mode_id) {
+	else if (property == crtc->color_pipeline_property) {
+		/* find DRM colorop object */
+		struct drm_colorop *colorop = NULL;
+
+		colorop = drm_colorop_find(dev, file_priv, val);
+
+		if (val && !colorop)
+			return -EACCES;
+
+		drm_atomic_set_colorop_for_crtc(state, colorop);
+	} else if (property == config->prop_mode_id) {
 		struct drm_property_blob *mode =
 			drm_property_lookup_blob(dev, val);
 		ret = drm_atomic_set_mode_prop_for_crtc(state, mode);
@@ -487,6 +524,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
+	else if (property == crtc->color_pipeline_property)
+		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
 	else if (crtc->funcs->atomic_get_property)
 		return crtc->funcs->atomic_get_property(crtc, state, property, val);
 	else {
@@ -1047,6 +1086,8 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
 
 		if (colorop->plane)
 			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
+		else if (colorop->crtc)
+			WARN_ON(!drm_modeset_is_locked(&colorop->crtc->mutex));
 
 		ret = drm_atomic_colorop_get_property(colorop,
 				colorop->state, property, val);
@@ -1204,7 +1245,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		}
 
 		ret = drm_atomic_crtc_set_property(crtc,
-				crtc_state, prop, prop_value);
+				crtc_state, file_priv, prop, prop_value);
 		break;
 	}
 	case DRM_MODE_OBJECT_PLANE: {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 94e60cffd29972aa979ac2f1932be7a6a97f3ada..94238163ff1254c721df39c030bc99a31d3bb92a 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1003,3 +1003,36 @@ drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mod
 	kfree(all_pipelines);
 	return prop;
 }
+
+/**
+ * drm_crtc_create_color_pipeline_property - create a new color pipeline
+ * property
+ *
+ * @crtc: drm CRTC
+ * @pipelines: list of pipelines
+ * @num_pipelines: number of pipelines
+ *
+ * Create the COLOR_PIPELINE CRTC property to specify color pipelines on
+ * the CRTC.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
+					    const struct drm_prop_enum_list *pipelines,
+					    int num_pipelines)
+{
+	struct drm_property *prop;
+
+	prop = drm_common_create_color_pipeline_property(crtc->dev,
+							 &crtc->base,
+							 pipelines,
+							 num_pipelines);
+	if (IS_ERR(prop))
+		return PTR_ERR(prop);
+
+	crtc->color_pipeline_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_color_pipeline_property);
diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
index 4363155233267b93767c895fa6085544e2277442..4dc191f6f929d73deee9812025c48275a33cf770 100644
--- a/include/drm/drm_atomic_uapi.h
+++ b/include/drm/drm_atomic_uapi.h
@@ -52,6 +52,8 @@ void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 				 struct drm_framebuffer *fb);
 void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
 				      struct drm_colorop *colorop);
+void drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
+				     struct drm_colorop *colorop);
 int __must_check
 drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 				  struct drm_crtc *crtc);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 77c0c04a5910a2263923e06cf37535697e20e1c9..df03637ca25abd45e96b5944229297f776fd046d 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1096,6 +1096,14 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @color_pipeline_property:
+	 *
+	 * Optional "COLOR_PIPELINE" enum property for specifying
+	 * a color pipeline to use on the CRTC.
+	 */
+	struct drm_property *color_pipeline_property;
+
 	/**
 	 * @state:
 	 *
@@ -1331,5 +1339,8 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
+int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
+					     const struct drm_prop_enum_list *pipelines,
+					     int num_pipelines);
 bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
 #endif /* __DRM_CRTC_H__ */

-- 
2.50.1

