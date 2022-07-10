Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8456D11D
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EDE18B062;
	Sun, 10 Jul 2022 19:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489D718B064
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D77FB84613;
 Sun, 10 Jul 2022 21:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482291;
 bh=mNNeh/cfrfZN+kwjyrRCKn7vHbAap7VtDRDs2PXf6h0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s6spzDj6EF87mwj+hJ4ok7niX1QSTcKDYyv05EPcM4UgNxDisZ/RvrQeJqsBBhGgc
 3rJkWDUYYhGpjf2kqUwRvelDLWPkkAmF0+F+XfuNA3fNM4Wvu5FKRZFVx5WhSOng20
 70GyOOBmktXEEiKHNKps+PVwobUoTBZQ8fHpnjkiLTX5kE+uTpLpxeXOURKiU42oHC
 NldnQqaUU1rK762RSU/uNigEj1p3WEtQrx/MrBu0Gtn7BsR7Ysl2E3yUyUWbLlurMM
 8XJKi0Et29kLNCHJj9f+qaE0KRvYYh37CjvfCOPxuE4fgCZrh6BwQ8gnljZqYSfwQg
 bPNaNFAyPlnSQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/panel/panel-sitronix-st7701: Adjust porch control
 bitfield name
Date: Sun, 10 Jul 2022 21:44:34 +0200
Message-Id: <20220710194437.289042-6-marex@denx.de>
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

Define DSI_CMD2_BK0_PORCTRL_VBP_MASK and DSI_CMD2_BK0_PORCTRL_VFP_MASK
and move the vertical back and front porch calculation from macros into
the st7701_init_sequence() function, so it is clear what this does.

No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 57388b1d516f..42e46e804146 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -72,13 +72,13 @@
 #define DSI_CMD2_BK0_LNESET_LINE_MASK	GENMASK(6, 0)
 #define DSI_CMD2_BK0_LNESET_LDE_EN	BIT(7)
 #define DSI_CMD2_BK0_LNESET_LINEDELTA	GENMASK(1, 0)
+#define DSI_CMD2_BK0_PORCTRL_VBP_MASK	GENMASK(7, 0)
+#define DSI_CMD2_BK0_PORCTRL_VFP_MASK	GENMASK(7, 0)
 #define DSI_INVSEL_DEFAULT		GENMASK(5, 4)
 #define DSI_INVSEL_NLINV		GENMASK(2, 0)
 #define DSI_INVSEL_RTNI			GENMASK(2, 1)
 #define DSI_CMD2_BK0_INVSEL_B1		DSI_INVSEL_RTNI
 #define DSI_CMD2_BK0_INVSEL_B0		(DSI_INVSEL_DEFAULT | DSI_INVSEL_NLINV)
-#define DSI_CMD2_BK0_PORCTRL_B0(m)	((m)->vtotal - (m)->vsync_end)
-#define DSI_CMD2_BK0_PORCTRL_B1(m)	((m)->vsync_start - (m)->vdisplay)
 
 /* Command2, BK1 bytes */
 #define DSI_CMD2_BK1_VRHA_SET		0x45
@@ -182,8 +182,10 @@ static void st7701_init_sequence(struct st7701 *st7701)
 		   (linecountrem2 ? DSI_CMD2_BK0_LNESET_LDE_EN : 0),
 		   FIELD_PREP(DSI_CMD2_BK0_LNESET_LINEDELTA, linecountrem2));
 	ST7701_DSI(st7701, DSI_CMD2_BK0_PORCTRL,
-		   DSI_CMD2_BK0_PORCTRL_B0(mode),
-		   DSI_CMD2_BK0_PORCTRL_B1(mode));
+		   FIELD_PREP(DSI_CMD2_BK0_PORCTRL_VBP_MASK,
+			      mode->vtotal - mode->vsync_end),
+		   FIELD_PREP(DSI_CMD2_BK0_PORCTRL_VFP_MASK,
+			      mode->vsync_start - mode->vdisplay));
 	ST7701_DSI(st7701, DSI_CMD2_BK0_INVSEL,
 		   DSI_CMD2_BK0_INVSEL_B0, DSI_CMD2_BK0_INVSEL_B1);
 
-- 
2.35.1

