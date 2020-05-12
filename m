Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF9F1CEDCF
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECF76E877;
	Tue, 12 May 2020 07:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838B6E041
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:04:06 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id q24so8952385pjd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cPYlxJhfKmWtbP4a2dRiIg5n9Tzb/bTlK0+j+KORUjo=;
 b=fJSL2ofei13tcbkZZb/Pr2NnHzs1Y2rSHpEwbHjNlqAa7o8IvZixYeWVN0GwMPsg3e
 NxAQzgeAo4o4vpJAckHUOcH80IP1TYeqpPIGlXUVpc42ex8nU7V6rEYV9TBblsrf8BEC
 HUIAaYhUqYBYn9phOtOrgDq3qusl55w6vxMQXl5OXAtVE1omAufTXfeTU4xVweno/ouS
 68tFoeeXP1DdaqcSkvQo++6sfqHAGqbOkBYkn+s2pyoxmE1/GUPGaOX333CbZjrumHIZ
 +/nrG+kam+ITLvosujZ2z0x8Ewa1/gON6f49XZfUVM0/KPLnCoXNaubyBmYyyCX5Zkp0
 /6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cPYlxJhfKmWtbP4a2dRiIg5n9Tzb/bTlK0+j+KORUjo=;
 b=hNCo/UHi0tBY/nI2oExGRknp/7UIHjVn8JkKiAY+rbxih5niydfEsKrjKWqTmkcGYx
 HMN4vIzuTY2YDtt33lrmBamLdemlYUcubH7ebKx56LooOiuQqXpvlsZQl3jS8oY/woae
 cUlyHaEqa2cFvzgUL3MJgo2zBFy9Zg1t7jDERANcfyDTK/XHU7gefjK3CMZABYNBtqnU
 OQ9Ef8CrnaxV1mlh3AYOnqlUg2A92E0deTwyAH4ieuef3/F+wQlalYJhpc/PfY3gJx7o
 2EpvomhaNWs/9st8Gxxp7PZpbrWJEAptoNYOtJn3LOC4TAdUBBQjJDPxZLx36mQ2pV34
 7Xjg==
X-Gm-Message-State: AGi0PuZqNVmsMzhn2abFidxzz6sPZSlWCkhPKoNriuVbF0fyQ8EMpv+6
 GZEdCbDuW5nJYk7EirW/u+A=
X-Google-Smtp-Source: APiQypKswW2iqMgYeLIiYULPyqI7RQPh0iMAPiCh2qROGM6rAR0Y5+8mNaNz5BngqvD9sBNfVV306w==
X-Received: by 2002:a17:902:8bc5:: with SMTP id
 r5mr18978437plo.218.1589267046097; 
 Tue, 12 May 2020 00:04:06 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.04.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:04:05 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 4/5] clk: stm32: Fix stm32f429 ltdc driver loading hang in
 clk set rate. keep ltdc clk running after kernel startup
Date: Tue, 12 May 2020 15:03:36 +0800
Message-Id: <1589267017-17294-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

as store stm32f4_rcc_register_pll return to the wrong offset of clks,
so ltdc gate clk is null. need change clks[PLL_VCO_SAI] to clks[PLL_SAI]

add CLK_IGNORE_UNUSED for ltdc to make sure clk not be freed by
clk_disable_unused

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/clk/clk-stm32f4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce..0ba73de 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,7 +129,8 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
 	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
-	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
+	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div",
+		CLK_IGNORE_UNUSED },
 };
 
 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
@@ -1757,7 +1758,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
 			&data->pll_data[1], &stm32f4_clk_lock);
 
-	clks[PLL_VCO_SAI] = stm32f4_rcc_register_pll("vco_in",
+	clks[PLL_SAI] = stm32f4_rcc_register_pll("vco_in",
 			&data->pll_data[2], &stm32f4_clk_lock);
 
 	for (n = 0; n < MAX_POST_DIV; n++) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
