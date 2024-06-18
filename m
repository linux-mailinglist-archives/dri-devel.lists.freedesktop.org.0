Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF890C4C6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133D410E5C7;
	Tue, 18 Jun 2024 08:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Ru+bK7YM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CE610E5C7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:15:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45I8ELZl011948;
 Tue, 18 Jun 2024 03:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718698461;
 bh=s94q1tPiu8M9+ocGs4RmWKfrtotRpRb19F3/NRL+Z/Q=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Ru+bK7YMgbPPlbYuwHm47gmLjVDphEtpkla3Qv+qylqa7PuYNtyHXCCQ5/iGXxs6d
 5J+nW53WadCcpwBVBIAHJsWbP3F97lrJbnMyfJTDqJCNKrMCvAEFsZFmviW/9BoKNe
 Hbhfd5PrlYNSYScGcqR/MbeZhbCTMryIl0hVVKxM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45I8EL7a025066
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Jun 2024 03:14:21 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 03:14:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 03:14:20 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.55])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45I8EKtQ116972;
 Tue, 18 Jun 2024 03:14:20 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <j-choudhary@ti.com>
CC: <linux-kernel@vger.kernel.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <spanda@codeaurora.org>, <a-bhatia1@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Add atomic_check hook for
 the bridge
Date: Tue, 18 Jun 2024 13:44:17 +0530
Message-ID: <20240618081418.250953-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618081418.250953-1-j-choudhary@ti.com>
References: <20240618081418.250953-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Add the atomic_check hook to ensure that the parameters are within the
valid range.
As of now, dsi clock freqency is being calculated in bridge_enable but
this needs to be checked in atomic_check which is called before
bridge_enable so move this calculation to atomic_check and write the
register value in bridge_enable as it is.

For now, add mode clock check for the max resolution supported by the
bridge as mentioned in the SN65DSI86 datasheet[0] and dsi clock range
check for SN_DSIA_CLK_FREQ_REG.
According to the datasheet[0], the minimum value for that reg is 0x08
and the maximum value is 0x96. So add check for that.

[0]: <https://www.ti.com/lit/gpn/sn65dsi86>

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 65 +++++++++++++++++++--------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 84698a0b27a8..d13b42d7c512 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -113,6 +113,20 @@
 
 #define MIN_DSI_CLK_FREQ_MHZ	40
 
+/*
+ * NOTE: DSI clock frequency range: [40MHz,755MHz)
+ * DSI clock frequency range is in 5-MHz increments
+ * So [40MHz,45MHz) translates to 0x08 (min value)
+ * And [750MHz,755MHz) translates to 0x96 (max value)
+ */
+#define MIN_DSI_CLK_RANGE	0x8
+#define MAX_DSI_CLK_RANGE	0x96
+
+/* Pixel clock to support max resolution (4K@60Hz) supported
+ * by the bridge.
+ */
+#define SN65DSI86_MAX_PIXEL_CLOCK_KHZ 600000
+
 /* fudge factor required to account for 8b/10b encoding */
 #define DP_CLK_FUDGE_NUM	10
 #define DP_CLK_FUDGE_DEN	8
@@ -191,6 +205,7 @@ struct ti_sn65dsi86 {
 	u8				ln_polrs;
 	bool				comms_enabled;
 	struct mutex			comms_mutex;
+	u32				dsi_clk_range;
 
 #if defined(CONFIG_OF_GPIO)
 	struct gpio_chip		gchip;
@@ -820,24 +835,6 @@ static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
 }
 
-static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
-{
-	unsigned int bit_rate_mhz, clk_freq_mhz;
-	unsigned int val;
-	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
-
-	/* set DSIA clk frequency */
-	bit_rate_mhz = (mode->clock / 1000) *
-			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
-	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
-
-	/* for each increment in val, frequency increases by 5MHz */
-	val = (MIN_DSI_CLK_FREQ_MHZ / 5) +
-		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
-	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
-}
-
 static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
 {
 	if (connector->display_info.bpc <= 6)
@@ -1104,7 +1101,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 			   pdata->ln_polrs << LN_POLRS_OFFSET);
 
 	/* set dsi clk frequency value */
-	ti_sn_bridge_set_dsi_rate(pdata);
+	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, pdata->dsi_clk_range);
 
 	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
@@ -1215,6 +1212,35 @@ static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
 	return drm_edid_read_ddc(connector, &pdata->aux.ddc);
 }
 
+static int ti_sn_bridge_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	struct drm_display_mode *mode = &crtc_state->mode;
+	unsigned int bit_rate_mhz, clk_freq_mhz;
+
+	/* Pixel clock check */
+	if (mode->clock > SN65DSI86_MAX_PIXEL_CLOCK_KHZ)
+		return -EINVAL;
+
+	bit_rate_mhz = (mode->clock / 1000) *
+			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
+	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
+
+	/* for each increment in dsi_clk_range, frequency increases by 5MHz */
+	pdata->dsi_clk_range = (MIN_DSI_CLK_FREQ_MHZ / 5) +
+		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
+
+	/* SN_DSIA_CLK_FREQ_REG check */
+	if (pdata->dsi_clk_range > MAX_DSI_CLK_RANGE ||
+	    pdata->dsi_clk_range < MIN_DSI_CLK_RANGE)
+		return -EINVAL;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
@@ -1228,6 +1254,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_check = ti_sn_bridge_atomic_check,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
-- 
2.25.1

