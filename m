Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F395100C1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 16:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7E910E07C;
	Tue, 26 Apr 2022 14:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44DA10E116;
 Tue, 26 Apr 2022 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650984140; x=1682520140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+HhKpYT7AiixQhmdUdUmQmp0hKs+xAjYz1P2P1ehB3k=;
 b=NWcsTHW6gxDg8w8igh7SridmP/nVngybgGyTpW4F6zxuhwxJrUg3ktlT
 tXM5dmo63D1L314GKtGgEL7bgwXKMZ3iB8wn2jMFwaIqMPTswRyPiAsMf
 t+e/MPgagN1C+0sMmOnSTiXFhPDQPjE55A09NyIzcoY+/uqn+MAO7gQMO Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 07:42:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:42:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:42:14 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:42:13 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v6 09/19] drm/msm/dpu: add an API to reset the encoder related
 hw blocks
Date: Tue, 26 Apr 2022 07:41:26 -0700
Message-ID: <1650984096-9964-10-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Add an API to reset the encoder related hw blocks to ensure
a proper teardown of the pipeline. At the moment this is being
used only for the writeback encoder but eventually we can start
using this for all interfaces.

changes in v4:
	- none

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 85 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  7 ++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4523693..25c7eda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
+ * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
@@ -22,6 +24,7 @@
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_dsc.h"
+#include "dpu_hw_merge3d.h"
 #include "dpu_formats.h"
 #include "dpu_encoder_phys.h"
 #include "dpu_crtc.h"
@@ -1838,6 +1841,86 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 	DPU_ATRACE_END("encoder_kickoff");
 }
 
+static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_hw_mixer_cfg mixer;
+	int i, num_lm;
+	u32 flush_mask = 0;
+	struct dpu_global_state *global_state;
+	struct dpu_hw_blk *hw_lm[2];
+	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
+
+	memset(&mixer, 0, sizeof(mixer));
+
+	/* reset all mixers for this encoder */
+	if (phys_enc->hw_ctl->ops.clear_all_blendstages)
+		phys_enc->hw_ctl->ops.clear_all_blendstages(phys_enc->hw_ctl);
+
+	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
+
+	num_lm = dpu_rm_get_assigned_resources(&phys_enc->dpu_kms->rm, global_state,
+		phys_enc->parent->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+
+	for (i = 0; i < num_lm; i++) {
+		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
+		flush_mask = phys_enc->hw_ctl->ops.get_bitmask_mixer(ctl, hw_mixer[i]->idx);
+		if (phys_enc->hw_ctl->ops.update_pending_flush)
+			phys_enc->hw_ctl->ops.update_pending_flush(ctl, flush_mask);
+
+		/* clear all blendstages */
+		if (phys_enc->hw_ctl->ops.setup_blendstage)
+			phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+	}
+}
+
+void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
+	struct dpu_hw_intf_cfg intf_cfg = { 0 };
+	int i;
+	struct dpu_encoder_virt *dpu_enc;
+
+	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
+
+	phys_enc->hw_ctl->ops.reset(ctl);
+
+	dpu_encoder_helper_reset_mixers(phys_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
+			phys_enc->hw_intf->ops.bind_pingpong_blk(
+					dpu_enc->phys_encs[i]->hw_intf, false,
+					dpu_enc->phys_encs[i]->hw_pp->idx);
+
+		/* mark INTF flush as pending */
+		if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
+			phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
+					dpu_enc->phys_encs[i]->hw_intf->idx);
+	}
+
+	/* reset the merge 3D HW block */
+	if (phys_enc->hw_pp->merge_3d) {
+		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
+				BLEND_3D_NONE);
+		if (phys_enc->hw_ctl->ops.update_pending_flush_merge_3d)
+			phys_enc->hw_ctl->ops.update_pending_flush_merge_3d(ctl,
+					phys_enc->hw_pp->merge_3d->idx);
+	}
+
+	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
+	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
+	if (phys_enc->hw_pp->merge_3d)
+		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
+
+	if (ctl->ops.reset_intf_cfg)
+		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
+
+	ctl->ops.trigger_flush(ctl);
+	ctl->ops.trigger_start(ctl);
+	ctl->ops.clear_pending_flush(ctl);
+}
+
 void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 706b566..544a9a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
  */
 
@@ -350,4 +351,10 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		void (*func)(void *arg, int irq_idx),
 		struct dpu_encoder_wait_info *wait_info);
 
+/**
+ * dpu_encoder_helper_phys_cleanup - helper to cleanup dpu pipeline
+ * @phys_enc: Pointer to physical encoder structure
+ */
+void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
+
 #endif /* __dpu_encoder_phys_H__ */
-- 
2.7.4

