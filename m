Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CA693948
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 19:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C5210E416;
	Sun, 12 Feb 2023 18:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 67846 seconds by postgrey-1.36 at gabe;
 Sun, 12 Feb 2023 12:08:52 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1F810E086
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 12:08:52 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PF5q45FzFz9sX0;
 Sun, 12 Feb 2023 13:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676203728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfE8sJ2Fi8pFKSAvvyoCwUemDhq2N1MdT14BaHkKkiQ=;
 b=1rLyIWuFy2QkHYr3CqNdCWKQwYLJ2UZL7PnxfkjO1qf77rEw7vnDakqEPE7JoI26UiAwXO
 plQkr40e5ZC1zDtfsJHeA7ABfyHX5bO+RqXeXOOKf7o8QKUXpPN195f2AiYyV8XbVUcmtI
 q4bNa3YxiKRvDDOtP+5LQOhNd2FFedZwUCTZaVTB5jLGLaGe5lhh/JtpU7Hbwmn3gPeL4D
 4Akdi69cL69bi06SBrI7tMfyq1O1H+JxnZNCDiKdR9+wGCwhuZz5ns81YshmO6Efn/l47m
 XgnumBnWnH/bvnsSk8YFZm7vwKvl2nE8+glQuvYeljjtEuHmqcbdQpuEEvKZGg==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] drm/panel: st7703: Fix resume of XBD599 panel
Date: Sun, 12 Feb 2023 13:08:29 +0100
Message-Id: <20230212120830.46880-2-frank@oltmanns.dev>
In-Reply-To: <20230212120830.46880-1-frank@oltmanns.dev>
References: <20230212120830.46880-1-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4PF5q45FzFz9sX0
X-Mailman-Approved-At: Sun, 12 Feb 2023 18:11:01 +0000
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
Cc: Ondrej Jirman <megi@xff.cz>, Frank Oltmanns <frank@oltmanns.dev>,
 Samuel Holland <samuel@sholland.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In contrast to the JH057N panel, the XBD599 panel does not require a 20
msec delay after initialization and exiting sleep mode. Therefore, move
the delay into the already existing device specific initialization
function.

Also, the timing contraints after entering and exiting sleep mode differ
between the two panels:
 - The JH057N requires a shorter delay than the XDB599 after waking up
   from sleep mode and before enabling the display.
 - The XDB599 requires a delay in order to drain the display of charge,
   which is not required on the JH057N.

Therefore, introduce panel specific functions for the delays.

The XDB599 does not require a 20 msec delay between the SETBGP and
SETVCOM commands. Therefore, remove the delay from the device specific
initialization function.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
Cc: Ondrej Jirman <megi@xff.cz>
Reported-by: Samuel Holland <samuel@sholland.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 40 ++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6747ca237ced..a149341c4a8b 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -66,6 +66,8 @@ struct st7703_panel_desc {
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
 	int (*init_sequence)(struct st7703 *ctx);
+	void (*wait_after_sleep_out)(void);
+	void (*drain_charge)(void);
 };
 
 static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
@@ -126,10 +128,24 @@ static int jh057n_init_sequence(struct st7703 *ctx)
 				   0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
 				   0x37, 0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10,
 				   0x11, 0x18);
+	msleep(20);
 
 	return 0;
 }
 
+static void jh057n_wait_after_sleep_out(void)
+{
+	/*
+	 * Panel is operational 120 msec after reset, i.e. 60 msec after
+	 * sleep out.
+	 */
+	msleep(60);
+}
+
+static void jh057n_drain_charge(void)
+{
+}
+
 static const struct drm_display_mode jh057n00900_mode = {
 	.hdisplay    = 720,
 	.hsync_start = 720 + 90,
@@ -152,6 +168,8 @@ static const struct st7703_panel_desc jh057n00900_panel_desc = {
 		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
 	.format = MIPI_DSI_FMT_RGB888,
 	.init_sequence = jh057n_init_sequence,
+	.wait_after_sleep_out = jh057n_wait_after_sleep_out,
+	.drain_charge = jh057n_drain_charge,
 };
 
 static int xbd599_init_sequence(struct st7703 *ctx)
@@ -273,7 +291,6 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
 			       0x07, /* VREF_SEL = 4.2V */
 			       0x07  /* NVREF_SEL = 4.2V */);
-	msleep(20);
 
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
 			       0x2C, /* VCOMDC_F = -0.67V */
@@ -315,6 +332,18 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 	return 0;
 }
 
+static void xbd599_wait_after_sleep_out(void)
+{
+	msleep(120);
+}
+
+static void xbd599_drain_charge(void)
+{
+	/* Drain diplay of charge, to work correctly on next power on. */
+	msleep(120);
+}
+
+
 static const struct drm_display_mode xbd599_mode = {
 	.hdisplay    = 720,
 	.hsync_start = 720 + 40,
@@ -336,6 +365,8 @@ static const struct st7703_panel_desc xbd599_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
 	.format = MIPI_DSI_FMT_RGB888,
 	.init_sequence = xbd599_init_sequence,
+	.wait_after_sleep_out = xbd599_wait_after_sleep_out,
+	.drain_charge = xbd599_drain_charge,
 };
 
 static int st7703_enable(struct drm_panel *panel)
@@ -350,16 +381,13 @@ static int st7703_enable(struct drm_panel *panel)
 		return ret;
 	}
 
-	msleep(20);
-
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
 		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
 		return ret;
 	}
 
-	/* Panel is operational 120 msec after reset */
-	msleep(60);
+	ctx->desc->wait_after_sleep_out();
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret)
@@ -384,6 +412,8 @@ static int st7703_disable(struct drm_panel *panel)
 	if (ret < 0)
 		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
 
+	ctx->desc->drain_charge();
+
 	return 0;
 }
 
-- 
2.39.1

