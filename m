Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB6A3807ED
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 13:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7358E6EE4B;
	Fri, 14 May 2021 11:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816976EE4B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 11:02:51 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id n3so3865683plf.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 04:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OOicQDUMq21UM0Ud7C95oVsNtJIeM7ZkfF7dwnsXfEg=;
 b=nQlQZxXGeUQ4gP81dPpiXkTEbHY/alLIvR5F6WhN+zlLpm6mPmYEsPD7dMTThV4qOy
 Lu3K3rLeKTHEacia78TX/Hdt2rBlb4lOQqAsQ4b+wijc3Ww/kT7uizjRXhS+P3q48+Cp
 dtLuqZEn2UJf5xt9LDMXNbeKj4hGfwbdnRWffqbp8Ronq3HXVKlM5rEOh4xRnVKzG/zN
 /6W2u1Iv8g3qfhH4mzed9kdG1ndtMCoaW3jTxXhHxv+Jlhmuw0dhqZE/u4zaQVk9kOHT
 1t6MtfHHeQ7ruu8j3Q3J+ITWWWkwWDS+Fn3itNosCln8R5qCcZ7J9HHiSs1Y0XgijcV+
 dRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOicQDUMq21UM0Ud7C95oVsNtJIeM7ZkfF7dwnsXfEg=;
 b=SuR+obkSXOrR9JBSfbU5TJiHse3h5U7RFjwI0PVMpNfsRNSf+5MmneD2UdNn5aSszy
 1DqY7D/2Lc9gUvOhy+ReiUHE8N7/54z6pQJIRKsLIHkDTb4pceMv5m/gQNafTl5NApsM
 t6WN+UMwMmyShQb7+r9lM600KvH3JYX6kx38UBImC+0aCc2BgqJqYQ+FsvokZ1J9H2FI
 jSToFmx0HPwvljr9ukn3qlPMshV81eGHvAUlcng80PnVkFBasA/HJ3zwtEANlaWfrbw/
 kV4A0cbDB0tTtpypxE8AXSpn8idjG6xIczeQpFWVLh81PXLI24QkdXe6n2o+Weizqb/U
 nLpA==
X-Gm-Message-State: AOAM530IE+X56c/rh2pszgm3vJPIT1zSTMHvI1JtH9043jTxD/NrpnkR
 /QhaX+De+Ytp391gy/I5dHE=
X-Google-Smtp-Source: ABdhPJx0Ynnvv8lCfWgGxjHnaXYOCPih7/zTgEt/rhl7yOCbB0MgfG7zmIHpo+UWX7GF7sX1k5pYfA==
X-Received: by 2002:a17:90a:4092:: with SMTP id
 l18mr10534045pjg.35.1620990170835; 
 Fri, 14 May 2021 04:02:50 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 202sm4193402pgg.59.2021.05.14.04.02.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 May 2021 04:02:50 -0700 (PDT)
From: dillon.minfei@gmail.com
To: patrice.chotard@foss.st.com, pierre-yves.mordret@foss.st.com,
 alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, mturquette@baylibre.com
Subject: [PATCH 3/4] clk: stm32: Fix stm32f429's ltdc driver hang in set clock
 rate
Date: Fri, 14 May 2021 19:02:31 +0800
Message-Id: <1620990152-19255-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dillon Min <dillon.minfei@gmail.com>

This is due to misuse ‘PLL_VCO_SAI' and'PLL_SAI' in clk-stm32f4.c
'PLL_SAI' is 2, 'PLL_VCO_SAI' is 7(defined in
include/dt-bindings/clock/stm32fx-clock.h).

'post_div' point to 'post_div_data[]', 'post_div->pll_num'
is PLL_I2S or PLL_SAI.

'clks[PLL_VCO_SAI]' has valid 'struct clk_hw* ' return
from stm32f4_rcc_register_pll() but, at line 1777 of
driver/clk/clk-stm32f4.c, use the 'clks[post_div->pll_num]',
equal to 'clks[PLL_SAI]', this is invalid array member at that time.

Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-6-git-send-email-dillon.minfei@gmail.com/
---
 drivers/clk/clk-stm32f4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 18117ce5ff85..42ca2dd86aea 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -557,13 +557,13 @@ static const struct clk_div_table post_divr_table[] = {
 
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

