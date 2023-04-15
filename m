Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858206E30AC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0510E0B6;
	Sat, 15 Apr 2023 10:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93F610E062
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:41:18 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-760c58486d3so15135239f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555277; x=1684147277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=56ZqII4Fb21fefI3ij/UQDEmcVSWwrH95gBjy3Mjo2c=;
 b=c8R4I6O7ggblq3O1pN0J/PavAtXqWA4bYUwa0MWOlSiv+6wVMfuKWJjDtC7rumJhcN
 0wnseCj6TyzdfajLDnKts4AwioLf4PO6JyroWchUm/aq2GRk9J+Lg3+Xoc14CHqCaw+2
 YW33BbG9KN3jggKvsgFWRlVK6qxRfaPAAb/BZ5zbH+Rk8Wlnp4UN9QUF9G9PbETTzSy4
 29TtbhcGai+nhWmrd4BBMWnOBy59vNlI2foFoP9nU76fTp2lRKxj3WqSBo5tZ3oOp0q8
 dQdHlgD28OO9t5wPpSbx45HEVfMBwSIq7B7r+qmyPSSWtXkh2BQ/+YEKhgdehA4QHEyp
 j1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555277; x=1684147277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=56ZqII4Fb21fefI3ij/UQDEmcVSWwrH95gBjy3Mjo2c=;
 b=DyW6vbCucNfXGX7boa+2xvuEhSYN+9K5VhdmKQeBdtgRhiRV6w2cTsDf/S86kJVEin
 7Kh999Kqws7DYuY1TB3dTLm6kPhX+zUbftcPQd8G8ArUSv27i9UA2MawnzrLXccZzxpe
 K0gXD/elS6OTdnDex5D/Jpn+Fuy1HOnjREYb7pTpIBxlWybQemN1CaHdzPY1ZNhzGuMp
 K3AZOnHcNIdV6j+NqMQr3Z3SExgWeNj8GXM0jB21RRoMTlSGwvnZtWYEo9hc6o3xpNFF
 /pHCSEh3TSekTE+oq/1lzdx7yM6f0VaD2E0/aP8sJD3v35u5uF1Yu69ni2Fe4wE3iGC4
 y9vA==
X-Gm-Message-State: AAQBX9dSsG8dkSUjwEGs7hop/pL3jlDhidgXLYGChZvGn7z6u2iW5FYG
 b+8VXdUONKrDYfs2EUrJy2zEaVLXwTS86g==
X-Google-Smtp-Source: AKy350YMpZS9K/4tuqfAqbcnOR5F8JMUeFciCZKRV1EEP8gaOTJNwxUsnA9p449Upwgys2q4gez8qA==
X-Received: by 2002:a92:d80f:0:b0:329:5a6e:3a18 with SMTP id
 y15-20020a92d80f000000b003295a6e3a18mr5513977ilm.4.1681555277355; 
 Sat, 15 Apr 2023 03:41:17 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:40bb:6fe6:ddbc:cc9a])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a056638440b00b0040b38102b79sm246536jab.82.2023.04.15.03.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:41:16 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Date: Sat, 15 Apr 2023 05:40:59 -0500
Message-Id: <20230415104104.5537-2-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415104104.5537-1-aford173@gmail.com>
References: <20230415104104.5537-1-aford173@gmail.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to Table 13-45 of the i.MX8M Mini Reference Manual, the min
and max values for M and  the frequency range for the VCO_out
calculator were incorrect.  This also appears to be the case for the
imx8mn and imx8mp.

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
index 1ccbad4ea577..9fec32b44e05 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -406,6 +406,9 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
@@ -419,6 +422,9 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
@@ -430,6 +436,9 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
@@ -442,6 +451,9 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
@@ -454,6 +466,9 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
+	.m_min = 41,
+	.m_max = 125,
+	.vco_min = 500,
 };
 
 static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
@@ -470,6 +485,9 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 */
 	.pll_p_offset = 14,
 	.reg_values = imx8mm_dsim_reg_values,
+	.m_min = 64,
+	.m_max = 1023,
+	.vco_min = 1050,
 };
 
 static const struct samsung_dsim_driver_data *
@@ -548,12 +566,12 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
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

