Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7FA78BBE0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 02:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906B010E386;
	Tue, 29 Aug 2023 00:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7CD10E377;
 Tue, 29 Aug 2023 00:06:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37SNmnid001628; Tue, 29 Aug 2023 00:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=iXo5/IFJf2KMIxJECcJgZlNWZf5/Xql+HcDHYiBJC/E=;
 b=DZ4R7SMQfsGCLiwKOQ7yJYBjRRS3hKlAcKPjv8e4Ay5bIxhyVc/UCk/24yAXpFrtkAa+
 d7xcVdNX4kRMG36BEuxydiv9SeWHC6pG9ABFNsXa/Uz5sNnTO5j3Obg5vV6kxWJXdOD5
 C5WqnwnrzB5tzYdnwDXZ83wKgK1RMBUEIgthQOQ+v+AdtrNsB8se66alhFYh8r0GiDN0
 Tdl2lrqaP64OaAZ32UuD6RzcRIuMDTjz6rOkmlvU01Uz58jRLbSARvXNd5D+XTGtQPqW
 ZgFA2DYyhCU8Yo40dP0CH4t4M7LHkyk01J0DnxSv77KSDKlsv3JMRgUBlXAfJe2Qy+8g MA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sq9m8vykh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 00:05:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37T05h2W032245
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 00:05:43 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 28 Aug 2023 17:05:43 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 28 Aug 2023 17:05:07 -0700
Subject: [PATCH RFC v6 01/10] drm: Introduce pixel_source DRM plane
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230828-solid-fill-v6-1-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
In-Reply-To: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693267542; l=9586;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=nXCRWkCkCawtKrl5oXamniwN1Jf6CnqHe2orMF8EvwI=;
 b=Z76HBp7pWzGqGk4C2wjbK9FXJZwPvlJZLiP4nlVd0XkWlxySlRWmtfOH/EYnn4e/K4TE3uoUt
 2yZjthmxp8RB+ce7mixjuQvAPMmqsA8Y+Wm94g2+atmBSS8aaHZJabf
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3r0TARHqtV-HEMi2KmB9rnu8_McYUAgp
X-Proofpoint-GUID: 3r0TARHqtV-HEMi2KmB9rnu8_McYUAgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_19,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=659
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280207
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for pixel_source property to drm_plane and related
documentation. In addition, force pixel_source to
DRM_PLANE_PIXEL_SOURCE_FB in DRM_IOCTL_MODE_SETPLANE as to not break
legacy userspace.

This enum property will allow user to specify a pixel source for the
plane. Possible pixel sources will be defined in the
drm_plane_pixel_source enum.

Currently, the only pixel sources are DRM_PLANE_PIXEL_SOURCE_FB (the
default value) and DRM_PLANE_PIXEL_SOURCE_NONE.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_blend.c               | 90 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c               | 19 +++++--
 include/drm/drm_blend.h                   |  2 +
 include/drm/drm_plane.h                   | 21 ++++++++
 6 files changed, 133 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..01638c51ce0a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
+	plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
 
 	if (plane->color_encoding_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d867e7f9f2cd..454f980e16c9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -544,6 +544,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->src_w = val;
 	} else if (property == config->prop_src_h) {
 		state->src_h = val;
+	} else if (property == plane->pixel_source_property) {
+		state->pixel_source = val;
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -616,6 +618,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->src_w;
 	} else if (property == config->prop_src_h) {
 		*val = state->src_h;
+	} else if (property == plane->pixel_source_property) {
+		*val = state->pixel_source;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6e74de833466..c3c57bae06b7 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -185,6 +185,21 @@
  *		 plane does not expose the "alpha" property, then this is
  *		 assumed to be 1.0
  *
+ * pixel_source:
+ *	pixel_source is set up with drm_plane_create_pixel_source_property().
+ *	It is used to toggle the active source of pixel data for the plane.
+ *	The plane will only display data from the set pixel_source -- any
+ *	data from other sources will be ignored.
+ *
+ *	Possible values:
+ *
+ *	"NONE":
+ *		No active pixel source.
+ *		Committing with a NONE pixel source will disable the plane.
+ *
+ *	"FB":
+ *		Framebuffer source set by the "FB_ID" property.
+ *
  * Note that all the property extensions described here apply either to the
  * plane or the CRTC (e.g. for the background color, which currently is not
  * exposed and assumed to be black).
@@ -615,3 +630,78 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
+	{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
+	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
+};
+
+/**
+ * drm_plane_create_pixel_source_property - create a new pixel source property
+ * @plane: DRM plane
+ * @extra_sources: Bitmask of additional supported pixel_sources for the driver.
+ *		   DRM_PLANE_PIXEL_SOURCE_FB and DRM_PLANE_PIXEL_SOURCE_NONE will
+ *		   always be enabled as supported sources.
+ *
+ * This creates a new property describing the current source of pixel data for the
+ * plane. The pixel_source will be initialized as DRM_PLANE_PIXEL_SOURCE_FB by default.
+ *
+ * Drivers can set a custom default source by overriding the pixel_source value in
+ * drm_plane_funcs.reset()
+ *
+ * The property is exposed to userspace as an enumeration property called
+ * "pixel_source" and has the following enumeration values:
+ *
+ * "NONE":
+ *	 No active pixel source
+ *
+ * "FB":
+ *	Framebuffer pixel source
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_create_pixel_source_property(struct drm_plane *plane,
+					   unsigned long extra_sources)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_property *prop;
+	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
+						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
+	int i;
+
+	/* FB is supported by default */
+	unsigned long supported_sources = extra_sources |
+					  BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
+					  BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
+
+	if (WARN_ON(supported_sources & ~valid_source_mask))
+		return -EINVAL;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM | DRM_MODE_PROP_ATOMIC, "pixel_source",
+			hweight32(supported_sources));
+
+	if (!prop)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(drm_pixel_source_enum_list); i++) {
+		int ret;
+
+		if (!test_bit(drm_pixel_source_enum_list[i].type, &supported_sources))
+			continue;
+
+		ret = drm_property_add_enum(prop, drm_pixel_source_enum_list[i].type,
+				drm_pixel_source_enum_list[i].name);
+		if (ret) {
+			drm_property_destroy(dev, prop);
+
+			return ret;
+		}
+	}
+
+	drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SOURCE_FB);
+	plane->pixel_source_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..559d101162ba 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -839,6 +839,14 @@ bool drm_any_plane_has_format(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_any_plane_has_format);
 
+static bool drm_plane_needs_disable(struct drm_plane_state *state, struct drm_framebuffer *fb)
+{
+	if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_NONE)
+		return true;
+
+	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb == NULL;
+}
+
 /*
  * __setplane_internal - setplane handler for internal callers
  *
@@ -861,8 +869,8 @@ static int __setplane_internal(struct drm_plane *plane,
 
 	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb) {
+	/* No visible data means shut it down */
+	if (drm_plane_needs_disable(plane->state, fb)) {
 		plane->old_fb = plane->fb;
 		ret = plane->funcs->disable_plane(plane, ctx);
 		if (!ret) {
@@ -913,8 +921,8 @@ static int __setplane_atomic(struct drm_plane *plane,
 
 	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb)
+	/* No visible data means shut it down */
+	if (drm_plane_needs_disable(plane->state, fb))
 		return plane->funcs->disable_plane(plane, ctx);
 
 	/*
@@ -987,6 +995,9 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 		return -ENOENT;
 	}
 
+	if (plane->state)
+		plane->state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
+
 	if (plane_req->fb_id) {
 		fb = drm_framebuffer_lookup(dev, file_priv, plane_req->fb_id);
 		if (!fb) {
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..122bbfbaae33 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+int drm_plane_create_pixel_source_property(struct drm_plane *plane,
+					   unsigned long extra_sources);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..89508b4dea4a 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -40,6 +40,12 @@ enum drm_scaling_filter {
 	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
 };
 
+enum drm_plane_pixel_source {
+	DRM_PLANE_PIXEL_SOURCE_NONE,
+	DRM_PLANE_PIXEL_SOURCE_FB,
+	DRM_PLANE_PIXEL_SOURCE_MAX
+};
+
 /**
  * struct drm_plane_state - mutable plane state
  *
@@ -116,6 +122,14 @@ struct drm_plane_state {
 	/** @src_h: height of visible portion of plane (in 16.16) */
 	uint32_t src_h, src_w;
 
+	/**
+	 * @pixel_source:
+	 *
+	 * Source of pixel information for the plane. See
+	 * drm_plane_create_pixel_source_property() for more details.
+	 */
+	enum drm_plane_pixel_source pixel_source;
+
 	/**
 	 * @alpha:
 	 * Opacity of the plane with 0 as completely transparent and 0xffff as
@@ -699,6 +713,13 @@ struct drm_plane {
 	 */
 	struct drm_plane_state *state;
 
+	/*
+	 * @pixel_source_property:
+	 * Optional pixel_source property for this plane. See
+	 * drm_plane_create_pixel_source_property().
+	 */
+	struct drm_property *pixel_source_property;
+
 	/**
 	 * @alpha_property:
 	 * Optional alpha property for this plane. See

-- 
2.42.0

