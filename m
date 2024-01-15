Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933082D773
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B304310E280;
	Mon, 15 Jan 2024 10:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0000310E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 10:34:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e8004628dso1293215e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 02:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705314864; x=1705919664;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vUOsBiPuxBvM6FDZ7VmJ/JCXXnby3Q2ff55p54IAZ7U=;
 b=azp444w4+8Hz5uilR0+fmELXCwcSNLf2/OLL0oHBYvPipjh5cw/AM4DHwDNcD2Vv/s
 z/31i/gfhGnsPiWZFq7yVYLSv04rmwMgNnZFnDHkjOHJ+iNbur6+VChVhGJTF247t2Kb
 s/c8vOL3wu+g3YuyEA0z8tZYhORxUXH4TAvPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705314864; x=1705919664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUOsBiPuxBvM6FDZ7VmJ/JCXXnby3Q2ff55p54IAZ7U=;
 b=rfYClyIlTKqmrhX4D+PX2iS8dU7lg918u88/hRCPdMfn7B/tPVo9ZHsdRdEzDZoIFv
 7L/wsx2kligK2uIqXeKtHdTSGIPFGINEavE1vkHR3zhHbt1sFYpLyw0ivc6PYfwdeo8W
 Q9+GpXptArrAaFrehC8wYNghjcDZzMppfO+NO3AUGJaoJMrutL0EeEFMQWffGu0m//X6
 WE8v2rz1uZN6R05L3/xqoKbQ5utfpI11EAxAEkmNcFYG+JiM7eWGxIU0ZqOTY9rck4de
 FQnrJ9cW245eXWzPD1cJ5i7zDJonYe06Nlb7L+3HNS4wiKcJx35Ag7tBOFq/75PjwXhr
 yOww==
X-Gm-Message-State: AOJu0YyOuHdFM0sbFnsuKOm6XYfaedFAv1fDENnpZ/0E0ks2JtKk/ieD
 qMQaTas/pMACkTqZ/gAneHcizPVaxhnA4g==
X-Google-Smtp-Source: AGHT+IGh1O+G/1dz0awf1sBDCz0T6XMUZyrIuqYX5f01A57JxbvNRHU38uQWBn4j2o8htR7XvaIJ9w==
X-Received: by 2002:a05:600c:314f:b0:40e:4640:241b with SMTP id
 h15-20020a05600c314f00b0040e4640241bmr2922328wmo.175.1705314864484; 
 Mon, 15 Jan 2024 02:34:24 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-69.net.vodafone.it. [5.90.63.69])
 by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b0040e50d82af5sm15536120wms.32.2024.01.15.02.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 02:34:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v9 2/2] drm: bridge: samsung-dsim: complete the
 CLKLANE_STOP setting
Date: Mon, 15 Jan 2024 11:33:48 +0100
Message-ID: <20240115103416.978481-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115103416.978481-1-dario.binacchi@amarulasolutions.com>
References: <20240115103416.978481-1-dario.binacchi@amarulasolutions.com>
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
 David Airlie <airlied@gmail.com>,
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

