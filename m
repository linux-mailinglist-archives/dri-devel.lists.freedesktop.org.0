Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF836590E8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68C110E21F;
	Thu, 29 Dec 2022 19:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB5710E205
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:01 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p36so28726022lfa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnd05D4A7qypUQpKTFI55M9QVUdcSTf1oiTJTEwrnk4=;
 b=l3jOxWWzsZp77w0XV+UDHl+l4bC+5+p06teOdLkpQ6Q75ToPp0yp0akoATeA6wnHIj
 5TIq3iBqcbwrGMRgx4DwYtbc6WbOJf94aQPM9r/YLwicI1NHjOQA0s1GOtYTMoTgX0BO
 C85hlEohsWjU9dNsKOLiEIXwRh/G28DV8nGOpmZJ+BTPYb1ZpFa5uHzQBJvpKjuxjvFk
 yQCaV1BvPN88bKojSV/k8c1I72xpS7ig8s2RHz+RD5ObADQsDY8aECm0TMdGSlR4ZhMk
 YLyHGqZLOuBxR4mAXSXjC9+6pBdpzzi5wJhO1DmgsOJnCmH2JtxNV/3tXs7seQOGphsy
 CK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnd05D4A7qypUQpKTFI55M9QVUdcSTf1oiTJTEwrnk4=;
 b=4C2pcJ/1HiKEr/OMU7/203mD3lLdK8aWYaoCX6znZzjJTh28g/lNVG4J8g8AEO/Atn
 vLqnyHDGofH3wl323osFKpE4MMGuZ9jbDoGki2auv4MoTVAzaHeoVOQaKrOMOyx9NsHT
 CqUut7nE0niQwcuUKMDq1gNAwh+gWtK/BzeF6r/jtyWKK6zPUaHf2VisDxGBgmMKkUC2
 wTslqNlCUEVWVaBAoSABJ/bnFZQx90SyYY2WGlnZmr6c2+zBcfnOe6go8d0McZ/pWT8A
 xmc3WFx4cA7V0N+QZ8/qyXNNDlOtnW91LmVERSMp1x2gvAWkHxozSe/WiNYlKoFiE0Za
 B+Sg==
X-Gm-Message-State: AFqh2kp9dRFBn/3ybdtf5lQMLpHoYZ3hlu42AJE65ofsRpij39ITPmFW
 Kp5ydk3uBt6i1RggkZi8lTb3PQ==
X-Google-Smtp-Source: AMrXdXtdx9RcTbs19nR5rS3TUtJ6VHRyzjuL9qJ/tpdGn0d/7jSv/qqgw53B4W2b/dSCenOa3w4oYw==
X-Received: by 2002:ac2:4bcc:0:b0:4b6:fae9:c9b7 with SMTP id
 o12-20020ac24bcc000000b004b6fae9c9b7mr8687857lfq.7.1672341541300; 
 Thu, 29 Dec 2022 11:19:01 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 03/27] drm/msm/dpu: move SSPP allocation to the RM
Date: Thu, 29 Dec 2022 21:18:32 +0200
Message-Id: <20221229191856.3508092-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 17 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    | 12 ++++++++++++
 3 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e1cdd71716f0..e443799de2c1 100644
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
index 73b3442e7467..0668009cc9ed 100644
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
2.39.0

