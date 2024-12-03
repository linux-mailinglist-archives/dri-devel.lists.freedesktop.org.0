Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ADF9E7E8A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 07:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9334010E1A7;
	Sat,  7 Dec 2024 06:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3174E10E1A7
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 06:23:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
 id 11BC72277; Sat,  7 Dec 2024 07:23:07 +0100 (CET)
From: Nikolaus Voss <nv@vosn.de>
Date: Tue, 3 Dec 2024 10:40:52 +0100
Subject: [PATCH v3] drm: bridge: fsl-ldb: fixup mode on freq mismatch
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
Message-Id: <20241207062307.11BC72277@mail.steuer-voss.de>
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
Although LDB and pixel clock have a common source, this
constraint cannot be satisfied for any pixel clock at a
fixed source clock.

Violating this constraint leads to flickering and distorted
lines on the attached display.

To overcome this, there are these approches:

1. Modify the base PLL clock statically by changing the
   device tree, implies calculating the PLL clock by
   hand, e.g. commit 4fbb73416b10 ("arm64: dts:
   imx8mp-phyboard-pollux: Set Video PLL1 frequency to 506.8 MHz")

2. Walk down the clock tree and modify the source clock.
   Proposed patch series by Miquel Raynal:
   [PATCH 0/5] clk: Fix simple video pipelines on i.MX8

3. This patch: check constraint violation in
   drm_bridge_funcs.atomic_check() and adapt the pixel
   clock in drm_display_mode.adjusted_mode accordingly.

Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
Cc: <stable@vger.kernel.org>
Signed-off-by: Nikolaus Voss <nv@vosn.de>

---
v2:
- use .atomic_check() instead of .mode_fixup() (Dmitry Baryshkov)
- add Fixes tag (Liu Ying)
- use fsl_ldb_link_frequency() and drop const qualifier for
  struct fsl_ldb* (Liu Ying)

v3:
- fix kernel test robot warning: fsl-ldb.c:125:30:
  warning: omitting the parameter name in a function definition
  is a C23 extension [-Wc23-extensions]
- fix/rephrase commit text due to discussion with Marek Vasut,
  Liu Ying and Miquel Raynal
- only calculate and set pixel clock if ldb is not already
  configured to the matching frequency
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04ff..b8e3629e4df4d 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -121,6 +121,37 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
+static int fsl_ldb_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *connector_state)
+{
+	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	const struct drm_display_mode *mode = &crtc_state->mode;
+	unsigned long requested_freq =
+		fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+	unsigned long freq = clk_round_rate(fsl_ldb->clk, requested_freq);
+	unsigned long configured_freq = clk_get_rate(fsl_ldb->clk);
+
+	if ((freq != configured_freq) && (freq != requested_freq)) {
+		/*
+		 * this will lead to flicker and incomplete lines on
+		 * the attached display, adjust the CRTC clock
+		 * accordingly.
+		 */
+		struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+		int pclk = freq / fsl_ldb_link_frequency(fsl_ldb, 1);
+
+		dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d kHz -> %d kHz)!\n",
+			 adjusted_mode->clock, pclk);
+
+		adjusted_mode->clock = pclk;
+		adjusted_mode->crtc_clock = pclk;
+	}
+
+	return 0;
+}
+
 static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
@@ -280,6 +311,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs funcs = {
 	.attach = fsl_ldb_attach,
+	.atomic_check = fsl_ldb_atomic_check,
 	.atomic_enable = fsl_ldb_atomic_enable,
 	.atomic_disable = fsl_ldb_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.43.0

