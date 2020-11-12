Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4492B0790
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 15:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD86E231;
	Thu, 12 Nov 2020 14:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993FE6E231
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 14:29:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r9so8714424lfn.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 06:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1ZZkgdRolUng3Hq596bCz1VgHevBtnaN/RxMVu/NJ0=;
 b=zeYQGaCkfRKlST5Cd3yVcDUXNuXEF4DTqo+QLCHAg/89DSinbV7hyWdFPDJtBytcYt
 5/99vDt51t3uyovHkSEWGXOQBKAN2JDznAZeHObt0Kc0d/gBx52gxkOUQ6ydj+rs6N4P
 eXeocuPGyAFR0ZuQ5V03ZX0JYg8mFmuJ/AVVKrhgjTyf5VX2chcBt7XYhY6+ng+eOHuI
 b7uYQmOAxatSIImeao8FWeNCIgziuIbJ750NcuzQgjeo8pJXF17V/VqntQPHNXRKYDdQ
 1GWJFceZHHkC66smfqN9fgVBpLhRKtUMxpsNNbvItKcjjlV6MZivHs82nKEhd1cFVA/C
 UCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1ZZkgdRolUng3Hq596bCz1VgHevBtnaN/RxMVu/NJ0=;
 b=ixyS6zUxBPF+nwXdFbev65J1jVpQMudjq+nI/1ZjmV2YNpkSwraNHLbC4md7CW3bXo
 u58xDCFTNoUgExaMiODyg+bGkFVnAP7+/q1itv5hzfNRlqcX2PmalGM6rI4fR4dPkdBC
 gyz5LF35ED34fOoNOsFa8g0tBigPc8FeswifpPIyR91q+PBlFoONFXT4n2h/pnbmAl5Y
 8v+Tgg1mPmg94aTp9qtbrJl4zUWIZZKNX0tAjHBm+u2xm9QtiZJWHmkSWjMpx/LA+aKW
 8HBrTUUs6VJ+s+lLenSlMBA0+mGgeunCLChh2dlKJMuvIBVWDjlWo2OwgVACXsNJm7yQ
 eIvw==
X-Gm-Message-State: AOAM531KrhwzbpN4IkBtNfgbIzl86pfREb3DYeu8bXj4bV8ZwrhnaP/B
 AahZxNgiI+A6SZbeTCWYQabIiSrdZ6SjOg==
X-Google-Smtp-Source: ABdhPJwRG5K6waVOySwjA0m/u1JXvBb17oUD05ZeiByjVgs9+dUGDsm+VTMrxbDJpf5k2PXLbsOAXw==
X-Received: by 2002:a19:7f8e:: with SMTP id
 a136mr12754104lfd.524.1605191370804; 
 Thu, 12 Nov 2020 06:29:30 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id o21sm206956lfg.40.2020.11.12.06.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:29:30 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/2] drm/mcde: Break out DSI set-up routine
Date: Thu, 12 Nov 2020 15:29:24 +0100
Message-Id: <20201112142925.2571179-1-linus.walleij@linaro.org>
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
Cc: upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To be able to support DPI without messing things up we
first break out the DSI set-up to a separate function.

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: phone-devel@vger.kernel.org
Cc: upstreaming@lists.sr.ht
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 135 +++++++++++++++-------------
 1 file changed, 75 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index c271e5bf042e..66a07e340f8a 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -860,74 +860,44 @@ static int mcde_dsi_get_pkt_div(int ppl, int fifo_size)
 	return 1;
 }
 
-static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *cstate,
-				struct drm_plane_state *plane_state)
+static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mode,
+			   int cpp, int *fifo_wtrmrk_lvl, int *dsi_formatter_frame,
+			   int *dsi_pkt_size)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
-	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = to_mcde(drm);
-	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
-	u32 format = fb->format->format;
 	u32 formatter_ppl = mode->hdisplay; /* pixels per line */
 	u32 formatter_lpf = mode->vdisplay; /* lines per frame */
-	int pkt_size, fifo_wtrmrk;
-	int cpp = fb->format->cpp[0];
+	int formatter_frame;
 	int formatter_cpp;
-	struct drm_format_name_buf tmp;
-	u32 formatter_frame;
+	int fifo_wtrmrk;
 	u32 pkt_div;
+	int pkt_size;
 	u32 val;
-	int ret;
 
-	/* This powers up the entire MCDE block and the DSI hardware */
-	ret = regulator_enable(mcde->epod);
-	if (ret) {
-		dev_err(drm->dev, "can't re-enable EPOD regulator\n");
-		return;
-	}
-
-	dev_info(drm->dev, "enable MCDE, %d x %d format %s\n",
-		 mode->hdisplay, mode->vdisplay,
-		 drm_get_format_name(format, &tmp));
-	if (!mcde->mdsi) {
-		/* TODO: deal with this for non-DSI output */
-		dev_err(drm->dev, "no DSI master attached!\n");
-		return;
-	}
+	dev_info(mcde->dev, "output in %s mode, format %dbpp\n",
+		 (mcde->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) ?
+		 "VIDEO" : "CMD",
+		 mipi_dsi_pixel_format_to_bpp(mcde->mdsi->format));
+	formatter_cpp =
+		mipi_dsi_pixel_format_to_bpp(mcde->mdsi->format) / 8;
+	dev_info(mcde->dev, "Overlay CPP: %d bytes, DSI formatter CPP %d bytes\n",
+		 cpp, formatter_cpp);
 
 	/* Set up the main control, watermark level at 7 */
 	val = 7 << MCDE_CONF0_IFIFOCTRLWTRMRKLVL_SHIFT;
-	/* 24 bits DPI: connect LSB Ch B to D[0:7] */
+
+	/*
+	 * This is the internal silicon muxing of the DPI
+	 * (parallell display) lines. Since we are not using
+	 * this at all (we are using DSI) these are just
+	 * dummy values from the vendor tree.
+	 */
 	val |= 3 << MCDE_CONF0_OUTMUX0_SHIFT;
-	/* TV out: connect LSB Ch B to D[8:15] */
 	val |= 3 << MCDE_CONF0_OUTMUX1_SHIFT;
-	/* Don't care about this muxing */
 	val |= 0 << MCDE_CONF0_OUTMUX2_SHIFT;
-	/* 24 bits DPI: connect MID Ch B to D[24:31] */
 	val |= 4 << MCDE_CONF0_OUTMUX3_SHIFT;
-	/* 5: 24 bits DPI: connect MSB Ch B to D[32:39] */
 	val |= 5 << MCDE_CONF0_OUTMUX4_SHIFT;
-	/* Syncmux bits zero: DPI channel A and B on output pins A and B resp */
 	writel(val, mcde->regs + MCDE_CONF0);
 
-	/* Clear any pending interrupts */
-	mcde_display_disable_irqs(mcde);
-	writel(0, mcde->regs + MCDE_IMSCERR);
-	writel(0xFFFFFFFF, mcde->regs + MCDE_RISERR);
-
-	dev_info(drm->dev, "output in %s mode, format %dbpp\n",
-		 (mcde->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) ?
-		 "VIDEO" : "CMD",
-		 mipi_dsi_pixel_format_to_bpp(mcde->mdsi->format));
-	formatter_cpp =
-		mipi_dsi_pixel_format_to_bpp(mcde->mdsi->format) / 8;
-	dev_info(drm->dev, "overlay CPP %d bytes, DSI CPP %d bytes\n",
-		 cpp,
-		 formatter_cpp);
-
 	/* Calculations from mcde_fmtr_dsi.c, fmtr_dsi_enable_video() */
 
 	/*
@@ -948,9 +918,9 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 		/* The FIFO is 640 entries deep on this v3 hardware */
 		pkt_div = mcde_dsi_get_pkt_div(mode->hdisplay, 640);
 	}
-	dev_dbg(drm->dev, "FIFO watermark after flooring: %d bytes\n",
+	dev_dbg(mcde->dev, "FIFO watermark after flooring: %d bytes\n",
 		fifo_wtrmrk);
-	dev_dbg(drm->dev, "Packet divisor: %d bytes\n", pkt_div);
+	dev_dbg(mcde->dev, "Packet divisor: %d bytes\n", pkt_div);
 
 	/* NOTE: pkt_div is 1 for video mode */
 	pkt_size = (formatter_ppl * formatter_cpp) / pkt_div;
@@ -958,16 +928,61 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	if (!(mcde->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO))
 		pkt_size++;
 
-	dev_dbg(drm->dev, "DSI packet size: %d * %d bytes per line\n",
+	dev_dbg(mcde->dev, "DSI packet size: %d * %d bytes per line\n",
 		pkt_size, pkt_div);
-	dev_dbg(drm->dev, "Overlay frame size: %u bytes\n",
+	dev_dbg(mcde->dev, "Overlay frame size: %u bytes\n",
 		mode->hdisplay * mode->vdisplay * cpp);
-	mcde->stride = mode->hdisplay * cpp;
-	dev_dbg(drm->dev, "Overlay line stride: %u bytes\n",
-		mcde->stride);
 	/* NOTE: pkt_div is 1 for video mode */
 	formatter_frame = pkt_size * pkt_div * formatter_lpf;
-	dev_dbg(drm->dev, "Formatter frame size: %u bytes\n", formatter_frame);
+	dev_dbg(mcde->dev, "Formatter frame size: %u bytes\n", formatter_frame);
+
+	*fifo_wtrmrk_lvl = fifo_wtrmrk;
+	*dsi_pkt_size = pkt_size;
+	*dsi_formatter_frame = formatter_frame;
+}
+
+static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
+				struct drm_crtc_state *cstate,
+				struct drm_plane_state *plane_state)
+{
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane *plane = &pipe->plane;
+	struct drm_device *drm = crtc->dev;
+	struct mcde *mcde = to_mcde(drm);
+	const struct drm_display_mode *mode = &cstate->mode;
+	struct drm_framebuffer *fb = plane->state->fb;
+	u32 format = fb->format->format;
+	int dsi_pkt_size;
+	int fifo_wtrmrk;
+	int cpp = fb->format->cpp[0];
+	struct drm_format_name_buf tmp;
+	u32 dsi_formatter_frame;
+	u32 val;
+	int ret;
+
+	/* This powers up the entire MCDE block and the DSI hardware */
+	ret = regulator_enable(mcde->epod);
+	if (ret) {
+		dev_err(drm->dev, "can't re-enable EPOD regulator\n");
+		return;
+	}
+
+	dev_info(drm->dev, "enable MCDE, %d x %d format %s\n",
+		 mode->hdisplay, mode->vdisplay,
+		 drm_get_format_name(format, &tmp));
+
+
+	/* Clear any pending interrupts */
+	mcde_display_disable_irqs(mcde);
+	writel(0, mcde->regs + MCDE_IMSCERR);
+	writel(0xFFFFFFFF, mcde->regs + MCDE_RISERR);
+
+	mcde_setup_dsi(mcde, mode, cpp, &fifo_wtrmrk,
+		       &dsi_formatter_frame, &dsi_pkt_size);
+
+	mcde->stride = mode->hdisplay * cpp;
+	dev_dbg(drm->dev, "Overlay line stride: %u bytes\n",
+		 mcde->stride);
 
 	/* Drain the FIFO A + channel 0 pipe so we have a clean slate */
 	mcde_drain_pipe(mcde, MCDE_FIFO_A, MCDE_CHANNEL_0);
@@ -1011,7 +1026,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 
 	/* Configure the DSI formatter 0 for the DSI panel output */
 	mcde_configure_dsi_formatter(mcde, MCDE_DSI_FORMATTER_0,
-				     formatter_frame, pkt_size);
+				     dsi_formatter_frame, dsi_pkt_size);
 
 	switch (mcde->flow_mode) {
 	case MCDE_COMMAND_TE_FLOW:
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
