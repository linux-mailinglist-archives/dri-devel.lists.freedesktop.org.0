Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01C11E07B4
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948289C69;
	Mon, 25 May 2020 07:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED7A89D64
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:41:34 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id x10so6988616plr.4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JHR9IFaRgCyJGWikuHqyC0B14pMQIGmyd5Kpq3MNpmQ=;
 b=b9x/beh8V8+Wi3TKqrBgqD2YLsbTxg11tUo1GMv4hQuU9CXkFipOzeKKw1ZhH558DJ
 r3oDIli3++aJuKFgOZhAMmIPgFHizDXljnjeuUsvEF9PQy3XdYGIYSNIkKY+vG+nZnUC
 S17nYhtoQLypMlGwlOfC4yczd2ZcZeMhwYt5FPiTVMn0/n7muwoxYy7K5NrlRNkjOZoA
 uYMMg1PRq7PQOTUKTlhGadlAru4Ngw2QUZcJmDsrxr/wcYKPqhI3yGp1of9jxHDiSs73
 YsOHksI+ec5abVm67ec+Wz5N7W8PH9R8LQQhLaETnupDLM+bilLEXZ1lUOV5xhLPeWvu
 MVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JHR9IFaRgCyJGWikuHqyC0B14pMQIGmyd5Kpq3MNpmQ=;
 b=YOq5Lyqv3iUosESmqjFcw1bIKYtQiuKVedL6GtNMKO3W8cZ7noTj1OXIjSy2gAVrBV
 eBPsw5SIIrOEK8GYruU/oYNOFlrM+z8pjJCGrlPd17Tks6gX+OT6gfltzaJ57CiVJS4N
 //6ewT8+Ny/ufIyEtAbkQKh2eq/LRS3PzWDxKfy+nzzwueT1M02Ee09Re75DwnHWg0Bx
 UHxzejLOH3ve9AQwecEWKk+3KfwRDukcmmfWfhik/4OJLmwGzj2lr7QckK54SAljCpSa
 xnUm1Q1wz690nuhGpT8B3Cq5dLrWcFhQQPwXt8OzYzL3F55XG5ySWP2pR8KYdrXSacL4
 e2tA==
X-Gm-Message-State: AOAM530YANE58bim/2mIK64yk/qZMtGaXlTDHlaUpz0h19OrGzUuxHjP
 isOJRAeWvxgu/8+PnYOicc8=
X-Google-Smtp-Source: ABdhPJwFd19cwDs3kghDA6cyFKAQQDyzxswSNn1g5n0asibuokVH+325D0MWIcoam+IOMZD80TfYMg==
X-Received: by 2002:a17:902:bc82:: with SMTP id
 bb2mr5540650plb.107.1590378094241; 
 Sun, 24 May 2020 20:41:34 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id 7sm11981695pfc.203.2020.05.24.20.41.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:41:33 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org
Subject: [PATCH v5 5/8] clk: stm32: Fix stm32f429's ltdc driver hang in set
 clock rate,
 fix duplicated ltdc clock register to 'clk_core' case ltdc's clock turn off by
 clk_disable_unused()
Date: Mon, 25 May 2020 11:40:59 +0800
Message-Id: <1590378062-7965-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

ltdc set clock rate crashed
   'post_div_data[]''s pll_num is PLL_I2S, PLL_SAI (number is 1,2). but,
    as pll_num is offset of 'clks[]' input to clk_register_pll_div(), which
    is FCLK, CLK_LSI, defined in 'include/dt-bindings/clock/stm32fx-clock.h'
    so, this is a null object at the register time.
    then, in ltdc's clock is_enabled(), enable(), will call to_clk_gate().
    will return a null object, cause kernel crashed.
    need change pll_num to PLL_VCO_I2S, PLL_VCO_SAI for 'post_div_data[]'

 duplicated ltdc clock
   'stm32f429_gates[]' has a member 'ltdc' register to 'clk_core', but no
    upper driver use it, ltdc driver use the lcd-tft defined in
   'stm32f429_aux_clk[]'. after system startup, as stm32f429_gates[]'s ltdc
    enable_count is zero, so turn off by clk_disable_unused()

Changes since V3:
1 drop last wrong changes about 'CLK_IGNORE_UNUSED' patch
2 fix PLL_SAI mismatch with PLL_VCO_SAI

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/clk/clk-stm32f4.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce..fa62e99 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
@@ -557,13 +556,13 @@ static const struct clk_div_table post_divr_table[] = {
 
 #define MAX_POST_DIV 3
 static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
-	{ CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
+	{ CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
 
-	{ CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
+	{ CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
 
-	{ NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
+	{ NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
 		STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
 };
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
