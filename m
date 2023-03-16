Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75046BD4F7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD71B10ED4A;
	Thu, 16 Mar 2023 16:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1CC10E227
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:16:58 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id b10so2292891ljr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6H6w3UvLExVH1r6LsLoxYcblK2SLTPc1eqfYAA+7oME=;
 b=pvO//C/wSoHh1Yx301rGkN1fsCJzo7G478oSaoYthmin7hD69qvfoQCMRuBef92zBx
 vi28OAhxWWVuagsPerJIxuOZomFOhVWxWrE/8+nPdbbne7Z4zCXz18391qXmLfvFxexj
 Mexblo79t+x4dsqulnybXvjGndBQR/FNmiUig5o0dA/cmcYWip9EXOlXZaiHeBn965oc
 BGFCPEJV7D1lLFgXUYLW99sJlOl6Wt23WPJ38mV4n+P+V610HsihcJzRKxaD6KNN6OQD
 Cs/WanLf+TQKS0hIkX1L5Bvi8iM3ygxj631Lnnm8D0V0e18uSgItVYc2Q4JUx3uQXHxJ
 xssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6H6w3UvLExVH1r6LsLoxYcblK2SLTPc1eqfYAA+7oME=;
 b=yj8zoJ5aF7tCjON3XUYuevNQNaUI3WnrC6IcvJ4XFO3NzDAnGWpaWW1sDAmgQpRduH
 ltTrSNgrN2hq0C4FK+FdypwXbXaVWWMEhFEtGGEh9qgDjyORLR45/nvLl/dqYo7Lrc1E
 qVmwtDIANhlc1ubsM9L3T+e4QIZ66NtrcI0v7L+CXqX/AEtbBASXZgsQkU4q0hX002B9
 PY60lXxqpPYG5HH2tGwWjJCRduUb30PZUFWXsmLzQqyitGJXo8sfpj+Cewm1uHmhu2mY
 eFTudvFqn8xdlYMmdT8+33zqfbwOOJgffDUEGbQwPXhOERKgOy8ZQVxuwP7jgPgOnR3i
 oA4Q==
X-Gm-Message-State: AO0yUKVbuyfq14bdh5HzTonCiQ7ChJByc4Obh7JMBY/8LUWKT2Fha2eN
 LbcGt1Dj/4BwGdUu92rlTG8/CTNR7jYQC2O+HVk=
X-Google-Smtp-Source: AK7set+/xEABlPRWPSUBRJc/2YxUb/t3jxiFFe0rfvM6cosu8W87JtBxFzYsfqOJsjTnrk2oHWQ1sw==
X-Received: by 2002:a2e:878d:0:b0:294:5a47:f1b with SMTP id
 n13-20020a2e878d000000b002945a470f1bmr2355253lji.35.1678983416608; 
 Thu, 16 Mar 2023 09:16:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:16:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 02/32] drm/msm/dpu: move SSPP allocation to the RM
Date: Thu, 16 Mar 2023 19:16:23 +0300
Message-Id: <20230316161653.4106395-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the example of all other hw blocks and initialize SSPP blocks in
Resource Manager.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 17 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    | 12 ++++++++++++
 3 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 5a4578ab62a6..b054055f120b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1275,8 +1275,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-		dpu_hw_sspp_destroy(pdpu->pipe_hw);
-
 		kfree(pdpu);
 	}
 }
@@ -1482,14 +1480,10 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	pdpu->pipe = pipe;
 
 	/* initialize underlying h/w driver */
-	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
-	if (IS_ERR(pdpu->pipe_hw)) {
-		DPU_ERROR("[%u]SSPP init failed\n", pipe);
-		ret = PTR_ERR(pdpu->pipe_hw);
+	pdpu->pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
+	if (!pdpu->pipe_hw || !pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
+		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
 		goto clean_plane;
-	} else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
-		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
-		goto clean_sspp;
 	}
 
 	format_list = pdpu->pipe_hw->cap->sblk->format_list;
@@ -1499,7 +1493,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
 	if (ret)
-		goto clean_sspp;
+		goto clean_plane;
 
 	pdpu->catalog = kms->catalog;
 
@@ -1532,9 +1526,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 					pipe, plane->base.id);
 	return plane;
 
-clean_sspp:
-	if (pdpu && pdpu->pipe_hw)
-		dpu_hw_sspp_destroy(pdpu->pipe_hw);
 clean_plane:
 	kfree(pdpu);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 66c1b70d244f..f4dda88a73f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -8,6 +8,7 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
+#include "dpu_hw_sspp.h"
 #include "dpu_hw_intf.h"
 #include "dpu_hw_wb.h"
 #include "dpu_hw_dspp.h"
@@ -91,6 +92,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 	for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
 		dpu_hw_wb_destroy(rm->hw_wb[i]);
 
+	for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++)
+		dpu_hw_sspp_destroy(rm->hw_sspp[i]);
+
 	return 0;
 }
 
@@ -255,6 +259,24 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->dsc_blks[dsc->id - DSC_0] = &hw->base;
 	}
 
+	for (i = 0; i < cat->sspp_count; i++) {
+		struct dpu_hw_sspp *hw;
+		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
+
+		if (sspp->id < SSPP_NONE || sspp->id >= SSPP_MAX) {
+			DPU_ERROR("skip intf %d with invalid id\n", sspp->id);
+			continue;
+		}
+
+		hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
+		if (IS_ERR(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed sspp object creation: err %d\n", rc);
+			goto fail;
+		}
+		rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
+	}
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 59de72b381f9..d62c2edb2460 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -21,6 +21,7 @@ struct dpu_global_state;
  * @hw_intf: array of intf hardware resources
  * @hw_wb: array of wb hardware resources
  * @dspp_blks: array of dspp hardware resources
+ * @hw_sspp: array of sspp hardware resources
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -31,6 +32,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
+	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
 };
 
 /**
@@ -108,5 +110,15 @@ static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_wb wb_
 	return rm->hw_wb[wb_idx - WB_0];
 }
 
+/**
+ * dpu_rm_get_sspp - Return a struct dpu_hw_sspp instance given it's index.
+ * @rm: DPU Resource Manager handle
+ * @sspp_idx: SSPP index
+ */
+static inline struct dpu_hw_sspp *dpu_rm_get_sspp(struct dpu_rm *rm, enum dpu_sspp sspp_idx)
+{
+	return rm->hw_sspp[sspp_idx - SSPP_NONE];
+}
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.30.2

