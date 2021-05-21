Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0978038C6F3
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2406E506;
	Fri, 21 May 2021 12:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188096F635;
 Fri, 21 May 2021 12:50:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 750C8613D9;
 Fri, 21 May 2021 12:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621601439;
 bh=Gb5d67i9Q4U15xb2aE7Imj0HQ2P/vErp6AIgUyNfqvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I3LsPb4rQpeFHtPNwU8iI/BmV9ZRJNNwyEIakasGihBN8gev7lksE929hszuv3Bro
 kVeBnMBqjTzLgpZuuYJP7v1R313RDqd7+0aMclaJVsmPhn8Mq1J72rtQsnl12zK8Tu
 WZ01DkU6C5y0GbmrUbPsVJKoLcTzYFo5Ktmh5bMSAe9E68VFrwkIRyGRyi4eVt4djw
 WlWAJFaaKIEfPhe5GNHfF454i62OfzAE4PuW8ucha0Tm2iJ6HDf/GhDCWP+ux7vNwb
 WMScJXW07GnGg2n4E8H9IQWX08TJBI04r6CLPURJsCWHIaB644ziMw5ksnfC8qcD4z
 D9isIvcGV1IeQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 06/13] drm/msm/disp/dpu1: Add DSC support in RM
Date: Fri, 21 May 2021 18:19:38 +0530
Message-Id: <20210521124946.3617862-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add the bits in RM to enable the DSC blocks

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 32 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  1 +
 3 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d6717d6672f7..d56c05146dfe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -165,6 +165,7 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
+	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index fd2d104f0a91..4da6d72b7996 100644
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
+		if (rm->intf_blks[i]) {
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
@@ -476,6 +498,9 @@ static int _dpu_rm_reserve_intf(
 	}
 
 	global_state->intf_to_enc_id[idx] = enc_id;
+
+	global_state->dsc_to_enc_id[0] = enc_id;
+	global_state->dsc_to_enc_id[1] = enc_id;
 	return 0;
 }
 
@@ -567,6 +592,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
 		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
+		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -640,6 +667,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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
2.26.3

