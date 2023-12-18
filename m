Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C290E817B9E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 21:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9A110E071;
	Mon, 18 Dec 2023 20:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1313410E277
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:13:29 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a2371eae8f1so12577666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 12:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702930408; x=1703535208;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vUOsBiPuxBvM6FDZ7VmJ/JCXXnby3Q2ff55p54IAZ7U=;
 b=NBzjXglGVU4TzDENQvoSEZPeqVoQKzLGtevl2kDT5EEjZKFCVikIrTmgbQJ68lavm6
 sA2MABJ2doeJhLGSlFWpB61rZQSSCfz3lSbVSV1ge1l450W+zlXlrGMmiI6CqDKseted
 thYRQsgqPcu2/BbIaYnvlGvW73uIj3TxglAwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702930408; x=1703535208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUOsBiPuxBvM6FDZ7VmJ/JCXXnby3Q2ff55p54IAZ7U=;
 b=iO46oBxylFi1qRg9tRwk4AMQLLvR327NFTjhD9SZqO6M5G3tJIFBO1M/omW1ZE/6KY
 buVA3F26kgdiWSAFtFV7XFcE95jeZwv32oFQHCXDULD4MvQ8pvNF7mC0StbWL3jFgCPT
 cyveUIRtpYsLrkF5ed4lTnZdlDlzns/9RMj2gLN3EKWWHL+AP7lL+G4Dr2eKhxYHxUkM
 z6k955R90GyZRV2jWNT9D0w9OhO2iCHCkRpEs0F5W1VKjxJ19g84qbhnuDW4CT7d8jsq
 S2vHjGewiQ/ZF4P3ml4hrsb4hvtYZjFfOfGbYlYR3keFODGzqFq8Sm06DcN7miEq0Mdk
 0K6A==
X-Gm-Message-State: AOJu0YzjMyIXkJZUgiw1xoCGVUGChp+cxzXh7BJ8URZs7i2205VGiI5z
 hIP7sBs/IOD7k+p9zWbIEJX7Pu2Ft3owaZy3XzhWeQ==
X-Google-Smtp-Source: AGHT+IHnI5pJOO1XvxphHcSVvqxQWGOBCsC2XszPbbyQs91sGn3IpyV+l3rc/uBb2YY0cLFmXx3IRQ==
X-Received: by 2002:a17:906:af0d:b0:a23:6059:ec33 with SMTP id
 lx13-20020a170906af0d00b00a236059ec33mr232832ejb.139.1702889044325; 
 Mon, 18 Dec 2023 00:44:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 un5-20020a170907cb8500b009ff77c2e1dasm13775480ejc.167.2023.12.18.00.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:44:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/2] drm: bridge: samsung-dsim: complete the CLKLANE_STOP
 setting
Date: Mon, 18 Dec 2023 09:43:38 +0100
Message-ID: <20231218084354.508942-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218084354.508942-1-dario.binacchi@amarulasolutions.com>
References: <20231218084354.508942-1-dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, michael@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch completes the setting of CLKLANE_STOP for the imx8m{m,n,p}
platforms (i. e. not exynos).

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v9:
- Updated commit message
- Drop [3/3] arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup
  because applied.

Changes in v8:
- Move the 'status' property to the end of the list of nodes:
  - pwm1
  - lcdif
  - mipi_dsi
- Add a newline between properties and child node (mipi_dsi_out).
- Sort the iomuxc node alphabetically
- Rename pwm1grp to blgrp

Changes in v7:
- Drop [3/4] dt-bindings: display: panel: Add synaptics r63353 panel controller
  because applied.

Changes in v6:
- Drop patches:
  - [06/10] drm/panel: Add Synaptics R63353 panel driver
  - [07/10] dt-bindings: display: panel: Add Ilitek ili9805 panel controller
  - [08/10] drm/panel: Add Ilitek ILI9805 panel driver
  - [09/10] drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 panel
  Because applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  Drop patches:
  - [01/10] drm/bridge: Fix bridge disable logic
  - [02/10] drm/bridge: Fix a use case in the bridge disable logic
  Because they are wrong

Changes in v3:
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Squash patch [09/11] dt-bindings: ili9805: add compatible string for Tianma TM041XDHG01
  into [07/11] dt-bindings: display: panel: Add Ilitek ili9805 panel controller.

Changes in v2:
- Adjust the mipi_dsi node based on the latest patches merged into
  the mainline in the dtsi files it includes.
- Added to the series the following patches:
  - 0001 drm/bridge: Fix bridge disable logic
  - 0002 drm/bridge: Fix a use case in the bridge disable logic
  - 0003 samsung-dsim: enter display mode in the enable() callback
  - 0004 drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

 drivers/gpu/drm/bridge/samsung-dsim.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 15bf05b2bbe4..13f181c99d7e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -96,6 +96,7 @@
 #define DSIM_MFLUSH_VS			BIT(29)
 /* This flag is valid only for exynos3250/3472/5260/5430 */
 #define DSIM_CLKLANE_STOP		BIT(30)
+#define DSIM_NON_CONTINUOUS_CLKLANE	BIT(31)
 
 /* DSIM_ESCMODE */
 #define DSIM_TX_TRIGGER_RST		BIT(4)
@@ -945,8 +946,12 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 	 * power consumption.
 	 */
 	if (driver_data->has_clklane_stop &&
-	    dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
+	    dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
+		if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
+			reg |= DSIM_NON_CONTINUOUS_CLKLANE;
+
 		reg |= DSIM_CLKLANE_STOP;
+	}
 	samsung_dsim_write(dsi, DSIM_CONFIG_REG, reg);
 
 	lanes_mask = BIT(dsi->lanes) - 1;
-- 
2.43.0

