Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08856EBF38
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 14:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BEA10E3A8;
	Sun, 23 Apr 2023 12:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D52210E3A8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 12:12:57 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7606cf9fc63so84491439f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682251976; x=1684843976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3pPY9HtEOUAK4JXw4/vXoPtAe/9xi0JXRHIjuTfYXw=;
 b=gmvH94iI2m0GKZIajyYNPgxVP+S3TM1zQ35lnAgZhuIRabJdWMZTrvMYTvO5J1zcmh
 bFKUcJfddTNIHmMGE0D5ojK5Csx+Jwh/BFBXEYJB0OWgxtJVyAF5gr8WzN4c9dCTITLX
 2sVWn2sHt8H/1xUfA65AJSuohQXMxN81a54EtcIldxBOvVulldqWC15Ja8rXePL9wDOg
 lBv6Dqs5geytGMtkxr1C3z7/P4EZm1KV7WSTgz0UqP5s0VUSShIkvV6J7dCE77/cEOI3
 dUnIWCXZxO5zFHUcUZQLN+cuJ6Pm1q/SpW4gxvDIkyJmbDxtG19M0J0bs8xKId+nNT9x
 0HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682251976; x=1684843976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C3pPY9HtEOUAK4JXw4/vXoPtAe/9xi0JXRHIjuTfYXw=;
 b=lg4JTaQ3aqXfIT6Lh03r2uV+Hbrlz8W24Sz7Q5d7zLjWkUnysFtIUhkStViNwKYVFz
 Xw99UuCJexo/WycGKgN8M7rQf8GRKGQu0xfXFN9XDI4XFS2xGUJPD1AQfJ2fOaj+B8H+
 wgTy4HGK26nGAMLo5Vg8GAKXIa1H+hyTlp/6SkFBcAFLl4t1MSB6iO+pcMPwmRWekk1s
 g2zEf7QVqUK9V2jQGeFzLw2a/rKXPLouUP7hbtlri/wVZk+nYEpsaw6oQSmfN70ySyAK
 su3IlznFuKSa21uwXx0d4lm/YtHKfPYmJkaYWbjj0W+SGTaf9/NA1v0j9JuX+AaiMrWB
 n/3Q==
X-Gm-Message-State: AAQBX9cIPmM3LPYz2kvaEFWsDdE33tST0F1ggIMfBd3B+zW7KztaRNYg
 6hC86CCIRxhNNdwdMCycXfpbexVeQBQ=
X-Google-Smtp-Source: AKy350a/O9W6zY3tjTMBeCg1ESutg2q3D+HvasDlLWjLo21snfZvgTbxN68OuUpeacv8kcMa5kVMRg==
X-Received: by 2002:a5e:c709:0:b0:763:5ab7:a8ec with SMTP id
 f9-20020a5ec709000000b007635ab7a8ecmr3700527iop.12.1682251975744; 
 Sun, 23 Apr 2023 05:12:55 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:b473:5d7c:4c2:75d7])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a02230b000000b00411a1373aa5sm1612155jau.155.2023.04.23.05.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 05:12:55 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Date: Sun, 23 Apr 2023 07:12:28 -0500
Message-Id: <20230423121232.1345909-3-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423121232.1345909-1-aford173@gmail.com>
References: <20230423121232.1345909-1-aford173@gmail.com>
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
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 dario.binacchi@amarulasolutions.com, Adam Ford <aford173@gmail.com>
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
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  3 +++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2be3b58624c3..adb9c13c5f7f 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -405,6 +405,9 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -418,6 +421,9 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -429,6 +435,9 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -441,6 +450,9 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -453,6 +465,9 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
@@ -469,6 +484,9 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 */
 	.pll_p_offset = 14,
 	.reg_values = imx8mm_dsim_reg_values,
+	.m_min = 64,
+	.m_max = 1023,
+	.vco_min = 1050,
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
+			if (tmp < driver_data->vco_min  * MHZ ||
 			    tmp > driver_data->max_freq * MHZ)
 				continue;
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index ba5484de2b30..a088d84579bc 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -59,6 +59,9 @@ struct samsung_dsim_driver_data {
 	unsigned int num_bits_resol;
 	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
+	u16 m_min;
+	u16 m_max;
+	u64 vco_min;
 };
 
 struct samsung_dsim_host_ops {
-- 
2.39.2

