Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FACF6B32A2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E4810E903;
	Fri, 10 Mar 2023 00:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1110E2D8;
 Fri, 10 Mar 2023 00:16:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329N8LY7003217; Fri, 10 Mar 2023 00:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=ZISqFqZUPRSkiQmJuPeL8/9N4yTLprDKUvGhUFrO8gw=;
 b=a/ly0UQpZHb9PhU/P/QoNZhoTOta1FfmwE0DN+XlE3nM7im3cBfhCRaDHWEE6lwhcs2m
 nJQpoxBKq3YBbFRBjD5Hcb6a11dwdzl15A6zgPDd6Yy+vGnPTylkK3G6j8B9iI53r8vT
 bFzBoofFdxfnAKyqYfqTZvk44eSe9/aNaTr3prissV71YB8EJa+7Xhzvn41A+plyQzRO
 59zND094x3TzRaCTzmuLFSNz63rtd6TuGBq4DExhIdtdnvfUw52hart6V/6o4oI/Bfk3
 p7P6kg8ZDOOQvs2k32zT32JurPNQ9hD7p0+UVBwM9POU/AUHIS84q0m4BEtGMnNaIuAh Tw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p7mgrgtr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 00:16:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32A0GYhD017461
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 00:16:34 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 9 Mar 2023 16:16:33 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/msm/dpu: avoid checking uninitialized plane format
Date: Thu, 9 Mar 2023 16:16:17 -0800
Message-ID: <1678407380-20391-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1678407380-20391-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1678407380-20391-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QkGa9f_-7YtnBbR3fGvXDhOS9v6DiyTC
X-Proofpoint-GUID: QkGa9f_-7YtnBbR3fGvXDhOS9v6DiyTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_14,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=710 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090195
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dpu_plane_atomic_check() checks for the format to make sure its
not YUV before using multirect.

However the format is not initialized before this. This causes
a compilation issue and also would not work if YUV content
is tried.

Fix it by setting the format before the check.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 06fbe5ef7ff2..9a03d1cad0ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1027,6 +1027,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		/* struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state); */
 
@@ -1067,8 +1069,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
 	}
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
-
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
-- 
2.7.4

