Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780B56B32A6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA71C10E907;
	Fri, 10 Mar 2023 00:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BBE10E903;
 Fri, 10 Mar 2023 00:16:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329NJnY0026303; Fri, 10 Mar 2023 00:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=3Sv3YtyIlPgJ03uelZlIHPUVAUbWr+sHttdUoRh+Bic=;
 b=ABYsjcwB1XYfGNI90xUNd5S465YY/4k4oyhUJJ+7Qi5qcKWipBICo7tMA/tiah20WgNm
 AO3i293K+oXvvYiGXRk2UFuNOiS2sM7DXgpsUOfZac083aHBHk8DXBdIw7QW8/REp1yM
 dHzmhBmnWPSskZf16AzfpPFHl6ibakpwtziGxWajgHyG1Z3khX8ML9vyrnFISUPCGJt/
 POIGTliW0v/d+0OhqGPqrYhtl0WgIhZhcPQOXsFMbIWORcS31ymidgRUX+1JRyVkallW
 /4dfw8fkKsReTEBOrwqlEFawm7m9P7LgkRG86ALCYEvbzFqMBOcFB6Rm0oeQB53oI71k 1Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p7rqgr4p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 00:16:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32A0Ga0e017468
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 00:16:37 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 9 Mar 2023 16:16:36 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/msm/dpu: call _dpu_crtc_blend_setup_pipe for r_pipe
Date: Thu, 9 Mar 2023 16:16:19 -0800
Message-ID: <1678407380-20391-4-git-send-email-quic_abhinavk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Z1ETB4sZhZZRDg9AnhATeqd2z0ddpJCb
X-Proofpoint-GUID: Z1ETB4sZhZZRDg9AnhATeqd2z0ddpJCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_13,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090194
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

_dpu_crtc_blend_setup_mixer() should call _dpu_crtc_blend_setup_pipe()
to stage the rectangles of the sspp for both the left and right
halves.

However, it incorrectly invokes it only for the left half causing
basic wide planes to not work and only half the screen is shown
on the display.

This was validated using a 2560x1440 DP monitor on sc7280 as
the max_linewidth is 2400 on sc7280.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 03034ec8ed1b..b748c4f17c90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -486,7 +486,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
 						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe, 1, stage_cfg);
+						   &pstate->r_pipe, 1, stage_cfg);
 		}
 
 		/* blend config update */
-- 
2.7.4

