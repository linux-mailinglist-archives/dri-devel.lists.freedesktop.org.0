Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255271E07DA
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4089EFF;
	Mon, 25 May 2020 07:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D95D89D53
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:46:09 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id z15so3563087pjb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JHR9IFaRgCyJGWikuHqyC0B14pMQIGmyd5Kpq3MNpmQ=;
 b=iz2EkdIG3/RqK9gUgyu2o4iN9HPdnIvCoCCpRwW1qd5e35SloeuFv6L7XUj7ZqqeJ6
 LbwKTi9GRKHJAmDxNPDCYbEVK+Cv7kWHyh8u5lMY0tI51s9VfTd18qBXSS92X6tsnmRL
 Ppxpi6MgO7teWvlPFFCP63GE0Q/Dczn6Nx+7aLgPTZbMf0kIDhuBySchsNpEPFczpMh2
 sKLt8SAA+J4iPs0wJvkisXGwQsHT9bjt3lVkkwiM1j9yd1hodeT/KTmC1AUXCwWM8xNQ
 XOL1owO12FeMDYfvUdazAEO3Ui07kMiVFywcUOFm2ywnReuW/5bz/8VWNVqY9FJRI/lM
 3nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JHR9IFaRgCyJGWikuHqyC0B14pMQIGmyd5Kpq3MNpmQ=;
 b=tJR/s9P6sbj0dG1DVK9SGF6r4Bj5wx/zU5yGUdDNkPx/mJcekR9BNYlqr1XIyJIhlb
 4peiDm8NpidPjMqAXS/MgrVXODH6mtHAeq47duqUf+km6+ph/JT5f0m7A3MREAAhxijH
 Ymoy0AWyxHGc+iH55gvEsS94ANCKqYS0fx2xFMEWZD/NVAsunpCjjlcY4rsGlZJ+hRUM
 2uMlQQSc+xPsXbleTyb4wlGbcVC3zfGQd775dyPYWYjVXjMlG+QLx6RrUIiZtAlBWI5B
 vypyg335/vgYfTKV92V8qHFj8Nosbjh7PaXEGFJypwSZsGgS+6U9b8/vDBJIECcpSlcv
 H1pA==
X-Gm-Message-State: AOAM530O2biqnoqCWWXd9haqsZROgT7gfHXLMHh/gTWiJtMJ9PqksbGQ
 fGverM73ecWAEI7e3I7CFJM=
X-Google-Smtp-Source: ABdhPJzJrYHR/plluRNQNEeUqmbEYzI4Fk9f2Ze1yZ1DdZkWDcFo8tEe3yRHg3Z/d/BuOqTZ+HFmaA==
X-Received: by 2002:a17:90a:c385:: with SMTP id
 h5mr18680382pjt.147.1590378369159; 
 Sun, 24 May 2020 20:46:09 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id i98sm12152831pje.37.2020.05.24.20.46.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:46:08 -0700 (PDT)
From: dillon.minfei@gmail.com
To: linus.walleij@linaro.org,
	broonie@kernel.org
Subject: [PATCH v5 5/8] clk: stm32: Fix stm32f429's ltdc driver hang in set
 clock rate,
 fix duplicated ltdc clock register to 'clk_core' case ltdc's clock turn off by
 clk_disable_unused()
Date: Mon, 25 May 2020 11:45:45 +0800
Message-Id: <1590378348-8115-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
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
