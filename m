Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DDD6F7C54
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 07:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0706210E565;
	Fri,  5 May 2023 05:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DD310E565
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 05:21:37 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id 2CD8E1BF20C;
 Fri,  5 May 2023 05:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1683264096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S31SO6KDsoAFCVqHr2y4SszRxMON8Fz0nC5PH2vEKG4=;
 b=UnPM7SnFVStghWutpcf4hvBzU3LYMgQUjXbbWf1gInkUfhbufwCME6gRJjJNdHHyxvjwQH
 srRdc0HcI59+WIyw7lYsIuwzWPrHcUNtRAHYxCSgOu/KMHv59fxCwJs01lHIN4N3yxgm8i
 cMWk0AvthS+LafJ1DmiQ0e7MNDln4zyNYOYODIK6uq9Elb+bh6/EH3zFkP3NXMPeUG2VO/
 O/TKMCDhzKatHr+hZ7qI3w/pJEgM73hns5rkVm3TEq9EMastRfLlObcqy0Kxfa59BLx/e4
 x+3LOJIPgOt2iP9UA/8RlnJBrA9fWT10KyWkBN5QkUzNOUOwjrdaZUHTaBiZww==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 3/4] drm: sun4i: rename sun4i_dotclock to sun4i_tcon_dclk
Date: Fri,  5 May 2023 07:21:09 +0200
Message-Id: <20230505052110.67514-4-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230505052110.67514-1-me@crly.cz>
References: <20230505052110.67514-1-me@crly.cz>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the rate of TCON0's DCLK matches dotclock for parallel and LVDS
outputs, this doesn't hold for DSI. The 'D' in DCLK actually stands for
'Data' according to Allwinner's manuals. The clock is mostly referred to
as dclk throughout this driver already anyway, so stick with that.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 drivers/gpu/drm/sun4i/Makefile                         |  2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                     | 10 +++++-----
 .../drm/sun4i/{sun4i_dotclock.c => sun4i_tcon_dclk.c}  |  2 +-
 .../drm/sun4i/{sun4i_dotclock.h => sun4i_tcon_dclk.h}  |  0
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.c => sun4i_tcon_dclk.c} (99%)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.h => sun4i_tcon_dclk.h} (100%)

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index 0d04f2447b01..bad7497a0d11 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -19,7 +19,7 @@ sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_scaler.o sun8i_csc.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
-sun4i-tcon-y			+= sun4i_dotclock.o
+sun4i-tcon-y			+= sun4i_tcon_dclk.o
 sun4i-tcon-y			+= sun4i_lvds.o
 sun4i-tcon-y			+= sun4i_tcon.o
 sun4i-tcon-y			+= sun4i_rgb.o
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 523a6d787921..eec26b1faa4b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -31,12 +31,12 @@
 #include <uapi/drm/drm_mode.h>
 
 #include "sun4i_crtc.h"
-#include "sun4i_dotclock.h"
 #include "sun4i_drv.h"
 #include "sun4i_lvds.h"
 #include "sun4i_rgb.h"
 #include "sun4i_tcon.h"
 #include "sun6i_mipi_dsi.h"
+#include "sun4i_tcon_dclk.h"
 #include "sun8i_tcon_top.h"
 #include "sunxi_engine.h"
 
@@ -1237,14 +1237,14 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	ret = sun4i_tcon_init_irq(dev, tcon);
 	if (ret) {
 		dev_err(dev, "Couldn't init our TCON interrupts\n");
-		goto err_free_dotclock;
+		goto err_free_dclk;
 	}
 
 	tcon->crtc = sun4i_crtc_init(drm, engine, tcon);
 	if (IS_ERR(tcon->crtc)) {
 		dev_err(dev, "Couldn't create our CRTC\n");
 		ret = PTR_ERR(tcon->crtc);
-		goto err_free_dotclock;
+		goto err_free_dclk;
 	}
 
 	if (tcon->quirks->has_channel_0) {
@@ -1264,7 +1264,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		of_node_put(remote);
 
 		if (ret < 0)
-			goto err_free_dotclock;
+			goto err_free_dclk;
 	}
 
 	if (tcon->quirks->needs_de_be_mux) {
@@ -1290,7 +1290,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 
 	return 0;
 
-err_free_dotclock:
+err_free_dclk:
 	if (tcon->quirks->has_channel_0)
 		sun4i_dclk_free(tcon);
 err_free_clocks:
diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
similarity index 99%
rename from drivers/gpu/drm/sun4i/sun4i_dotclock.c
rename to drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 417ade3d2565..03d7de1911cd 100644
--- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -10,7 +10,7 @@
 #include <linux/regmap.h>
 
 #include "sun4i_tcon.h"
-#include "sun4i_dotclock.h"
+#include "sun4i_tcon_dclk.h"
 
 struct sun4i_dclk {
 	struct clk_hw		hw;
diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.h b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.h
similarity index 100%
rename from drivers/gpu/drm/sun4i/sun4i_dotclock.h
rename to drivers/gpu/drm/sun4i/sun4i_tcon_dclk.h
-- 
2.32.0 (Apple Git-132)

