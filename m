Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEBA74A51C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 22:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F5010E4AA;
	Thu,  6 Jul 2023 20:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FBC10E0FD;
 Thu,  6 Jul 2023 20:48:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 366KgMT3011905; Thu, 6 Jul 2023 20:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=C92CpaLMBxsIu1Vqu81H7JOvCBxUCRCAB1bx/1EdNVs=;
 b=FiMipGOqgguR7//NmDgVpWATZ49AlcIFIwA8MnilIUqii87WOujWRYAqudd1AT8eXSGm
 3OGiAB05/eRg+dKKeI/w8p5CE0U82nIKEloAlgMX6yGJ4eZ7I0oCGbHnBbiW9FnMB21f
 fwXA3rsLK7WcZWWNng97NCU3gDhcZiimtlMBbZa4DqvMTx+gtQTIbjqIM4ubSQEpMzp5
 WSj6582oyYbdiQsfCwBI20v9MF8vg7DVUqGrv6ma/3HZer6ejy5nrOcYAE2OPcW7Uhr3
 koakN6cXEdsJuQPFTo8YB5RrTtvdGYU87nGVb/L/FKH5Mi3lwXX7eQmaosXFR1mLVs8x pg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rn152mkyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 20:48:45 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 366Kmi0i006918
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Jul 2023 20:48:44 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 13:48:43 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Date: Thu, 6 Jul 2023 13:48:37 -0700
Subject: [PATCH v4 6/6] drm/msm/dpu: Update dev core dump to dump registers
 of sub-blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v4-6-e304ddbe9648@quicinc.com>
References: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688676521; l=4752;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=AT8Z1kDsBnEI1CH8VhV5WFsBJXsUk7u9tyfOM6NNPIs=;
 b=ArD61lIOSN9L5riubvhRRSqZdKLr3wcNWoKJQQRr1hUeWKFe+4kp2x9d9qNzO12IR4jOn9c0F
 2lf6IMG6LacD2Dqd3btMjoQh+cWTCU0tYABkv8+QQgKd/YcDVG++Wfb
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EGQtbjKugXdUTroUMzPeyvsSGSYFesbI
X-Proofpoint-ORIG-GUID: EGQtbjKugXdUTroUMzPeyvsSGSYFesbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=943
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060182
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the device core dump mechanism does not dump registers of
sub-blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Edit
dpu_kms_mdp_snapshot function to account for sub-blocks.

Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 66 ++++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 70dbb1204e6c..afc45d597d65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -903,25 +903,58 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 					    cat->ctl[i].base, cat->ctl[i].name);
 
 	/* dump DSPP sub-blocks HW regs info */
-	for (i = 0; i < cat->dspp_count; i++)
+	for (i = 0; i < cat->dspp_count; i++) {
 		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, dpu_kms->mmio +
 					    cat->dspp[i].base, cat->dspp[i].name);
 
+		if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
+			msm_disp_snapshot_add_block(disp_state, cat->dspp[i].sblk->pcc.len,
+						    dpu_kms->mmio + cat->dspp[i].base +
+						    cat->dspp[i].sblk->pcc.base, "%s_%s",
+						    cat->dspp[i].name,
+						    cat->dspp[i].sblk->pcc.name);
+	}
+
 	/* dump INTF sub-blocks HW regs info */
 	for (i = 0; i < cat->intf_count; i++)
 		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, dpu_kms->mmio +
 					    cat->intf[i].base, cat->intf[i].name);
 
 	/* dump PP sub-blocks HW regs info */
-	for (i = 0; i < cat->pingpong_count; i++)
+	for (i = 0; i < cat->pingpong_count; i++) {
 		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, dpu_kms->mmio +
 					    cat->pingpong[i].base, cat->pingpong[i].name);
 
+		/* TE2 block has length of 0, so will not print it */
+
+		if (cat->pingpong[i].sblk && cat->pingpong[i].sblk->dither.len > 0)
+			msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].sblk->dither.len,
+						    dpu_kms->mmio + cat->pingpong[i].base +
+						    cat->pingpong[i].sblk->dither.base, "%s_%s",
+						    cat->pingpong[i].name,
+						    cat->pingpong[i].sblk->dither.name);
+	}
+
 	/* dump SSPP sub-blocks HW regs info */
-	for (i = 0; i < cat->sspp_count; i++)
+	for (i = 0; i < cat->sspp_count; i++) {
 		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, dpu_kms->mmio +
 					    cat->sspp[i].base, cat->sspp[i].name);
 
+		if (cat->sspp[i].sblk && cat->sspp[i].sblk->scaler_blk.len > 0)
+			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->scaler_blk.len,
+						    dpu_kms->mmio + cat->sspp[i].base +
+						    cat->sspp[i].sblk->scaler_blk.base, "%s_%s",
+						    cat->sspp[i].name,
+						    cat->sspp[i].sblk->scaler_blk.name);
+
+		if (cat->sspp[i].sblk && cat->sspp[i].sblk->csc_blk.len > 0)
+			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->csc_blk.len,
+						    dpu_kms->mmio + cat->sspp[i].base +
+						    cat->sspp[i].sblk->csc_blk.base, "%s_%s",
+						    cat->sspp[i].name,
+						    cat->sspp[i].sblk->csc_blk.name);
+	}
+
 	/* dump LM sub-blocks HW regs info */
 	for (i = 0; i < cat->mixer_count; i++)
 		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len, dpu_kms->mmio +
@@ -943,9 +976,30 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	}
 
 	/* dump DSC sub-blocks HW regs info */
-	for (i = 0; i < cat->dsc_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, dpu_kms->mmio +
-					    cat->dsc[i].base, cat->dsc[i].name);
+	for (i = 0; i < cat->dsc_count; i++) {
+		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
+			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
+			struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
+
+			/* For now, pass in a length of 0 because the DSC_BLK register space
+			 * overlaps with the sblks' register space.
+			 *
+			 * TODO: Pass in a length of 0 to DSC_BLK_1_2 in the HW catalog where
+			 * applicable.
+			 */
+			msm_disp_snapshot_add_block(disp_state, 0, dpu_kms->mmio +
+						    cat->dsc[i].base, cat->dsc[i].name);
+			msm_disp_snapshot_add_block(disp_state, enc.len, dpu_kms->mmio +
+						    cat->dsc[i].base + enc.base, "%s_%s",
+						    cat->dsc[i].name, enc.name);
+			msm_disp_snapshot_add_block(disp_state, ctl.len, dpu_kms->mmio +
+						    cat->dsc[i].base + ctl.base, "%s_%s",
+						    cat->dsc[i].name, ctl.name);
+		} else {
+			msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, dpu_kms->mmio +
+						    cat->dsc[i].base, cat->dsc[i].name);
+		}
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }

-- 
2.25.1

