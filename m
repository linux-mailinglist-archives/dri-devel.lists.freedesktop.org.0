Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D96564850D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE48F10E543;
	Fri,  9 Dec 2022 15:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E4610E551
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:25:52 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id g10so5198798plo.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LFDauSpXdcfcdulBlIlfj04e257Z0kmZtXLY+iJX2Pg=;
 b=ryEFa27h8SLc1qWdmoMlBp0bx55NLrrGgH8Zv2/ERI2Xh22eUHA7BUmUDn/Gc7LQBT
 hYdFsZFpSKssP6unOy5EqipGJ6JuD+hZ7QZ1x4lS9Ym95THHWxHBTsodhxHcgjl24yMq
 nubrbGC+/k210FrvNnYYGqWDjg7PARSDn65NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LFDauSpXdcfcdulBlIlfj04e257Z0kmZtXLY+iJX2Pg=;
 b=5iNXAh+Hwk3mLe7DY4TdsXhpRuYSxgWw8PM4YPt0cJM14M0OqvYGOzrf5XRtQWCB2b
 C6eTwaqP3LZ1a/LCWWD/q27QVgFNAKw8zkfKSx4hTl0xEW0lQ/UXOWJpGxQHvvjZUlvq
 hlqKE5d3DpvG646PPU8uQXalr5wiPTvTv2k+z31tWcWcV9m67nNupN3XWCLtJurseUy7
 Ny0UCzduOctnNZArlHXi4heLs7Grg+zWI/6tCGOwMzedCihVnHmpTM+so39nEh9OKRtu
 TtXaNux8n2338/pyAMc2jyyq7q7AN+xqHZMOz4nMIHhn0EGU6mzlooi44XNpGumrgFtG
 AZPQ==
X-Gm-Message-State: ANoB5pnAOwHzFJ16K1hz9PWGmkgn2GEqzA8ashcCc0PZtuxFDDdUQCD6
 1o/YbkEntBk0do9TU8PGikqR+g==
X-Google-Smtp-Source: AA0mqf4L+0It51zXy3WVW7YZtaQAOe0SU2ffTuGt5Qne8mX7Sf8W244wwyLuWxnnc1tRpHva6L5yfA==
X-Received: by 2002:a17:902:e787:b0:187:1d13:f6d1 with SMTP id
 cp7-20020a170902e78700b001871d13f6d1mr5927784plb.52.1670599552412; 
 Fri, 09 Dec 2022 07:25:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:25:51 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v9 05/18] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
Date: Fri,  9 Dec 2022 20:53:30 +0530
Message-Id: <20221209152343.180139-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, Nicolas Boichat <drinkcat@chromium.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HSA/HBP/HFP/HSE mode bits in Processor Reference Manuals specify
a naming conversion as 'disable mode bit' due to its bit definition,
0 = Enable and 1 = Disable.

For HSE bit, the i.MX 8M Mini/Nano/Plus Applications Processor
Reference Manual named this bit as 'HseDisableMode' but the bit
definition is quite opposite like
0 = Disables transfer
1 = Enables transfer
which clearly states that HSE is not a disable bit.

HSE is named as per the manual even though it is not a disable
bit however the driver logic for handling HSE is based on the
MIPI_DSI_MODE_VIDEO_HSE flag itself.

Cc: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v9:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 33 +++++++++++++++++++------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 50a2a9ca88a9..b64bb6006b7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -75,10 +75,27 @@
 #define DSIM_MAIN_PIX_FORMAT_RGB565	(0x4 << 12)
 #define DSIM_SUB_VC			(((x) & 0x3) << 16)
 #define DSIM_MAIN_VC			(((x) & 0x3) << 18)
-#define DSIM_HSA_MODE			(1 << 20)
-#define DSIM_HBP_MODE			(1 << 21)
-#define DSIM_HFP_MODE			(1 << 22)
-#define DSIM_HSE_MODE			(1 << 23)
+#define DSIM_HSA_DISABLE_MODE		(1 << 20)
+#define DSIM_HBP_DISABLE_MODE		(1 << 21)
+#define DSIM_HFP_DISABLE_MODE		(1 << 22)
+/*
+ * The i.MX 8M Mini Applications Processor Reference Manual,
+ * Rev. 3, 11/2020 Page 4091
+ * The i.MX 8M Nano Applications Processor Reference Manual,
+ * Rev. 2, 07/2022 Page 3058
+ * The i.MX 8M Plus Applications Processor Reference Manual,
+ * Rev. 1, 06/2021 Page 5436
+ * named this bit as 'HseDisableMode' but the bit definition
+ * is quite opposite like
+ * 0 = Disables transfer
+ * 1 = Enables transfer
+ * which clearly states that HSE is not a disable bit.
+ *
+ * This bit is named as per the manual even though it is not
+ * a disable bit however the driver logic for handling HSE
+ * is based on the MIPI_DSI_MODE_VIDEO_HSE flag itself.
+ */
+#define DSIM_HSE_DISABLE_MODE		(1 << 23)
 #define DSIM_AUTO_MODE			(1 << 24)
 #define DSIM_VIDEO_MODE			(1 << 25)
 #define DSIM_BURST_MODE			(1 << 26)
@@ -804,13 +821,13 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
 			reg |= DSIM_AUTO_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
-			reg |= DSIM_HSE_MODE;
+			reg |= DSIM_HSE_DISABLE_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
-			reg |= DSIM_HFP_MODE;
+			reg |= DSIM_HFP_DISABLE_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
-			reg |= DSIM_HBP_MODE;
+			reg |= DSIM_HBP_DISABLE_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
-			reg |= DSIM_HSA_MODE;
+			reg |= DSIM_HSA_DISABLE_MODE;
 	}
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
-- 
2.25.1

