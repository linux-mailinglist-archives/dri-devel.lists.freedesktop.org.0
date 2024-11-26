Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA699DA453
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04E610EA4C;
	Wed, 27 Nov 2024 09:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Tue, 26 Nov 2024 17:32:21 UTC
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25F510E96B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 17:32:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
 id AD8B51622C; Tue, 26 Nov 2024 18:26:10 +0100 (CET)
From: Nikolaus Voss <nv@vosn.de>
Date: Tue, 26 Nov 2024 16:45:54 +0100
Subject: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nikolaus.voss@haag-streit.com
Message-Id: <20241126172610.AD8B51622C@mail.steuer-voss.de>
X-Mailman-Approved-At: Wed, 27 Nov 2024 09:01:48 +0000
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

LDB clock has to be a fixed multiple of the pixel clock.
As LDB and pixel clock are derived from different clock sources
(at least on imx8mp), this constraint cannot be satisfied for
any pixel clock, which leads to flickering and incomplete
lines on the attached display.

To overcome this, check this condition in mode_fixup() and
adapt the pixel clock accordingly.

Cc: <stable@vger.kernel.org>

Signed-off-by: Nikolaus Voss <nv@vosn.de>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 40 ++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04ff..e341341b8c600 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -104,12 +104,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
 	return container_of(bridge, struct fsl_ldb, bridge);
 }
 
+static unsigned int fsl_ldb_link_freq_factor(const struct fsl_ldb *fsl_ldb)
+{
+	return fsl_ldb_is_dual(fsl_ldb) ? 3500 : 7000;
+}
+
 static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
 {
-	if (fsl_ldb_is_dual(fsl_ldb))
-		return clock * 3500;
-	else
-		return clock * 7000;
+	return clock * fsl_ldb_link_freq_factor(fsl_ldb);
 }
 
 static int fsl_ldb_attach(struct drm_bridge *bridge,
@@ -121,6 +123,35 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
+static bool fsl_ldb_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	const struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	unsigned long requested_link_freq =
+		mode->clock * fsl_ldb_link_freq_factor(fsl_ldb);
+	unsigned long freq = clk_round_rate(fsl_ldb->clk, requested_link_freq);
+
+	if (freq != requested_link_freq) {
+		/*
+		 * this will lead to flicker and incomplete lines on
+		 * the attached display, adjust the CRTC clock
+		 * accordingly.
+		 */
+		int pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb);
+
+		if (adjusted_mode->clock != pclk) {
+			dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d kHz -> %d kHz)!\n",
+				 adjusted_mode->clock, pclk);
+
+			adjusted_mode->clock = pclk;
+			adjusted_mode->crtc_clock = pclk;
+		}
+	}
+
+	return true;
+}
+
 static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
@@ -280,6 +311,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs funcs = {
 	.attach = fsl_ldb_attach,
+	.mode_fixup = fsl_ldb_mode_fixup,
 	.atomic_enable = fsl_ldb_atomic_enable,
 	.atomic_disable = fsl_ldb_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.43.0

