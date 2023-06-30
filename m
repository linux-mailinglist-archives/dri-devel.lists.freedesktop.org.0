Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE34743197
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91E510E411;
	Fri, 30 Jun 2023 00:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1BC10E40E;
 Fri, 30 Jun 2023 00:25:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35U0LFYN027249; Fri, 30 Jun 2023 00:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=lAPlTdabfsz0jCPgQDKI7aPq9KfhvilxRGdFIKwbr8M=;
 b=j1YRaA7HkX92gSqSAUOibCJYm2Y5k3TPhPP2JOvDf3rWXHY2OzV2IFSaxrPYjBGzMFgm
 3xKY/jSzuY07THHiXCRvVoGR2pkyFKDkDq0mttl39w6dTb7X7rcxUcCDgafnEpm3yTNC
 QKfbSHChcFv8n15pNKTxZ68nqAPvOW5J1PPWgAqbVhAEgmhUN7mvXywgzaxPUlhwEXw3
 pF3u8u+1nodqGon5AJSe5K8VMyRT2SoY8uvU4RYKTrin92td5lCXoWleRhs+26UNmN+N
 1Wev87Tl8D/5a/4nO3grrHgz/TVdF7qDT36QsrU+o2YvlPvnkm2NLwsNwPo+FIzm/bZb /w== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rgy1tjfph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 00:25:37 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U0Parj010710
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 00:25:36 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 29 Jun 2023 17:25:36 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Jun 2023 17:25:01 -0700
Subject: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
In-Reply-To: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688084735; l=7128;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=JbsB75ScnJGdrFoWV3iEEmzBuoWRmdXBk1yeClXqevI=;
 b=nq0gG7V6jz+Z2cHWkgALPjhI4KxTMIHg6zsxemlJpwamS/l5gPbdc5ubxMzt0CZrkSdq+0/+B
 1K7vvaxae+wBOabqKDoDpykGYE4Iy7/of9LppJ2XJO50U0AO2obkgYg
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jnQtjANyIqhFLqtKwA24WrYE5rJd1rCU
X-Proofpoint-GUID: jnQtjANyIqhFLqtKwA24WrYE5rJd1rCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 mlxlogscore=679 mlxscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300002
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
documentation.

This enum property will allow user to specify a pixel source for the
plane. Possible pixel sources will be defined in the
drm_plane_pixel_source enum.

The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_blend.c               | 81 +++++++++++++++++++++++++++++++
 include/drm/drm_blend.h                   |  2 +
 include/drm/drm_plane.h                   | 21 ++++++++
 5 files changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index fe14be2bd2b2..86fb876efbe6 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
+	plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
 
 	if (plane_state->solid_fill_blob) {
 		drm_property_blob_put(plane_state->solid_fill_blob);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a28b4ee79444..6e59c21af66b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		drm_property_blob_put(solid_fill);
 
 		return ret;
+	} else if (property == plane->pixel_source_property) {
+		state->pixel_source = val;
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	} else if (property == plane->solid_fill_property) {
 		*val = state->solid_fill_blob ?
 			state->solid_fill_blob->base.id : 0;
+	} else if (property == plane->pixel_source_property) {
+		*val = state->pixel_source;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 38c3c5d6453a..8c100a957ee2 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -189,6 +189,18 @@
  *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
  *	contains pixel data that drivers can use to fill a plane.
  *
+ * pixel_source:
+ *	pixel_source is set up with drm_plane_create_pixel_source_property().
+ *	It is used to toggle the source of pixel data for the plane.
+ *
+ *	Possible values:
+ *
+ *	"FB":
+ *		Framebuffer source
+ *
+ *	"COLOR":
+ *		solid_fill source
+ *
  * Note that all the property extensions described here apply either to the
  * plane or the CRTC (e.g. for the background color, which currently is not
  * exposed and assumed to be black).
@@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct drm_plane *plane)
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
+
+/**
+ * drm_plane_create_pixel_source_property - create a new pixel source property
+ * @plane: drm plane
+ * @supported_sources: bitmask of supported pixel_sources for the driver (NOT
+ *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it will be supported
+ *                     by default).
+ *
+ * This creates a new property describing the current source of pixel data for the
+ * plane.
+ *
+ * The property is exposed to userspace as an enumeration property called
+ * "pixel_source" and has the following enumeration values:
+ *
+ * "FB":
+ *	Framebuffer pixel source
+ *
+ * "COLOR":
+ *	Solid fill color pixel source
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_create_pixel_source_property(struct drm_plane *plane,
+					   unsigned int supported_sources)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_property *prop;
+	const struct drm_prop_enum_list enum_list[] = {
+		{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
+		{ DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
+	};
+	unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
+				       BIT(DRM_PLANE_PIXEL_SOURCE_COLOR);
+	int i;
+
+	/* FB is supported by default */
+	supported_sources |= BIT(DRM_PLANE_PIXEL_SOURCE_FB);
+
+	if (WARN_ON(supported_sources & ~valid_source_mask))
+		return -EINVAL;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_source",
+			hweight32(supported_sources));
+
+	if (!prop)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(enum_list); i++) {
+		int ret;
+
+		if (!(BIT(enum_list[i].type) & supported_sources))
+			continue;
+
+		ret = drm_property_add_enum(prop, enum_list[i].type, enum_list[i].name);
+
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
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 0338a860b9c8..31af7cfa5b1b 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
 int drm_plane_create_solid_fill_property(struct drm_plane *plane);
+int drm_plane_create_pixel_source_property(struct drm_plane *plane,
+					   unsigned int supported_sources);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index f6ab313cb83e..73fb6cf8a5d9 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -59,6 +59,12 @@ struct drm_solid_fill {
 	uint32_t b;
 };
 
+enum drm_plane_pixel_source {
+	DRM_PLANE_PIXEL_SOURCE_FB,
+	DRM_PLANE_PIXEL_SOURCE_COLOR,
+	DRM_PLANE_PIXEL_SOURCE_MAX
+};
+
 /**
  * struct drm_plane_state - mutable plane state
  *
@@ -152,6 +158,14 @@ struct drm_plane_state {
 	 */
 	struct drm_solid_fill solid_fill;
 
+	/*
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
@@ -742,6 +756,13 @@ struct drm_plane {
 	 */
 	struct drm_property *solid_fill_property;
 
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

