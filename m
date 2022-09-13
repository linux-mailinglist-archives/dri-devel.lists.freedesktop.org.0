Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806D5B7292
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC71A10E759;
	Tue, 13 Sep 2022 14:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90A510E5DF;
 Tue, 13 Sep 2022 14:56:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DDui8c024936;
 Tue, 13 Sep 2022 14:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=4nlqORRt9b3DsraZrJNija+m8ktZiw/UtRuAhAf6CDc=;
 b=oKL3amyyXlb/jJUlP5rMG244QJuVCbTW1GVALO2DyhPtrCTyKBNGCEbbNb3dtmEMBuLb
 Wmgc06RcS/yjR/6jSR4a0iABJ63gEwgFIq6EzrS7ETlTEsPwE9bf5Crs2OVdOEVTOH/C
 kvD2clIjcKaKzkz2VAAAl6a4GRS389oktjpU2dXP1vIEsiTt87+r8orL/JC2HjVFaVZD
 Vhn0SkGB05Cmf/AghbviH9YXSE9XO0jBHMhDeAnmi4o5YsoAMLp/fHxG9cylCs2SFdhw
 31J9tc4ETSRjMNSFrG4uSTx7JqUUbz6ibRfNY9Ko9o3vOwZVPfk73R66BMlotRh9CjNY 9g== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjnju9vpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 14:56:31 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28DEpR1V017971; 
 Tue, 13 Sep 2022 14:51:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3jh46m5ds1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 13 Sep 2022 14:51:27 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28DEpQGf017856;
 Tue, 13 Sep 2022 14:51:27 GMT
Received: from vpolimer-linux.qualcomm.com (vpolimer-linux.qualcomm.com
 [10.204.67.235])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 28DEpQKB017894;
 Tue, 13 Sep 2022 14:51:27 +0000
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id DC5A14044; Tue, 13 Sep 2022 20:21:25 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 09/15] drm/msm/disp/dpu: use atomic enable/disable
 callbacks for encoder functions
Date: Tue, 13 Sep 2022 20:21:10 +0530
Message-Id: <1663080676-12936-10-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1663080676-12936-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1663080676-12936-1-git-send-email-quic_vpolimer@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1IVV-D-dQmG38CDiGNnMm_JXEho6IFSg
X-Proofpoint-GUID: 1IVV-D-dQmG38CDiGNnMm_JXEho6IFSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_07,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=910
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130068
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic variants for encoder callback functions such that
certain states like self-refresh can be accessed as part of
enable/disable sequence.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0c7d8b5..9cb2542 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1167,7 +1167,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
+					struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
@@ -1203,7 +1204,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
+					struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int i = 0;
@@ -2387,8 +2389,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
-	.disable = dpu_encoder_virt_disable,
-	.enable = dpu_encoder_virt_enable,
+	.atomic_disable = dpu_encoder_virt_atomic_disable,
+	.atomic_enable = dpu_encoder_virt_atomic_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
-- 
2.7.4

