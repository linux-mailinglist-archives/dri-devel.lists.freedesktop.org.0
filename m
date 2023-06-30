Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B217431AC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209F510E418;
	Fri, 30 Jun 2023 00:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC15910E40E;
 Fri, 30 Jun 2023 00:25:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35U0JTuh005812; Fri, 30 Jun 2023 00:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=zjPa45oL/pErAsL7MxcKBo5QLvypUGJJmkV+lm18PDc=;
 b=Ceg0g1rGTEl/yFdM1FDr+AwSaUG4CBODBhRYqVbszHPQ+iBUCRpGiOd0xchO0MsQdL/8
 JaSTJShOrGHfb5Jg/7k6Jw4rhG0BcvzVyKN7X0TbJP89/7ZogxHz59JSCGBCgnh32yUC
 CnsLryP1EDKW/YdQVMmG/DSSXw0cfIs2p6GkZof4gblg/6GIyke9mn/OXWc/OZncu5ir
 xJNUWtjCQYFm4GQe2FljXPmJpqx1R1rcxa2YdvUiW31sKW75TT6AEBTjoxSxNEi6+Vzk
 weHpG/nx3nj3mIys5o6wHII8F/u7AhL1pWJ97n96UuWiXByRljOhvIPwaR739w9ovP0n pA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rh5g8sxe7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 00:25:38 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U0Pbag010716
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 00:25:37 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 29 Jun 2023 17:25:36 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Jun 2023 17:25:03 -0700
Subject: [PATCH RFC v4 4/7] drm/atomic: Loosen FB atomic checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230404-solid-fill-v4-4-f4ec0caa742d@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
In-Reply-To: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688084735; l=7336;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=9NfyDg9G5BsexYdr7vq5WbJruCxrdq8/GGr1pdk8gEc=;
 b=Ux006x40VlMURaA+mnE+pfKaNTd7yzNpJJzOsauAY9QBd0E9SckY3gnwiAXPZSxjeSIImQY7g
 5IOlWRTAwogB/3ut0lp4oOo7TpzeQpkhyqkye69lmIRtovlvmmmgPa2
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VmHGHGLd_E0tIdTuXeOLkL60F7oRtx-a
X-Proofpoint-GUID: VmHGHGLd_E0tIdTuXeOLkL60F7oRtx-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=823 clxscore=1015 suspectscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Loosen the requirements for atomic and legacy commit so that, in cases
where solid fill planes is enabled but no FB is set, the commit can
still go through.

This includes adding framebuffer NULL checks in other areas to account
for FB being NULL when solid fill is enabled.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c        | 14 +++++++-------
 drivers/gpu/drm/drm_atomic_helper.c | 34 ++++++++++++++++++++--------------
 drivers/gpu/drm/drm_plane.c         |  8 ++++----
 include/drm/drm_atomic_helper.h     |  4 ++--
 include/drm/drm_plane.h             | 28 ++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 404b984d2d9f..ec9681c25366 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -668,14 +668,14 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	const struct drm_framebuffer *fb = new_plane_state->fb;
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
 
@@ -706,7 +706,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 
-	if (fb) {
+	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
 		ret = drm_atomic_check_fb(new_plane_state);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 41b8066f61ff..d05ec9ef2b3e 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	*src = drm_plane_state_src(plane_state);
 	*dst = drm_plane_state_dest(plane_state);
 
-	if (!fb) {
+	if (!drm_plane_has_visible_data(plane_state)) {
 		plane_state->visible = false;
 		return 0;
 	}
@@ -881,25 +881,31 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
+	if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
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
+		/* Check scaling */
+		hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
+		vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
+
+		if (hscale < 0 || vscale < 0) {
+			drm_dbg_kms(plane_state->plane->dev,
+					"Invalid scaling of plane\n");
+			drm_rect_debug_print("src: ", &plane_state->src, true);
+			drm_rect_debug_print("dst: ", &plane_state->dst, false);
+			return -ERANGE;
+		}
 	}
 
 	if (crtc_state->enable)
 		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
 
-	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
-
-	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+	if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
+		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
+		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+	} else if (drm_plane_solid_fill_enabled(plane_state)) {
+		plane_state->visible = true;
+	}
 
 	if (!plane_state->visible)
 		/*
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..5f19a27ba182 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -861,8 +861,8 @@ static int __setplane_internal(struct drm_plane *plane,
 
 	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb) {
+	/* No visible data means shut it down */
+	if (!drm_plane_has_visible_data(plane->state)) {
 		plane->old_fb = plane->fb;
 		ret = plane->funcs->disable_plane(plane, ctx);
 		if (!ret) {
@@ -913,8 +913,8 @@ static int __setplane_atomic(struct drm_plane *plane,
 
 	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb)
+	/* No visible data means shut it down */
+	if (!drm_plane_has_visible_data(plane->state))
 		return plane->funcs->disable_plane(plane, ctx);
 
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
index 73fb6cf8a5d9..f893f7a56912 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -998,6 +998,34 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
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
+	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_COLOR && state->solid_fill_blob;
+}
+
+static inline bool drm_plane_has_visible_data(const struct drm_plane_state *state)
+{
+	switch (state->pixel_source) {
+	case DRM_PLANE_PIXEL_SOURCE_COLOR:
+		return state->solid_fill_blob != NULL;
+
+	default:
+		return state->fb != NULL;
+	}
+
+	return false;
+}
+
+
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
 

-- 
2.41.0

