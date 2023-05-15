Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFCE704188
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 01:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E9510E2BC;
	Mon, 15 May 2023 23:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A7D10E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 23:57:30 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-332cc0efe88so87750065ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684195049; x=1686787049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhmHVm3biAYbsxZZFqn6S1mZ25+9+Btd76fwE2r61yM=;
 b=jPFoih2JerTXMPTvzSfu70Qlo1kT35sMk9aeKJmYOIXqS8Uv4sjwsLw26Au/WwdM70
 oxFKDJU2QY5iIosliXX3Z2H1Ln5Pj4rLx0ISa0i9FE/S8IrEA7sVz+B4fw4KqdTPDLRg
 t8uVn3dHwT01yJ9tIjYeWeMbQEdHsYaEJPB7UIE5NoQ+PuKnESv7P7PjyLS69FHtKP55
 OIRwJed9MULFFElE4bW6SNMVbDLX8UQdon+5b/TLF2nOzU4oYN1h8jxE0noY9vrh8AC1
 ECwrJj4j65zr7MXmQnzv4NlaM3r7ECu61UuHgcV+85Bd4xdMZW8qqpneBtwi91P4UxD+
 R5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684195049; x=1686787049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhmHVm3biAYbsxZZFqn6S1mZ25+9+Btd76fwE2r61yM=;
 b=CzNOiD+LSDVLLfYEffJa/iU+xPk4oslMpRXKTPXdk3MnIAQ8DCB5IQOhy49LeNigr3
 ih14CgnoXikEXGaMQlm1nUwQeDyqnAAWZZYL+M4BsMkyFdlxhwG6pZ1MLwd3vKZIhYpi
 qTTXczWWv8Bvjs252R6YJwSeJLPvevzldADL+hM65gg+e1JBTBqpi0LEn/7My1Oo/wpP
 X2P7gSW0YwFHHDMxJTg+abftnW2bgHlUSlYL74IB6Q0EDVRdQg9BEHTqZDFf4tMUH39j
 UK0oC1LTTJ1H7w53OAU06UAkQs07zsyH6dtFZZHa2zrud79I61Vm5obZo6oGhHpGTsdC
 uOaQ==
X-Gm-Message-State: AC+VfDxrWUGWkfarUagfgnjlKq1wuhcinE/iGPuoYJokxEGy0SoK/KR7
 oMQt1RFqH1JAR0VT/DblnPZ7qRi9Xis=
X-Google-Smtp-Source: ACHHUZ40FhhFFnZOCOFF/BcvjFoJhXNoFnG7UHB06L42VB+ehdL2H7dF0A/DZ2jPNO0oO/eHDTptjg==
X-Received: by 2002:a05:6e02:546:b0:335:542b:aa48 with SMTP id
 i6-20020a056e02054600b00335542baa48mr20490228ils.19.1684195048768; 
 Mon, 15 May 2023 16:57:28 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:61e0:9fee:1bca:ea3c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056638112600b00411b5ea8576sm7427851jar.108.2023.05.15.16.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 16:57:28 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Date: Mon, 15 May 2023 18:57:09 -0500
Message-Id: <20230515235713.232939-3-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515235713.232939-1-aford173@gmail.com>
References: <20230515235713.232939-1-aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to Table 13-45 of the i.MX8M Mini Reference Manual, the min
and max values for M and the frequency range for the VCO_out
calculator were incorrect.  This information was contradicted in other
parts of the mini, nano and plus manuals.  After reaching out to my
NXP Rep, when confronting him about discrepencies in the Nano manual,
he responded with:
 "Yes it is definitely wrong, the one that is part
  of the NOTE in MIPI_DPHY_M_PLLPMS register table against PMS_P,
  PMS_M and PMS_S is not correct. I will report this to Doc team,
  the one customer should be take into account is the Table 13-40
  DPHY PLL Parameters and the Note above."

These updated values also match what is used in the NXP downstream
kernel.

To fix this, make new variables to hold the min and max values of m
and the minimum value of VCO_out, and update the PMS calculator to
use these new variables instead of using hard-coded values to keep
the backwards compatibility with other parts using this driver.

Fixes: 4d562c70c4dc ("drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support")
Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  3 +++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2be3b58624c3..bf4b33d2de76 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -405,6 +405,9 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -418,6 +421,9 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -429,6 +435,9 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -441,6 +450,9 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -453,6 +465,9 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
@@ -469,6 +484,9 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 */
 	.pll_p_offset = 14,
 	.reg_values = imx8mm_dsim_reg_values,
+	.m_min = 64,
+	.m_max = 1023,
+	.min_freq = 1050,
 };
 
 static const struct samsung_dsim_driver_data *
@@ -547,12 +565,12 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
 			tmp = (u64)fout * (_p << _s);
 			do_div(tmp, fin);
 			_m = tmp;
-			if (_m < 41 || _m > 125)
+			if (_m < driver_data->m_min || _m > driver_data->m_max)
 				continue;
 
 			tmp = (u64)_m * fin;
 			do_div(tmp, _p);
-			if (tmp < 500 * MHZ ||
+			if (tmp < driver_data->min_freq  * MHZ ||
 			    tmp > driver_data->max_freq * MHZ)
 				continue;
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index ba5484de2b30..a1a5b2b89a7a 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -54,11 +54,14 @@ struct samsung_dsim_driver_data {
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
 	unsigned int num_clks;
+	unsigned int min_freq;
 	unsigned int max_freq;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
+	u16 m_min;
+	u16 m_max;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.39.2

