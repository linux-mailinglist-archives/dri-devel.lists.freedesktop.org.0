Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD219EA060
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 21:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8377610E556;
	Mon,  9 Dec 2024 20:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ILeUc3CQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A6910E556;
 Mon,  9 Dec 2024 20:38:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9E6kMp006934;
 Mon, 9 Dec 2024 20:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=fvwwTNIF8h8l5wvlor8WVW
 f38A1m4+BOueQ7v7bM4Bg=; b=ILeUc3CQYP+N1pnr0W0Dozudn4AeQ0ZxsMOm0Z
 hXkig7xumy981u2wKhqxH3b+edyau19lFPLFybGpsmxhi4kuiWfQH/TGZYLXIQe9
 3odTKH9N+JLMCqycDOby33R2/qAfhqg/lMo41yg7JxK3zJJNUhltOzOVS4djdWad
 mlfg2DLHGidhtvzPbjvi79YR4wTAz4jr6Rlf+RJRI7X0RMPghzbJFiJQICrTUVJe
 uLuwBGDqp/lbjyT90u9dMUnktLm63ApcLbuZPg4FbxEk+/4m2gUf9Gr09X3n4Yr5
 3mBNgQgw3o2I04M30Olr/GRK71E9zLeCndz4AGxg0B681CxA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e21bh3ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 20:38:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9Kc3WF016322
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Dec 2024 20:38:03 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 12:38:02 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 9 Dec 2024 12:37:51 -0800
Subject: [PATCH] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAB5VV2cC/x3MOwqAMBBF0a3I1A4kQQvdiljE+KKD+CFREYJ7N
 1ie4t5EEUEQqS0SBdwSZd8ydFmQm+02gWXMJqNMpY1q2M1wC8fTnuABfg/g8VoPNlbp2jrUvmo
 o10eAl+c/d/37ft2QiuBpAAAA
X-Change-ID: 20241209-check-state-before-dump-2a015ace5f49
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733776682; l=2773;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=C5d2g63eLwibyWB5dWw7Utj/EJvAdBmky2bZEuj5EEk=;
 b=ppM7s6p5sqiHgSgi+Umf86/swZhXI7/NHhoArJ3NiWopNobSJt1f36HAaXtd9a2H1mFDLJMUV
 NrtGBo0CcZcAap2FD/n8D9GZ8z2gGQA8CTAiD0F72c/SWrNIHUNJ3Wh
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4cOgugvzjWwoBsE5EswnqeB_W7uKadFu
X-Proofpoint-ORIG-GUID: 4cOgugvzjWwoBsE5EswnqeB_W7uKadFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090159
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to the r_pipe sspp protect, add a check to protect
the pipe state prints to avoid NULL ptr dereference for cases when
the state is dumped without a corresponding atomic_check() where the
pipe->sspp is assigned.

Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
To: Rob Clark <robdclark@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3ffac24333a2a5b01135d4ece418432d4a74dc04..fe3fd9587ec61f241ccb8c28925c7902b92bcdcd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1333,14 +1333,17 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
 	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 
-	drm_printf(p, "\tstage=%d\n", pstate->stage);
-
-	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
-	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
-	drm_printf(p, "\tmultirect_index[0]=%s\n",
-		   dpu_get_multirect_index(pipe->multirect_index));
-	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
-	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	if (pipe->sspp) {
+		drm_printf(p, "\tstage=%d\n", pstate->stage);
+
+		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
+		drm_printf(p, "\tmultirect_mode[0]=%s\n",
+			   dpu_get_multirect_mode(pipe->multirect_mode));
+		drm_printf(p, "\tmultirect_index[0]=%s\n",
+			   dpu_get_multirect_index(pipe->multirect_index));
+		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
+		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
+	}
 
 	if (r_pipe->sspp) {
 		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);

---
base-commit: 9d6a414ad31e8eb296cd6f2c1834b2c6994960a0
change-id: 20241209-check-state-before-dump-2a015ace5f49

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

