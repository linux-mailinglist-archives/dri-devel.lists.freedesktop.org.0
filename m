Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881744AA1FD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 22:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0303110E74C;
	Fri,  4 Feb 2022 21:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1270D10E74C;
 Fri,  4 Feb 2022 21:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644009470; x=1675545470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=OMGtz4WT+eqttSgXixTVcRCoWxojnt9vZ2LHA8zh9DE=;
 b=AezsEmrqu1wcCcyPmc7mM4FB5dAEILqsxilWghCy4ZPuVStZVB4e52lS
 vLjjr0S7qttbcymMmskYSOek0OnwoTK+2/fwohogYRyb73yMdRKmIqeUY
 S12psPRTFbEJsmE2V6y0v704bUBV6jzhpLB35+B4omWLBiCW1ngSnCc/H c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Feb 2022 13:17:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 13:17:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:49 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:17:48 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/12] drm/msm/dpu: add writeback blocks to DPU RM
Date: Fri, 4 Feb 2022 13:17:16 -0800
Message-ID: <1644009445-17320-4-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 swboyd@chromium.org, nganji@codeaurora.org, seanpaul@chromium.org,
 markyacoub@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add writeback blocks to DPU resource manager so that
writeback encoders can request for writeback hardware blocks
through RM and their usage can be tracked.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 71 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +
 4 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index e241914..cc10436 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -21,9 +22,11 @@
 /**
  * Encoder functions and data types
  * @intfs:	Interfaces this encoder is using, INTF_MODE_NONE if unused
+ * @wbs:    Writeback blocks this encoder is using
  */
 struct dpu_encoder_hw_resources {
 	enum dpu_intf_mode intfs[INTF_MAX];
+	enum dpu_intf_mode wbs[WB_MAX];
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 2d385b4..1e00804 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -146,6 +147,7 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
+	uint32_t wb_to_enc_id[WB_MAX - WB_0];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6..edd0b7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
  */
 
@@ -9,6 +10,7 @@
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_intf.h"
+#include "dpu_hw_wb.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_merge3d.h"
 #include "dpu_encoder.h"
@@ -75,6 +77,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_intf_destroy(hw);
 		}
 	}
+	for (i = 0; i < ARRAY_SIZE(rm->wb_blks); i++) {
+		struct dpu_hw_wb *hw;
+
+		if (rm->wb_blks[i]) {
+			hw = to_dpu_hw_wb(rm->wb_blks[i]);
+			dpu_hw_wb_destroy(hw);
+		}
+	}
 
 	return 0;
 }
@@ -187,6 +197,24 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->intf_blks[intf->id - INTF_0] = &hw->base;
 	}
 
+	for (i = 0; i < cat->wb_count; i++) {
+		struct dpu_hw_wb *hw;
+		const struct dpu_wb_cfg *wb = &cat->wb[i];
+
+		if (wb->id < WB_0 || wb->id >= WB_MAX) {
+			DPU_ERROR("skip intf %d with invalid id\n", wb->id);
+			continue;
+		}
+
+		hw = dpu_hw_wb_init(wb->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed wb object creation: err %d\n", rc);
+			goto fail;
+		}
+		rm->wb_blks[wb->id - WB_0] = &hw->base;
+	}
+
 	for (i = 0; i < cat->ctl_count; i++) {
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
@@ -479,6 +507,33 @@ static int _dpu_rm_reserve_intf(
 	return 0;
 }
 
+static int _dpu_rm_reserve_wb(
+		struct dpu_rm *rm,
+		struct dpu_global_state *global_state,
+		uint32_t enc_id,
+		uint32_t id)
+{
+	int idx = id - WB_0;
+
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->wb_blks)) {
+		DPU_ERROR("invalid intf id: %d", id);
+		return -EINVAL;
+	}
+
+	if (!rm->wb_blks[idx]) {
+		DPU_ERROR("couldn't find wb id %d\n", id);
+		return -EINVAL;
+	}
+
+	if (reserved_by_other(global_state->wb_to_enc_id, idx, enc_id)) {
+		DPU_ERROR("intf id %d already reserved\n", id);
+		return -ENAVAIL;
+	}
+
+	global_state->wb_to_enc_id[idx] = enc_id;
+	return 0;
+}
+
 static int _dpu_rm_reserve_intf_related_hw(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -497,6 +552,15 @@ static int _dpu_rm_reserve_intf_related_hw(
 			return ret;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(hw_res->wbs); i++) {
+		if (hw_res->wbs[i] == INTF_MODE_NONE)
+			continue;
+		id = i + WB_0;
+		ret = _dpu_rm_reserve_wb(rm, global_state, enc_id, id);
+		if (ret)
+			return ret;
+	}
+
 	return ret;
 }
 
@@ -567,6 +631,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
 		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(global_state->wb_to_enc_id,
+		ARRAY_SIZE(global_state->wb_to_enc_id), enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -635,6 +701,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_enc_id = global_state->intf_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->intf_blks);
 		break;
+	case DPU_HW_BLK_WB:
+		hw_blks = rm->wb_blks;
+		hw_to_enc_id = global_state->wb_to_enc_id;
+		max_blks = ARRAY_SIZE(rm->wb_blks);
+		break;
 	case DPU_HW_BLK_DSPP:
 		hw_blks = rm->dspp_blks;
 		hw_to_enc_id = global_state->dspp_to_enc_id;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d..a021409 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
  */
 
@@ -30,6 +31,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
+	struct dpu_hw_blk *wb_blks[WB_MAX - WB_0];
 
 	uint32_t lm_max_width;
 };
-- 
2.7.4

