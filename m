Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736BF68A19A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA5810E85C;
	Fri,  3 Feb 2023 18:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78D010E852
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:37 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eq11so6010808edb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+VOZFLZqhVA8c0SXEUbcQTNqM3iJbkyXdzns45BZeI=;
 b=ql6UdAm1dY58uI15V239GzMFBX6WAg8pJjFmn06E92AVb1Zg93+V634+jky/TO4Qwv
 QxiCk9rkx7A8nrByNC8JeWa2XhSG5rqrZ7UKo3OSlO9t0YE1M3LEnGHYPeOTLw2f2VlO
 4P7C3+dgEZvFvla/aELtYQ4ve84iWLhYLVPAg5cR31YUKB1HdUsOlCMWQ3vWPsEfomEF
 KQnKMPtwcy0OdsT3n4WbwNE1W5fvsQrhWbltfZDvNfzf2XRkDfW2wSu2fMLwQcnhU3Nu
 b9s5OZdRiignl2QVzEwU48JIhtMfHXmdlracLnVD28k2GJ8p5oGtuBvsZXput8UvGvf/
 vFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+VOZFLZqhVA8c0SXEUbcQTNqM3iJbkyXdzns45BZeI=;
 b=SKeeN/w+pxBhsA0gRjVAV7/MJvlui8ZdsJ72gKli1M/UuJjR7xqHfjIPM0nx8sp9/w
 BfW/NiL5tF5643aI2DQeomFx6isB+Ix5cyn9RhCYrf/dhgxDeWV2YuP6uz8GY0UdET/p
 rCAsnctx7PIFa35fmO3016MtHvB+qPqljz+/PoxyggpYp5XchTHiGYIHo2IEOb9TC68c
 vSUnQ4qbt9JqhbuPrkahR5CmmuvOq1WZxN4vwVgB/ixkNjlB6E2HPxSRD/zwkiaMjvy1
 v6/lh8SziN8DPcVD6pDRHDWtIuDR48n7DjApIoHyjI9GRb1XzkWjnuoNmd5aOrakZtHB
 wqhg==
X-Gm-Message-State: AO0yUKVL6L/2i3AJqqU2HqbwJVRxk1urH4ZuaiNIlFvY9h6izyzyJ0Yz
 YjWAeCFPwK4qEMgFpV6A4pzEGg==
X-Google-Smtp-Source: AK7set9X2BcsDzxIbprpfNjTTAcO9hJryMvJwKtWzzCf66p0Mp/DXsBtwQtmezHscEwJHg+PrgBJfg==
X-Received: by 2002:a05:6402:292e:b0:49e:65e4:ff1d with SMTP id
 ee46-20020a056402292e00b0049e65e4ff1dmr11273273edb.24.1675448496413; 
 Fri, 03 Feb 2023 10:21:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 02/27] drm/msm/dpu: move SSPP allocation to the RM
Date: Fri,  3 Feb 2023 20:21:07 +0200
Message-Id: <20230203182132.1307834-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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
index 396429e63756..53c644ca52ef 100644
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
2.39.1

