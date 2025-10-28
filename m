Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA9C175C4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C40E10E6B3;
	Tue, 28 Oct 2025 23:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tThfYyYm";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Y9bDExYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3807510E6B4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 23:30:33 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cx67D0Djbz9tjp;
 Wed, 29 Oct 2025 00:30:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzfK9Y5NLqr9G8FkzozkN0QB3F1BZawtNbqgUESYOWU=;
 b=tThfYyYm2z83D98ny/6+9IjVU+Fd8vk68ZHrpe3keNOk8PQHD1dFYGnECgRfghvAudu9KH
 pDiu1kV1Jjgkto5og659ZwJfvXYxM08sDRzBNWItTyrPVc4g/MgqumbSVo3Pspf/3m3b1t
 5Pbw+kCApzM+z/2kmcYb3gRdbaZ4GPFJmdDilBtSMT0XSdDmK9Ef/M3QZxHzOAAgTR+p15
 Qq31IJErdTSCAzYyT5R7PxQvn0tEjdrK1luou+75XtRZcjE9h+yXsjCy39p5BKQqSRWVgm
 UkRGbcSOxG3sn9nZc2Szrg8Gg+iBeUzM/P+4qu4t510Dm1qtNmra3XqBbUaVJw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761694229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzfK9Y5NLqr9G8FkzozkN0QB3F1BZawtNbqgUESYOWU=;
 b=Y9bDExYoNbcMEDJP9mW6n/a6Aj4E8h1zxrQlT4li8SeNee/240CvprMC1gC+JipweYuKHO
 Yn0QzVD2nhGUESdgpCcSakDKHw2BRQFSOSzrbSN+fvg9tqIF2LT49cH59oT8TK4/a5x21V
 WMXHVzFPS6JMcOKxAGW0Ff07n6w9zhSvrqDrjXVhQFhCU0O1KtsHA8HRg+psKDvussUHcO
 1V+7sC8cfn3vi1Hk5zKoM4ruScG8l/2g4GG0kJ+zRiOp/7rr9l64kNbG25WclNn/LPKVM4
 j97MxCETqMr+P962s+mZthFMgDVMKvW0yHzz9zrO8tHYn204wRvCsP/x3EM08A==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 08/11] drm/rcar-du: dsi: Respect DSI mode flags
Date: Wed, 29 Oct 2025 00:28:18 +0100
Message-ID: <20251028232959.109936-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ed05a3ed18404693b0d
X-MBO-RS-META: uagwfznw9jkucm5nztumeamg1osth38m
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

Cache DSI mode flags in new mode_flags member of struct rcar_mipi_dsi .
Configure TXVMSETR register based on the content of DSI mode flags in
case the controller operates in video mode.

Rename TXVMSETR_H..BPEN_EN to TXVMSETR_H..BPEN and drop TXVMSETR_H..BPEN_DIS
which resolves to 0. Update TXVMSETR_VSEN in the same manner. Replace
TXVMSETR_SYNSEQ_PULSES with a code comment next to TXVMSETR_SYNSEQ_EVENTS
because TXVMSETR_SYNSEQ_PULSES resolves to 0.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add RB from Laurent
V3: No change
V4: Add RB from Tomi
---
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    | 18 +++++++++++++++---
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   | 15 +++++----------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index f6427476feb72..78e512de7cf96 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -72,6 +72,7 @@ struct rcar_mipi_dsi {
 	} clocks;
 
 	enum mipi_dsi_pixel_format format;
+	unsigned long mode_flags;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 };
@@ -474,9 +475,19 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 	}
 
 	/* Configuration for Blanking sequence and Input Pixel */
-	setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN
-	     | TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES
-	     | TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
+	setr = TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
+
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
+			setr |= TXVMSETR_SYNSEQ_EVENTS;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
+			setr |= TXVMSETR_HFPBPEN;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
+			setr |= TXVMSETR_HBPBPEN;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
+			setr |= TXVMSETR_HSABPEN;
+	}
+
 	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
 
 	/* Configuration for Video Parameters */
@@ -917,6 +928,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
+	dsi->mode_flags = device->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
 						  1, 0);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index cfaa9b345308f..75b0ae207a640 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -140,19 +140,14 @@
  * Video Mode Register
  */
 #define TXVMSETR			0x180
-#define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
-#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
+#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16) /* 0:Pulses 1:Events */
 #define TXVMSETR_VSTPM			(1 << 15)
 #define TXVMSETR_PIXWDTH_MASK		(7 << 8)
 #define TXVMSETR_PIXWDTH		(1 << 8) /* Only allowed value */
-#define TXVMSETR_VSEN_EN		(1 << 4)
-#define TXVMSETR_VSEN_DIS		(0 << 4)
-#define TXVMSETR_HFPBPEN_EN		(1 << 2)
-#define TXVMSETR_HFPBPEN_DIS		(0 << 2)
-#define TXVMSETR_HBPBPEN_EN		(1 << 1)
-#define TXVMSETR_HBPBPEN_DIS		(0 << 1)
-#define TXVMSETR_HSABPEN_EN		(1 << 0)
-#define TXVMSETR_HSABPEN_DIS		(0 << 0)
+#define TXVMSETR_VSEN			(1 << 4)
+#define TXVMSETR_HFPBPEN		(1 << 2)
+#define TXVMSETR_HBPBPEN		(1 << 1)
+#define TXVMSETR_HSABPEN		(1 << 0)
 
 #define TXVMCR				0x190
 #define TXVMCR_VFCLR			(1 << 12)
-- 
2.51.0

