Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992145093D1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1779F10F2CA;
	Wed, 20 Apr 2022 23:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB3F10E607;
 Wed, 20 Apr 2022 23:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650498623; x=1682034623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=jL8x1Cn9bMqm5PZucg9Au1/qz/7ZnwLQh9bTCYn9e+k=;
 b=DGAkvYIgaCUTYRjit9znE/DicYRNOJsZXirjy+yV/GlDtCSHqUhMdTvc
 6xH4UYIrSNv5vqk7fQHTLRlYiNzSNmtjSVgwCKV5wH83HWXlxeXAKwC7p
 Rnz5Lig8Xogff2uV7wjncsYGjpUUWMa9VEyzdq7MsmaBXEpmCwhzrvq9d s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 20 Apr 2022 16:50:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 16:50:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:50:04 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:50:03 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 08/18] drm/msm/dpu: add writeback blocks to DPU RM
Date: Wed, 20 Apr 2022 16:49:37 -0700
Message-ID: <1650498587-14749-9-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
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

Add writeback blocks to DPU resource manager so that
the encoders can directly request them through RM.

changes in v3:
	- use IS_ERR() instead of IS_ERR_OR_NULL()

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h | 12 ++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 0e6634b..06f03e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -9,6 +9,7 @@
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_intf.h"
+#include "dpu_hw_wb.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_merge3d.h"
 #include "dpu_hw_dsc.h"
@@ -87,6 +88,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 		}
 	}
 
+	for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
+		dpu_hw_wb_destroy(rm->hw_wb[i]);
+
 	return 0;
 }
 
@@ -186,6 +190,24 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->hw_intf[intf->id - INTF_0] = hw;
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
+		if (IS_ERR(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed wb object creation: err %d\n", rc);
+			goto fail;
+		}
+		rm->hw_wb[wb->id - WB_0] = hw;
+	}
+
 	for (i = 0; i < cat->ctl_count; i++) {
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 32e0d8a..ba82e54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -19,6 +19,7 @@ struct dpu_global_state;
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @hw_intf: array of intf hardware resources
+ * @hw_wb: array of wb hardware resources
  * @dspp_blks: array of dspp hardware resources
  */
 struct dpu_rm {
@@ -26,6 +27,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
+	struct dpu_hw_wb *hw_wb[WB_MAX - WB_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
@@ -96,5 +98,15 @@ static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
 	return rm->hw_intf[intf_idx - INTF_0];
 }
 
+/**
+ * dpu_rm_get_wb - Return a struct dpu_hw_wb instance given it's index.
+ * @rm: DPU Resource Manager handle
+ * @wb_idx: WB index
+ */
+static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_intf wb_idx)
+{
+	return rm->hw_wb[wb_idx - WB_0];
+}
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.7.4

