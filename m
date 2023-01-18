Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461BE672CB1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 00:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED0D10E86B;
	Wed, 18 Jan 2023 23:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00F110E86B;
 Wed, 18 Jan 2023 23:39:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30INVdaU003088; Wed, 18 Jan 2023 23:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=xn0IoLYGkGNrFsEmPAlr5+5f1kkNCC84vRmgMEK0qyc=;
 b=XXRtRJacSUqPzgK3MNvfoYKxT4sguQVhlOK/oF/lqto6qT0yaUg26j7rMikRHKSyyuYc
 AaiIkf8iL2ToFgQEnvToz2tJA3nj5gVeycTYiirPrvCKk8gNBTUkEXCnZVjbjR0wByzu
 5+LIrzuGGE0g26qo+LU55hWQ1LDRKCRD8vkw5TBQ/lx3203yoSx4cXH2/CwsPt5K9VzV
 t5seIP56GvsFs6StrYdYdXvJlHQ0U6tKU+Y+F/vt14a47bE7gUJqMTYtsplcJ4yfAhVD
 CGpnCii4R5hr7pygM/FJkXtTSAQg6S5RvhXlF8HyOcV+d4SQi/lpA1tt8txlSVkJcw3O nw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6r5987ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 23:39:04 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30INd47x019382
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 23:39:04 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 18 Jan 2023 15:39:03 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3] drm/msm/dpu: Reapply CTM if modeset is needed
Date: Wed, 18 Jan 2023 15:38:48 -0800
Message-ID: <20230118233848.611-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4VjfkML8hKxStsPr2jPfLU5FNdB9WE6P
X-Proofpoint-GUID: 4VjfkML8hKxStsPr2jPfLU5FNdB9WE6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=833 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301180196
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a !drm_atomic_crtc_needs_modeset() check to
_dpu_crtc_setup_cp_blocks() so that CTM is reapplied if the LM/DSPP
blocks were reallocated during modeset or after a suspend/resume.

Changes in V2:
- Fixed commit message

Changes in V3:
- Added mention of suspend/resume case back to commit message

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 13ce321283ff..aa120a230222 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -748,7 +748,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 	int i;
 
 
-	if (!state->color_mgmt_changed)
+	if (!state->color_mgmt_changed && !drm_atomic_crtc_needs_modeset(state))
 		return;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
-- 
2.39.0

