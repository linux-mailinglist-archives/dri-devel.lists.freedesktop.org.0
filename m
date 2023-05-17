Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAEE707500
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 00:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E577410E4A8;
	Wed, 17 May 2023 22:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974D210E4A8;
 Wed, 17 May 2023 22:02:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HJus0W001592; Wed, 17 May 2023 22:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=FGQ2qzPMg0icbR+NUubz5buhnSF28Hw4uDneAbl0PFg=;
 b=kSIWusT44t1KWlYiU25i6S1CApJP9ONWjZ5muxH9ovL7zycgPgZhj8N7krFiwbDVsBLU
 9Oql1ZtLAWc+uRdT0+4s6FiPtjisn8NTmIOkniohFsT+VLXEg4WYML96Fo7JTfhNqvoP
 /+uD1yL0BO6lCJgqiiRG/VHbvKJ8QAn+cBXfoTQhWg8OE7JPM1+S+FbJHQP64kT4LWop
 tTdSstshl4mhWy914CNv3B+aPOAQBwherIjtnhW/Yzump9fQUTYpS3ogfbjv+Moz9Enf
 8/fyIVBd2NI/V/8l+laJTe7E0ySnuxBmUer/J851d7I9km7It/2H9dtYiTZHbQywwZkE uQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmts29v1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:02:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HM2HwB000939
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:02:17 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 15:02:17 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v10 6/8] drm/msm/dpu: separate DSC flush update out of
 interface
Date: Wed, 17 May 2023 15:01:57 -0700
Message-ID: <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2FVvmq6yn_YAzq41d20llz_Aand4ft33
X-Proofpoint-ORIG-GUID: 2FVvmq6yn_YAzq41d20llz_Aand4ft33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170181
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

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 13 +++++++++++++
 3 files changed, 37 insertions(+), 8 deletions(-)

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
index 4f7cfa9..4e132d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -139,6 +139,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
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
 
@@ -285,6 +290,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
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
@@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
 		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
 
-	if (cfg->dsc)
-		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
-
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
@@ -524,10 +533,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
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
@@ -630,6 +638,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->update_pending_flush_merge_3d =
 			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
 		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+		ops->update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 6292002..d5f3ef8 100644
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
+ * @pending_merge_3d_flush_mask: pending merge_3d flush
+ * @pending_dspp_flush_mask: pending dspp flush
+ * @pending_dsc_flush_mask: pending dsc flush
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

