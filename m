Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA0B6F3BAB
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC10610E2C5;
	Tue,  2 May 2023 01:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9054D10E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 01:08:12 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7665e607d1bso58250439f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 18:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682989691; x=1685581691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTXYxsRf77C4yLC2TKlqpFtoqraoDJZ2y+9E11ns+dE=;
 b=cFhQRnU8n0BA92q9rOduE3LmlIvUj6IxLohDQN/6oLV+i6eMngwWWgJhESb5BmSCK6
 4kYKlZOhCWfDxDHikb9H4ZCRP9bETlG8vXBFgumusBgO5xqlclzWxRG/U880g0ViS5Rf
 QppSwynxGVndxjuWsmj9JMvvcMSkVRilhqeeGa+aSvNk+3pUhTRyDLvlbelNgbc4IB8l
 YKuAkt80SnWr368EwfNdaesL8GaQ2wDZLS9oNF2FZHS/zCdDUG4PKmQK1NfV63XmMfrZ
 mupkewzJQ+q6V3olGdVvte/m9weUe6IaayF6TmCxss2HUXUuYPVFoQWyni8NGgb19WFv
 iLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682989691; x=1685581691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTXYxsRf77C4yLC2TKlqpFtoqraoDJZ2y+9E11ns+dE=;
 b=a+YSauJWnB5DRueEDRGMbMf4QzC+iLdcxKBO7/8gRJav5Wu9pZU9kGqGDsMhcAeo+H
 DyvcXYyVTVks6lILMwcXgnLuhWROoj1NpPjRnsHlPT+T9KdzzXu8c24vHlcpChAgYYQT
 /0dcnuh6Ckyq2N5o9/D03xfV5EPZvEOll4dmBuN2Af7xr4Id3ki1CJkrYi0c1sLOfYv0
 TF3Wz/5/X/9uSnqtrkYz9DABb/sSDUPgibVwtFy5GzR1kzVIwiXsRyPnXPwajdpJEmZI
 JiNOFrFEO8zbZhAinJhPb9rRLn3hPeTYK6rqXk0fWWxHhk/D2plBaqlAYO5J8An7vFyg
 3kxQ==
X-Gm-Message-State: AC+VfDwEUBBhBzbbN+qEfHzxeMkdw5w+POQFPbsN+Sr90/cJZftsrqZb
 FGHPI3+//MEput0qIMouLCehZPVIgdJngg==
X-Google-Smtp-Source: ACHHUZ6SXojuAzq55kL/xNbJbCc9KkkXp9f0Q7WIAAd4EOTjhg+7ZSueOUYUQ1yXoBPnE/gGeTrKxg==
X-Received: by 2002:a6b:3c07:0:b0:762:920c:4c91 with SMTP id
 k7-20020a6b3c07000000b00762920c4c91mr10015904iob.14.1682989690878; 
 Mon, 01 May 2023 18:08:10 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:8257:a536:d7fc:1919])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056638329000b0040fb5d5429fsm4836329jav.131.2023.05.01.18.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 18:08:10 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 2/7] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Date: Mon,  1 May 2023 20:07:54 -0500
Message-Id: <20230502010759.17282-3-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org
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

