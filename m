Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23D8000D6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 02:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED39510E792;
	Fri,  1 Dec 2023 01:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C754E10E794;
 Fri,  1 Dec 2023 01:08:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUN7akT017185; Fri, 1 Dec 2023 01:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=1Qphx6EBOdkvkyIMjEOJQkzV3uQ7oiDj85+npScU12E=;
 b=iJ/EpFvcadeAPNWFS010DpQqi19KLET+eJbzO8RCDdPIqSeTJqv1HfI7xSOAdRaoWwoZ
 M8kNptch9tvEAwmdNi6gQnUMg3ukDrfD9kn/9UndzrAnrnDEIIt+v/A56rsOYy99W+4Q
 88+H6VBu6cBGTRDVyyQhghYJkoKcITX9Udm/13H59QBcGxkAYmyKGc2k93x4QVoKJQ6i
 pS2jsTyXlbEcA8od6tLC61v4sDfznPasHy0Ucs02BwTOLFtI7ZtAMFo12e5ABu5rUwA1
 pgQ3E7jjlCDvleuc/Ev/hgCf7GemdBkzWaPkGFv4WcF684DYMch/dXbZqCvyyhilTlCP 8A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upw12scs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 01:08:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B118J2U014751
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 01:08:19 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 17:08:19 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/msm/dpu: Modify vblank_refcount if error in callback
Date: Thu, 30 Nov 2023 17:07:53 -0800
Message-ID: <20231201010758.1703-2-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201010758.1703-1-quic_parellan@quicinc.com>
References: <20231201010758.1703-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _i9-sK6nuW3MPR2Vco_v_8SluWkpkwCs
X-Proofpoint-ORIG-GUID: _i9-sK6nuW3MPR2Vco_v_8SluWkpkwCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312010006
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, steev@kali.org,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the irq callback returns a value other than zero,
modify vblank_refcount by performing the inverse
operation of its corresponding if-else condition.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 +++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index be185fe69793b..25babfe1f001a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -260,14 +260,19 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		      phys_enc->hw_pp->idx - PINGPONG_0,
 		      enable ? "true" : "false", refcount);
 
-	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
+	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1) {
 		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				phys_enc->irq[INTR_IDX_RDPTR],
 				dpu_encoder_phys_cmd_te_rd_ptr_irq,
 				phys_enc);
-	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
+		if (ret)
+			atomic_dec(&phys_enc->vblank_refcount);
+	} else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0) {
 		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
 				phys_enc->irq[INTR_IDX_RDPTR]);
+		if (ret)
+			atomic_inc(&phys_enc->vblank_refcount);
+	}
 
 end:
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a01fda7118835..8e905d7267f9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -379,14 +379,19 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 	DRM_DEBUG_VBL("id:%u enable=%d/%d\n", DRMID(phys_enc->parent), enable,
 		      atomic_read(&phys_enc->vblank_refcount));
 
-	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
+	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1) {
 		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				phys_enc->irq[INTR_IDX_VSYNC],
 				dpu_encoder_phys_vid_vblank_irq,
 				phys_enc);
-	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
+		if (ret)
+			atomic_dec(&phys_enc->vblank_refcount);
+	} else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0) {
 		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
 				phys_enc->irq[INTR_IDX_VSYNC]);
+		if (ret)
+			atomic_inc(&phys_enc->vblank_refcount);
+	}
 
 end:
 	if (ret) {
-- 
2.39.2

