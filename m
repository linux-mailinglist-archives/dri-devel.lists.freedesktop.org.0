Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E379B8268A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9C710E5B2;
	Thu, 18 Sep 2025 00:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kMfbC2sB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A859110E5B2;
 Thu, 18 Sep 2025 00:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758156244;
 bh=mf6juSKLniW5wlorSSAfNOP2rtqyBOQ0mzeNSGygAfY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kMfbC2sBQnS3xAdpFzMtrPkxt4u0N0MK/4OvPWqGC1Xixi8I2pTEwXFzJeVD1ZCXP
 QQlOQ6xmlDhRvhW+bepjqJbRzLbav2nXNTVCo399JjnVF43zLhzS8FDeZXr4GjLVuN
 J23kum3PZjhxVaLEl6pY1mQ4O4bAKUoiyJAmnLKYotUYL7rRJrgHYoSRqQBb1uuarj
 bFxQOGDoMo2sH1wkYAAARS+D7woHAeryhxqdqjkV2LgpyAne2MVIwN3kbgRSarffHG
 ferjdMDxPf31VIvjj+MmrVbF8U4eQlOhiah+8QYYZEg3JOIx7Eg77u1ivnjyJ1Y5ax
 w3aVwcNXKFHdQ==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 38A2F17E1067;
 Thu, 18 Sep 2025 02:43:57 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:15 -0400
Subject: [PATCH RFC v2 06/20] drm: Introduce
 DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-6-ac4471b44758@collabora.com>
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

Introduce DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE which a DRM client
can set to enable the usage of post-blend color pipelines instead of the
now deprecated CRTC color management properties: "GAMMA_LUT",
"DEGAMMA_LUT" and "CTM".

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c   | 15 +++++++++++++++
 drivers/gpu/drm/drm_connector.c     |  1 +
 drivers/gpu/drm/drm_crtc_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c         |  9 +++++++++
 drivers/gpu/drm/drm_mode_object.c   |  9 +++++++++
 include/drm/drm_file.h              |  7 +++++++
 include/uapi/drm/drm.h              | 19 +++++++++++++++++++
 7 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 063c142fd9b656e228cfc660d005a3fbb4640d32..f5125fa3fa28ff2a6ff07fd7cf07d4bdf77ab738 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -452,6 +452,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (property == config->prop_vrr_enabled) {
 		state->vrr_enabled = val;
 	} else if (property == config->degamma_lut_property) {
+		if (file_priv->post_blend_color_pipeline) {
+			drm_dbg_atomic(dev,
+				"Setting DEGAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->degamma_lut,
 					val,
@@ -460,6 +465,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == config->ctm_property) {
+		if (file_priv->post_blend_color_pipeline) {
+			drm_dbg_atomic(dev,
+				"Setting CTM CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->ctm,
 					val,
@@ -468,6 +478,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == config->gamma_lut_property) {
+		if (file_priv->post_blend_color_pipeline) {
+			drm_dbg_atomic(dev,
+				"Setting GAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->gamma_lut,
 					val,
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5bc730b1aff7a184448af7b93f078..f58cfd2131139ff3e613adc4dbb9ddbedf724dc7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3440,6 +3440,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	 */
 	ret = drm_mode_object_get_properties(&connector->base, file_priv->atomic,
 			file_priv->plane_color_pipeline,
+			file_priv->post_blend_color_pipeline,
 			(uint32_t __user *)(unsigned long)(out_resp->props_ptr),
 			(uint64_t __user *)(unsigned long)(out_resp->prop_values_ptr),
 			&out_resp->count_props);
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index e3dbdcbfa385b940ec0b5476adde6146fe4afde1..c53f154e5392a10c326c844b7321666275f9ac02 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -169,6 +169,7 @@ void drm_mode_object_unregister(struct drm_device *dev,
 				struct drm_mode_object *object);
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 				   bool plane_color_pipeline,
+				   bool post_blend_color_pipeline,
 				   uint32_t __user *prop_ptr,
 				   uint64_t __user *prop_values,
 				   uint32_t *arg_count_props);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 01592d10e3465ddceddef94bc417f98d3ec12087..ea9600f5392f520a2b42ba7ef363d2f08ce19812 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -383,6 +383,15 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->plane_color_pipeline = req->value;
 		break;
+	case DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE:
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value > 1)
+			return -EINVAL;
+		if (!drm_core_check_feature(dev, DRIVER_POST_BLEND_COLOR_PIPELINE))
+			return -EINVAL;
+		file_priv->post_blend_color_pipeline = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index b45d501b10c868c6d9b7a5a8760eadbd7b372a6a..5e6c3de9456b997985142a68b9cef57771a58bdc 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -388,6 +388,7 @@ EXPORT_SYMBOL(drm_object_property_get_default_value);
 /* helper for getconnector and getproperties ioctls */
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 				   bool plane_color_pipeline,
+				   bool post_blend_color_pipeline,
 				   uint32_t __user *prop_ptr,
 				   uint64_t __user *prop_values,
 				   uint32_t *arg_count_props)
@@ -416,6 +417,13 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 				continue;
 		}
 
+		if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
+			struct drm_crtc *crtc = obj_to_crtc(obj);
+
+			if (prop == crtc->color_pipeline_property)
+				continue;
+		}
+
 		if (*arg_count_props > count) {
 			ret = __drm_object_property_get_value(obj, prop, &val);
 			if (ret)
@@ -475,6 +483,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 
 	ret = drm_mode_object_get_properties(obj, file_priv->atomic,
 			file_priv->plane_color_pipeline,
+			file_priv->post_blend_color_pipeline,
 			(uint32_t __user *)(unsigned long)(arg->props_ptr),
 			(uint64_t __user *)(unsigned long)(arg->prop_values_ptr),
 			&arg->count_props);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 1a3018e4a537b3341acb50187d47371f6b781b9d..42b9a43baa18079af8ec2ea5b1484b23c497beb0 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -213,6 +213,13 @@ struct drm_file {
 	 */
 	bool plane_color_pipeline;
 
+	/**
+	 * @post_blend_color_pipeline:
+	 *
+	 * True if client understands post-blend color pipelines
+	 */
+	bool post_blend_color_pipeline;
+
 	/**
 	 * @was_master:
 	 *
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index c6c53e57958e951204154ce41a69696a6876f0e8..f9ac10b3e4876f71005a87dedefa4aed320566f0 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -927,6 +927,25 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
 
+/**
+ * DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
+ *
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_crtc, as well as drm_colorop properties.
+ *
+ * Setting of these crtc properties will be rejected when this client
+ * cap is set:
+ * - GAMMA_LUT
+ * - DEGAMMA_LUT
+ * - CTM
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This client cap can only be set if the driver sets the corresponding driver
+ * cap &DRM_CAP_POST_BLEND_COLOR_PIPELINE.
+ */
+#define DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE	8
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;

-- 
2.50.1

