Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03147DA38B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 00:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE9210EA98;
	Fri, 27 Oct 2023 22:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFFD10EA5C;
 Fri, 27 Oct 2023 22:33:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RMMjVs027511; Fri, 27 Oct 2023 22:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=CYy9LY0AuPrsMb30pNthjEmUuKpgCqV4pzLSurY6pfk=;
 b=OFR7/918iN+8IOyyMqM/GNKc8tf7qKEuBW54UlqinaPvxSxeZgeziRUx6T18hgfh6M2h
 hsHwnbAoWxRLV+S1ED/sCoogpPbazdBsnYv4HtcTAc2a1G02enztx7IIKg3nnEvLNd9Z
 vVglC5XSulVXBzlK80DtoOW2S/ZlXwZlOMBo3I0MCdnzoJ9/J89Xj0EK/C71nJHghlBR
 QGgwRZVgbh6G8leoc1lkcyaK1mjXXFAyj5HyxNEhtqu5OYae6z7hRdXZg/Fn18byYjP3
 lzWcIzchlDbvVKHV7sWUfdP6Uv1pLWq5kamfIT5zmcelLi47fvPU6ywDtom2fU/mdnZB 0w== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyws9bbea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:29 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RMXSFB030526
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 27 Oct 2023 15:33:28 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 27 Oct 2023 15:32:57 -0700
Subject: [PATCH RFC v7 07/10] drm/atomic: Loosen FB atomic checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698446005; l=7406;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=TbsBRFhS6Fbvd/H9xpjCulQntS/aAU2CrEtUvIGQeT8=;
 b=Q9MQIi3+jm57iPR4Kj2Oik6IyTE3bb9iZwR1KnFit++A1qufK1UVbA/KKy3jpQjCWmcA72JmP
 TvOpFGy59+ADI7/ANoDNe1eH//qwnVifU7Nq3A5FRDjJTx7y0VLmSpi
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FjvU8Vca2ZZUPmWsffvfqQNePTAOe4BJ
X-Proofpoint-GUID: FjvU8Vca2ZZUPmWsffvfqQNePTAOe4BJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_21,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=866 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loosen the requirements for atomic and legacy commit so that, in cases
where pixel_source != FB, the commit can still go through.

This includes adding framebuffer NULL checks in other areas to account for
FB being NULL when non-FB pixel sources are enabled.

To disable a plane, the pixel_source must be NONE or the FB must be NULL
if pixel_source == FB.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c        | 21 ++++++++++----------
 drivers/gpu/drm/drm_atomic_helper.c | 39 +++++++++++++++++++++----------------
 include/drm/drm_atomic_helper.h     |  4 ++--
 include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 48a2df4e3d27..66e49c06aced 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -674,17 +674,16 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 {
 	struct drm_plane *plane = new_plane_state->plane;
 	struct drm_crtc *crtc = new_plane_state->crtc;
-	const struct drm_framebuffer *fb = new_plane_state->fb;
 	int ret;
 
-	/* either *both* CRTC and FB must be set, or neither */
-	if (crtc && !fb) {
-		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
+	/* either *both* CRTC and pixel source must be set, or neither */
+	if (crtc && !drm_plane_has_visible_data(new_plane_state)) {
+		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no visible data\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
-	} else if (fb && !crtc) {
-		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
-			       plane->base.id, plane->name);
+	} else if (drm_plane_has_visible_data(new_plane_state) && !crtc) {
+		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] Source %d has visible data but no CRTC\n",
+			       plane->base.id, plane->name, new_plane_state->pixel_source);
 		return -EINVAL;
 	}
 
@@ -715,9 +714,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 
-	ret = drm_atomic_plane_check_fb(new_plane_state);
-	if (ret)
-		return ret;
+	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && new_plane_state->fb) {
+		ret = drm_atomic_plane_check_fb(new_plane_state);
+		if (ret)
+			return ret;
+	}
 
 	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
 		drm_dbg_atomic(plane->dev,
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 292e38eb6218..27e8c8dd9324 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -852,7 +852,6 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					bool can_position,
 					bool can_update_disabled)
 {
-	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_rect *src = &plane_state->src;
 	struct drm_rect *dst = &plane_state->dst;
 	unsigned int rotation = plane_state->rotation;
@@ -864,7 +863,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	*src = drm_plane_state_src(plane_state);
 	*dst = drm_plane_state_dest(plane_state);
 
-	if (!fb) {
+	if (!drm_plane_has_visible_data(plane_state)) {
 		plane_state->visible = false;
 		return 0;
 	}
@@ -881,25 +880,31 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
+	/* Check that selected pixel source is valid */
+	if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && plane_state->fb) {
+		struct drm_framebuffer *fb = plane_state->fb;
+		drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
 
-	/* Check scaling */
-	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
-	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
-	if (hscale < 0 || vscale < 0) {
-		drm_dbg_kms(plane_state->plane->dev,
-			    "Invalid scaling of plane\n");
-		drm_rect_debug_print("src: ", &plane_state->src, true);
-		drm_rect_debug_print("dst: ", &plane_state->dst, false);
-		return -ERANGE;
-	}
+		/* Check scaling */
+		hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
+		vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
 
-	if (crtc_state->enable)
-		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
+		if (hscale < 0 || vscale < 0) {
+			drm_dbg_kms(plane_state->plane->dev,
+					"Invalid scaling of plane\n");
+			drm_rect_debug_print("src: ", &plane_state->src, true);
+			drm_rect_debug_print("dst: ", &plane_state->dst, false);
+			return -ERANGE;
+		}
 
-	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
+		if (crtc_state->enable)
+			drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
 
-	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
+		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+	} else if (drm_plane_solid_fill_enabled(plane_state)) {
+		plane_state->visible = true;
+	}
 
 	if (!plane_state->visible)
 		/*
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..6d97f38ac1f6 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -256,8 +256,8 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
 	 * Anything else should be considered a bug in the atomic core, so we
 	 * gently warn about it.
 	 */
-	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
-		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
+	WARN_ON((new_plane_state->crtc == NULL && drm_plane_has_visible_data(new_plane_state)) ||
+		(new_plane_state->crtc != NULL && !drm_plane_has_visible_data(new_plane_state)));
 
 	return old_plane_state->crtc && !new_plane_state->crtc;
 }
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 6171fb1a0b47..56b7a0acce74 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -992,6 +992,35 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 #define drm_for_each_plane(plane, dev) \
 	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
 
+/**
+ * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
+ * @state: plane state
+ *
+ * Returns:
+ * Whether the plane has been assigned a solid_fill_blob
+ */
+static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *state)
+{
+	if (!state)
+		return false;
+	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL && state->solid_fill_blob;
+}
+
+static inline bool drm_plane_has_visible_data(const struct drm_plane_state *state)
+{
+	switch (state->pixel_source) {
+	case DRM_PLANE_PIXEL_SOURCE_NONE:
+		return false;
+	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
+		return state->solid_fill_blob != NULL;
+	case DRM_PLANE_PIXEL_SOURCE_FB:
+	default:
+		WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
+	}
+
+	return state->fb != NULL;
+}
+
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
 

-- 
2.42.0

