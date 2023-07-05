Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC180748DE6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 21:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DD810E3C1;
	Wed,  5 Jul 2023 19:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C5310E3B5;
 Wed,  5 Jul 2023 19:32:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365JWFGA013584; Wed, 5 Jul 2023 19:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=3dnyWbQNdUA66aDt+FnwjyRVjoB5u3EevUNmDnWz544=;
 b=ghLcFBbf0sihtuIoqmoNH3uZCY0GU/a6U0O/GfFPUYNLJ18sqq9GyTRUzkTsp0Oaejc0
 0QeSph8g1CTRhAr46pEINTJW6vBRXelbxJ13Xf/XH1gp0Ap25KKcvptsYEWa+3dx02IZ
 epzcz8jMTm/iBqWJSytg66xAnhthUuYMp0TVifrGsf5+/A177iTwicEg+pjXSOWD2yra
 tTEezpIQgdovHPVLgMcsYh708+Q7XUJgl8fZVWILTyhNwv3nKGKyzdRD4TMJPjCBcII2
 y1nP/q3QtC3LXpCHAQuAuYXo4Q+kdUfKPnRFA23SQiRqD/h/VC+Sib2lTjI3Mir7m7D4 Lg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rmny9ash1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 19:32:15 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 365JWEgb027843
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Jul 2023 19:32:14 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 5 Jul 2023 12:32:13 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Date: Wed, 5 Jul 2023 12:30:19 -0700
Subject: [PATCH v2 5/5] drm/msm/dpu: Update dev core dump to dump registers
 of sub-blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v2-5-9e90a87d393f@quicinc.com>
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688585532; l=6652;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=cfI2GLOnJfCxwpSlsQ60JvjHBOZXn4VLuygfgy3UEPo=;
 b=Zry+JVouyEeMDxoMM4GBCE+kXRY+gaQswtXw7XgDqWk8ERvUBX3PxZ5d1b1ZVICihi53fm4S1
 Qbrea530m4KD2qGCNxtcNwmnFNQoGNF7W/N1jQFFEBNG5lUemSxbyE9
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KN6nySe708Y64oOeu1BG5zj_RjzNOOC1
X-Proofpoint-ORIG-GUID: KN6nySe708Y64oOeu1BG5zj_RjzNOOC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_10,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=989
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050178
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 106 ++++++++++++++++++++++++--------
 1 file changed, 82 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..c83f5d79e5c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -890,62 +890,120 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	int i;
 	struct dpu_kms *dpu_kms;
 	const struct dpu_mdss_cfg *cat;
+	void __iomem *mmio;
+	u32 base;
 
 	dpu_kms = to_dpu_kms(kms);
 
 	cat = dpu_kms->catalog;
+	mmio = dpu_kms->mmio;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
 	/* dump CTL sub-blocks HW regs info */
 	for (i = 0; i < cat->ctl_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
-				dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len, mmio + cat->ctl[i].base,
+					    "%s", cat->ctl[i].name);
 
 	/* dump DSPP sub-blocks HW regs info */
-	for (i = 0; i < cat->dspp_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
-				dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
+	for (i = 0; i < cat->dspp_count; i++) {
+		base = cat->dspp[i].base;
+		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, mmio + base, "%s",
+					    cat->dspp[i].name);
+
+		if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
+			msm_disp_snapshot_add_block(disp_state, cat->dspp[i].sblk->pcc.len,
+						    mmio + base + cat->dspp[i].sblk->pcc.base,
+						    "%s_%s", cat->dspp[i].name,
+						    cat->dspp[i].sblk->pcc.name);
+	}
+
 
 	/* dump INTF sub-blocks HW regs info */
 	for (i = 0; i < cat->intf_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
-				dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, mmio + cat->intf[i].base,
+					    "%s", cat->intf[i].name);
 
 	/* dump PP sub-blocks HW regs info */
-	for (i = 0; i < cat->pingpong_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
-				dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", i);
+	for (i = 0; i < cat->pingpong_count; i++) {
+		base = cat->pingpong[i].base;
+		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, mmio + base, "%s",
+					    cat->pingpong[i].name);
+
+		/* TE2 block has length of 0, so will not print it */
+
+		if (cat->pingpong[i].sblk && cat->pingpong[i].sblk->dither.len > 0)
+			msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].sblk->dither.len,
+						    mmio + base + cat->pingpong[i].sblk->dither.base,
+						    "%s_%s", cat->pingpong[i].name,
+						    cat->pingpong[i].sblk->dither.name);
+	}
 
 	/* dump SSPP sub-blocks HW regs info */
-	for (i = 0; i < cat->sspp_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
-				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
+	for (i = 0; i < cat->sspp_count; i++) {
+		base = cat->sspp[i].base;
+		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, mmio + cat->sspp[i].base,
+					    "%s", cat->sspp[i].name);
+
+		if (cat->sspp[i].sblk && cat->sspp[i].sblk->scaler_blk.len > 0)
+			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->scaler_blk.len,
+						    mmio + base + cat->sspp[i].sblk->scaler_blk.base,
+						    "%s_%s", cat->sspp[i].name,
+						    cat->sspp[i].sblk->scaler_blk.name);
+
+		if (cat->sspp[i].sblk && cat->sspp[i].sblk->csc_blk.len > 0)
+			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->csc_blk.len,
+						    mmio + base + cat->sspp[i].sblk->csc_blk.base,
+						    "%s_%s", cat->sspp[i].name,
+						    cat->sspp[i].sblk->csc_blk.name);
+	}
 
 	/* dump LM sub-blocks HW regs info */
 	for (i = 0; i < cat->mixer_count; i++)
 		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
-				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
+					    mmio + cat->mixer[i].base,
+					    "%s", cat->mixer[i].name);
 
 	/* dump WB sub-blocks HW regs info */
 	for (i = 0; i < cat->wb_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
-				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len, mmio + cat->wb[i].base,
+					    "%s", cat->wb[i].name);
 
 	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
-		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
-				dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0, mmio + cat->mdp[0].base,
+					    "top");
 		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,
-				dpu_kms->mmio + cat->mdp[0].base + MDP_PERIPH_TOP0_END, "top_2");
+					    mmio + cat->mdp[0].base + MDP_PERIPH_TOP0_END,
+					    "top_2");
 	} else {
-		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-				dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len, mmio + cat->mdp[0].base,
+					    "top");
 	}
 
 	/* dump DSC sub-blocks HW regs info */
-	for (i = 0; i < cat->dsc_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
-				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
+	for (i = 0; i < cat->dsc_count; i++) {
+		base = cat->dsc[i].base;
+
+		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
+			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
+			struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
+
+			/* For now, pass in a length of 0 because the DSC_BLK register space
+			 * overlaps with the sblks' register space.
+			 *
+			 * TODO: Pass in a length of 0 t0 DSC_BLK_1_2 in the HW catalog where
+			 * applicable.
+			 */
+			msm_disp_snapshot_add_block(disp_state, 0, mmio + base, "%s", cat->dsc[i].name);
+			msm_disp_snapshot_add_block(disp_state, enc.len, mmio + base + enc.base,
+						    "%s_%s", cat->dsc[i].name, enc.name);
+			msm_disp_snapshot_add_block(disp_state, ctl.len, mmio + base + ctl.base,
+						    "%s_%s", cat->dsc[i].name, ctl.name);
+		} else {
+			msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, mmio + base, "%s",
+						    cat->dsc[i].name);
+		}
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }

-- 
2.25.1

