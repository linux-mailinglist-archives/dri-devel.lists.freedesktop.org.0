Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 433D57672BF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 19:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A320C10E73A;
	Fri, 28 Jul 2023 17:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7323B10E72D;
 Fri, 28 Jul 2023 17:03:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SDY3wL005154; Fri, 28 Jul 2023 17:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=JHA9CcHdqSbzmny5Je+oo1FHHNkrDGEfUd03vxiTdLM=;
 b=NEOli6g2HI+jTZHClm8bo8vnV6oAuzU+J3MX7nnkrZTGJuxgDTaTlo6L1NS+uUSmD1qi
 ZNr/TLxkioXKv612GhV4Rai8x+JpoidBjBSexDuXYkdtZFSm2EPdbFWOag01DydNocyo
 Xm7Jx9cCZJtDImTMELm9xVNq4n6MKHTevXsjuzEyjQIfr//oXwheZI7aVqebNPm4hnDo
 EfUyoFQxWpgAzChRN8iBbPN9SMQdxKGYBD46qv76j6EGo63TyLgRIOiNM7cQxCUCIhoF
 Kv21r3CCXQBNMk95qoy2RFWlPBjFn4i4D0wtwha9o6E7dOlzPz/E9xt4Cuh6p8jRkUcu LA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s4e270k3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 17:02:53 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SH2rAA024388
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 17:02:53 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 10:02:52 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 28 Jul 2023 10:02:10 -0700
Subject: [PATCH RFC v5 01/10] drm: Introduce pixel_source DRM plane
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230728-solid-fill-v5-1-053dbefa909c@quicinc.com>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
In-Reply-To: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690563772; l=8248;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=J72vvRflnf/Ue+1q9lBf/VPZYjUuukwMBgmKazMPoqc=;
 b=3UI5ndQqBAAcLDh/rUMuIAso7YCE5LE/W3tBCJIF2b2GZlD0R4KMR9itVLlj/UBF/QoxNte/6
 hmXTmMq6ii/CyNx9VsmqagI3zzCSgbxKX88RgTlYeZVbPbuZM6JiI7y
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6A4ZV96mszQaGq7KTuFRd1E_7ojxJ4yN
X-Proofpoint-ORIG-GUID: 6A4ZV96mszQaGq7KTuFRd1E_7ojxJ4yN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=936
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280154
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

The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_NONE and
DRM_PLANE_PIXEL_SOURCE_FB with *_PIXEL_SOURCE_FB being the default value.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_blend.c               | 85 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c               |  3 ++
 include/drm/drm_blend.h                   |  2 +
 include/drm/drm_plane.h                   | 21 ++++++++
 6 files changed, 116 insertions(+)

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
index 6e74de833466..c500310a3d09 100644
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
@@ -615,3 +630,73 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+/**
+ * drm_plane_create_pixel_source_property - create a new pixel source property
+ * @plane: DRM plane
+ * @extra_sources: Bitmask of additional supported pixel_sources for the driver.
+ *		   DRM_PLANE_PIXEL_SOURCE_FB always be enabled as a supported
+ *		   source.
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
+	static const struct drm_prop_enum_list enum_list[] = {
+		{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
+		{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
+	};
+	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB);
+	int i;
+
+	/* FB is supported by default */
+	unsigned long supported_sources = extra_sources | BIT(DRM_PLANE_PIXEL_SOURCE_FB);
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
+	for (i = 0; i < ARRAY_SIZE(enum_list); i++) {
+		int ret;
+
+		if (!test_bit(enum_list[i].type, &supported_sources))
+			continue;
+
+		ret = drm_property_add_enum(prop, enum_list[i].type, enum_list[i].name);
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
index 24e7998d1731..f342cf15412b 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -987,6 +987,9 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
 		return -ENOENT;
 	}
 
+	if (plane->state && plane->state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB)
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
2.41.0

