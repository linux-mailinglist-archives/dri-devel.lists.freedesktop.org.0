Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EAB7C68D2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332C410E472;
	Thu, 12 Oct 2023 09:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9805710E471
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:01:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32d885e97e2so709323f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697101295; x=1697706095; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GbTB2uPyXxZYT1sA9JVR+NoxhvrgHUoB1FiBsf5/CkA=;
 b=JfbGNGs7Ht4dTWk+c458XutVRoOSQsGtzHvL1RVJ4xoZxICxWjSw2Qlvenn9Wg1n5Z
 Rgk+Zk36trw9ZshInl03xurqYkgk1bFzPE8D+5gMoxj4ZxjWNyPXaUwwMIEJGgd3pQ0y
 /OwELTqMGvKFmmyylzmBVuR8NfgBknbUo2y+xS9yrwOScYukBE2H01QcMREBCe1TDe3L
 Ujh8VqTc9zfmtPpcQYIUookPbFB7ywD+EaCYd40mHYHtj+0PKyje9H1PrTxbF/TfuiXC
 ixFy9Hl5lzNBLCfY0Nxt31FNZkAqmeRj/AfF0T7F+EmKAGW3stXeWRphTPNjR9k7jBwD
 p6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697101295; x=1697706095;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbTB2uPyXxZYT1sA9JVR+NoxhvrgHUoB1FiBsf5/CkA=;
 b=wWjTZ0QYOKOMKReB8qhD8TsHSwGFZW08x+hib2TB3bslQ4JLKakY1q/KVTI2XuaR6O
 3EHU8dw2qp0eSKh5gE1unsmMGGt3tJLF3RjZu2MO+5rXgT9VT7HZVPp2ML/gT7XVHP3Z
 A3DB6JXd13IuLN3fM3jqcrOh7urDAfKoyea//7n0Ls0e8pvoRjvIqOivJ16GMoxbYmHV
 Qy0T/nikmsTlV80jJT46OG5iSbPyEDp5OLb5Ijizbe5+MC6HoL++ZgnE+ieNEIhVzAdb
 MM5xGeuLS6KOl4vsf25dDLuGCPKhmmRF3JKr5ApevW9nFYtMUXU5Bxa4V5pN2f+5YIuG
 l48w==
X-Gm-Message-State: AOJu0YyEHRhh+EitOWOkMZHGBYXnNa9mKQx3xO4uNKiIPEf8W39HIliK
 JF+ex5rKuiYLS7/zfzGBB/j5Ag==
X-Google-Smtp-Source: AGHT+IFAbiuzJ9bdNBOrih0fvUaz8W8y7ucjaGtcOTuiFHXY6bnFGTxSh1a8QhUQBRenTfGvpAHAiw==
X-Received: by 2002:a5d:474f:0:b0:31f:d5db:a13 with SMTP id
 o15-20020a5d474f000000b0031fd5db0a13mr21002063wrs.61.1697101294500; 
 Thu, 12 Oct 2023 02:01:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm17811176wru.35.2023.10.12.02.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:01:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 12 Oct 2023 11:01:27 +0200
Subject: [PATCH v3 1/5] drm/msm/dpu: create a dpu_hw_clk_force_ctrl()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-1-4bcad69812d3@linaro.org>
References: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
In-Reply-To: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3100;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=A/G3MVO3WfKh+AqmbjQ5ogAUwEdsxecl9VHw880vMMU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJ7Xq4Jw1pCAzFBCnmjWylDx9kPa3sj7k2Xk1Bj/4
 40NlNRiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSe16gAKCRB33NvayMhJ0doTEA
 CvD60gIMBV+0SdVwtSQDUJiY5c9It7mfxJ62Ff64/GmMyyE+ynlW8K9Wa5cyN6p81o6P08lNEEMUFN
 UUfoZ6Y70ZQRu68OdcNqa88ZEgIuDQuNIx6pqHVQsZYmVN/AvZmYO80v4DqYZGVW1k4K1VIGIqJzVu
 lUt1wcgQ70tVn47U4LBsmCAKDJGGDS/U5a7fcU3vNyG71S+oqVBIayw0ttRV1qzE8CPxs5rH5MLoBf
 HKhtGPp6gi/ywbzKHGxTJChYhTHTzqbb32aLNh7EKiO07rBBm7IltBgEcc9a8gBg9aGjtkrFbP33DK
 fedXC7EADx+Pp/2B+XZURtqirEY/dnqCCisyWlJyt1DjhjUVfCz+0iAz4hnucqbvEM73b6peJKEIXn
 eHzIIHaIfm0loIVX9j1ir+86JjqoRlQod3W5olAcPV88hEq2n2+iRwBARrVacxZ3kVIDr69yNwU0Jd
 C+4FE5j1/scFSTtxn8HB5S5rwa83kiYEX+TtXP0F7RlFC6KHgkw7XmfOqX2c475duJm4B6FUGLca0C
 1zW89o9p3A2I+BgfaDIFxSPJ9DWusA+RGu05qNEJedgfkQa0VPYWzHr3hE1DOmeQb0gQTzi9Vr89Zx
 ntOXJ7LAg98n4dT//LDE91DRsABo0YA6ylqp9J4b1SlmswWk4J2DjX9VPi8g==
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

