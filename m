Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A3A6945D7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B1E10E5A1;
	Mon, 13 Feb 2023 12:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B60E10E5A1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:33:00 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4PFkJT1QT4z9sZg;
 Mon, 13 Feb 2023 13:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676291577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmcPQbXPr0WHWnVrlJ8mwjTopUrw6rswtOKlLypnddk=;
 b=NZFX2mxPuZC0QMxzyKG64b39/NlwoN9BX8rR8f/L0XFa9ncEonhvJm6YbHwIT0ZNS3asmm
 E6hI8XoHMs6pcRjQ0vo57FMwigzPILDMOpF8/xG1oMzBH44aD+SiUvEcCtXTAYKO9oY1O3
 bAoSPU3AjUVPBiDELt2skKKOKsOWLR/BlthJvwzWkXXd0SuJ7pwEBl8SmKhrlEvGgCvKVL
 VuuhpjRm3kBfUOi7vNZAhf2hgaJJ0FWw+MNLbHYegQxb2J1Kl5ESS5GZMg0OaDUzOYBsnv
 VRNfeB8LrGFiXlj3R1MOgJ8foO42DGR0nVKkyADFPmnPkB6XmGF++QOx3ICQZQ==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Ondrej Jirman <megi@xff.cz>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/1] drm/panel: st7703: Fix timings when entering/exiting
 sleep
Date: Mon, 13 Feb 2023 13:32:38 +0100
Message-Id: <20230213123238.76889-2-frank@oltmanns.dev>
In-Reply-To: <20230213123238.76889-1-frank@oltmanns.dev>
References: <20230213123238.76889-1-frank@oltmanns.dev>
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
Cc: Frank Oltmanns <frank@oltmanns.dev>, Samuel Holland <samuel@sholland.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix flickering of the pinephone's XDB599 panel that happens after
resume.

Extend the delay after issuing the command to exit sleep mode from 60 to
120 msec as per the controller's specification.

Introduce a 120 msec delay after issuing the command to enter sleep
mode. This is needed in order for the controller to reliably finalize
the sleep in sequence before switching of power supply.

In contrast to the JH057N panel, the XBD599 panel does not require a 20
msec delay after initialization and exiting sleep mode. Therefore, move
the delay into the already existing device specific initialization
function.

The XDB599 does not require a 20 msec delay between the SETBGP and
SETVCOM commands. Therefore, remove the delay from the device specific
initialization function.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
Cc: Ondrej Jirman <megi@xff.cz>
Reported-by: Samuel Holland <samuel@sholland.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6747ca237ced..c49f4ef883fc 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -126,6 +126,7 @@ static int jh057n_init_sequence(struct st7703 *ctx)
 				   0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
 				   0x37, 0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10,
 				   0x11, 0x18);
+	msleep(20);
 
 	return 0;
 }
@@ -273,7 +274,6 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
 			       0x07, /* VREF_SEL = 4.2V */
 			       0x07  /* NVREF_SEL = 4.2V */);
-	msleep(20);
 
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
 			       0x2C, /* VCOMDC_F = -0.67V */
@@ -350,16 +350,14 @@ static int st7703_enable(struct drm_panel *panel)
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
+	/* It takes the controller 120 msec to wake up after sleep. */
+	msleep(120);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret)
@@ -384,6 +382,9 @@ static int st7703_disable(struct drm_panel *panel)
 	if (ret < 0)
 		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
 
+	/* It takes the controller 120 msec to enter sleep mode. */
+	msleep(120);
+
 	return 0;
 }
 
-- 
2.39.1

