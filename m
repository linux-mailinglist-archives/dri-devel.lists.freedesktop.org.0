Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30297800129
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 02:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AC610E79F;
	Fri,  1 Dec 2023 01:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2D510E798;
 Fri,  1 Dec 2023 01:41:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUMp9K5019418; Fri, 1 Dec 2023 01:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=3nqrAExzL6JTIOm+Yfjp+zfrumqFw8E6t3//XmyKcAk=;
 b=JrqUj3kvj5XyTfCGbvpD9WGVJEISoSX7UClclLX4dTJYuP/8eXIQHxFdP69F+1t3VkBg
 0Z6XeXQCDG4xtg7VSugivgchxmTRfnnUfGdganGHGXq6/wVbMmxJv18HANvoUM6HbrWI
 Mtkrwf/y131NWyVK7jTTpVo6ohqyFF9dOKq7GQq2EDvRNeQ5djcSYJ1s6VpqFLKl48Vn
 wJ0hDHD9qxzh3nPKcrX32FAt0clqORwzDKEllecZcovlkHCFTL9Dd2+sVN0r8aF6kqTj
 eoueydcZnNyXLVHBxXi6dju4r7UMq2QRjcB5VFJCZNKsrjzGE6AQ69RQ87lkk5uzZd/C Ag== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upvm1sgyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 01:41:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B11fFSs015964
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 01:41:15 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 17:41:14 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 1/2] drm/msm/dpu: Modify vblank_refcount if error in
 callback
Date: Thu, 30 Nov 2023 17:40:54 -0800
Message-ID: <20231201014101.15802-2-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201014101.15802-1-quic_parellan@quicinc.com>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: n4GMGhXGR_qIGt6GT1ekY-OL6VyL1al8
X-Proofpoint-GUID: n4GMGhXGR_qIGt6GT1ekY-OL6VyL1al8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010009
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
2.41.0

