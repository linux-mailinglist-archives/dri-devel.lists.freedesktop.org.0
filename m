Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E2652174
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 14:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E5510E39B;
	Tue, 20 Dec 2022 13:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750F510E37D;
 Tue, 20 Dec 2022 13:25:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BKAiJuR026253; Tue, 20 Dec 2022 13:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=lM3u0GIQ/ZA8DdY5FBJ+To4H8W1q25EWlhwI/VHnAIE=;
 b=CD6g5xrFcIz9BhrSZZA2XeX9ia7RAJ2H3ISwmkYvc88wohEYnkj6g2OVuk7OeDjp+p1q
 tcu2s9AODEL3j79kmJFvm6LxkfFHoEvQsOJVIUEwYWuWlPI/Ybeo3VBNYOztkEyk39N8
 E8vbxw9BSE+VaFYyBobiLDHbUVRwLYEkAKxrF1xbiMohET0yD8K8CEwHCFSZx2/bNbmw
 2wv+Dk9NvNikItdXX7gRO4tancSdm7rCRFo1H1loxbs9wkFyoH5/zoAmioSKA0F87UJA
 kO8SLjOtWQH4YFrX4WaJyQUEd8qew3qaWEHGcaasG+FF0Z/SsqssUfj9irInnCsguDuG 6Q== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk39t9at9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 13:25:30 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2BKDPQsN012685; 
 Tue, 20 Dec 2022 13:25:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3mh6ukg3y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 20 Dec 2022 13:25:26 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BKDPPbR012680;
 Tue, 20 Dec 2022 13:25:26 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2BKDPPdL012679;
 Tue, 20 Dec 2022 13:25:25 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id CD9B64A4B; Tue, 20 Dec 2022 05:25:24 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v11] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Date: Tue, 20 Dec 2022 05:25:19 -0800
Message-Id: <1671542719-12655-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: c_EwPj6LF8_pDFZk4Ppv2elxDZx4UpTX
X-Proofpoint-GUID: c_EwPj6LF8_pDFZk4Ppv2elxDZx4UpTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_05,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200110
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Flush mechanism for DSPP blocks has changed in sc7280 family, it
allows individual sub blocks to be flushed in coordination with
master flush control.

Representation: master_flush && (PCC_flush | IGC_flush .. etc )

This change adds necessary support for the above design.

Changes in v1:
- Few nits (Doug, Dmitry)
- Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)

Changes in v2:
- Move the address offset to flush macro (Dmitry)
- Separate ops for the sub block flush (Dmitry)

Changes in v3:
- Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)

Changes in v4:
- Use shorter version for unsigned int (Stephen)

Changes in v5:
- Spurious patch please ignore.

Changes in v6:
- Add SOB tag (Doug, Dmitry)

Changes in v7:
- Cache flush mask per dspp (Dmitry)
- Few nits (Marijn)

Changes in v8:
- Few nits (Marijn)

Changes in v9:
- Use DSPP enum while accessing flush mask to make it readable (Dmitry)
- Few nits (Dmitry)

Changes in v10:
- Fix white spaces in a separate patch (Dmitry)

Changes in v11:
- Define a macro for dspp flush selection (Marijn)
- Few nits (Marijn)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 44 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  5 ++-
 5 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 601d687..4170fbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 
 		/* stage config flush mask */
 		ctl->ops.update_pending_flush_dspp(ctl,
-			mixer[i].hw_dspp->idx);
+			mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 27f029f..0eecb2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -65,7 +65,10 @@
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
+	(BIT(DPU_CTL_ACTIVE_CFG) | \
+	 BIT(DPU_CTL_FETCH_ACTIVE) | \
+	 BIT(DPU_CTL_VM_CFG) | \
+	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define MERGE_3D_SM8150_MASK (0)
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38a..0e70337 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -161,10 +161,12 @@ enum {
  * DSPP sub-blocks
  * @DPU_DSPP_PCC             Panel color correction block
  * @DPU_DSPP_GC              Gamma correction block
+ * @DPU_DSPP_IGC             Inverse gamma correction block
  */
 enum {
 	DPU_DSPP_PCC = 0x1,
 	DPU_DSPP_GC,
+	DPU_DSPP_IGC,
 	DPU_DSPP_MAX
 };
 
@@ -191,6 +193,7 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
+ * @DPU_CTL_DSPP_BLOCK_FLUSH	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
@@ -198,6 +201,7 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
+	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index a35ecb6..fb2a115 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -33,6 +33,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
+#define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
 #define CTL_MIXER_BORDER_OUT            BIT(24)
 #define CTL_FLUSH_MASK_CTL              BIT(17)
@@ -42,6 +43,7 @@
 #define  DSC_IDX        22
 #define  INTF_IDX       31
 #define WB_IDX          16
+#define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
 #define CTL_INVALID_BIT                 0xffff
 #define CTL_DEFAULT_GROUP_ID		0xf
 
@@ -113,6 +115,9 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
 	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
 				     dpu_hw_ctl_get_flush_register(ctx));
 	ctx->pending_flush_mask = 0x0;
+
+	memset(ctx->pending_dspp_flush_mask, 0,
+		sizeof(ctx->pending_dspp_flush_mask));
 }
 
 static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
@@ -130,6 +135,8 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 
 static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 {
+	int dspp;
+
 	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
 				ctx->pending_merge_3d_flush_mask);
@@ -140,6 +147,12 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
 				ctx->pending_wb_flush_mask);
 
+	for (dspp = DSPP_0; dspp < DSPP_MAX; dspp++)
+		if (ctx->pending_flush_mask & BIT(DSPP_IDX) &&
+		    ctx->pending_dspp_flush_mask[dspp - DSPP_0])
+			DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp - DSPP_0),
+				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
+
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
 
@@ -287,7 +300,7 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 }
 
 static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
-	enum dpu_dspp dspp)
+	enum dpu_dspp dspp, u32 dspp_sub_blk)
 {
 	switch (dspp) {
 	case DSPP_0:
@@ -307,6 +320,29 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
 	}
 }
 
+static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
+	struct dpu_hw_ctl *ctx,	enum dpu_dspp dspp, u32 dspp_sub_blk)
+{
+	if (dspp >= DSPP_MAX)
+		return;
+
+	switch (dspp_sub_blk) {
+	case DPU_DSPP_IGC:
+		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(2);
+		break;
+	case DPU_DSPP_PCC:
+		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(4);
+		break;
+	case DPU_DSPP_GC:
+		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(5);
+		break;
+	default:
+		return;
+	}
+
+	ctx->pending_flush_mask |= BIT(DSPP_IDX);
+}
+
 static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -675,7 +711,11 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_subblocks;
+	else
+		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+
 	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
 		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 96c012e..78611a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -152,9 +152,11 @@ struct dpu_hw_ctl_ops {
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : DSPP block index
+	 * @dspp_sub_blk : DSPP sub-block index
 	 */
 	void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
-		enum dpu_dspp blk);
+		enum dpu_dspp blk, u32 dspp_sub_blk);
+
 	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
@@ -242,6 +244,7 @@ struct dpu_hw_ctl {
 	u32 pending_intf_flush_mask;
 	u32 pending_wb_flush_mask;
 	u32 pending_merge_3d_flush_mask;
+	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
 
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
-- 
2.7.4

