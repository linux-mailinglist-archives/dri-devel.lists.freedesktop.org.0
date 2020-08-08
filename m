Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55FF23F952
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 00:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C01A6E291;
	Sat,  8 Aug 2020 22:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0696E291
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 22:31:27 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v9so5821400ljk.6
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 15:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=liTGnJ5ib4EhSDKV4Hujgo0mv8zC2slUaKkVr7c+t+8=;
 b=QMUhmcMbeX6BZtoR/iUqqjaZQmIjq1z/CSiMr8Kwu2c/1/fpYzi08yj/X0PWGz+mgd
 F+Yxgl2B2Mkhu8IML/lcHq7U2xmaubcGTpk6Fqf3jVG7x4J64AqJqdHxwiBg0Ae9+vJ2
 WaqDyS+tp53H8zhDYkSno13R6JPTJh5IAgsArdvzs2RRyCjZgtrGcK5FmY1wCOtdIxj3
 4XEL3mM+CZ6bO/TDE5NMVF/tEZzj8qYWpAFEi3Ju0B/bsYAhwXwWyOukgijaxLRi1k8l
 j3OVF1Ua1pOFEJo74QaACpIBY7mmH3hhOJ/MSTW6tJVZEpJnvSe6Dpixy7VvDDr2YmRE
 Urxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=liTGnJ5ib4EhSDKV4Hujgo0mv8zC2slUaKkVr7c+t+8=;
 b=dVVqNxG9EVAfqV+JiFQUi4J3MSEDE526OhQENTgTFCmFhOeZJ9XKQ349PSrXmzMjaO
 PNyisdd6ZapqeZcnp1AkiGqSeAwqYIgmRfD/miLS6mXgIp2JqHEygf3cc0NmUKAznIjS
 5CkcE/u48CaQ/fsoUhqgVg7xI1aEWPLyLdThlDlytWYDLwRMN3oBNuCQZYYZj7Cc/BwD
 AxIko6pC3rFvIRXcbSZyzic0tyGxg9XaYbF6QErO/OAqMZvp9qcSA7Gw9pCIabT3nSt4
 JXC3r4wjuyD+6vzTaYSI4gQUcWTwPLT0+Df2ASDdtASRzRniPOgSvo/RYJrPZpHI4Kqm
 G9qA==
X-Gm-Message-State: AOAM530kP6sybakPJ/WcU7JwIDuGd5GluhSUfPCwCn9JwHKTbaVSxS0s
 xyiXS/nzPElvfq+nssZvzk0zwPH32y6/6A==
X-Google-Smtp-Source: ABdhPJxwSNM1TW0ncuCLd31S6JajnjNHIcUBPSg1A25Zw1HQ+hSuvSD8pGOCqyH4VPwwuX7OuMhOXQ==
X-Received: by 2002:a2e:d1a:: with SMTP id 26mr8530486ljn.412.1596925885430;
 Sat, 08 Aug 2020 15:31:25 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id x4sm5803827ljd.34.2020.08.08.15.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 15:31:24 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/4 v2] drm/mcde: Improve pixel fetcher FIFO depth setting
Date: Sun,  9 Aug 2020 00:31:19 +0200
Message-Id: <20200808223122.1492124-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pixel fetcher FIFO depth was just hardcoded to 48
which works fine as long as the framebuffer is 32BPP
and the DSI output is RGB888.

We will need more elaborate handling for some buffer
formats and displays, so start to improve this function
by setting reasonable defaults for 32, 24 and 16 BPP
framebuffers.

Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 34 +++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index cac660ac8803..cbc7c0c4955a 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -333,7 +333,7 @@ static void mcde_configure_overlay(struct mcde *mcde, enum mcde_overlay ovl,
 				   enum mcde_extsrc src,
 				   enum mcde_channel ch,
 				   const struct drm_display_mode *mode,
-				   u32 format)
+				   u32 format, int cpp)
 {
 	u32 val;
 	u32 conf1;
@@ -342,6 +342,7 @@ static void mcde_configure_overlay(struct mcde *mcde, enum mcde_overlay ovl,
 	u32 ljinc;
 	u32 cr;
 	u32 comp;
+	u32 pixel_fetcher_watermark;
 
 	switch (ovl) {
 	case MCDE_OVERLAY_0:
@@ -426,8 +427,33 @@ static void mcde_configure_overlay(struct mcde *mcde, enum mcde_overlay ovl,
 			format);
 		break;
 	}
-	/* The default watermark level for overlay 0 is 48 */
-	val |= 48 << MCDE_OVLXCONF2_PIXELFETCHERWATERMARKLEVEL_SHIFT;
+
+	/*
+	 * Pixel fetch watermark level is max 0x1FFF pixels.
+	 * Two basic rules should be followed:
+	 * 1. The value should be at least 256 bits.
+	 * 2. The sum of all active overlays pixelfetch watermark level
+	 *    multiplied with bits per pixel, should be lower than the
+	 *    size of input_fifo_size in bits.
+	 * 3. The value should be a multiple of a line (256 bits).
+	 */
+	switch (cpp) {
+	case 2:
+		pixel_fetcher_watermark = 128;
+		break;
+	case 3:
+		pixel_fetcher_watermark = 96;
+		break;
+	case 4:
+		pixel_fetcher_watermark = 48;
+		break;
+	default:
+		pixel_fetcher_watermark = 48;
+		break;
+	}
+	dev_dbg(mcde->dev, "pixel fetcher watermark level %d pixels\n",
+		pixel_fetcher_watermark);
+	val |= pixel_fetcher_watermark << MCDE_OVLXCONF2_PIXELFETCHERWATERMARKLEVEL_SHIFT;
 	writel(val, mcde->regs + conf2);
 
 	/* Number of bytes to fetch per line */
@@ -932,7 +958,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	 * channel 0
 	 */
 	mcde_configure_overlay(mcde, MCDE_OVERLAY_0, MCDE_EXTSRC_0,
-			       MCDE_CHANNEL_0, mode, format);
+			       MCDE_CHANNEL_0, mode, format, cpp);
 
 	/*
 	 * Configure pixel-per-line and line-per-frame for channel 0 and then
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
