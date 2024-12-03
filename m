Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382919E2BB9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 20:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC9910E0EA;
	Tue,  3 Dec 2024 19:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFF810E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 19:11:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
 id 47B56F7; Tue,  3 Dec 2024 20:11:11 +0100 (CET)
From: Nikolaus Voss <nv@vosn.de>
Date: Tue, 3 Dec 2024 20:09:52 +0100
Subject: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 miquel.raynal@bootlin.com, nikolaus.voss@haag-streit.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <20241203191111.47B56F7@mail.steuer-voss.de>
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

To overcome this, check this condition in .atomic_check() and
adapt the pixel clock accordingly.

Cc: <stable@vger.kernel.org>
Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")

Signed-off-by: Nikolaus Voss <nv@vosn.de>

---
v2:
- use .atomic_check() instead of .mode_fixup() (Dmitry Baryshkov)
- add Fixes tag (Liu Ying)
- use fsl_ldb_link_frequency() and drop const qualifier for
  struct fsl_ldb* (Liu Ying)

 drivers/gpu/drm/bridge/fsl-ldb.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04ff..5b09529564609 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -121,6 +121,38 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
+static int fsl_ldb_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *)
+{
+	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	const struct drm_display_mode *mode = &crtc_state->mode;
+	unsigned long requested_link_freq =
+		fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+	unsigned long freq = clk_round_rate(fsl_ldb->clk, requested_link_freq);
+
+	if (freq != requested_link_freq) {
+		/*
+		 * this will lead to flicker and incomplete lines on
+		 * the attached display, adjust the CRTC clock
+		 * accordingly.
+		 */
+		struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+		int pclk = freq / fsl_ldb_link_frequency(fsl_ldb, 1);
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
+	return 0;
+}
+
 static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
@@ -280,6 +312,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs funcs = {
 	.attach = fsl_ldb_attach,
+	.atomic_check = fsl_ldb_atomic_check,
 	.atomic_enable = fsl_ldb_atomic_enable,
 	.atomic_disable = fsl_ldb_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.43.0

