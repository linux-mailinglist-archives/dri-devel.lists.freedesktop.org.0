Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6A7507E69
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 03:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2440E10EF80;
	Wed, 20 Apr 2022 01:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E185210EF8B;
 Wed, 20 Apr 2022 01:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650419211; x=1681955211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Wxnf9gMkonYAiV0SOsW6+bIFutMa0qTq/sHMYjqZkRE=;
 b=ZKbOilfbDGMQVS49sxDxVv1UIfcqURvVmTP0RPtNue+XSF7XtQoNGz1C
 xUaeLIfWsuOb2Jxt8PbYOg+pTShRbpcqDTD2noghkHG3zJOs8oQuD/MSq
 3jqfdeY6JAZFjWAZgttt8SKojuZ4Uan6fyXmPxsoG8aPc9TvEMeAmAdmm s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Apr 2022 18:46:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:46:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 18:46:33 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 18:46:32 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 05/17] drm/msm/dpu: add reset_intf_cfg operation for
 dpu_hw_ctl
Date: Tue, 19 Apr 2022 18:45:57 -0700
Message-ID: <1650419169-13760-6-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a reset_intf_cfg operation for dpu_hw_ctl to reset the
entire CTL path by disabling each component namely layer mixer,
3d-merge and interface blocks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 32 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  8 ++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index dc27579..524f024 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -563,6 +563,37 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_TOP, intf_cfg);
 }
 
+static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
+		struct dpu_hw_intf_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	u32 intf_active = 0;
+	u32 merge3d_active = 0;
+
+	/*
+	 * This API resets each portion of the CTL path namely,
+	 * clearing the sspps staged on the lm, merge_3d block,
+	 * interfaces etc to ensure clean teardown of the pipeline.
+	 * This will be used for writeback to begin with to have a
+	 * proper teardown of the writeback session but upon further
+	 * validation, this can be extended to all interfaces.
+	 */
+	if (cfg->merge_3d) {
+		merge3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
+		merge3d_active &= ~BIT(cfg->merge_3d - MERGE_3D_0);
+		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
+				merge3d_active);
+	}
+
+	dpu_hw_ctl_clear_all_blendstages(ctx);
+
+	if (cfg->intf) {
+		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
+		intf_active &= ~BIT(cfg->intf - INTF_0);
+		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+	}
+}
+
 static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
 	unsigned long *fetch_active)
 {
@@ -586,6 +617,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
+		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
 		ops->update_pending_flush_intf =
 			dpu_hw_ctl_update_pending_flush_intf_v1;
 		ops->update_pending_flush_merge_3d =
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 97f326d..c61a8fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -140,6 +140,14 @@ struct dpu_hw_ctl_ops {
 	void (*setup_intf_cfg)(struct dpu_hw_ctl *ctx,
 		struct dpu_hw_intf_cfg *cfg);
 
+	/**
+	 * reset ctl_path interface config
+	 * @ctx    : ctl path ctx pointer
+	 * @cfg    : interface config structure pointer
+	 */
+	void (*reset_intf_cfg)(struct dpu_hw_ctl *ctx,
+			struct dpu_hw_intf_cfg *cfg);
+
 	int (*reset)(struct dpu_hw_ctl *c);
 
 	/*
-- 
2.7.4

