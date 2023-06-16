Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0601732CF8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F067710E5D5;
	Fri, 16 Jun 2023 10:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F5E10E5CA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:04:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f60a27c4a2so596705e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686909864; x=1689501864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjOtinuEjbt24XJmOWkl6+48nccnCQLcSVT0xhiArGI=;
 b=pZxMHJmXXeIMbUAKfhn3cNfbnPH1yfYfiCpZdUS6+p828h/8TewHOoBYPvjNEY+oXs
 VLCWFBWWccGAwYMAJMC7pX8/ikgHBApbfHqZSaZXcFdEBuUoIvwJMxJGHjUjTkiiOUl7
 bf7XnZct7dg/Mlt9mPP89SGc4nhoEgiOZA/EuuJcP03Me61mBzksYfiBqXvXiaqdvR10
 XGYifrsMmc6l62+cJnkBSNI2Nl2RGWwLRoKMUbBMMR4mSsTmBuymRsBI9ZQnWw2EmmL/
 EB2+oLgz6iA0iBhCXbL6V+qiUv8+lKDTagu+hmMCRBbeIUwVcAbqJejTiYunuxI/AMuI
 QCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686909864; x=1689501864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjOtinuEjbt24XJmOWkl6+48nccnCQLcSVT0xhiArGI=;
 b=VZ26AoatvvDqUnjEIrM8WGy+2192YaW8+TeDs90vW1uC2zm7Pk8usBcOPH0vlQoBNk
 853jBGqzterX2RIbDSCjyfVY/lA4p8l8TejANl96cWlixdcrI8M6vjvwO/bUmWDHRkEi
 15VNCo1e6R1riY2IdsU0hhGipoow156WoBvIN0x4mndmxuTvkvXQXBSX7CQ49CNW592e
 n5UMh1rgQqgTvF+V61tGFuITSkt50jHVIKfMX4t9FoV01i3aSekVeCJnrrDg/bp5+nv+
 yYotUAWYmXmZk04FP15H5Wyb9hLhpD19TQr1VWCtO9kXsbJF4QlDAA3u+JjWPpk9fmVr
 aKEw==
X-Gm-Message-State: AC+VfDza3uCeYxw4iyyNSYxQM4sKEb/1CuiUuM7bsr3r6BYt3UFQ6kAb
 fKHcG46LgwQ23HDehDd0v01uum+Nrv4/0g9KdX0=
X-Google-Smtp-Source: ACHHUZ5QLxMZmMBkbqRpMdZOrjnNG+FlVguQpzZv55RCTtFqe5asqn00o8IGFVHrccW2i4NhQxaaJQ==
X-Received: by 2002:ac2:5b5d:0:b0:4f8:4aed:b48c with SMTP id
 i29-20020ac25b5d000000b004f84aedb48cmr894947lfp.46.1686909864361; 
 Fri, 16 Jun 2023 03:04:24 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
 by smtp.gmail.com with ESMTPSA id
 r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 03:04:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 16/19] drm/msm/dpu: inline WB_BLK macros
Date: Fri, 16 Jun 2023 13:03:14 +0300
Message-Id: <20230616100317.500687-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 14 ++++++++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 14 ++++++++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
 4 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 787af2b2f957..60e71cbc5e27 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -323,8 +323,18 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 };
 
 static const struct dpu_wb_cfg sm8250_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_perf_cfg sm8250_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d7d117e3af36..904c758a60df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -148,8 +148,18 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 };
 
 static const struct dpu_wb_cfg sc7180_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_perf_cfg sc7180_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b67010f336b..7b5c9a77b102 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -176,8 +176,18 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
-	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ea63ca358a4..d2bca1ec0e63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -493,24 +493,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 	.intr_tear_rd_ptr = _tear_rd_ptr, \
 	}
 
-/*************************************************************
- * Writeback blocks config
- *************************************************************/
-#define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
-		__xin_id, vbif_id, _reg, _max_linewidth, _wb_done_bit) \
-	{ \
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x2c8, \
-	.features = _features, \
-	.format_list = wb2_formats, \
-	.num_formats = ARRAY_SIZE(wb2_formats), \
-	.clk_ctrl = _clk_ctrl, \
-	.xin_id = __xin_id, \
-	.vbif_idx = vbif_id, \
-	.maxlinewidth = _max_linewidth, \
-	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
-	}
-
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
-- 
2.39.2

