Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D63C677519
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 07:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A2810E30B;
	Mon, 23 Jan 2023 06:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF25A10E30B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 06:24:18 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j17so16694371lfr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 22:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zmjULO6Lx2bWV6pkSSEDxjddNWaKTXCc+6Tq6pikP+U=;
 b=YutDh5WeB6NfXcZ3hcWQgq2dByaVsZ7vVHG+GdUSj3u28nImaDR7qbiJyk5Uz9myWT
 AIAAkzE3HWrAx3EgDduZmPtOQMJgRct5gkB/UX9zhCIuavgp3HidywhNEU9GLpWEl2Ea
 FgdbO8mCFOkVx42WPWp3YREJrW8pyKtqITeTn6UdxK1mt0ZNxSDJTWUoykyY7UebDsSw
 h2+CgCOfL5GRLoYzNl3MqeJTDfrqc8X8z5ne0a1/+9DKUoizMeggOZdmdMf2Q3AsyxQH
 u4jzVWmdGlaq1BpbJs4WkAivQ+wOl0QCymxOEdN3dZ3CzheMHNYgOsUHLx0Wg9U+H4w3
 ik6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmjULO6Lx2bWV6pkSSEDxjddNWaKTXCc+6Tq6pikP+U=;
 b=oyItKo6AKjL6PMeoqVy3YdmAJIwNBAa9HKYxM6uca+O3upt6pT88weDufZJuYFcmFy
 uZyrssVM4cHhawc6G9xowPULX6uap+APj/si8ZIghsA4IJdjm2tgWwsrWlW8k8wz9d9n
 KX2/kPM8Rt+plrNY7Fc16SJiwpBH35ptz5VE5H3MJiL4mXsFrqcxz6ggm4okaAoIn5rN
 fupUckgAe/2e/vavLoMRGjPugDVCFXMdDa45y/e9DR3smtfhf7/xmIJbh3jiN+6mTslZ
 8lO7XoSyGuOWOJeNvC9uclNaxHm+EeWMUz0Ksjzr0+zy0iIA4wrfOyGnIWjQrB4bc8Zf
 gMzA==
X-Gm-Message-State: AFqh2kqkF3giYsG/csu+wZ3mNK5gqJX3z8hRQVw/5bDeB7Ccx6Lkb8Xf
 bEkJqJuW7TwDtT3f+ZnwOs1k6w==
X-Google-Smtp-Source: AMrXdXsuF1OLKO3i/Z0WsolPfPCIAUQJ/ZfsfaSUltkM+91LW8idP/MFE+s9DJZ6rvMmKcmp+StWHA==
X-Received: by 2002:a05:6512:2305:b0:4b5:b87a:3264 with SMTP id
 o5-20020a056512230500b004b5b87a3264mr7370328lfu.56.1674455057129; 
 Sun, 22 Jan 2023 22:24:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056512118700b004cc885ea933sm4807775lfr.192.2023.01.22.22.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 22:24:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm/dpu: add missing ubwc_swizzle setting to catalog
Date: Mon, 23 Jan 2023 08:24:15 +0200
Message-Id: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Use the values from the vendor DTs to set ubwc_swizzle in the catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Added data for sc7280 and sm8550

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e45799e9fe49..b16e550fc4b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -580,6 +580,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x7,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -593,6 +594,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -649,6 +651,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -675,6 +678,7 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x2014,
 	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -711,6 +715,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x4330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-- 
2.39.0

