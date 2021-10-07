Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A186424DCA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 09:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407B6F38F;
	Thu,  7 Oct 2021 07:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5E76F38F;
 Thu,  7 Oct 2021 07:09:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A690C611C1;
 Thu,  7 Oct 2021 07:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633590573;
 bh=H9s9bm9z+KcQ1sSO6qfHz+y8l3giP3kBGaePIrkBE6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kaqeiW5gv6EhwwBC5IdxN/kPD4OZ98OkvMPGRO07PVCLszONtqDyfbpjViJRuZNAX
 6j9yqlhiChPUxpAx195q+lxbkfbju1gvLwNZ/o392yghwnPVTIGWxJtsE/TOfPzlsG
 EtQH9zrDbdEanV4/FqbIY0KTrezF0WGgdnEpmAY/TPWvz9dKOW6h15ucmQaQmLrCk/
 NcEuW0lMA1SgaA09CD5Sn7qkXfspFJUfcOURmIn+sDi0+dLXuVOp2RRFMCj3FzF8zK
 S5tLG2mKABJI4UouHt1gaQcBlub0pt/Ps1FPDevcPYXzvX1HyEnn2fGaxM/q4V0UhY
 o2F9Cf9vRi28A==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 04/11] drm/msm/disp/dpu1: Add DSC support in RM
Date: Thu,  7 Oct 2021 12:38:53 +0530
Message-Id: <20211007070900.456044-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007070900.456044-1-vkoul@kernel.org>
References: <20211007070900.456044-1-vkoul@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add the bits in RM to enable the DSC blocks

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since
v1:
 - Add _dpu_rm_reserve_dsc() function which checks if DSC is enabled
 - Fix to use dsc_blks

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 61 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  1 +
 3 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 323a6bce9e64..da646817585d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -159,6 +159,7 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
+	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6e427a..95bdabc16280 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -11,6 +11,7 @@
 #include "dpu_hw_intf.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_merge3d.h"
+#include "dpu_hw_dsc.h"
 #include "dpu_encoder.h"
 #include "dpu_trace.h"
 
@@ -75,6 +76,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_intf_destroy(hw);
 		}
 	}
+	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
+		struct dpu_hw_dsc *hw;
+
+		if (rm->dsc_blks[i]) {
+			hw = to_dpu_hw_dsc(rm->dsc_blks[i]);
+			dpu_hw_dsc_destroy(hw);
+		}
+	}
 
 	return 0;
 }
@@ -221,6 +230,19 @@ int dpu_rm_init(struct dpu_rm *rm,
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
@@ -476,6 +498,7 @@ static int _dpu_rm_reserve_intf(
 	}
 
 	global_state->intf_to_enc_id[idx] = enc_id;
+
 	return 0;
 }
 
@@ -500,6 +523,33 @@ static int _dpu_rm_reserve_intf_related_hw(
 	return ret;
 }
 
+static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       struct drm_encoder *enc)
+{
+	struct msm_drm_private *priv;
+
+	priv = enc->dev->dev_private;
+
+	if (!priv)
+		return -EIO;
+
+	/* check if DSC is supported */
+	if (!priv->dsc)
+		return 0;
+
+	/* check if DSC 0 & 1 and allocated or not */
+	if (global_state->dsc_to_enc_id[0] || global_state->dsc_to_enc_id[1]) {
+		DPU_ERROR("DSC 0|1 is already allocated\n");
+		return -EIO;
+	}
+
+	global_state->dsc_to_enc_id[0] = enc->base.id;
+	global_state->dsc_to_enc_id[1] = enc->base.id;
+
+	return 0;
+}
+
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -526,6 +576,10 @@ static int _dpu_rm_make_reservation(
 	if (ret)
 		return ret;
 
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc);
+	if (ret)
+		return ret;
+
 	return ret;
 }
 
@@ -567,6 +621,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
 		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
+		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -640,6 +696,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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
index 1f12c8d5b8aa..278d2a510b80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -30,6 +30,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
+	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
 
 	uint32_t lm_max_width;
 };
-- 
2.31.1

