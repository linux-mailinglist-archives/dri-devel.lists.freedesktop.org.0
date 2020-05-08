Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E01CA67A
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3016EAAC;
	Fri,  8 May 2020 08:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E937C6E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 04:13:38 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 207so272847pgc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 21:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sGTXTVIeWZfMKGu2Tui/sSS6UaYWbPyLZVydf0J+7iw=;
 b=VrRdrzH7uKw/48TsVJC0k5uaudQ/8i4despiyT+mgT4Oe7Uw8VOpOj9Xe9kAwWSOrh
 FtHdoUcfmFSrMJMUPMSkVlbzZlsazu7YQ21sZyaU2m3P0V48G4dqdsiUOh2Q/rwbZXNy
 oqV1wlxFAiU8EQHraM/wta9w16G93woaX01sKbrtyrtgLftdjx/Zro/oT0KmPuTWsbfE
 LsmgyY+DZ9ULBA4C908KplqHUhCNMgRhNIYnh9D/GFBwWyo0nRqKQGw95vF8LczzNpsy
 OZII5c3ewtpx/1zWKnAbch5U03VOwcZd1k25XnYHOt1PqjJEBxdZ9kaLS8jj7SBzh/8m
 KTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sGTXTVIeWZfMKGu2Tui/sSS6UaYWbPyLZVydf0J+7iw=;
 b=BVIY51bus0pCUYZNxMuRod+c9lE3T+7gao9B0aNPZA2tgwwbqinFX9Uus+T7c+MEXs
 7U0Ws3gq6eWrdfwe63eSSplDnI9nDDjbr55hA1gghDBJCijyGchQkIjjfwrpYJzaBkUS
 VFV/4rYMw1qvGYTuS8fNEFau5W3dMsi6eILlUCRTKITh6H1gFjPaShJlDE+Ijciy+CUe
 JzomhXD51/2K9G4hvSFTwujwsl0GB1jvimQaI556J8iRh1zROgyZ1j5Nn+Z8TxEKuei/
 GK2Jhr9jgGmQ8ZfnkuS/xbZZwytNYYp4/QOS+ihmhVp/7S03eMSeYA4cgil0qdA7J8EF
 2uww==
X-Gm-Message-State: AGi0PuZn2Sth4aGM5rKlX3lLaVrDN4uGkOCSxxpK856fFWKrVFid1dNF
 10pKKhAMLm0ePFZ3OQvVaCM=
X-Google-Smtp-Source: APiQypKtSx7FFpg/lKRdr/OnMpMvj7PJ21YY/dFtMba1MMBSiMMuH8F3u50v0gIMSY0JufkuJgzOYQ==
X-Received: by 2002:a62:1994:: with SMTP id 142mr720891pfz.259.1588911218632; 
 Thu, 07 May 2020 21:13:38 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:38 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 4/5] clk: stm32: Fix stm32f429 ltdc driver loading hang in
 clk set rate. keep ltdc clk running after kernel startup
Date: Fri,  8 May 2020 12:13:13 +0800
Message-Id: <1588911194-12433-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
References: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

as store stm32f4_rcc_register_pll return to the wrong offset of clks,
so ltdc gate clk is null.
need change clks[PLL_VCO_SAI] to clks[PLL_SAI]

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
