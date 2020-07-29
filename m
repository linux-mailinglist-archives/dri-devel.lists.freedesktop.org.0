Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627BD231BD3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 11:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265926E49A;
	Wed, 29 Jul 2020 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C7D6E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 09:09:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id g6so11597954ljn.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5j9+loj+Mz1hcLdVnz6rH8vcMvg1KDKApB5fvA4++jM=;
 b=NE52yDaLGNN7BzMNAd0kPnS1Buxcuh7igKTy3/eimAJZa2M3cDnomV4L9BkmhWw8Kw
 mycJutM6L15IKWuqT/sRKfXO2DM5eYlgbCK8MQQ1laRjWKds9a2ZkzkroWc+gkPjebDx
 JMtPO1CXfy+Hb2cMYCC51VaqyEIHmsiDwn5DQf73NZTP9m9d4CtGy3CXJsXLnstUW1to
 2gecf0+5WxiPDUU5Msl7xCRfukA63cK91gw+oAT9np4a6ZRpxg9cLFMBRiJL8f7zEBez
 7gp6sgGfgCc/yfib9ERSj2NL56oYPaOqL85KRIXz14RUrWT3c1tIsanmPbOegJY+CT2h
 u9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5j9+loj+Mz1hcLdVnz6rH8vcMvg1KDKApB5fvA4++jM=;
 b=C/On8759LTg7FmA+BWOYwT2eGYzoe1QF8qmasnIAFNZwmH+hwa9KCPFNHJSARb/+xm
 zWTkWghfIPAJNj61jbAUtEXwFRRM7zyrxhQQxTxyMPaCai4lur5KNXyjpml4x367Vfq5
 lnR2pGwHz5iBcEG4SV5+3JsIKCRhAnnI1kM18skj0YxrRV1g+QPuM/UdywYwtrKfIEx8
 zlU/se1C/R3YgaNzJfjrD1kYdVbcoAIlN2XB/8u04hYNMPe6pDeXDe+cCzvvh232BHoW
 ozOo++USY8dYrTpF5Ed8UdgWmN6q1Lmexd1R1jaTQCjQwvU+4JaOS+8KpJ5tHu4BDGof
 5ilQ==
X-Gm-Message-State: AOAM531CWnF2Gk58yk/Ek/RP3jrVzjcATLWxAfbqsqIWpMEuUAadu/sD
 l9mz9PeZ12Qoyub/eNA6nXA+YtNvCsCywQ==
X-Google-Smtp-Source: ABdhPJxJaUvbcskjoYoPmJima274ak9soDaemoBvkBG00FzCgz/9wPJWFeJJNrlfoUMq6Va/64K38g==
X-Received: by 2002:a2e:844a:: with SMTP id u10mr8068827ljh.213.1596013765532; 
 Wed, 29 Jul 2020 02:09:25 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id x205sm313589lfa.96.2020.07.29.02.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 02:09:24 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/2 v2] drm/mcde: Fix display data flow control
Date: Wed, 29 Jul 2020 11:09:15 +0200
Message-Id: <20200729090915.252730-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729090915.252730-1-linus.walleij@linaro.org>
References: <20200729090915.252730-1-linus.walleij@linaro.org>
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Revamp the way that the flow of data to the display is
defined.

I realized that the hardware supports something like
5 different modes of flow: oneshot, command with TE IRQ,
command with BTA (bus turn around) and TE IRQ, video
with TE IRQ and video without TE IRQ instead synchronizing
to the output of the MCDE DSI formatter.

Like before the selection of the type of flow is done
frome the DSI driver when we attach it to the MCDE and we
get to know what the display wants.

The new video mode synchronization method from the MCDE DSI
formatter is used on some upstream devices such as Golden.
This is the new default for video mode: stateless panels
do not as a rule generate TE IRQs.

Another semantic change is that we stop sending
a TE request before every command when sending data to
a display in command mode: this should only be explicitly
requested when using BTA, according to the vendor driver.

This has been tested and works fine with the command mode
displays I have. (All that are supported upstream.)

Reported-by: Stephan Gerhold <stephan@gerhold.net>
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Select the formatter as synchronization source for the
  video flow, this should be the most common case.
- Set the formatter as sync source for BTA+TE mode as in
  the vendor driver, and insert a comment to help developers.
---
 drivers/gpu/drm/mcde/mcde_display.c | 113 ++++++++++++++++++----------
 drivers/gpu/drm/mcde/mcde_drm.h     |  26 ++++++-
 drivers/gpu/drm/mcde/mcde_drv.c     |   3 -
 drivers/gpu/drm/mcde/mcde_dsi.c     |  19 ++++-
 4 files changed, 111 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 363fa5ca4b45..cac660ac8803 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -89,7 +89,7 @@ void mcde_display_irq(struct mcde *mcde)
 		 * the update function is called, then we disable the
 		 * flow on the channel once we get the TE IRQ.
 		 */
-		if (mcde->oneshot_mode) {
+		if (mcde->flow_mode == MCDE_COMMAND_ONESHOT_FLOW) {
 			spin_lock(&mcde->flow_lock);
 			if (--mcde->flow_active == 0) {
 				dev_dbg(mcde->dev, "TE0 IRQ\n");
@@ -498,19 +498,47 @@ static void mcde_configure_channel(struct mcde *mcde, enum mcde_channel ch,
 	}
 
 	/* Set up channel 0 sync (based on chnl_update_registers()) */
-	if (mcde->video_mode || mcde->te_sync)
+	switch (mcde->flow_mode) {
+	case MCDE_COMMAND_ONESHOT_FLOW:
+		/* Oneshot is achieved with software sync */
+		val = MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SOFTWARE
+			<< MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SHIFT;
+		break;
+	case MCDE_COMMAND_TE_FLOW:
 		val = MCDE_CHNLXSYNCHMOD_SRC_SYNCH_HARDWARE
 			<< MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SHIFT;
-	else
-		val = MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SOFTWARE
+		val |= MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_TE0
+			<< MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_SHIFT;
+		break;
+	case MCDE_COMMAND_BTA_TE_FLOW:
+		val = MCDE_CHNLXSYNCHMOD_SRC_SYNCH_HARDWARE
+			<< MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SHIFT;
+		/*
+		 * TODO:
+		 * The vendor driver uses the formatter as sync source
+		 * for BTA TE mode. Test to use TE if you have a panel
+		 * that uses this mode.
+		 */
+		val |= MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_FORMATTER
+			<< MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_SHIFT;
+		break;
+	case MCDE_VIDEO_TE_FLOW:
+		val = MCDE_CHNLXSYNCHMOD_SRC_SYNCH_HARDWARE
 			<< MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SHIFT;
-
-	if (mcde->te_sync)
 		val |= MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_TE0
 			<< MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_SHIFT;
-	else
+		break;
+	case MCDE_VIDEO_FORMATTER_FLOW:
+		val = MCDE_CHNLXSYNCHMOD_SRC_SYNCH_HARDWARE
+			<< MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SHIFT;
 		val |= MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_FORMATTER
 			<< MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_SHIFT;
+		break;
+	default:
+		dev_err(mcde->dev, "unknown flow mode %d\n",
+			mcde->flow_mode);
+		break;
+	}
 
 	writel(val, mcde->regs + sync);
 
@@ -920,7 +948,11 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	mcde_configure_dsi_formatter(mcde, MCDE_DSI_FORMATTER_0,
 				     formatter_frame, pkt_size);
 
-	if (mcde->te_sync) {
+	switch (mcde->flow_mode) {
+	case MCDE_COMMAND_TE_FLOW:
+	case MCDE_COMMAND_BTA_TE_FLOW:
+	case MCDE_VIDEO_TE_FLOW:
+		/* We are using TE in some comination */
 		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 			val = MCDE_VSCRC_VSPOL;
 		else
@@ -930,16 +962,22 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 		val = readl(mcde->regs + MCDE_CRC);
 		val |= MCDE_CRC_SYCEN0;
 		writel(val, mcde->regs + MCDE_CRC);
+		break;
+	default:
+		/* No TE capture */
+		break;
 	}
 
 	drm_crtc_vblank_on(crtc);
 
-	if (mcde->video_mode)
+	if (mcde_flow_is_video(mcde)) {
 		/*
 		 * Keep FIFO permanently enabled in video mode,
 		 * otherwise MCDE will stop feeding data to the panel.
 		 */
 		mcde_enable_fifo(mcde, MCDE_FIFO_A);
+		dev_dbg(mcde->dev, "started MCDE video FIFO flow\n");
+	}
 
 	dev_info(drm->dev, "MCDE display is enabled\n");
 }
@@ -970,38 +1008,36 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 
 static void mcde_start_flow(struct mcde *mcde)
 {
-	/* Request a TE ACK */
-	if (mcde->te_sync)
+	/* Request a TE ACK only in TE+BTA mode */
+	if (mcde->flow_mode == MCDE_COMMAND_BTA_TE_FLOW)
 		mcde_dsi_te_request(mcde->mdsi);
 
 	/* Enable FIFO A flow */
 	mcde_enable_fifo(mcde, MCDE_FIFO_A);
 
-	if (mcde->te_sync) {
+	/*
+	 * If oneshot mode is enabled, the flow will be disabled
+	 * when the TE0 IRQ arrives in the interrupt handler. Otherwise
+	 * updates are continuously streamed to the display after this
+	 * point.
+	 */
+
+	if (mcde->flow_mode == MCDE_COMMAND_ONESHOT_FLOW) {
+		/* Trigger a software sync out on channel 0 */
+		writel(MCDE_CHNLXSYNCHSW_SW_TRIG,
+		       mcde->regs + MCDE_CHNL0SYNCHSW);
+
 		/*
-		 * If oneshot mode is enabled, the flow will be disabled
-		 * when the TE0 IRQ arrives in the interrupt handler. Otherwise
-		 * updates are continuously streamed to the display after this
-		 * point.
+		 * Disable FIFO A flow again: since we are using TE sync we
+		 * need to wait for the FIFO to drain before we continue
+		 * so repeated calls to this function will not cause a mess
+		 * in the hardware by pushing updates will updates are going
+		 * on already.
 		 */
-		dev_dbg(mcde->dev, "sent TE0 framebuffer update\n");
-		return;
+		mcde_disable_fifo(mcde, MCDE_FIFO_A, true);
 	}
 
-	/* Trigger a software sync out on channel 0 */
-	writel(MCDE_CHNLXSYNCHSW_SW_TRIG,
-	       mcde->regs + MCDE_CHNL0SYNCHSW);
-
-	/*
-	 * Disable FIFO A flow again: since we are using TE sync we
-	 * need to wait for the FIFO to drain before we continue
-	 * so repeated calls to this function will not cause a mess
-	 * in the hardware by pushing updates will updates are going
-	 * on already.
-	 */
-	mcde_disable_fifo(mcde, MCDE_FIFO_A, true);
-
-	dev_dbg(mcde->dev, "sent SW framebuffer update\n");
+	dev_dbg(mcde->dev, "started MCDE FIFO flow\n");
 }
 
 static void mcde_set_extsrc(struct mcde *mcde, u32 buffer_address)
@@ -1060,15 +1096,10 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	 */
 	if (fb) {
 		mcde_set_extsrc(mcde, drm_fb_cma_get_gem_addr(fb, pstate, 0));
-		if (!mcde->video_mode) {
-			/*
-			 * Send a single frame using software sync if the flow
-			 * is not active yet.
-			 */
-			if (mcde->flow_active == 0)
-				mcde_start_flow(mcde);
-		}
-		dev_info_once(mcde->dev, "sent first display update\n");
+		dev_info_once(mcde->dev, "first update of display contents\n");
+		/* The flow is already active in video mode */
+		if (!mcde_flow_is_video(mcde) && mcde->flow_active == 0)
+			mcde_start_flow(mcde);
 	} else {
 		/*
 		 * If an update is receieved before the MCDE is enabled
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index 679c2c4e6d9d..3e406d783465 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -9,6 +9,22 @@
 #ifndef _MCDE_DRM_H_
 #define _MCDE_DRM_H_
 
+enum mcde_flow_mode {
+	/* One-shot mode: flow stops after one frame */
+	MCDE_COMMAND_ONESHOT_FLOW,
+	/* Command mode with tearing effect (TE) IRQ sync */
+	MCDE_COMMAND_TE_FLOW,
+	/*
+	 * Command mode with bus turn-around (BTA) and tearing effect
+	 * (TE) IRQ sync.
+	 */
+	MCDE_COMMAND_BTA_TE_FLOW,
+	/* Video mode with tearing effect (TE) sync IRQ */
+	MCDE_VIDEO_TE_FLOW,
+	/* Video mode with the formatter itself as sync source */
+	MCDE_VIDEO_FORMATTER_FLOW,
+};
+
 struct mcde {
 	struct drm_device drm;
 	struct device *dev;
@@ -18,9 +34,7 @@ struct mcde {
 	struct drm_simple_display_pipe pipe;
 	struct mipi_dsi_device *mdsi;
 	s16 stride;
-	bool te_sync;
-	bool video_mode;
-	bool oneshot_mode;
+	enum mcde_flow_mode flow_mode;
 	unsigned int flow_active;
 	spinlock_t flow_lock; /* Locks the channel flow control */
 
@@ -36,6 +50,12 @@ struct mcde {
 
 #define to_mcde(dev) container_of(dev, struct mcde, drm)
 
+static inline bool mcde_flow_is_video(struct mcde *mcde)
+{
+	return (mcde->flow_mode == MCDE_VIDEO_TE_FLOW ||
+		mcde->flow_mode == MCDE_VIDEO_FORMATTER_FLOW);
+}
+
 bool mcde_dsi_irq(struct mipi_dsi_device *mdsi);
 void mcde_dsi_te_request(struct mipi_dsi_device *mdsi);
 extern struct platform_driver mcde_dsi_driver;
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 80082d6dce3a..1671af101cf2 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -315,9 +315,6 @@ static int mcde_probe(struct platform_device *pdev)
 	mcde->dev = dev;
 	platform_set_drvdata(pdev, drm);
 
-	/* Enable continuous updates: this is what Linux' framebuffer expects */
-	mcde->oneshot_mode = false;
-
 	/* First obtain and turn on the main power */
 	mcde->epod = devm_regulator_get(dev, "epod");
 	if (IS_ERR(mcde->epod)) {
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index f303369305a3..337c4c5e3947 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -148,9 +148,22 @@ static void mcde_dsi_attach_to_mcde(struct mcde_dsi *d)
 {
 	d->mcde->mdsi = d->mdsi;
 
-	d->mcde->video_mode = !!(d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO);
-	/* Enable use of the TE signal for all command mode panels */
-	d->mcde->te_sync = !d->mcde->video_mode;
+	/*
+	 * Select the way the DSI data flow is pushing to the display:
+	 * currently we just support video or command mode depending
+	 * on the type of display. Video mode defaults to using the
+	 * formatter itself for synchronization (stateless video panel).
+	 *
+	 * FIXME: add flags to struct mipi_dsi_device .flags to indicate
+	 * displays that require BTA (bus turn around) so we can handle
+	 * such displays as well. Figure out how to properly handle
+	 * single frame on-demand updates with DRM for command mode
+	 * displays (MCDE_COMMAND_ONESHOT_FLOW).
+	 */
+	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO)
+		d->mcde->flow_mode = MCDE_VIDEO_FORMATTER_FLOW;
+	else
+		d->mcde->flow_mode = MCDE_COMMAND_TE_FLOW;
 }
 
 static int mcde_dsi_host_attach(struct mipi_dsi_host *host,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
