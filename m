Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695A37431B1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D368E10E435;
	Fri, 30 Jun 2023 00:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5224C10E411;
 Fri, 30 Jun 2023 00:25:56 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35U0KOue015759; Fri, 30 Jun 2023 00:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=t6R9N2yeIsQexJaQS8c81OEI5P/dBc4R0tAtMEWHmpQ=;
 b=AvEa7LYSYexv9k+Jf2GxxjLpWeROwBCvwmc0fttoFQ5jCjtPc+RhwBNTWgj4Cp4fGb3y
 FrNJOn2l0BkzaQ4Bm1AYoZvQTIisty0oJSpU777i6htj/Dju/TcN00NiMICqE2SXs0i6
 1PT+RxW2+m9xbAlwuFpVRwKj0qYf8cwXCjqcT5hjwusQmgRhrNJls0MqY8qVfmysZIKL
 DZvVINj5oWscYqIdKM8pL/O3UWvJ/AfQQhmUC2TuYFdVVJEDUNMNFe9tHFIU3JoeN1DZ
 2iTgOwp8f9D3wAG/Rz+sZAuTYnMFAi0WULndwx6FSdo8ebd3TtQMwl3i7jHMgLc3JQtx LQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh0aajdpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 00:25:37 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U0PaRM011859
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 00:25:36 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 29 Jun 2023 17:25:36 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Jun 2023 17:25:00 -0700
Subject: [PATCH RFC v4 1/7] drm: Introduce solid fill DRM plane property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
In-Reply-To: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688084735; l=8808;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=swiVqYAIFwdA1Xzfs0+stuK82AxNRai/ckKMrin5BtQ=;
 b=AUK5SI3RFECwFsm/oBpK+HEN+aCujwdH1ir344ZShH+EbgD/b8+uKJpRtW/42lsaVQR0YM+he
 svE/I88QAHCBt4AzxWoETBxauKpclkLy7on0GfH7lnO8MnZtj5P6iwJ
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cdb9lHk-k2CULTBmmbJSZaRByLgJ6XWq
X-Proofpoint-ORIG-GUID: cdb9lHk-k2CULTBmmbJSZaRByLgJ6XWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306300001
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

Document and add support for solid_fill property to drm_plane. In
addition, add support for setting and getting the values for solid_fill.

To enable solid fill planes, userspace must assign a property blob to
the "solid_fill" plane property containing the following information:

struct drm_solid_fill_info {
	u8 version;
	u32 r, g, b;
};

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_blend.c               | 33 +++++++++++++++++++
 include/drm/drm_blend.h                   |  1 +
 include/drm/drm_plane.h                   | 43 ++++++++++++++++++++++++
 5 files changed, 141 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..fe14be2bd2b2 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
 
+	if (plane_state->solid_fill_blob) {
+		drm_property_blob_put(plane_state->solid_fill_blob);
+		plane_state->solid_fill_blob = NULL;
+	}
+
 	if (plane->color_encoding_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
 							   plane->color_encoding_property,
@@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	if (state->fb)
 		drm_framebuffer_get(state->fb);
 
+	if (state->solid_fill_blob)
+		drm_property_blob_get(state->solid_fill_blob);
+
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
@@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 		drm_crtc_commit_put(state->commit);
 
 	drm_property_blob_put(state->fb_damage_clips);
+	drm_property_blob_put(state->solid_fill_blob);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d867e7f9f2cd..a28b4ee79444 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -316,6 +316,51 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
 
+static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
+		struct drm_property_blob *blob)
+{
+	int ret = 0;
+	int blob_version;
+
+	if (blob == state->solid_fill_blob)
+		return 0;
+
+	drm_property_blob_put(state->solid_fill_blob);
+	state->solid_fill_blob = NULL;
+
+	memset(&state->solid_fill, 0, sizeof(state->solid_fill));
+
+	if (blob) {
+		struct drm_solid_fill_info *user_info = (struct drm_solid_fill_info *)blob->data;
+
+		if (blob->length != sizeof(struct drm_solid_fill_info)) {
+			drm_dbg_atomic(state->plane->dev,
+				       "[PLANE:%d:%s] bad solid fill blob length: %zu\n",
+				       state->plane->base.id, state->plane->name,
+				       blob->length);
+			return -EINVAL;
+		}
+
+		blob_version = user_info->version;
+
+		/* Add more versions if necessary */
+		if (blob_version == 1) {
+			state->solid_fill.r = user_info->r;
+			state->solid_fill.g = user_info->g;
+			state->solid_fill.b = user_info->b;
+		} else {
+			drm_dbg_atomic(state->plane->dev,
+				       "[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
+				       state->plane->base.id, state->plane->name,
+				       ret);
+			return -EINVAL;
+		}
+		state->solid_fill_blob = drm_property_blob_get(blob);
+	}
+
+	return ret;
+}
+
 static void set_out_fence_for_crtc(struct drm_atomic_state *state,
 				   struct drm_crtc *crtc, s32 __user *fence_ptr)
 {
@@ -544,6 +589,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->src_w = val;
 	} else if (property == config->prop_src_h) {
 		state->src_h = val;
+	} else if (property == plane->solid_fill_property) {
+		struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
+
+		ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
+		drm_property_blob_put(solid_fill);
+
+		return ret;
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -616,6 +668,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->src_w;
 	} else if (property == config->prop_src_h) {
 		*val = state->src_h;
+	} else if (property == plane->solid_fill_property) {
+		*val = state->solid_fill_blob ?
+			state->solid_fill_blob->base.id : 0;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6e74de833466..38c3c5d6453a 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -185,6 +185,10 @@
  *		 plane does not expose the "alpha" property, then this is
  *		 assumed to be 1.0
  *
+ * solid_fill:
+ *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
+ *	contains pixel data that drivers can use to fill a plane.
+ *
  * Note that all the property extensions described here apply either to the
  * plane or the CRTC (e.g. for the background color, which currently is not
  * exposed and assumed to be black).
@@ -615,3 +619,32 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+/**
+ * drm_plane_create_solid_fill_property - create a new solid_fill property
+ * @plane: drm plane
+ *
+ * This creates a new property that holds pixel data for solid fill planes. This
+ * property is exposed to userspace as a property blob called "solid_fill".
+ *
+ * For information on what the blob contains, see `drm_solid_fill_info`.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_create_solid_fill_property(struct drm_plane *plane)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(plane->dev,
+			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
+			"solid_fill", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->solid_fill_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..0338a860b9c8 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+int drm_plane_create_solid_fill_property(struct drm_plane *plane);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..f6ab313cb83e 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -40,6 +40,25 @@ enum drm_scaling_filter {
 	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
 };
 
+/**
+ * struct drm_solid_fill_info - User info for solid fill planes
+ */
+struct drm_solid_fill_info {
+	__u8 version;
+	__u32 r, g, b;
+};
+
+/**
+ * struct solid_fill_property - RGB values for solid fill plane
+ *
+ * Note: This is the V1 for this feature
+ */
+struct drm_solid_fill {
+	uint32_t r;
+	uint32_t g;
+	uint32_t b;
+};
+
 /**
  * struct drm_plane_state - mutable plane state
  *
@@ -116,6 +135,23 @@ struct drm_plane_state {
 	/** @src_h: height of visible portion of plane (in 16.16) */
 	uint32_t src_h, src_w;
 
+	/**
+	 * @solid_fill_blob:
+	 *
+	 * Blob containing relevant information for a solid fill plane
+	 * including pixel format and data. See
+	 * drm_plane_create_solid_fill_property() for more details.
+	 */
+	struct drm_property_blob *solid_fill_blob;
+
+	/**
+	 * @solid_fill:
+	 *
+	 * Pixel data for solid fill planes. See
+	 * drm_plane_create_solid_fill_property() for more details.
+	 */
+	struct drm_solid_fill solid_fill;
+
 	/**
 	 * @alpha:
 	 * Opacity of the plane with 0 as completely transparent and 0xffff as
@@ -699,6 +735,13 @@ struct drm_plane {
 	 */
 	struct drm_plane_state *state;
 
+	/*
+	 * @solid_fill_property:
+	 * Optional solid_fill property for this plane. See
+	 * drm_plane_create_solid_fill_property().
+	 */
+	struct drm_property *solid_fill_property;
+
 	/**
 	 * @alpha_property:
 	 * Optional alpha property for this plane. See

-- 
2.41.0

