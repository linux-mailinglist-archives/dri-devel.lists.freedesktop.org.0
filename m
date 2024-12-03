Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804F9E14F0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D943E10E93C;
	Tue,  3 Dec 2024 08:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vdJsfRGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791EC10E93C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:02:49 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7DA41054;
 Tue,  3 Dec 2024 09:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733212941;
 bh=OZy+GzwddoEQ/rtfVYVsaCKHX6Y7QWSvf39qNi9WxKU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vdJsfRGOhGpIDsZYTJj+XkKGWWiGyYSCu5UEWdwijYxNHszU866YzK9r+dnuu18Qj
 /PXP0xyG9AKdtWf1LiViUdISdhO5JXYbyMXxibHmSmji5JY6y0+M8bUz0SOHfdXPQP
 rd21ys8vongZYClhUByZZSUr2qft7PrYgb01/DeQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:38 +0200
Subject: [PATCH 4/9] drm/rcar-du: dsi: Fix PHY lock bit check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-4-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dR3ezdc2V2lwbS/Z56CQfx4yJu0itDQCOe45c+Q1tZM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsdg8TjciFYIibJr6i0ukOIV20YssNSU7e1E
 2ukeUkHc1aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HQAKCRD6PaqMvJYe
 9bsWEACnsgGz7PzpY5XnSaalf0ZCqIXfaDr5nQjlPNB7c/Ad6LLXCLI6MDBsduqlRmnfLaEglF7
 kxdopl6wIaTQ+z42tsgUkSlo/yHKx37TbmSncI9iBWYo7RPufOUpS2ALuNEWor+/qmfyJWdra+q
 Tm3utbeSDBusSCH4bns0kbgf6x0MCJS/PBFi4awOXiqNuNCqlv2Io+VW+jQ3MoP9oFIhZV8FhPw
 vV2JxHW5rJrggz4gDlg7f4SWo3JmC8l9JWCkvGO65ChYvyH53/8xpceEha/B8cHocdnTQxe1KB/
 koxLhStGKKc+DtudjjE3KYYiJjmGY3gkxrt5j+6THCmMar7ePl5lWLFSZFw99yGwhEcAnNzaaOq
 1BKBDd9QETsZUcrX1cs6zgtrvlEMS6khi7KizBRSNWY3jGg52Whm4+dQVSPTyZeI8hJN4sEt3Wa
 gfL2XlKFcRZytrT1kPdehC6UcQtFEA+gvGrrWbsoCFP8nWtW/E4tziL21HsNAqmz7PWfo1EPsiI
 X1SPW2/YoWt2l9PP3ayx3o/AznsSivkqY3N3OSajTGRcdMZpY8CFjsGeGoO/hqaWV/RylfuDbLh
 wjwNmIuIIr+tRgH12QnWhSloInnauNawr6oggDyCmPSg5nbRFhBqTSJSsiLz1k8tqWLpVDYLMiS
 acIiHmVjSWKrlmA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The driver checks for bit 16 (using CLOCKSET1_LOCK define) in CLOCKSET1
register when waiting for the PPI clock. However, the right bit to check
is bit 17 (CLOCKSET1_LOCK_PHY define). Not only that, but there's
nothing in the documents for bit 16 for V3U nor V4H.

So, fix the check to use bit 17, and drop the define for bit 16.

Fixes: 155358310f01 ("drm: rcar-du: Add R-Car DSI driver")
Fixes: 11696c5e8924 ("drm: Place Renesas drivers in a separate dir")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 2dba7c5ffd2c..92f4261305bd 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -587,7 +587,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	for (timeout = 10; timeout > 0; --timeout) {
 		if ((rcar_mipi_dsi_read(dsi, PPICLSR) & PPICLSR_STPST) &&
 		    (rcar_mipi_dsi_read(dsi, PPIDLSR) & PPIDLSR_STPST) &&
-		    (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK))
+		    (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK_PHY))
 			break;
 
 		usleep_range(1000, 2000);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index f8114d11f2d1..a6b276f1d6ee 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -142,7 +142,6 @@
 
 #define CLOCKSET1			0x101c
 #define CLOCKSET1_LOCK_PHY		(1 << 17)
-#define CLOCKSET1_LOCK			(1 << 16)
 #define CLOCKSET1_CLKSEL		(1 << 8)
 #define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
 #define CLOCKSET1_CLKINSEL_DIG		(1 << 2)

-- 
2.43.0

