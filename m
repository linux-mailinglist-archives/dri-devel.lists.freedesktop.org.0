Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E033E9B15EC
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 09:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF41210E0A1;
	Sat, 26 Oct 2024 07:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="mfpbeBfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190AF10E0A1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 07:27:34 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AC6C18860B;
 Sat, 26 Oct 2024 09:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729927653;
 bh=zIHzHN3g7yDwSf5T5r+L3ve4VAFSRvji/5WAZxW5ix0=;
 h=From:To:Cc:Subject:Date:From;
 b=mfpbeBfjMuNZMsM0vVFQjTfd3TDBTIjp38AgZg23ENzomWRIfNCb8j1u5RFvJrsjy
 cG062wRxeoaRPr2Vvv+GYmUpMUDjmU64oCWkwzNIHnnlOo4ikSAvl2yckrKmZbPbC5
 jScni/CNdfbzNE6gKO+Lj5lpCNT6ovRHfzFXHKkB956MGpKSmEvgxInpBjvUIumgxw
 GawC7oR075qxMUJdJZDgRVlQ4BZa5TeqrZDCK/rPI7oK4WgKCzGR04wqyP/63t1tvm
 vYl3LIf0tKU0b0PqUXH1BkfjnFXLoJcrBHwiITS+sQqUxv1N0DyiL2WlyLZOxeW4ZF
 pK1P/tw1h2FpA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm/bridge: tc358767: Improve DPI output pixel clock
 accuracy
Date: Sat, 26 Oct 2024 09:26:49 +0200
Message-ID: <20241026072716.328105-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Pixel PLL is not very capable and may come up with wildly inaccurate
clock. Since DPI panels are often tolerant to slightly higher pixel clock
without being operated outside of specification, calculate two Pixel PLL
settings for DPI output, one for desired output pixel clock and one for
output pixel clock with 1% increase, and then pick the result which is
closer to the desired pixel clock and use it as the Pixel PLL settings.

For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
without this patch is 65 MHz which is out of the panel specification of
68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
the specification and far more accurate.

Keep the change isolated to DPI output.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
V2: Isolate the change to DPI only, split tc_bridge_mode_set()
---
 drivers/gpu/drm/bridge/tc358767.c | 47 ++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 7968183510e63..84c1429321c43 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1682,15 +1682,39 @@ static int tc_dpi_atomic_check(struct drm_bridge *bridge,
 			       struct drm_connector_state *conn_state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
-	int adjusted_clock = 0;
+	int adjusted_clock_0p = 0;
+	int adjusted_clock_1p = 0;
+	int adjusted_clock;
 	int ret;
 
+	/*
+	 * Calculate adjusted clock pixel and find out what the PLL can
+	 * produce. The PLL is limited, so the clock might be inaccurate.
+	 */
 	ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
 			      crtc_state->mode.clock * 1000,
-			      &adjusted_clock, NULL);
+			      &adjusted_clock_0p, NULL);
 	if (ret)
 		return ret;
 
+	/*
+	 * Calculate adjusted pixel clock with 1% faster requested pixel
+	 * clock and find out what the PLL can produce. This may in fact
+	 * be closer to the expected pixel clock of the output.
+	 */
+	ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
+			      crtc_state->mode.clock * 1010,
+			      &adjusted_clock_1p, NULL);
+	if (ret)
+		return ret;
+
+	/* Pick the more accurate of the two calculated results. */
+	if (crtc_state->mode.clock * 1010 - adjusted_clock_1p <
+	    crtc_state->mode.clock * 1000 - adjusted_clock_0p)
+		adjusted_clock = adjusted_clock_1p;
+	else
+		adjusted_clock = adjusted_clock_0p;
+
 	crtc_state->adjusted_mode.clock = adjusted_clock / 1000;
 
 	/* DSI->DPI interface clock limitation: upto 100 MHz */
@@ -1758,9 +1782,18 @@ tc_edp_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void tc_bridge_mode_set(struct drm_bridge *bridge,
-			       const struct drm_display_mode *mode,
-			       const struct drm_display_mode *adj)
+static void tc_dpi_bridge_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adj)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	drm_mode_copy(&tc->mode, adj);
+}
+
+static void tc_edp_bridge_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adj)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
@@ -1977,7 +2010,7 @@ tc_edp_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
 	.attach = tc_dpi_bridge_attach,
 	.mode_valid = tc_dpi_mode_valid,
-	.mode_set = tc_bridge_mode_set,
+	.mode_set = tc_dpi_bridge_mode_set,
 	.atomic_check = tc_dpi_atomic_check,
 	.atomic_enable = tc_dpi_bridge_atomic_enable,
 	.atomic_disable = tc_dpi_bridge_atomic_disable,
@@ -1991,7 +2024,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.attach = tc_edp_bridge_attach,
 	.detach = tc_edp_bridge_detach,
 	.mode_valid = tc_edp_mode_valid,
-	.mode_set = tc_bridge_mode_set,
+	.mode_set = tc_edp_bridge_mode_set,
 	.atomic_check = tc_edp_atomic_check,
 	.atomic_enable = tc_edp_bridge_atomic_enable,
 	.atomic_disable = tc_edp_bridge_atomic_disable,
-- 
2.45.2

