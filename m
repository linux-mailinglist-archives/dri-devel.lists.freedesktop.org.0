Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23457A81655
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE6B10E73F;
	Tue,  8 Apr 2025 20:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZW0NuGRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAC010E73D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso44322185e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142976; x=1744747776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6OgcXmNS3sENYjB8Vw7lSliGvZSR77gtkSbaMOxpKv0=;
 b=ZW0NuGRSgeDnJGvL+We2LyexYcDhR1HY1SWXYH/BgPm8RH2bDngaunw32rhc3lhrs2
 U1eSoB/4W2TSCksvA9FmkvyRTaktU+NSJot3Y1hA+1sr9N320Hulw6VLV7T30XjZvKNW
 6XQccJm1HOQ4HKS6StYVrTlyTdRmUeAGrnMQsq8SChg80wZmPzcjh8PrZaXHVP2AvW4U
 IhRPgDf5G/PprQnvT6H0nCOh+hmQ+lE22YPiAUghd3qZAsK0mYiSLqenK7izFelMh4Qm
 J4impLL/KzXfFhODmCAKHROU/MW+T9cGtFAmUh/eoDTMRXJ222DN/PKGvZOautZByU1o
 7xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142976; x=1744747776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6OgcXmNS3sENYjB8Vw7lSliGvZSR77gtkSbaMOxpKv0=;
 b=rIpPgedOW/IR0NF8Pf2BlLUQYnTGaMm30dwKApFmHJGApsCHaT9QeJ/q70mwEoMcSF
 BBjoWIYkbm2+0yRQxzpYbuuT7CqE2Vo8NbhJ8mxraVYjM002gZS3IweTK75wRvPvpEuk
 hd6XpevrDawuqAfWZiQFQxdhxtioNjPNKg2KjsKzAYpwRlpHWI8/1T7xooe7rG+fUYH9
 6B4SzwTun+qAVrJ937xIKR5piAQQmr0OMB0+CVQtLsv3r+o34F6n8R7+JO0cXFhz4eTB
 0mUMFn5tPS54+2DYnZx2q4lNINpWrCCsv+T3xorZ/hwzAeOKktwISSn99uFu2YoKBDOm
 927Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmEIdDijYA7Na8+l6Plz9qqNY9e4+LQvOvZsvZAL7Yw31fHqjKcGVzGXU0Q9+16nq9JMVU8hu+ZWs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx887EafA4YnbhSZMEvxRm1hyWw9wdrWi4Ezw9fEOHwiGYnsDZS
 rlt0S653qkumQNN4gh3Bg0nvW70p3QMXxfoI9LdujPh5LkgoLJtY
X-Gm-Gg: ASbGncuT3nChOzrfMRX6FuT+hMuU5DitoVxp+bjHLXqXhk/pgLwq/EkCNwqGjDawvxg
 D6owu37DQ6S9HGwztIF96hronwTqnSsrg8eI519G0jPYVHAJJYbOr58aOaMfuh4wrd9hd9pBYci
 kx6QRu9/SXJ45HN2bXsUAv6qR0+kChsu8K6aMzDQctABqWI/4mDRQzDwR/0dkijihnPxUtwzKM4
 g57/90WMypuZ6cVCbuN9a365+ABYFSsjSxlOwMouDjHbYt/KxHwwo0O7HS/pEE6JdSrJZfjIRoE
 /uLVasF+v52LUXvojqXBLRZTtUqpGKF9kAr3/ndFYmn/lH7upYcHVdc19KthQOWP4UEr
X-Google-Smtp-Source: AGHT+IEbficL3uCGDn7GCDfeny1xMvHgI4JpauUALYcr8FLWvyjii2SNUL/xBJg0E1G0ZCoeZ07FSQ==
X-Received: by 2002:a05:600c:1c26:b0:43c:ef13:7e5e with SMTP id
 5b1f17b1804b1-43f1ff3badfmr253225e9.26.1744142975880; 
 Tue, 08 Apr 2025 13:09:35 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ
 calculation
Date: Tue,  8 Apr 2025 21:09:05 +0100
Message-ID: <20250408200916.93793-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
VCLK rate instead of the mode clock. The relationship between HSCLK and
VCLK is:

    vclk * bpp <= hsclk * 8 * lanes

Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
HSFREQ accurately reflects the clock rate set in hardware, leading to
better precision in data transmission.

Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
when computing `hsfreq`. Also, update unit conversions to use correct
scaling factors for better clarity and correctness.

Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
threshold comparisons to use Hz instead of kHz to ensure correct behavior.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c5f698cd74f1..8fa86ae07fd2 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -15,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	/* All DSI global operation timings are set with recommended setting */
 	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
 		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
-		if (hsfreq <= dphy_timings->hsfreq_max)
+		if (hsfreq <= (dphy_timings->hsfreq_max * KILO))
 			break;
 	}
 
@@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq;
+	unsigned long hsfreq, vclk_rate;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	u32 golpbkt;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	clk_set_rate(dsi->vclk, mode->clock * KILO);
+
 	/*
 	 * Relationship between hsclk and vclk must follow
 	 * vclk * bpp = hsclk * 8 * lanes
@@ -280,13 +288,8 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp) / dsi->lanes;
-
-	ret = pm_runtime_resume_and_get(dsi->dev);
-	if (ret < 0)
-		return ret;
-
-	clk_set_rate(dsi->vclk, mode->clock * 1000);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
 	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
 	if (ret < 0)
@@ -304,12 +307,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * - data lanes: maximum 4 lanes
 	 * Therefore maximum hsclk will be 891 Mbps.
 	 */
-	if (hsfreq > 445500) {
+	if (hsfreq > 445500000) {
 		clkkpt = 12;
 		clkbfht = 15;
 		clkstpt = 48;
 		golpbkt = 75;
-	} else if (hsfreq > 250000) {
+	} else if (hsfreq > 250000000) {
 		clkkpt = 7;
 		clkbfht = 8;
 		clkstpt = 27;
@@ -753,7 +756,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

