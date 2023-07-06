Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C9D74A522
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 22:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906410E4A9;
	Thu,  6 Jul 2023 20:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A7310E0E6;
 Thu,  6 Jul 2023 20:48:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 366JW2rU028604; Thu, 6 Jul 2023 20:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=qoE2f8srnWkKEB827Y+0e4xfcaCPbdluKQvT1hfRNvk=;
 b=P/zLC92wnkOGBFflcKIRlHT3yXZJoxp0L9hnSWwcm9XkOIxbmcM79D8m2UnLQ2lMhs4e
 e7xOr3IxFzXpCY6gCuRbwpy+3pKeRl0kRjiKLlgA5P+OwY+fUnJu3DFjzdrOldp6K6LQ
 FoNIGIdfs9TkbuS92v5//SAWn7GdM0LMecQAkax7UpRBviHSzPWnpcLeqFOh/D9lqfVu
 nJe5In6Zo0dbUpvHtLaGVNQSGFTR303FKCvm541/YNZLA+HqpW5iuHYuX7XI2a/tmTV4
 Pim6+TqXQ4zADzLwGGU4w5o7dHT5FAv+AAmPFVfi2/zcpSYD7kCfWewi5JO1/i33vlBg sQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rn5ht46ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jul 2023 20:48:45 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 366Kmi70006042
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Jul 2023 20:48:44 GMT
Received: from hu-rmccann-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 6 Jul 2023 13:48:43 -0700
From: Ryan McCann <quic_rmccann@quicinc.com>
Date: Thu, 6 Jul 2023 13:48:36 -0700
Subject: [PATCH v4 5/6] drm/msm/dpu: Refactor printing of main blocks in
 device core dump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230622-devcoredump_patch-v4-5-e304ddbe9648@quicinc.com>
References: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
In-Reply-To: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-8a804
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688676521; l=3731;
 i=quic_rmccann@quicinc.com; s=20230622; h=from:subject:message-id;
 bh=cgDf8AwZWb9D2ZESipawvospKW+6T+ZCp+FYliGHtKU=;
 b=DiPZYa2EV/us3JDUH8EYDPiTARa4Veaft5aAffnfVZ6QjvT8dSIGRMkpcLeez1V829VRyKIvP
 56naoFOrbolD+BRZEBbEhfgxFOY1bWqXecRlNmnDzaYd68zQA2ZaiWI
X-Developer-Key: i=quic_rmccann@quicinc.com; a=ed25519;
 pk=d/uP3OwPGpj/bTtiHvV1RBZ2S6q4AL6j1+A5y+dmbTI=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HGW3WZ9vT194FnsTio2_QZQipF8cIvXD
X-Proofpoint-GUID: HGW3WZ9vT194FnsTio2_QZQipF8cIvXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=950 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Currently, the names of main blocks are hardcoded into the
msm_disp_snapshot_add_block function rather than using the name that
already exists in the catalog. Change this to take the name directly from
the catalog instead of hardcoding it.

Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..70dbb1204e6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -899,38 +899,38 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 
 	/* dump CTL sub-blocks HW regs info */
 	for (i = 0; i < cat->ctl_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
-				dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len, dpu_kms->mmio +
+					    cat->ctl[i].base, cat->ctl[i].name);
 
 	/* dump DSPP sub-blocks HW regs info */
 	for (i = 0; i < cat->dspp_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
-				dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, dpu_kms->mmio +
+					    cat->dspp[i].base, cat->dspp[i].name);
 
 	/* dump INTF sub-blocks HW regs info */
 	for (i = 0; i < cat->intf_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
-				dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, dpu_kms->mmio +
+					    cat->intf[i].base, cat->intf[i].name);
 
 	/* dump PP sub-blocks HW regs info */
 	for (i = 0; i < cat->pingpong_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
-				dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, dpu_kms->mmio +
+					    cat->pingpong[i].base, cat->pingpong[i].name);
 
 	/* dump SSPP sub-blocks HW regs info */
 	for (i = 0; i < cat->sspp_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
-				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, dpu_kms->mmio +
+					    cat->sspp[i].base, cat->sspp[i].name);
 
 	/* dump LM sub-blocks HW regs info */
 	for (i = 0; i < cat->mixer_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
-				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len, dpu_kms->mmio +
+					    cat->mixer[i].base, cat->mixer[i].name);
 
 	/* dump WB sub-blocks HW regs info */
 	for (i = 0; i < cat->wb_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
-				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len, dpu_kms->mmio +
+					    cat->wb[i].base, cat->wb[i].name);
 
 	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
 		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
@@ -944,8 +944,8 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 
 	/* dump DSC sub-blocks HW regs info */
 	for (i = 0; i < cat->dsc_count; i++)
-		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
-				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
+		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, dpu_kms->mmio +
+					    cat->dsc[i].base, cat->dsc[i].name);
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }

-- 
2.25.1

