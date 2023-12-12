Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F380E01C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 01:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59D110E563;
	Tue, 12 Dec 2023 00:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F39A10E555;
 Tue, 12 Dec 2023 00:23:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BBNUgc3026385; Tue, 12 Dec 2023 00:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=a2VuJQUMriTF4WrCTKoLy65xsyOZcLPKD43MLHb7ooE=; b=Ah
 GoeXeS8O3YI/5Px+pvdOG4ULF7kpRyMl+I1KmVCecApPp8AhfPwk3mZOCZnUjbne
 qNHdw+omJkAhX+hWU24PkwQQ3zHMDrY0oXf5uFSQsE0DRilC5/Vlbe/akOZqkb8W
 IHEtVDEyOM8wnFnAvlSCt9sAh08S3TAt/xykvAkop7AdLcK3XLvZULKk+KtmqpxQ
 /5r/c4M/k8khiZWgME1SD47namm8TK79gYlKqK5TDygPkGm4Nyw+4uEh2OqJ4ExJ
 +VeZMvww+WjIi1jzQsHD8GGayCun4bUe0gVEW6y+Cz2Nh9eqzr9tlHcywuqAHeHA
 Ue49eZFxghzAvgH5dhAw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnnsvqj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:23:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC0NEb7000532
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:23:14 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 16:23:14 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v3 10/15] drm/msm/dpu: add CDM related logic to dpu_hw_ctl
 layer
Date: Mon, 11 Dec 2023 16:22:40 -0800
Message-ID: <20231212002245.23715-11-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: p_3seO4nHYvQt4EHcqLB9GRC0EnLjbz4
X-Proofpoint-GUID: p_3seO4nHYvQt4EHcqLB9GRC0EnLjbz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=850
 clxscore=1015 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120001
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CDM block will need its own logic to program the flush and active
bits in the dpu_hw_ctl layer.

Make necessary changes in dpu_hw_ctl to support CDM programming.

changes in v3:
	- drop unused cdm_active as reported by kbot
	- retained the R-b as its a trivial change

changes in v2:
	- remove unused empty line
	- pass in cdm_num to update_pending_flush_cdm()

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312102047.S0I69pCs-lkp@intel.com/
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 33 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 12 ++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index e7b680a151d6..e76565c3e6a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -32,11 +32,13 @@
 #define   CTL_DSC_ACTIVE                0x0E8
 #define   CTL_WB_ACTIVE                 0x0EC
 #define   CTL_INTF_ACTIVE               0x0F4
+#define   CTL_CDM_ACTIVE                0x0F8
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
 #define   CTL_MERGE_3D_FLUSH            0x100
 #define   CTL_DSC_FLUSH                0x104
 #define   CTL_WB_FLUSH                  0x108
 #define   CTL_INTF_FLUSH                0x110
+#define   CTL_CDM_FLUSH                0x114
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -46,6 +48,7 @@
 #define DPU_REG_RESET_TIMEOUT_US        2000
 #define  MERGE_3D_IDX   23
 #define  DSC_IDX        22
+#define CDM_IDX         26
 #define  INTF_IDX       31
 #define WB_IDX          16
 #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
@@ -107,6 +110,7 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
 	ctx->pending_wb_flush_mask = 0;
 	ctx->pending_merge_3d_flush_mask = 0;
 	ctx->pending_dsc_flush_mask = 0;
+	ctx->pending_cdm_flush_mask = 0;
 
 	memset(ctx->pending_dspp_flush_mask, 0,
 		sizeof(ctx->pending_dspp_flush_mask));
@@ -151,6 +155,10 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
 			      ctx->pending_dsc_flush_mask);
 
+	if (ctx->pending_flush_mask & BIT(CDM_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_CDM_FLUSH,
+			      ctx->pending_cdm_flush_mask);
+
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
 
@@ -282,6 +290,13 @@ static void dpu_hw_ctl_update_pending_flush_wb(struct dpu_hw_ctl *ctx,
 	}
 }
 
+static void dpu_hw_ctl_update_pending_flush_cdm(struct dpu_hw_ctl *ctx, enum dpu_cdm cdm_num)
+{
+	/* update pending flush only if CDM_0 is flushed */
+	if (cdm_num == CDM_0)
+		ctx->pending_flush_mask |= BIT(CDM_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl *ctx,
 		enum dpu_wb wb)
 {
@@ -310,6 +325,12 @@ static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(DSC_IDX);
 }
 
+static void dpu_hw_ctl_update_pending_flush_cdm_v1(struct dpu_hw_ctl *ctx, enum dpu_cdm cdm_num)
+{
+	ctx->pending_cdm_flush_mask |= BIT(cdm_num - CDM_0);
+	ctx->pending_flush_mask |= BIT(CDM_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
 	enum dpu_dspp dspp, u32 dspp_sub_blk)
 {
@@ -543,6 +564,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	if (cfg->dsc)
 		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
+
+	if (cfg->cdm)
+		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
@@ -586,6 +610,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 wb_active = 0;
 	u32 merge3d_active = 0;
 	u32 dsc_active;
+	u32 cdm_active;
 
 	/*
 	 * This API resets each portion of the CTL path namely,
@@ -621,6 +646,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 		dsc_active &= ~cfg->dsc;
 		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
 	}
+
+	if (cfg->cdm) {
+		cdm_active = DPU_REG_READ(c, CTL_CDM_ACTIVE);
+		cdm_active &= ~cfg->cdm;
+		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cdm_active);
+	}
 }
 
 static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
@@ -654,12 +685,14 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
 		ops->update_pending_flush_dsc =
 			dpu_hw_ctl_update_pending_flush_dsc_v1;
+		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
 		ops->update_pending_flush_intf =
 			dpu_hw_ctl_update_pending_flush_intf;
 		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
+		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
 	}
 	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
 	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 279ebd8dfbff..ff85b5ee0acf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
  * @mode_3d:               3d mux configuration
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
+ * @cdm:                   CDM block used
  * @stream_sel:            Stream selection for multi-stream interfaces
  * @dsc:                   DSC BIT masks used
  */
@@ -48,6 +49,7 @@ struct dpu_hw_intf_cfg {
 	enum dpu_3d_blend_mode mode_3d;
 	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
+	enum dpu_cdm cdm;
 	int stream_sel;
 	unsigned int dsc;
 };
@@ -166,6 +168,14 @@ struct dpu_hw_ctl_ops {
 	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
 					 enum dpu_dsc blk);
 
+	/**
+	 * OR in the given flushbits to the cached pending_(cdm_)flush_mask
+	 * No effect on hardware
+	 * @ctx: ctl path ctx pointer
+	 * @cdm_num: idx of cdm to be flushed
+	 */
+	void (*update_pending_flush_cdm)(struct dpu_hw_ctl *ctx, enum dpu_cdm cdm_num);
+
 	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
@@ -239,6 +249,7 @@ struct dpu_hw_ctl_ops {
  * @pending_intf_flush_mask: pending INTF flush
  * @pending_wb_flush_mask: pending WB flush
  * @pending_dsc_flush_mask: pending DSC flush
+ * @pending_cdm_flush_mask: pending CDM flush
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -256,6 +267,7 @@ struct dpu_hw_ctl {
 	u32 pending_merge_3d_flush_mask;
 	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
 	u32 pending_dsc_flush_mask;
+	u32 pending_cdm_flush_mask;
 
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
-- 
2.40.1

