Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13D73AD65
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3CA10E5BD;
	Thu, 22 Jun 2023 23:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B0B10E5BD;
 Thu, 22 Jun 2023 23:50:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35MN47xP005500; Thu, 22 Jun 2023 23:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=SiWbOMCmpgwxxX3TlE2LyY2gp55DW7XcM5FPAL+Pfo0=;
 b=NNxFqeHoqOiEX0kOvvlPyyQOMyFiDOdFczZFDgnF2xkx1NZLMLdmcTxP59dFgPef3ay/
 EUpCdwgcvtCfQsKTng4rHKjr1eQ0SsnPycGpGzDsyN6pRHL8V+xLcbGUbMB9dQNWieE/
 ZgD3aiiG/C7y65CyGdRHgwe/C6Tjq0r3CApHVA9rtU7jHQP4d+bgKL9Z4v2oNoZo3MiV
 ulhF3IBEr9ebQsAFrbyrW7op2IHuqdlaD39Uqtf1MCSn2A8D7Qr1BI/EKzdOlNxG/8pL
 YsKB6atVQ59/rNEwAahMqdkS3P5DvWPZDCgvfWS2UmIaoKbVGb4gSPt0hHpuhNayrVfA qg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rckn2t3vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 23:50:28 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35MNoRq1004798
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 23:50:27 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Jun 2023 16:50:27 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Date: Thu, 22 Jun 2023 16:48:58 -0700
Subject: [PATCH 6/6] drm/msm/dpu: Update dev core dump to dump registers of
 sub blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v1-6-3b2cdcc6a576@quicinc.com>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687477824; l=9099;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=GPxUKbhVRNfWIyXk3T5WLt4/ZaogBUP0uckeyfQQy4s=;
 b=q+otuAwcBqj5+AUuode0cgyK8Ew6TfCfsv4Yb8SHTIZs+ukXypQE4NsP+AscDiDIlFk+2VJD9
 B6rdAZFE/4TDC+5Yg2yvnbU35CogUREVSqCHL2MKk3nverPe5u3iiT/
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Mn6Qi1SvhbsTxhfaxOqp2f5N9clFK8OR
X-Proofpoint-ORIG-GUID: Mn6Qi1SvhbsTxhfaxOqp2f5N9clFK8OR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_17,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=956
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306220205
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

Currently, the device core dump mechanism does not dump registers of sub
blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Add wrapper
function to dump hardware blocks that contain sub blocks.

Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 194 +++++++++++++++++++++++++++-----
 1 file changed, 168 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..9b1b1c382269 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -885,6 +885,154 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 	return 0;
 }
 
+static void dpu_kms_mdp_snapshot_add_block(struct msm_disp_state *disp_state,
+					   void __iomem *mmio, void *blk,
+					   enum dpu_hw_blk_type blk_type)
+{
+	u32 base;
+
+	switch (blk_type) {
+	case DPU_HW_BLK_TOP:
+	{
+		struct dpu_mdp_cfg *top = (struct dpu_mdp_cfg *)blk;
+
+		if (top->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+			msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
+						    mmio + top->base, "top");
+			msm_disp_snapshot_add_block(disp_state, top->len - MDP_PERIPH_TOP0_END,
+						    mmio + top->base + MDP_PERIPH_TOP0_END,
+						    "top_2");
+		} else {
+			msm_disp_snapshot_add_block(disp_state, top->len, mmio + top->base, "top");
+		}
+		break;
+	}
+	case DPU_HW_BLK_LM:
+	{
+		struct dpu_lm_cfg *mixer = (struct dpu_lm_cfg *)blk;
+
+		msm_disp_snapshot_add_block(disp_state, mixer->len, mmio + mixer->base, "%s",
+					    mixer->name);
+		break;
+	}
+	case DPU_HW_BLK_CTL:
+	{
+		struct dpu_ctl_cfg *ctl = (struct dpu_ctl_cfg *)blk;
+
+		msm_disp_snapshot_add_block(disp_state, ctl->len, mmio + ctl->base, "%s",
+					    ctl->name);
+		break;
+	}
+	case DPU_HW_BLK_INTF:
+	{
+		struct dpu_intf_cfg *intf = (struct dpu_intf_cfg *)blk;
+
+		msm_disp_snapshot_add_block(disp_state, intf->len, mmio + intf->base, "%s",
+					    intf->name);
+		break;
+	}
+	case DPU_HW_BLK_WB:
+	{
+		struct dpu_wb_cfg *wb = (struct dpu_wb_cfg *)blk;
+
+		msm_disp_snapshot_add_block(disp_state, wb->len, mmio + wb->base, "%s",
+					    wb->name);
+		break;
+	}
+	case DPU_HW_BLK_SSPP:
+	{
+		struct dpu_sspp_cfg *sspp_block = (struct dpu_sspp_cfg *)blk;
+		const struct dpu_sspp_sub_blks *sblk = sspp_block->sblk;
+
+		base = sspp_block->base;
+
+		msm_disp_snapshot_add_block(disp_state, sspp_block->len, mmio + base, "%s",
+					    sspp_block->name);
+
+		if (sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
+		    sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
+		    sspp_block->features & BIT(DPU_SSPP_SCALER_QSEED4))
+			msm_disp_snapshot_add_block(disp_state, sblk->scaler_blk.len,
+						    mmio + base + sblk->scaler_blk.base, "%s_%s",
+						    sspp_block->name, sblk->scaler_blk.name);
+
+		if (sspp_block->features & BIT(DPU_SSPP_CSC) || sspp_block->features
+					& BIT(DPU_SSPP_CSC_10BIT))
+			msm_disp_snapshot_add_block(disp_state, sblk->csc_blk.len,
+						    mmio + base + sblk->csc_blk.base, "%s_%s",
+						    sspp_block->name, sblk->csc_blk.name);
+		break;
+	}
+	case DPU_HW_BLK_DSPP:
+	{
+		struct dpu_dspp_cfg *dspp_block = (struct dpu_dspp_cfg *)blk;
+
+		base = dspp_block->base;
+
+		msm_disp_snapshot_add_block(disp_state, dspp_block->len, mmio + base, "%s",
+					    dspp_block->name);
+
+		if (dspp_block->features & BIT(DPU_DSPP_PCC))
+			msm_disp_snapshot_add_block(disp_state, dspp_block->sblk->pcc.len,
+						    mmio + base + dspp_block->sblk->pcc.base,
+						    "%s_%s", dspp_block->name,
+						    dspp_block->sblk->pcc.name);
+		break;
+	}
+	case DPU_HW_BLK_PINGPONG:
+	{
+		struct dpu_pingpong_cfg *pingpong_block = (struct dpu_pingpong_cfg *)blk;
+		const struct dpu_pingpong_sub_blks *sblk = pingpong_block->sblk;
+
+		base = pingpong_block->base;
+
+		msm_disp_snapshot_add_block(disp_state, pingpong_block->len, mmio + base, "%s",
+					    pingpong_block->name);
+
+		if (pingpong_block->features & BIT(DPU_PINGPONG_TE2))
+			msm_disp_snapshot_add_block(disp_state, sblk->te2.len,
+						    mmio + base + sblk->te2.base, "%s_%s",
+						    pingpong_block->name, sblk->te2.name);
+
+		if (pingpong_block->features & BIT(DPU_PINGPONG_DITHER))
+			msm_disp_snapshot_add_block(disp_state, sblk->dither.len,
+						    mmio + base + sblk->dither.base, "%s_%s",
+						    pingpong_block->name, sblk->dither.name);
+		break;
+	}
+	case DPU_HW_BLK_DSC:
+	{
+		struct dpu_dsc_cfg *dsc_block = (struct dpu_dsc_cfg *)blk;
+
+		base = dsc_block->base;
+
+		if (dsc_block->features & BIT(DPU_DSC_HW_REV_1_2)) {
+			struct dpu_dsc_blk enc = dsc_block->sblk->enc;
+			struct dpu_dsc_blk ctl = dsc_block->sblk->ctl;
+
+			/* For now, pass in a length of 0 because the DSC_BLK register space
+			 * overlaps with the sblks' register space.
+			 *
+			 * TODO: Pass in a length of 0 t0 DSC_BLK_1_2 in the HW catalog where
+			 * applicable.
+			 */
+			msm_disp_snapshot_add_block(disp_state, 0, mmio + base, "%s",
+						    dsc_block->name);
+			msm_disp_snapshot_add_block(disp_state, enc.len, mmio + base + enc.base,
+						    "%s_%s", dsc_block->name, enc.name);
+			msm_disp_snapshot_add_block(disp_state, ctl.len, mmio + base + ctl.base,
+						    "%s_%s", dsc_block->name, ctl.name);
+		} else {
+			msm_disp_snapshot_add_block(disp_state, dsc_block->len, mmio + base, "%s",
+						    dsc_block->name);
+		}
+		break;
+	}
+	default:
+		DPU_ERROR("Block type not supported.");
+	}
+}
+
 static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_kms *kms)
 {
 	int i;
@@ -899,53 +1047,47 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 
 	/* dump CTL sub-blocks HW regs info */
 	for (i = 0; i < cat->ctl_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
-				dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
+		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->ctl[i],
+					       DPU_HW_BLK_CTL);
 
 	/* dump DSPP sub-blocks HW regs info */
 	for (i = 0; i < cat->dspp_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
-				dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
+		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->dspp[i],
+					       DPU_HW_BLK_DSPP);
 
 	/* dump INTF sub-blocks HW regs info */
 	for (i = 0; i < cat->intf_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
-				dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
+		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->intf[i],
+					       DPU_HW_BLK_INTF);
 
 	/* dump PP sub-blocks HW regs info */
 	for (i = 0; i < cat->pingpong_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
-				dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", i);
+		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->pingpong[i],
+					       DPU_HW_BLK_PINGPONG);
 
 	/* dump SSPP sub-blocks HW regs info */
 	for (i = 0; i < cat->sspp_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
-				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
+		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->sspp[i],
+					       DPU_HW_BLK_SSPP);
 
 	/* dump LM sub-blocks HW regs info */
 	for (i = 0; i < cat->mixer_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
-				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
+		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->mixer[i],
+					       DPU_HW_BLK_LM);
 
 	/* dump WB sub-blocks HW regs info */
 	for (i = 0; i < cat->wb_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
-				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
-
-	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
-		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
-				dpu_kms->mmio + cat->mdp[0].base, "top");
-		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,
-				dpu_kms->mmio + cat->mdp[0].base + MDP_PERIPH_TOP0_END, "top_2");
-	} else {
-		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-				dpu_kms->mmio + cat->mdp[0].base, "top");
-	}
+		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->wb[i],
+					       DPU_HW_BLK_WB);
+
+	/* dump top block */
+	dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->mdp[0],
+				       DPU_HW_BLK_TOP);
 
 	/* dump DSC sub-blocks HW regs info */
 	for (i = 0; i < cat->dsc_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
-				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
+		dpu_kms_mdp_snapshot_add_block(disp_state, dpu_kms->mmio, (void *)&cat->dsc[i],
+					       DPU_HW_BLK_DSC);
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }

-- 
2.25.1

