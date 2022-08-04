Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02449589A76
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 12:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B9494AD6;
	Thu,  4 Aug 2022 10:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B1A94A96;
 Thu,  4 Aug 2022 10:29:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 274A9UUG023791;
 Thu, 4 Aug 2022 10:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=EZe8eC3iDD3kk/ONKmOPiIysE9i0w67BBMmkWHWW3H0=;
 b=FBoIiZmGu46jChSLNNt60yA4a4inoaJYCyOSbJdw4LeZdChhTBfLw2Gh//h0nuhVHUGw
 9BmR1qYBSBKQoTyRKUDlbJWLtvO1O72rD2uFhIUl3EZCmXQ8Mbh+9ThrUwOIFWMPOykR
 akPO7ZzQQ4i1AlsUFd0rx+3OEbpWA96gJWzV5oy+DWq2HYw7NaVrNwQp13l1qVVHmcSM
 0WsLpNHCASVvvcm2pKJkXZJ+Jw289QtCUfZOUvBvNLm+pdMQGTBWCv0sFT2fWSv9CUIa
 BC3sPFy+ya76OqwyT79KWnHbgArzN57UQQK8qAij/WAStAU+rKur3WX7IhQWtFTpYPf3 xQ== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hqy7r9cu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 10:29:03 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 274ASxPf017796; 
 Thu, 4 Aug 2022 10:28:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3hmwqkg9n7-1;
 Thu, 04 Aug 2022 10:28:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 274ASwq7017791;
 Thu, 4 Aug 2022 10:28:58 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 274ASwYO017790;
 Thu, 04 Aug 2022 10:28:58 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id D9F5E40F4; Thu,  4 Aug 2022 03:28:57 -0700 (PDT)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for dspp
 in sc7280
Date: Thu,  4 Aug 2022 03:28:50 -0700
Message-Id: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1ZUH6sWsyGbNWSu42OdW5FXzlwGvlRt5
X-Proofpoint-ORIG-GUID: 1ZUH6sWsyGbNWSu42OdW5FXzlwGvlRt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_03,2022-08-04_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040045
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

representation: master_flush && (PCC_flush | IGC_flush .. etc )

This change adds necessary support for the above design.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 40 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |  7 +++++
 6 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7763558..4eca317 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -703,6 +703,10 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 		mixer[i].flush_mask |= ctl->ops.get_bitmask_dspp(ctl,
 			mixer[i].hw_dspp->idx);
 
+		if(ctl->ops.set_dspp_hierarchical_flush)
+			ctl->ops.set_dspp_hierarchical_flush(ctl,
+						mixer[i].hw_dspp->idx, DSPP_SUB_PCC);
+
 		/* stage config flush mask */
 		ctl->ops.update_pending_flush(ctl, mixer[i].flush_mask);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 021eb2f..3b27a87 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -58,7 +58,10 @@
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
+	(BIT(DPU_CTL_ACTIVE_CFG) | \
+	 BIT(DPU_CTL_FETCH_ACTIVE) | \
+	 BIT(DPU_CTL_VM_CFG) | \
+	 BIT(DPU_CTL_HIERARCHICAL_FLUSH))
 
 #define MERGE_3D_SM8150_MASK (0)
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b85b24b..7922f6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -185,6 +185,7 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
+ * @DPU_CTL_HIERARCHICAL_FLUSH: CTL config to support hierarchical flush
  * @DPU_CTL_MAX
  */
 enum {
@@ -192,6 +193,7 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
+	DPU_CTL_HIERARCHICAL_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 3584f5e..b34fc30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -28,6 +28,8 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
+#define   CTL_DSPP_0_FLUSH		0x13C
+
 
 #define CTL_MIXER_BORDER_OUT            BIT(24)
 #define CTL_FLUSH_MASK_CTL              BIT(17)
@@ -292,6 +294,36 @@ static uint32_t dpu_hw_ctl_get_bitmask_dspp(struct dpu_hw_ctl *ctx,
 	return flushbits;
 }
 
+static uint32_t dpu_hw_ctl_get_bitmask_dspp_v1(struct dpu_hw_ctl *ctx,
+	enum dpu_dspp dspp)
+{
+	return BIT(29);
+}
+
+static void dpu_hw_ctl_set_dspp_hierarchical_flush(struct dpu_hw_ctl *ctx,
+	enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
+{
+	uint32_t flushbits = 0, active = 0;
+
+	switch (dspp_sub_blk) {
+	case DSPP_SUB_IGC:
+		flushbits = BIT(2);
+		break;
+	case DSPP_SUB_PCC:
+		flushbits = BIT(4);
+		break;
+	case DSPP_SUB_GC:
+		flushbits = BIT(5);
+		break;
+	default:
+		return;
+	}
+
+	active = DPU_REG_READ(&ctx->hw, CTL_DSPP_0_FLUSH + ((dspp - 1) * 4));
+
+	DPU_REG_WRITE(&ctx->hw, CTL_DSPP_0_FLUSH + ((dspp - 1) * 4), active | flushbits);
+}
+
 static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -600,7 +632,13 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
 	ops->get_bitmask_mixer = dpu_hw_ctl_get_bitmask_mixer;
-	ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
+	if (cap & BIT(DPU_CTL_HIERARCHICAL_FLUSH)) {
+		ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp_v1;
+		ops->set_dspp_hierarchical_flush = dpu_hw_ctl_set_dspp_hierarchical_flush;
+	} else {
+		ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
+	}
+
 	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
 		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index ac15444..8ecab91 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -160,6 +160,9 @@ struct dpu_hw_ctl_ops {
 	uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
 		enum dpu_dspp blk);
 
+	void (*set_dspp_hierarchical_flush)(struct dpu_hw_ctl *ctx,
+		enum dpu_dspp blk, enum dpu_dspp_sub_blk dspp_sub_blk);
+
 	/**
 	 * Set all blend stages to disabled
 	 * @ctx       : ctl path ctx pointer
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index bb9cead..561e2ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -166,6 +166,13 @@ enum dpu_dspp {
 	DSPP_MAX
 };
 
+enum dpu_dspp_sub_blk{
+	DSPP_SUB_PCC = 1,
+	DSPP_SUB_IGC,
+	DSPP_SUB_GC,
+	DSPP_SUB_MAX
+};
+
 enum dpu_ctl {
 	CTL_0 = 1,
 	CTL_1,
-- 
2.7.4

