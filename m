Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420AF7DA37A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 00:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CCF10EA61;
	Fri, 27 Oct 2023 22:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B4D10EA5E;
 Fri, 27 Oct 2023 22:33:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RMW7GQ027877; Fri, 27 Oct 2023 22:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=yCUyPv3e1/GNQdAsSKktW9PKVBR6XemuX9wtdB1vNsQ=;
 b=jyEP9OMDP0dxW4qBuRMkmtAGmU8Tmp85xiQUzuLTOT2f772215QycSwbUtwohb7iVLWQ
 rifIyhCQIdsmkee1ieD28oNsiHk6Mvw7SK07FolhvqYf5fFhX57em4IhtSriqWFFC22K
 ij91zhcwDuC4xc4UXsrptlm0LObELJBWc8gP1d0f8wLk4aqRtRh+SReyYA8NVT36kVXl
 fPVaXRPyijZyPg8P5Vi7hrM2Qq9pO7fgZ827HA77af8E+YyGKK7GsKfXB5KFtcnvjp6v
 aauYVVCTVpHOgy+VReY1/hz8kaujxn9B+ta8cgwX0fj7Qb2HlBrsVmviOQwOL7R8BRty VA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0bnr1efm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:28 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RMXR12012043
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 27 Oct 2023 15:33:27 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 27 Oct 2023 15:32:54 -0700
Subject: [PATCH RFC v7 04/10] drm/atomic: Add pixel source to plane state dump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231027-solid-fill-v7-4-780188bfa7b2@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698446005; l=2198;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ZCyfs4rBGRWAaiul8wk8CuY9FViHx5LqSTBmYUs6PaU=;
 b=ng4tPOj3519LhMZePgiSUsLp0/xBb0+Kslo8OnkeKrwk/r/SrkAwSJB0BQigJbN7E4/U8CiBO
 yiOz5TM92r2D9MdmnJHaZuh0Z8MnXRBnxHOfPylqOtSwlD86Mx1BWWX
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RSvX3-9QZAqXewvQefqlT99NlAU-6rev
X-Proofpoint-ORIG-GUID: RSvX3-9QZAqXewvQefqlT99NlAU-6rev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_21,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=414 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add pixel source to the atomic plane state dump

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Sebastian Wick <sebastian@sebastianwick.net>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c        | 1 +
 drivers/gpu/drm/drm_blend.c         | 1 +
 drivers/gpu/drm/drm_crtc_internal.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c277b198fa3f..9f9abbe76369 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -722,6 +722,7 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 
 	drm_printf(p, "plane[%u]: %s\n", plane->base.id, plane->name);
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
+	drm_printf(p, "\tpixel-source=%s\n", drm_get_pixel_source_name(state->pixel_source));
 	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
 	if (state->fb)
 		drm_framebuffer_print_info(p, 2, state->fb);
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 37b31b7e5ce5..9c1608f7c1df 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -647,6 +647,7 @@ static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
 	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
 	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
 };
+DRM_ENUM_NAME_FN(drm_get_pixel_source_name, drm_pixel_source_enum_list);
 
 /**
  * drm_plane_create_pixel_source_property - create a new pixel source property
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 501a10edd0e1..7bc93ba449d5 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -267,6 +267,7 @@ int drm_plane_check_pixel_format(struct drm_plane *plane,
 				 u32 format, u64 modifier);
 struct drm_mode_rect *
 __drm_plane_get_damage_clips(const struct drm_plane_state *state);
+const char *drm_get_pixel_source_name(int val);
 
 /* drm_bridge.c */
 void drm_bridge_detach(struct drm_bridge *bridge);

-- 
2.42.0

