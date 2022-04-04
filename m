Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACA44F1959
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BB510E89E;
	Mon,  4 Apr 2022 16:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0989310E89E;
 Mon,  4 Apr 2022 16:35:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BE56B81837;
 Mon,  4 Apr 2022 16:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8359C2BBE4;
 Mon,  4 Apr 2022 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649090139;
 bh=U5Bqi3NaVVv4LuUNQNUHVGlc3p2darzi8Idayz0D3lY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+wTIb4+5TuoS0UAmf4GBoCJ8uIIRF3vC8PTZmos7ZakD/x2NYAr2ouHWz6eNbx8n
 35qm+31uih7L4aSbP602leDorL7r/loYiTXsU4t8ZQj6NdrCClw+LeZONXp4WquI/X
 TC9F9xDEVURKgVUUx3U9NZUSjoHyVh6iyOHLUupQqApqfea5IIsVSSJqKmxIPNJgDn
 etpYk8nKR6BlaOwBEEro8r8a0LW94ggonu4fosJxfTmN87Dgf5cguFHmG28gSA/iyf
 yYF+Llsz+dNCCQHqeBV5ixYWd3qAjmYw4zdeA6JOKpZDgt2UsjkShwpUkt0nuOEDYZ
 XGYv2IIXDLlhg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v6 11/14] drm/msm/disp/dpu1: Add DSC support in RM
Date: Mon,  4 Apr 2022 22:04:33 +0530
Message-Id: <20220404163436.956875-12-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220404163436.956875-1-vkoul@kernel.org>
References: <20220404163436.956875-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add the bits in RM to enable the DSC blocks

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 56 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  1 +
 3 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 779e7bd01efd..a41f0eb2761b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -145,6 +145,7 @@ struct dpu_global_state {
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
+	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7497538adae1..0e6634b217aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -11,6 +11,7 @@
 #include "dpu_hw_intf.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_merge3d.h"
+#include "dpu_hw_dsc.h"
 #include "dpu_encoder.h"
 #include "dpu_trace.h"
 
@@ -77,6 +78,15 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 	for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++)
 		dpu_hw_intf_destroy(rm->hw_intf[i]);
 
+	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
+		struct dpu_hw_dsc *hw;
+
+		if (rm->dsc_blks[i]) {
+			hw = to_dpu_hw_dsc(rm->dsc_blks[i]);
+			dpu_hw_dsc_destroy(hw);
+		}
+	}
+
 	return 0;
 }
 
@@ -210,6 +220,19 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
 	}
 
+	for (i = 0; i < cat->dsc_count; i++) {
+		struct dpu_hw_dsc *hw;
+		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
+
+		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed dsc object creation: err %d\n", rc);
+			goto fail;
+		}
+		rm->dsc_blks[dsc->id - DSC_0] = &hw->base;
+	}
+
 	return 0;
 
 fail:
@@ -441,6 +464,28 @@ static int _dpu_rm_reserve_ctls(
 	return 0;
 }
 
+static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       struct drm_encoder *enc,
+			       const struct msm_display_topology *top)
+{
+	int num_dsc = top->num_dsc;
+	int i;
+
+	/* check if DSC required are allocated or not */
+	for (i = 0; i < num_dsc; i++) {
+		if (global_state->dsc_to_enc_id[i]) {
+			DPU_ERROR("DSC %d is already allocated\n", i);
+			return -EIO;
+		}
+	}
+
+	for (i = 0; i < num_dsc; i++)
+		global_state->dsc_to_enc_id[i] = enc->base.id;
+
+	return 0;
+}
+
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -462,6 +507,10 @@ static int _dpu_rm_make_reservation(
 		return ret;
 	}
 
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
+	if (ret)
+		return ret;
+
 	return ret;
 }
 
@@ -499,6 +548,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
 		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
+		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -567,6 +618,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_enc_id = global_state->dspp_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->dspp_blks);
 		break;
+	case DPU_HW_BLK_DSC:
+		hw_blks = rm->dsc_blks;
+		hw_to_enc_id = global_state->dsc_to_enc_id;
+		max_blks = ARRAY_SIZE(rm->dsc_blks);
+		break;
 	default:
 		DPU_ERROR("blk type %d not managed by rm\n", type);
 		return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 9b13200a050a..32e0d8aa65ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -28,6 +28,7 @@ struct dpu_rm {
 	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
+	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
 };
 
 /**
-- 
2.34.1

