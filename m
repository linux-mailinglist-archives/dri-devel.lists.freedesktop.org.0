Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C576B997F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E961F891E1;
	Tue, 14 Mar 2023 15:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F56710E848
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:49 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id b10so16472849ljr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIyCYqhMauRLyAdFONtHZHJOdkrVE0gV4zk+V0IYJX8=;
 b=W4dG8+nvDnHb0fF5gamNctOzJGo5hrRcluMdjqWrS+Ra3SsrqLQaM4eBAuoQ6NgyOK
 pfS3UFbIXl6GQnbHSJCMGwvyUcnLCXk1FtQkkb3Bu/TkHmOG6E+hgOj/xm5xnZ5O/1Q9
 6S4Z48DtnTBZCpQJMG/TwDmUQlQhj4FeI1kD3ZUfy2SNrpmQkiSubCs2vwMdTwIi3CJG
 XEgKsQPphhHAxrxFBqTQF118Xy4rEbmM8f9NC9Jkp7NEBeeQlICWXrMXv2a0QzDqOnJn
 tDOlJGdSPN38BEHM07o4XRUXZelcp9CRANRcAUrwI8wgcPlLsnkly48X5lubywXE2RO4
 2ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIyCYqhMauRLyAdFONtHZHJOdkrVE0gV4zk+V0IYJX8=;
 b=Ir/RGt1TS3oXCOlyOfKKUZ03qBAvhZErIlahx/kwgE9NJD//+ynsZt1nz4KRtJnEsP
 HeF3Mk0tpn9DDNNLPzcNkm3d+XZo42Uthv+4EtstTHtyNyyMaA5WE1tA2qXwcFzL4+0T
 sGWecvvUqpzS2cLV6Jl2+dxIs+42pRRyoM3f4Nfd2EEqfTUrmAe5jCEphx8MdztuHF1j
 Wr+OtpS5nMQKGS9Cr2J3XyiOO7bBg12ruY+uieU+sowpr9s96sp/5u6TwJqEmZxo9W5G
 kfOstcxcHksC9gqD6p83xMBC0lOGezcyFzn+ZG1+F6rehwEClM1om/6KHtLVvP8iP+CZ
 RcMA==
X-Gm-Message-State: AO0yUKUha3hyFp4/RUGFsuHMhfRhR/51b5IHAxXKugGocQWA9mBCw0Wc
 v3HjrG+DWQfNaWhee+S6BB4dWQ==
X-Google-Smtp-Source: AK7set/lrsWbXQvaIr6DrBXepkcCbyR1i/kHblB5p15t219ViAZoqBlTvJtdJKNt9fYqNRarRmj8rA==
X-Received: by 2002:a2e:9790:0:b0:295:b432:2062 with SMTP id
 y16-20020a2e9790000000b00295b4322062mr11936763lji.36.1678808147747; 
 Tue, 14 Mar 2023 08:35:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 02/32] drm/msm/dpu: move SSPP allocation to the RM
Date: Tue, 14 Mar 2023 18:35:15 +0300
Message-Id: <20230314153545.3442879-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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

