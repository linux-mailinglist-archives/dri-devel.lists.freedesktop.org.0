Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAAC8D632
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D380310E7AC;
	Thu, 27 Nov 2025 08:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gx8YLxZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9234110E7B4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:43:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4B7254E41916;
 Thu, 27 Nov 2025 08:43:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 063566068C;
 Thu, 27 Nov 2025 08:43:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E623F102F260E; Thu, 27 Nov 2025 09:42:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764232980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=z7qp01XB6E83lne7S4ATIFt+HhSlAN3EBRwIPYSMTfE=;
 b=gx8YLxZAfeGqgRDUyCt+MztDqfdrXHdF7tjVFHq1dY++7VM+hZWH3N7XOPV3LOVDlp+o7N
 VKFDDncONMVoa4QIuDytCiQz0UQXfZobq4O6h5t6yo9+vL9Ydin12zuBQx9R1MTc5rJHST
 ciZ5/3nqbfcIBbu+uR01hmyGevESnW9RbD/c/LX5mCn0xEL9RXfuRR9CLmV5RADrLFniLv
 a8sv1xcV+T2SjDAKa5PE/hT7FkkNJQDZANaxVNE2KA7hKQT/7u/mDOxIqY4hllHOeNy59Q
 i3A5XiPhRP+sNE/cs7+r607GMPrOgFFpZs3KztCmf8XTLqfSOMEsCN3bs+ni2w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 27 Nov 2025 09:42:40 +0100
Subject: [PATCH] drm/bridge: ti-sn65dsi83: ignore PLL_UNLOCK errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251127-drm-ti-sn65dsi83-ignore-pll-unlock-v1-1-8a03fdf562e9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAPKGkC/x3NwQrCMAyA4VcZORuw0Y7pq8gOXRtnsKajURmMv
 bvF43f5/w2Mq7DBtdug8ldMija4QwfxEXRmlNQMdCTvHPWY6gvfgqa9TybDCWXWUhmXnPGjucQ
 nngMNIdCFJx+hhZbKd1n/k9u47z8+/T7mdAAAAA==
X-Change-ID: 20251126-drm-ti-sn65dsi83-ignore-pll-unlock-4a28aa29eb5c
To: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Philippe Schenker <philippe.schenker@impulsing.ch>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

On hardware based on Toradex Verdin AM62 the recovery mechanism added by
commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery
mechanism") has been reported [0] to make the display turn on and off and
and the kernel logging "Unexpected link status 0x01".

According to the report, the error recovery mechanism is triggered by the
PLL_UNLOCK error going active. Analysis suggested the board is unable to
provide the correct DSI clock neede by the SN65DSI84, to which the TI
SN65DSI84 reacts by raising the PLL_UNLOCK, while the display still works
apparently without issues.

On other hardware, where all the clocks are within the components
specifications, the PLL_UNLOCK bit does not trigger while the display is in
normal use. It can trigger for e.g. electromagnetic interference, which is
a transient event and exactly the reason why the error recovery mechanism
has been implemented.

Idelly the PLL_UNLOCK bit could be ignored when working out of
specification, but this requires to detect in software whether it triggers
because the device is working out of specification but visually correctly
for the user or for good reasons (e.g. EMI, or even because working out of
specifications but compromising the visual output).

The ongoing analysis as of this writing [1][2] has not yet found a way for
the driver to discriminate among the two cases. So as a temporary measure
mask the PLL_UNLOCK error bit unconditionally.

[0] https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42
[1] https://lore.kernel.org/all/b71e941c-fc8a-4ac1-9407-0fe7df73b412@gmail.com/
[2] https://lore.kernel.org/all/20251125103900.31750-1-francesco@dolcini.it/

Closes: https://lore.kernel.org/r/bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42
Cc: stable@vger.kernel.org # 6.15+
Co-developed-by: Hervé Codina <herve.codina@bootlin.com>
Signed-off-by: Hervé Codina <herve.codina@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Francesco, Emanuele, João: can you please apply this patch and report
whether the display on the affected boards gets back to working as before?

Cc: João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>
Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552..fffb47b62f43 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -429,7 +429,14 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
 	 */
 
 	ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
-	if (ret || irq_stat) {
+
+	/*
+	 * Some hardware (Toradex Verdin AM62) is known to report the
+	 * PLL_UNLOCK error interrupt while working without visible
+	 * problems. In lack of a reliable way to discriminate such cases
+	 * from user-visible PLL_UNLOCK cases, ignore that bit entirely.
+	 */
+	if (ret || irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK) {
 		/*
 		 * IRQ acknowledged is not always possible (the bridge can be in
 		 * a state where it doesn't answer anymore). To prevent an
@@ -654,7 +661,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	if (ctx->irq) {
 		/* Enable irq to detect errors */
 		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
-		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff);
+		regmap_write(ctx->regmap, REG_IRQ_EN, 0xff & ~REG_IRQ_EN_CHA_PLL_UNLOCK_EN);
 	} else {
 		/* Use the polling task */
 		sn65dsi83_monitor_start(ctx);

---
base-commit: c884ee70b15a8d63184d7c1e02eba99676a6fcf7
change-id: 20251126-drm-ti-sn65dsi83-ignore-pll-unlock-4a28aa29eb5c

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

