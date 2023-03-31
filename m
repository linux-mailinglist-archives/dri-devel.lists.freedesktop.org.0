Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A224F6D2F0A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 10:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFB889056;
	Sat,  1 Apr 2023 08:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE42B10F1DD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 11:02:57 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id 173A7C0009;
 Fri, 31 Mar 2023 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1680260576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S31SO6KDsoAFCVqHr2y4SszRxMON8Fz0nC5PH2vEKG4=;
 b=RWs2uHxhiPWFZggEVO/klI9bSBhm3o/8KD5oRkF3GkSQi4JGT821yWDXULe0xe787baWJI
 //0aIW2kqlaiEA4VYdjwranAKQ6/AACCjBtYysBqfnfb7ey/HKyB7bGBkwKwY4mFlpahuY
 v1OkeRzliJ/et3c8fAc7IzKBo16zEU223fL4T7qcxrjOS8PczJrJLDYLRiIf9IhTNtfAwL
 RiWQvSymlFw5F4mrMDRobxpBCm9mwGAY5lDfcf5sSm32LIAWNynQs2sikMWWC0g8/niAJt
 NehooFzLzTpv1wEzBcN79tV16AkAregV/11UcXr6yhdNDJDl2oSq6OgiASDGBQ==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/3] drm: sun4i: rename sun4i_dotclock to sun4i_tcon_dclk
Date: Fri, 31 Mar 2023 13:02:43 +0200
Message-Id: <20230331110245.43527-2-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230331110245.43527-1-me@crly.cz>
References: <20230331110245.43527-1-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 01 Apr 2023 08:14:47 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
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

