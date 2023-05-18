Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5F708C64
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 01:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293C710E58D;
	Thu, 18 May 2023 23:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1678110E58E;
 Thu, 18 May 2023 23:34:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34INKaVp022141; Thu, 18 May 2023 23:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=yfmKTcnCU4uXxjlf48MSGYEf00l9G60/aa+PaWqSwTw=;
 b=GM9zjO8q1hN/8f/iBT/lYID3M/e/wCHBUNMgo1dE8swZqSN9jPzAl0mIzld3+ieuv4QR
 JBQjTHUXpQPOQkuvdc4tnkFH7RGSKC/A/61yQD7bLLMKrKH5msiwfse+Rc0SibnalWFe
 tem3E5L4qq7Nv3agMAFcAGWdne0s+ltHWhaoyhZiPHVu5mTikYlluY5+iTNyxm2/mqOR
 +9UMLO20Tr9KyIn16ImW0BOSiKb6i5DC/ahCyTUUPAuRJutDHXMobej7Hul9W/4qfI+P
 jXhpeflSh0aav+vYGfSTxJrTnoGQRrAl81eBKfLemx6fufH37Hj+GI4keftRBaTpsOlE 1w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qnwk4g0jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 23:33:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34INXwKg004315
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 23:33:58 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 18 May 2023 16:33:57 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v11 7/9] drm/msm/dpu: separate DSC flush update out of
 interface
Date: Thu, 18 May 2023 16:33:34 -0700
Message-ID: <1684452816-27848-8-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684452816-27848-1-git-send-email-quic_khsieh@quicinc.com>
References: <1684452816-27848-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PspjQi_jTKKPwuvoCZ9EOVXivbY00cTe
X-Proofpoint-ORIG-GUID: PspjQi_jTKKPwuvoCZ9EOVXivbY00cTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_16,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=985 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305180195
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently DSC flushing happens during interface configuration at
dpu_hw_ctl_intf_cfg_v1(). Separate DSC flush away from
dpu_hw_ctl_intf_cfg_v1() by adding dpu_hw_ctl_update_pending_flush_dsc_v1()
to handle both per-DSC engine and DSC flush bits at same time to make it
consistent with the location of flush programming of other DPU sub-blocks.

Changes in v10:
-- rewording commit text
-- pass ctl directly instead of dpu_enc to dsc_pipe_cfg()
-- ctx->pending_dsc_flush_mask = 0;

Changes in v11:
-- add Fixes tag
-- capitalize MERGE_3D, DSPP and DSC at struct dpu_hw_ctl_ops{}

Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 23 +++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 13 +++++++++++++
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ffa6f04..1957545 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1834,7 +1834,8 @@ dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
 	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
 }
 
-static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
+static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
+				     struct dpu_hw_dsc *hw_dsc,
 				     struct dpu_hw_pingpong *hw_pp,
 				     struct drm_dsc_config *dsc,
 				     u32 common_mode,
@@ -1854,6 +1855,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
 
 	if (hw_pp->ops.enable_dsc)
 		hw_pp->ops.enable_dsc(hw_pp);
+
+	if (ctl->ops.update_pending_flush_dsc)
+		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
 }
 
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
@@ -1861,6 +1865,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 {
 	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
+	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
 	int this_frame_slices;
@@ -1898,7 +1903,8 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
-		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
+		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i], dsc,
+					 dsc_common_mode, initial_lines);
 }
 
 void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index b8651e4..20e08c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -103,6 +103,7 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
 	ctx->pending_intf_flush_mask = 0;
 	ctx->pending_wb_flush_mask = 0;
 	ctx->pending_merge_3d_flush_mask = 0;
+	ctx->pending_dsc_flush_mask = 0;
 	memset(ctx->pending_dspp_flush_mask, 0,
 		sizeof(ctx->pending_dspp_flush_mask));
 }
@@ -141,6 +142,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 				CTL_DSPP_n_FLUSH(dspp - DSPP_0),
 				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
 		}
+
+	if (ctx->pending_flush_mask & BIT(DSC_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
+			      ctx->pending_dsc_flush_mask);
+
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
 
@@ -287,6 +293,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
 }
 
+static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
+						   enum dpu_dsc dsc_num)
+{
+	ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
+	ctx->pending_flush_mask |= BIT(DSC_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
 	enum dpu_dspp dspp, u32 dspp_sub_blk)
 {
@@ -504,9 +517,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
 		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
 
-	if (cfg->dsc)
-		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
-
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
@@ -526,10 +536,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
-	if (cfg->dsc) {
-		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
+
+	if (cfg->dsc)
 		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
-	}
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
@@ -632,6 +641,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->update_pending_flush_merge_3d =
 			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
 		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+		ops->update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 6292002..3c8ee7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
 		enum dpu_dspp blk, u32 dspp_sub_blk);
 
 	/**
+	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
+	 * No effect on hardware
+	 * @ctx: ctl path ctx pointer
+	 * @blk: interface block index
+	 */
+	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
+		enum dpu_dsc blk);
+
+	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
 	 */
@@ -229,6 +238,9 @@ struct dpu_hw_ctl_ops {
  * @pending_flush_mask: storage for pending ctl_flush managed via ops
  * @pending_intf_flush_mask: pending INTF flush
  * @pending_wb_flush_mask: pending WB flush
+ * @pending_merge_3d_flush_mask: pending MERGE_3D flush
+ * @pending_dspp_flush_mask: pending DSPP flush
+ * @pending_dsc_flush_mask: pending DSC flush
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -245,6 +257,7 @@ struct dpu_hw_ctl {
 	u32 pending_wb_flush_mask;
 	u32 pending_merge_3d_flush_mask;
 	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
+	u32 pending_dsc_flush_mask;
 
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
-- 
2.7.4

