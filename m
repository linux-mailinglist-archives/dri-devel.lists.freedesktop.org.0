Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA7B711E40
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7BA10E795;
	Fri, 26 May 2023 03:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B2310E797
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:06:12 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-333eb36e453so577985ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685070371; x=1687662371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZwQCaqcjy7RjxDAR2wRO2JGL84KcCiGYyuPBX57oTU=;
 b=SL3yZ2bL+Fcnjpm+QQGYOdSO63Z0kU0R9qvNv2zZm16wB/iEfKcSRxYXszttr0yr/+
 yLChq/wv4fq8KpJPBrAuvAqPSIHnJO0n1xZLx84TNfTkmze8WUBCfXpGetoqFOMMTI2U
 Rp3sUocO/WAacUrvB0sMHMI+7yIxsQ8OMz/dbpi3yXmK3kVyLUKRtezLms1qYcvvpTnr
 ZlsUdUWb1O4IWwZ2RnU6Ef1fiP38KMmgwhmIb448kKOyjZGyA6L0FqwajT5rP+zW6xx/
 42WSZGPe8ciTPVJ1YPUqZyYJIscyY+cZlwvAeDG72/hrK9yHgm/e2sNntm47CBBo/je1
 pNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685070371; x=1687662371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZwQCaqcjy7RjxDAR2wRO2JGL84KcCiGYyuPBX57oTU=;
 b=AAyXmuOOSLK83hCwBg5KWHKNkDlSHOKOBlPvagnPuYbtlJ2Q6owWVOYTl8JJYOfQmN
 nvYuleBWwgsN58KMSdPr8VjKz4xsleS1t1awEqHuxifzGKmKdUngsKwvVfEXnhAmTDB8
 ePK9SZMMukBazvAjxtasi4vNO5E1IUXNGH44zanuK2AWoavakMvmkfuCerOiW8ufA3Ye
 0axSY72xY+v3e9vgTTPGKy/AzecYbkZatYjMF8qiplW2zHiDfWZfm2jcLyYqkhqH6cKJ
 VxZhg7SR+wnPgUtj2ygPorBXzyQXG1Xl3+B1uh1DdMtsAljJrKp/mHXIbWMXIoWhcuBp
 1e4Q==
X-Gm-Message-State: AC+VfDxFdcKa6+K0TgYaiubYOMQAPOMFvA1GQyzZu8zsJalA+aHMKWhD
 0N1RBoB8RTya3o4M5OZ4qIbRJYNMU3g=
X-Google-Smtp-Source: ACHHUZ4FVaUBBSjmhB1EOfv0vtM23SiUMZy8GR/ohrRTv1x/DQIFwlpinrFYRpEET2fBs60KxFKezw==
X-Received: by 2002:a6b:6510:0:b0:774:952a:1c09 with SMTP id
 z16-20020a6b6510000000b00774952a1c09mr69368iob.9.1685070371055; 
 Thu, 25 May 2023 20:06:11 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:3dd9:3f6c:9922:6420])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5e8502000000b007702f55116fsm363189ioj.38.2023.05.25.20.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 20:06:10 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V8 2/7] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Date: Thu, 25 May 2023 22:05:54 -0500
Message-Id: <20230526030559.326566-3-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526030559.326566-1-aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Chen-Yu Tsai <wenst@chromium.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
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
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  3 +++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index a2d1eaf0ed1c..ead922c3ce9f 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -407,6 +407,9 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -420,6 +423,9 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -431,6 +437,9 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -443,6 +452,9 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -455,6 +467,9 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
 };
 
 static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
@@ -471,6 +486,9 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 */
 	.pll_p_offset = 14,
 	.reg_values = imx8mm_dsim_reg_values,
+	.m_min = 64,
+	.m_max = 1023,
+	.min_freq = 1050,
 };
 
 static const struct samsung_dsim_driver_data *
@@ -549,12 +567,12 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
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
index 6a37d1e079bf..2c20b9460c9a 100644
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

