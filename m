Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2A614806
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1816910E213;
	Tue,  1 Nov 2022 10:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9EE10E213;
 Tue,  1 Nov 2022 10:57:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1AMo5h000519; Tue, 1 Nov 2022 10:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=ZdwizPVPfe4p+N7OYBrHEa0WUaclhEatP+qhUy19UuM=;
 b=E/5FGYh0rrcPIBMNV3PJDR6gRyRLGTBCk/J/5PbZsHWkhsnNt5NcGFBEppjo+0f70I3c
 a55tCGXeAnCD9xPsxs8pXw1gIEAb7yMdqvSHI04hdqlMazNs2iEPueWMnSoOx6fTkEVu
 KiudgXYSIriTXfbZbwCFgmbX6Izz9LSTIYkLExYmbNI9IAoA8O5LlwKc0oOB9pSW8Kc0
 7GZGZAURNDZ2GVktCEqCge+xzEPcm/6AXaZ8VngL8ljKqFmzx2K+kjW8Nx7mEp6fD3/j
 fg07hzG2AaoaLsGjaA5J4yRXFDd0n53RVLuKZ9g684eSbcZllwfI32Xznzw4e36rBLkz 9w== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kjxqgrr5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 10:57:14 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1AvBK7011728; 
 Tue, 1 Nov 2022 10:57:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3khdp1w0nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 01 Nov 2022 10:57:11 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A1AvAv7011718;
 Tue, 1 Nov 2022 10:57:10 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2A1AvA0M011703;
 Tue, 01 Nov 2022 10:57:10 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 9E57B2E82; Tue,  1 Nov 2022 03:57:09 -0700 (PDT)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v7] drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
Date: Tue,  1 Nov 2022 03:57:05 -0700
Message-Id: <1667300225-14367-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: maAWYAbJmaCPMRYUH7AF_8mWCv42PfVg
X-Proofpoint-GUID: maAWYAbJmaCPMRYUH7AF_8mWCv42PfVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_05,2022-11-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010083
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, dianders@chromium.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org, swboyd@chromium.org
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
- Seperate ops for the sub block flush (Dmitry)

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

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 46 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  7 ++--
 5 files changed, 58 insertions(+), 6 deletions(-)

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
index 38aa38a..8148e91 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -161,10 +161,12 @@ enum {
  * DSPP sub-blocks
  * @DPU_DSPP_PCC             Panel color correction block
  * @DPU_DSPP_GC              Gamma correction block
+ * @DPU_DSPP_IGC             Inverse Gamma correction block
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
+ * @DPU_CTL_DSPP_BLOCK_FLUSH: CTL config to support dspp sub-block flush
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
index a35ecb6..fbcb7da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -33,6 +33,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
+#define   CTL_DSPP_n_FLUSH(n)		((0x13C) + ((n) * 4))
 
 #define CTL_MIXER_BORDER_OUT            BIT(24)
 #define CTL_FLUSH_MASK_CTL              BIT(17)
@@ -110,9 +111,14 @@ static inline void dpu_hw_ctl_trigger_pending(struct dpu_hw_ctl *ctx)
 
 static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
 {
+	int i;
+
 	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
 				     dpu_hw_ctl_get_flush_register(ctx));
 	ctx->pending_flush_mask = 0x0;
+
+	for(i = 0; i < ARRAY_SIZE(ctx->pending_dspp_flush_mask); i++)
+		ctx->pending_dspp_flush_mask[i] = 0x0;
 }
 
 static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
@@ -130,6 +136,8 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 
 static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 {
+	int i;
+
 	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
 				ctx->pending_merge_3d_flush_mask);
@@ -140,6 +148,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
 				ctx->pending_wb_flush_mask);
 
+	for(i = 0; i < ARRAY_SIZE(ctx->pending_dspp_flush_mask); i++)
+		if (ctx->pending_dspp_flush_mask[i])
+			DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(i),
+				ctx->pending_dspp_flush_mask[i]);
+
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
 
@@ -287,8 +300,9 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 }
 
 static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
-	enum dpu_dspp dspp)
+	enum dpu_dspp dspp, u32 dspp_sub_blk)
 {
+
 	switch (dspp) {
 	case DSPP_0:
 		ctx->pending_flush_mask |= BIT(13);
@@ -307,6 +321,30 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
 	}
 }
 
+static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
+	struct dpu_hw_ctl *ctx,	enum dpu_dspp dspp, u32 dspp_sub_blk)
+{
+
+	if (dspp >= DSPP_MAX)
+		return;
+
+	switch (dspp_sub_blk) {
+	case DPU_DSPP_IGC:
+		ctx->pending_dspp_flush_mask[dspp-DSPP_0] |= BIT(2);
+		break;
+	case DPU_DSPP_PCC:
+		ctx->pending_dspp_flush_mask[dspp-DSPP_0] |= BIT(4);
+		break;
+	case DPU_DSPP_GC:
+		ctx->pending_dspp_flush_mask[dspp-DSPP_0] |= BIT(5);
+		break;
+	default:
+		return;
+	}
+
+	ctx->pending_flush_mask |= BIT(29);
+}
+
 static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -675,7 +713,11 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
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
index 96c012e..ff4e92c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -148,13 +148,15 @@ struct dpu_hw_ctl_ops {
 		enum dpu_lm blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_flush_mask
+	 * OR in the given flushbits to the cached pending_dspp_flush_mask
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

