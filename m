Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1337DA364
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 00:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4AA10EA5E;
	Fri, 27 Oct 2023 22:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889A010EA5D;
 Fri, 27 Oct 2023 22:33:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RL4WIg013097; Fri, 27 Oct 2023 22:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=X2cTnT2nLzkQWzX0XR6uYf4br4qhjJxE9XwDlm3Vv64=;
 b=olNkSRYR7zxAcaM37gGPzbD2eTOm4x602Wsy2ELPcO+6FNjSseCNdf0fNilCXTonwAxE
 F8A3ZvWBPSuBlOsLHDF0aPlcWNgLLFTcgDQ7bzC3QAnA368BeLn5T5meadQnC5VF1qTP
 1H7rPm/AdtdWg5caX1Q/0m2yZclGmXLBHDnNIv910lsL6YDz/m34qHWvboHEaLRAU4ZV
 xChNmJeZ4IVo7vNg40FQvFp4/MVrIYMyx36SSAhqHLZdZhs0KX1HZq5pewYi8YBW75cp
 aGyRFf2YbBBVvUUNWRkAeI0r5VXCLcFuarNyqIvhiG31a026R9tdYMUBB5WRQ6m4miMU xw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyx4wu73q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:27 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RMXQso017955
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:26 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 27 Oct 2023 15:33:26 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 27 Oct 2023 15:32:52 -0700
Subject: [PATCH RFC v7 02/10] drm: Introduce solid fill DRM plane property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231027-solid-fill-v7-2-780188bfa7b2@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698446005; l=9026;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=TrYvCIeixWWNBdH1E36zz0BUsgCWcEtzeGloVo03b+Q=;
 b=HABKImsTHVnvRegiyTA9xmSvVRdYr9i7YZICcbuoJUakRrO8dQS3JkQLodGKzVGqi58hzaaRC
 b5jT/0v/3AeAATuKlpN5no60G9t3xG6hU9xyXf+UmqTrqMHRsknKOgJ
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: uPzQneK098iwwb9H-0Kv45O0al7hD6-6
X-Proofpoint-GUID: uPzQneK098iwwb9H-0Kv45O0al7hD6-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_21,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=963 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270193
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
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document and add support for solid_fill property to drm_plane. In
addition, add support for setting and getting the values for solid_fill.

To enable solid fill planes, userspace must assign a property blob to
the "solid_fill" plane property containing the following information:

struct drm_mode_solid_fill {
	u32 r, g, b, pad;
};

Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Sebastian Wick <sebastian@sebastianwick.net>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 26 ++++++++++++++++++++++
 drivers/gpu/drm/drm_blend.c               | 30 ++++++++++++++++++++++++++
 include/drm/drm_blend.h                   |  1 +
 include/drm/drm_plane.h                   | 36 +++++++++++++++++++++++++++++++
 include/uapi/drm/drm_mode.h               | 24 +++++++++++++++++++++
 6 files changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 01638c51ce0a..86fb876efbe6 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -254,6 +254,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
 	plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
 
+	if (plane_state->solid_fill_blob) {
+		drm_property_blob_put(plane_state->solid_fill_blob);
+		plane_state->solid_fill_blob = NULL;
+	}
+
 	if (plane->color_encoding_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
 							   plane->color_encoding_property,
@@ -336,6 +341,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	if (state->fb)
 		drm_framebuffer_get(state->fb);
 
+	if (state->solid_fill_blob)
+		drm_property_blob_get(state->solid_fill_blob);
+
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
@@ -385,6 +393,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 		drm_crtc_commit_put(state->commit);
 
 	drm_property_blob_put(state->fb_damage_clips);
+	drm_property_blob_put(state->solid_fill_blob);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 46c78b87803d..576acb34195f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -316,6 +316,20 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
 
+static void drm_atomic_set_solid_fill_prop(struct drm_plane_state *state)
+{
+	struct drm_mode_solid_fill *user_info;
+
+	if (!state->solid_fill_blob)
+		return;
+
+	user_info = (struct drm_mode_solid_fill *)state->solid_fill_blob->data;
+
+	state->solid_fill.r = user_info->r;
+	state->solid_fill.g = user_info->g;
+	state->solid_fill.b = user_info->b;
+}
+
 static void set_out_fence_for_crtc(struct drm_atomic_state *state,
 				   struct drm_crtc *crtc, s32 __user *fence_ptr)
 {
@@ -564,6 +578,15 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->src_h = val;
 	} else if (property == plane->pixel_source_property) {
 		state->pixel_source = val;
+	} else if (property == plane->solid_fill_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+				&state->solid_fill_blob,
+				val, sizeof(struct drm_mode_solid_fill),
+				-1, &replaced);
+		if (ret)
+			return ret;
+
+		drm_atomic_set_solid_fill_prop(state);
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -638,6 +661,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->src_h;
 	} else if (property == plane->pixel_source_property) {
 		*val = state->pixel_source;
+	} else if (property == plane->solid_fill_property) {
+		*val = state->solid_fill_blob ?
+			state->solid_fill_blob->base.id : 0;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index fce734cdb85b..665c5d9b056f 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -204,6 +204,10 @@
  *	"FB":
  *		Framebuffer source set by the "FB_ID" property.
  *
+ * solid_fill:
+ *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
+ *	contains pixel data that drivers can use to fill a plane.
+ *
  * Note that all the property extensions described here apply either to the
  * plane or the CRTC (e.g. for the background color, which currently is not
  * exposed and assumed to be black).
@@ -709,3 +713,29 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
+
+/**
+ * drm_plane_create_solid_fill_property - create a new solid_fill property
+ * @plane: drm plane
+ *
+ * This creates a new property blob that holds pixel data for solid fill planes.
+ * The property is exposed to userspace as a property blob called "solid_fill".
+ *
+ * For information on what the blob contains, see `drm_mode_solid_fill`.
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
index 122bbfbaae33..e7158fbee389 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -60,4 +60,5 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
 int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 					   unsigned long extra_sources);
+int drm_plane_create_solid_fill_property(struct drm_plane *plane);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 0b24fae36304..e2ae7c26cc57 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -46,6 +46,18 @@ enum drm_plane_pixel_source {
 	DRM_PLANE_PIXEL_SOURCE_MAX
 };
 
+/**
+ * struct solid_fill_property - RGB values for solid fill plane
+ *
+ * TODO: Add solid fill source and corresponding pixel source
+ *       that supports RGBA color
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
@@ -130,6 +142,23 @@ struct drm_plane_state {
 	 */
 	enum drm_plane_pixel_source pixel_source;
 
+	/**
+	 * @solid_fill_blob:
+	 *
+	 * Blob containing relevant information for a solid fill plane
+	 * including RGB color values. See
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
@@ -720,6 +749,13 @@ struct drm_plane {
 	 */
 	struct drm_property *pixel_source_property;
 
+	/**
+	 * @solid_fill_property:
+	 * Optional solid_fill property for this plane. See
+	 * drm_plane_create_solid_fill_property().
+	 */
+	struct drm_property *solid_fill_property;
+
 	/**
 	 * @alpha_property:
 	 * Optional alpha property for this plane. See
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index ea1b639bcb28..3bf86406f10d 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
 	char name[DRM_DISPLAY_MODE_LEN];
 };
 
+/**
+ * struct drm_mode_solid_fill - User info for solid fill planes
+ *
+ * This is the userspace API solid fill information structure.
+ *
+ * Userspace can enable solid fill planes by assigning the plane "solid_fill"
+ * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
+ * color and setting the pixel source to "SOLID_FILL".
+ *
+ * For information on the plane property, see drm_plane_create_solid_fill_property()
+ *
+ * @r: Red color value of single pixel
+ * @g: Green color value of single pixel
+ * @b: Blue color value of single pixel
+ * @pad: padding, must be zero
+ */
+struct drm_mode_solid_fill {
+	__u32 r;
+	__u32 g;
+	__u32 b;
+	__u32 pad;
+};
+
+
 struct drm_mode_card_res {
 	__u64 fb_id_ptr;
 	__u64 crtc_id_ptr;

-- 
2.42.0

