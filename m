Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8176F8D58
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 03:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C66A10E186;
	Sat,  6 May 2023 01:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8760710E15E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 01:09:46 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-76372a83c8eso56578539f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 18:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683335385; x=1685927385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhmHVm3biAYbsxZZFqn6S1mZ25+9+Btd76fwE2r61yM=;
 b=IesZ3n1AOwj1IfCp5kLr6vAC8shx70AS1fWg5oLyOe5/OmMjTCAwAWHMgh+PvYQWxg
 58epP43jgMS9aVJ4Eo+WXD95Q1RkZq0GJIfhu1bRn9isUcdx06O30kCizd/YCF3g8WEs
 8WzBo8bFJkwB2KNrc6MKp1MPTKjB6VyG5k4BCuM/PjVU5uCIezyqrs8irTiIdzPA4ND2
 dy32Hk2vLcO/ydnayQ4ZZWjHvNcfGQd8fD8ZWbkx4qVn/a4Xf3GXxyTMKlFDApE137Cq
 oonJJxXzrT6iaGJ/0vLxIg8TMgk2f6SHf2oaXnTnWQmObeOopq+8TLsRQbdTHFeAyWUe
 DFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683335385; x=1685927385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhmHVm3biAYbsxZZFqn6S1mZ25+9+Btd76fwE2r61yM=;
 b=dzm3WA2k5w5jjPXiHZdYPueukFYWoB/c96/196QcRBvMTVEXvrFF/bwlyvfMwC1od3
 YfYi9t1tORMFK56BFhYuYgb2KEKrRxxvXJadcoU4CGupjcsIGBPLRBUK082AObNc3xme
 hvqm/V0HGD6xwlVYVysQUyamz+EV8hTECUIIauvuCojgTNYxVe5jmiukSYQp1mI21KVM
 0rC1szb0I+hdsb6cmahPd9bvVUogNWwz3rDWkqKKZnLSguXvlW1XAN7FYLdv8+ahGgz+
 nrES/NCEsa1VyyKCwdxz6ErBWzKj+tmvqT6UXyX6m6ARVwdu3hoQg67yxMb7+g75E17r
 N4qw==
X-Gm-Message-State: AC+VfDzMz0MrrqJor3q3lYfMZMjoZCC9ZaB/8hacc9Fw/RNc+VoIMAze
 5CauAlc3ahItjFteDkBfZkLB0k6akC82Jw==
X-Google-Smtp-Source: ACHHUZ7lWuVj8GHQ8o+3UxtHCzHhHIvIDw7MAzhnAt0I821jAT+753AKCkMU3Y+GVfLNFl/yFunVXA==
X-Received: by 2002:a6b:4010:0:b0:760:eeac:e1dd with SMTP id
 k16-20020a6b4010000000b00760eeace1ddmr1693109ioa.18.1683335384972; 
 Fri, 05 May 2023 18:09:44 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:34a2:3894:45cc:c002])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5e950b000000b00760ed929d0bsm335735ioj.2.2023.05.05.18.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 18:09:44 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Date: Fri,  5 May 2023 20:09:29 -0500
Message-Id: <20230506010933.170939-3-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506010933.170939-1-aford173@gmail.com>
References: <20230506010933.170939-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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

