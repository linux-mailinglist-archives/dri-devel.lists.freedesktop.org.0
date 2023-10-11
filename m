Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0197C52BE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 13:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D30810E748;
	Wed, 11 Oct 2023 11:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B5F10E105
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 11:59:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40651a726acso62476525e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697025574; x=1697630374; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GbTB2uPyXxZYT1sA9JVR+NoxhvrgHUoB1FiBsf5/CkA=;
 b=XhWDSvTEAKRd6dV9zUQ0piLmKgXuPWifwyfgJLc38n7e7PI+FnFB+I9Z/5vEEpcukC
 p7y3b9xZqmKMohVVB8OTs0gDvimj9kkisnCdZM7rhm5u7fMhHLEBoqoEaqoEYliCNWTJ
 If+JPmRSUotqpDC+gRA5XSNbEI4FFwd7QaCqUz7AEjDi5qqmshPY+vQ47FZe0CVcByCH
 1PKwJtfke+fCvGZvPtxg/KVsmGGMp+dN+Gdf8oE9ORdJutGEJM7o1Vu6bILXNpLov1NF
 iCiL2aouyPF8QVjItb3ii5yOvo4OaCExMrn0amBPn+yLQE880d8iTCH4U8ROJZd3Uz8Y
 9x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697025574; x=1697630374;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbTB2uPyXxZYT1sA9JVR+NoxhvrgHUoB1FiBsf5/CkA=;
 b=JIWMDxgmSQzMi4ZoIUIeT67Q1dlzSkIHlfRjp/6lu4U5TgFVCv23cSgrOjV1XrLbcs
 AVEh41kAVYJoPyesxSRfiYQQmgiUUkxrb2cR5gHwJI3BzC8XSaetP34Z3hU2u/ImxvAd
 bxtaZXGAmzlDj23/o/tGD/sXnQuPcH7wviabGg7+Uxg9qsajkH19fD8ISzqgiEbpk5Le
 tHUPyh1msHuPzIVYuDotM6c653/SBHBPvEm4IqW+y+VBtL/Bf1h0mQOg4gdYxNjrfAwW
 S4bywvdkt3DPsLjCcx0Q5b+jx8/YYY92XMhs5eciySPZGvWyAGhRaXB2fE5mFq1UirAs
 8zkw==
X-Gm-Message-State: AOJu0YzFgu4J9JqQqgaSfeKjae6Nzuh5pDs0pMo6ImYK3snSvQvaG2li
 cwZQjd3PujJZBzRjrhwLbRreww==
X-Google-Smtp-Source: AGHT+IHfw7jkKb6D4VJ2Ce7gX/reoTq0ux9u2+ViRAcdsj0DT1llO5Qx+W6FDyN0ZODBgJvcD3vEQg==
X-Received: by 2002:adf:f1c6:0:b0:324:1521:3a6e with SMTP id
 z6-20020adff1c6000000b0032415213a6emr18092008wro.24.1697025573692; 
 Wed, 11 Oct 2023 04:59:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b00323293bd023sm15447805wro.6.2023.10.11.04.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 04:59:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Oct 2023 13:59:21 +0200
Subject: [PATCH v2 1/5] drm/msm/dpu: create a dpu_hw_clk_force_ctrl()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-1-b219c945df53@linaro.org>
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3100;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=A/G3MVO3WfKh+AqmbjQ5ogAUwEdsxecl9VHw880vMMU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJo4hP9v16iv5MviNHP9TcD7Agb3W8eAPlpNIlMod
 o0b1dQ2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSaOIQAKCRB33NvayMhJ0bInD/
 9Ly1iAVJsLt2ZkqG5V1mRJXRvDzonNt7DX48LRCklfUv+oPTCQS6bmla3/BtEVaUoNAiRegsrwyyrP
 2PCCZbsDSlh9nhbi/mvFYGQsi8w7UVD8LBHFmMkoltHeNSxOwYRHxZ+0xYXEvugvXNTuJGy0bnefuQ
 EP1DPaSSJVhGyMOZx7ObinDoYv3OOJCN+0gJVS3xjlXOH3+GhYmSn4OBQ9OtM/MErLhMOD1yBOLsv4
 rol+TzfIxvaCZ5whloEcB5vB/pcz617DsqSGYg2E9b3KOtvC2r38ekUxKP1Dm9T21oN7wEWQGFmDeT
 f3xhQrmehAAqmHtHwy1oXZWW2vM0EvPH0JYyPX379ae0clAVHnRk6tOfzzXw70uNWpcaE9qo7w3TCm
 h91vLSE6mJ7Ti8x53gbhIoSNLCKcffX7fmNsDmc45ipcj4+PYh7YtxdgfdYCM5s9ZUbSE5voLAU8u/
 tVXFjdnbQRb+0gvjH7ocm8H9xymrbyuYOzix81zYre52d345B1UIF0TgtJYNAczfvI3Ljhpa0zvwEd
 BKCD6XpxZVTUP8DOWrf/fWmbcYN4N7VU0gJr65HyKBKTswvWsC4gJvo2DDTHPFkNzDSEZfB2kod9PI
 DFY83Z651z48F154XzjKXfdaHfc5vA3jLrzmFZzw/IeFJTOni1oR691fhDag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an helper to setup the force clock control as it will
be used in multiple HW files.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  | 23 +----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  4 ++++
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cff48763ce25..24e734768a72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -66,34 +66,13 @@ static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 static bool dpu_hw_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
 		enum dpu_clk_ctrl_type clk_ctrl, bool enable)
 {
-	struct dpu_hw_blk_reg_map *c;
-	u32 reg_off, bit_off;
-	u32 reg_val, new_val;
-	bool clk_forced_on;
-
 	if (!mdp)
 		return false;
 
-	c = &mdp->hw;
-
 	if (clk_ctrl <= DPU_CLK_CTRL_NONE || clk_ctrl >= DPU_CLK_CTRL_MAX)
 		return false;
 
-	reg_off = mdp->caps->clk_ctrls[clk_ctrl].reg_off;
-	bit_off = mdp->caps->clk_ctrls[clk_ctrl].bit_off;
-
-	reg_val = DPU_REG_READ(c, reg_off);
-
-	if (enable)
-		new_val = reg_val | BIT(bit_off);
-	else
-		new_val = reg_val & ~BIT(bit_off);
-
-	DPU_REG_WRITE(c, reg_off, new_val);
-
-	clk_forced_on = !(reg_val & BIT(bit_off));
-
-	return clk_forced_on;
+	return dpu_hw_clk_force_ctrl(&mdp->hw, &mdp->caps->clk_ctrls[clk_ctrl], enable);
 }
 
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 9d2273fd2fed..18b16b2d2bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -546,3 +546,24 @@ void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
 
 	DPU_REG_WRITE(c, offset, cdp_cntl);
 }
+
+bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
+			   const struct dpu_clk_ctrl_reg *clk_ctrl_reg,
+			   bool enable)
+{
+	u32 reg_val, new_val;
+	bool clk_forced_on;
+
+	reg_val = DPU_REG_READ(c, clk_ctrl_reg->reg_off);
+
+	if (enable)
+		new_val = reg_val | BIT(clk_ctrl_reg->bit_off);
+	else
+		new_val = reg_val & ~BIT(clk_ctrl_reg->bit_off);
+
+	DPU_REG_WRITE(c, clk_ctrl_reg->reg_off, new_val);
+
+	clk_forced_on = !(reg_val & BIT(clk_ctrl_reg->bit_off));
+
+	return clk_forced_on;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 1f6079f47071..4bea139081bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -367,4 +367,8 @@ int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_signature_offset,
 		u32 *misr_value);
 
+bool dpu_hw_clk_force_ctrl(struct dpu_hw_blk_reg_map *c,
+			   const struct dpu_clk_ctrl_reg *clk_ctrl_reg,
+			   bool enable);
+
 #endif /* _DPU_HW_UTIL_H */

-- 
2.34.1

