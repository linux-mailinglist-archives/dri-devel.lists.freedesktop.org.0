Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDF7DA38C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 00:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C9E10EA9B;
	Fri, 27 Oct 2023 22:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B2210EA5D;
 Fri, 27 Oct 2023 22:33:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RMXTFX015928; Fri, 27 Oct 2023 22:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=FC1aUq6Aw7Bkzx6kFQTxATA+HxW2howxBYZNbytzTC8=;
 b=HEoFG600dxz9CBUsEwdsDheLsQO1whf7jUHhMDHJnf9j/evEjr2WRSGLLObqXybv+twA
 HhgXv9u8GT98DK3UtTw7SlkcRmhWZ6XOu8p/TLIUw955J7bQ01oak/2z0iGXw/sK2F8X
 j0uFg4aRGbJDqW2RLAPUbLpscBKS2WVx2T0MHXVIdEyXgfmiMyyhu9ogyM8u4DoNHJBb
 DeobzYRX0U6sDmtKgx8qP6i224FMXx9xNoRwtEj6K+ZjuNjseUZ6PhKkPMe35n3nx7aA
 scq0yeEJWlDm6NukeNZs01/24umF+JRBcE/I0l2TIt9WxuWOGuOuF53WgETitcnVwxui iA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyxbvb8bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:29 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RMXROL030522
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 22:33:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 27 Oct 2023 15:33:27 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 27 Oct 2023 15:32:55 -0700
Subject: [PATCH RFC v7 05/10] drm/atomic: Add solid fill data to plane
 state dump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231027-solid-fill-v7-5-780188bfa7b2@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698446005; l=2637;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=sPy3j48PBHXhvhp4TKxVQvfaRlReIVkG2Si6CQpLVX8=;
 b=9OGiHqndx+M7eOPiNepjDTkljNNLi1XsVve9+V08RX2d8MRdmEow91E9CDWvt+XgpDhmcntiH
 Co87eExmZpIBrCgh85/h8+7vtOxE9UcsZoyGI0N10UMH0aSJDhlNVIn
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9Sm8KKbMj0-iqt_ntXKKVnkmaQ9kamrj
X-Proofpoint-GUID: 9Sm8KKbMj0-iqt_ntXKKVnkmaQ9kamrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_21,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 mlxlogscore=618
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
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add solid_fill property data to the atomic plane state dump.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Sebastian Wick <sebastian@sebastianwick.net>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c | 4 ++++
 drivers/gpu/drm/drm_plane.c  | 8 ++++++++
 include/drm/drm_plane.h      | 3 +++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9f9abbe76369..af778d32785b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -726,6 +726,10 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
 	if (state->fb)
 		drm_framebuffer_print_info(p, 2, state->fb);
+	drm_printf(p, "\tsolid_fill=%u\n",
+			state->solid_fill_blob ? state->solid_fill_blob->base.id : 0);
+	if (state->solid_fill_blob)
+		drm_plane_solid_fill_print_info(p, 2, state);
 	drm_printf(p, "\tcrtc-pos=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&dest));
 	drm_printf(p, "\tsrc-pos=" DRM_RECT_FP_FMT "\n", DRM_RECT_FP_ARG(&src));
 	drm_printf(p, "\trotation=%x\n", state->rotation);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 559d101162ba..289b3be86d52 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1495,6 +1495,14 @@ __drm_plane_get_damage_clips(const struct drm_plane_state *state)
 					state->fb_damage_clips->data : NULL);
 }
 
+void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
+				     const struct drm_plane_state *state)
+{
+	drm_printf_indent(p, indent, "r=0x%08x\n", state->solid_fill.r);
+	drm_printf_indent(p, indent, "g=0x%08x\n", state->solid_fill.g);
+	drm_printf_indent(p, indent, "b=0x%08x\n", state->solid_fill.b);
+}
+
 /**
  * drm_plane_get_damage_clips - Returns damage clips.
  * @state: Plane state.
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index baaf737392bc..6171fb1a0b47 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -1001,6 +1001,9 @@ drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
 struct drm_mode_rect *
 drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
+void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
+				     const struct drm_plane_state *state);
+
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
 

-- 
2.42.0

