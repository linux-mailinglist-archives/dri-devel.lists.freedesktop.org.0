Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9756D11B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112F18B061;
	Sun, 10 Jul 2022 19:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A1618B063
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:51 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2D9A883C28;
 Sun, 10 Jul 2022 21:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482289;
 bh=C3odKcQfLu38ggbqMKkZgX7EZ5rqOIHQ/PApTVgkKig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vMoa3OrNwvgVjqqYMkb8koxeky/7j+0dOKKZZtRiYIa8nkY3cL0YUykKAL6V0+oLJ
 9pag1XuxM/uUSCKy9AS9boEg+4oUIZetQ82ejTH2enCFH8tAoAGfExd1bw9x0kD7B6
 HakZt1YO6WYBzZHHMM+X8ylMt+TWRwHHHF9wnYh3O143ySVXKBZFeXAWffNOS7ysBW
 CFaOHaaU6Y6EhxxcIWF4sCdUpzSRifKOhoNrfyMzzrQ9+O2gm7FWAkMFL6gK/uGOmr
 +NUulXrI8j1ccKIqb+dW9UEyK0IE1Yd4w6C4rgcneZICFvCefpQdX6wAS/9VtVUloM
 //eveaGcidb8A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/panel/panel-sitronix-st7701: Enable DSI burst mode,
 LPM, non-continuous clock
Date: Sun, 10 Jul 2022 21:44:30 +0200
Message-Id: <20220710194437.289042-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710194437.289042-1-marex@denx.de>
References: <20220710194437.289042-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ST7701(S) is capable of DSI burst mode, which is more energy
efficient than the non-burst modes. Make use of it.

The ST7701(S) is capable of DSI non-continuous clock, since it
sources the TFT matrix driver clock from internal clock source.
The DSI non-continuous clock further reduce power utilization.

The ST7701(S) uses DSI LPM for command transmissions, make sure
this is configured correctly in the DSI mode flags.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 90b0e90eb6e2..fe9f1d2fcf44 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -334,7 +334,8 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 		return -ENOMEM;
 
 	desc = of_device_get_match_data(&dsi->dev);
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
 
-- 
2.35.1

