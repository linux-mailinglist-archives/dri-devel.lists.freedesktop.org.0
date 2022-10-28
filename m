Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D4611DDF
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 01:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F6010E8FB;
	Fri, 28 Oct 2022 23:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BDE10E8F4;
 Fri, 28 Oct 2022 23:00:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SN01a0015239;
 Fri, 28 Oct 2022 23:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rLNj1v36MAqp1DJc1ri0Mjyxui+XuU2/YiVpM7f+o28=;
 b=ZfEggxeSntnvDvc+FwxuNNyMOyx60CiZj3SDjIBQGfz3Cca/DSF6JBkBqikx3FzPnYjh
 AUzbCeXSat+7D6ihJ971wsfNdR0SQBFic6ZfTSw+14oviQdSk86ruYWaqd/XI+SCVlqL
 0V60+7AVJwvhKPNg7P6d0RIp1qYAeo7Qz1cJZgwH/BE7H4uhMMdltdrWaalOhrGM0av9
 aMkIyHC9BVWBIL9G468UDEe7Ru5HppC21cnInBjcWmA2Z26lHdbYYtBfQ1iStS3rrkDm
 LkZxX+/bawOPFZxvVFZ8hnS4WfGroKW2YmhOQ3OgY0VuM6XPYh8Nma1t09cmCy4F8u4w BA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kgdaw1jkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 23:00:16 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29SN0Fr8006352
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 23:00:15 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 28 Oct 2022 16:00:14 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH 2/3] drm: Adjust atomic checks for solid fill color
Date: Fri, 28 Oct 2022 15:59:51 -0700
Message-ID: <20221028225952.160-3-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028225952.160-1-quic_jesszhan@quicinc.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rhdRa1p7w5vAcM5hpKeXBQ-IUKz118YN
X-Proofpoint-ORIG-GUID: rhdRa1p7w5vAcM5hpKeXBQ-IUKz118YN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=856 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280145
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loosen the requirements for atomic and legacy commit so that, in cases
where solid fill planes is enabled (and FB_ID is NULL), the commit can
still go through.

In addition, add framebuffer NULL checks in other areas to account for
FB being NULL when solid fill is enabled.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c        | 68 ++++++++++++++++-------------
 drivers/gpu/drm/drm_atomic_helper.c | 34 +++++++++------
 drivers/gpu/drm/drm_plane.c         |  8 ++--
 include/drm/drm_atomic_helper.h     |  5 ++-
 4 files changed, 64 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f197f59f6d99..b576ed221431 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -601,8 +601,10 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	uint32_t num_clips;
 	int ret;
 
-	/* either *both* CRTC and FB must be set, or neither */
-	if (crtc && !fb) {
+	/* When color_fill is disabled,
+	 * either *both* CRTC and FB must be set, or neither
+	 */
+	if (crtc && !fb && !new_plane_state->color_fill) {
 		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
 			       plane->base.id, plane->name);
 		return -EINVAL;
@@ -626,14 +628,16 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 	/* Check whether this plane supports the fb pixel format. */
-	ret = drm_plane_check_pixel_format(plane, fb->format->format,
-					   fb->modifier);
-	if (ret) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
-			       plane->base.id, plane->name,
-			       &fb->format->format, fb->modifier);
-		return ret;
+	if (fb) {
+		ret = drm_plane_check_pixel_format(plane, fb->format->format,
+						   fb->modifier);
+
+		if (ret)
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
+				       plane->base.id, plane->name,
+				       &fb->format->format, fb->modifier);
+			return ret;
 	}
 
 	/* Give drivers some help against integer overflows */
@@ -649,28 +653,30 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -ERANGE;
 	}
 
-	fb_width = fb->width << 16;
-	fb_height = fb->height << 16;
+	if (fb) {
+		fb_width = fb->width << 16;
+		fb_height = fb->height << 16;
 
-	/* Make sure source coordinates are inside the fb. */
-	if (new_plane_state->src_w > fb_width ||
-	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
-	    new_plane_state->src_h > fb_height ||
-	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid source coordinates "
-			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
-			       plane->base.id, plane->name,
-			       new_plane_state->src_w >> 16,
-			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_h >> 16,
-			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_x >> 16,
-			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_y >> 16,
-			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
-			       fb->width, fb->height);
-		return -ENOSPC;
+		/* Make sure source coordinates are inside the fb. */
+		if (new_plane_state->src_w > fb_width ||
+		    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
+		    new_plane_state->src_h > fb_height ||
+		    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] invalid source coordinates "
+				       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
+				       plane->base.id, plane->name,
+				       new_plane_state->src_w >> 16,
+				       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
+				       new_plane_state->src_h >> 16,
+				       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
+				       new_plane_state->src_x >> 16,
+				       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
+				       new_plane_state->src_y >> 16,
+				       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
+				       fb->width, fb->height);
+			return -ENOSPC;
+		}
 	}
 
 	clips = __drm_plane_get_damage_clips(new_plane_state);
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 8bf41aa24068..5a5ffa06b8bd 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -818,7 +818,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	*src = drm_plane_state_src(plane_state);
 	*dst = drm_plane_state_dest(plane_state);
 
-	if (!fb) {
+	if (!fb && !plane_state->color_fill) {
 		plane_state->visible = false;
 		return 0;
 	}
@@ -835,25 +835,31 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return -EINVAL;
 	}
 
-	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
+	if (fb) {
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
+			    	"Invalid scaling of plane\n");
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
+	if (fb) {
+		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
+		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
+	} else if (plane_state->color_fill) {
+		plane_state->visible = true;
+	}
 
 	if (!plane_state->visible)
 		/*
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 726f2f163c26..223b5ed93d3a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -850,8 +850,8 @@ static int __setplane_internal(struct drm_plane *plane,
 
 	WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb) {
+	/* No fb and no color fill means shut it down */
+	if (!fb && (plane->state && !plane->state->color_fill)) {
 		plane->old_fb = plane->fb;
 		ret = plane->funcs->disable_plane(plane, ctx);
 		if (!ret) {
@@ -902,8 +902,8 @@ static int __setplane_atomic(struct drm_plane *plane,
 
 	WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
 
-	/* No fb means shut it down */
-	if (!fb)
+	/* No fb and no color fill means shut it down */
+	if (!fb && (plane->state && !plane->state->color_fill))
 		return plane->funcs->disable_plane(plane, ctx);
 
 	/*
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 2a0b17842402..aa7576f0879d 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -219,8 +219,9 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
 	 * Anything else should be considered a bug in the atomic core, so we
 	 * gently warn about it.
 	 */
-	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
-		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
+	WARN_ON(!new_plane_state->color_fill &&
+			((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
+			(new_plane_state->crtc != NULL && new_plane_state->fb == NULL)));
 
 	return old_plane_state->crtc && !new_plane_state->crtc;
 }
-- 
2.38.0

