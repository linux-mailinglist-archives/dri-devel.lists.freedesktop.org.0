Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709697083B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EEE10E27D;
	Sun,  8 Sep 2024 14:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="Xcwgz2+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5198 seconds by postgrey-1.36 at gabe;
 Sun, 08 Sep 2024 14:55:38 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [207.246.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6826C10E27D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725807327; bh=V2dGVPkW7unWHK16HPMh1/1tKtsd3J5CV8rFRUeW/os=;
 b=Xcwgz2+y07DjXft8NL+zfJrIjmZ8fw28DzkAvO75Yq1c3YWf+mmsCKWB6RW3IrXy9wJC8N7UW
 fUcvLtn1GWtp73WlMCHVUxqIwj3NPOOrXAjK/Bru3lzI+fCCE2VkQrk7CDfXPJTC39PhZ/xOWU1
 h03E6Xnq9KHY2XpDPs3oWAnYfww4LjV1ofRPXKjWHGxuanY2fUb5EMeB4pVvkNNiAs8pGgMCZB6
 pZ3J3xhvQCPljW4JqLlkQAoPPCuA/SO04okkwx00X5kxtx2nUk3a8scv4GRsMcUsV0GqbP5g9jt
 u6w/T+WzEO70CmXKY7vqIAeVp8i3eLxkFAHZJVJJ+QlA==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/7] drm/rockchip: dw_hdmi: Filter modes based on
 hdmiphy_clk
Date: Sun,  8 Sep 2024 14:54:58 +0000
Message-ID: <20240908145511.3331451-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908145511.3331451-1-jonas@kwiboo.se>
References: <20240908145511.3331451-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 66ddbadb3c9877b459588e82
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

RK3228 and RK3328 clock rate is being validated against a mpll config
table intended for a Synopsys phy, and not the used inno-hdmi-phy.

Instead get a reference to the hdmiphy clk and validate rates against
it to enable use of HDMI2.0 modes, e.g. 4K@60Hz, on RK3228 and RK3328.

For Synopsis phy the max_tmds_clock validation is sufficient.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Diederik de Haas <didi.debian@cknow.org> # Rock64
---
v2: Collect t-b tag
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 35 ++++++++++-----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 240552eb517f..36cc700766fd 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -76,6 +76,7 @@ struct rockchip_hdmi {
 	struct rockchip_encoder encoder;
 	const struct rockchip_hdmi_chip_data *chip_data;
 	const struct dw_hdmi_plat_data *plat_data;
+	struct clk *hdmiphy_clk;
 	struct clk *ref_clk;
 	struct clk *grf_clk;
 	struct dw_hdmi *hdmi;
@@ -251,10 +252,7 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 			    const struct drm_display_mode *mode)
 {
 	struct rockchip_hdmi *hdmi = data;
-	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
 	int pclk = mode->clock * 1000;
-	bool exact_match = hdmi->plat_data->phy_force_vendor;
-	int i;
 
 	if (hdmi->chip_data->max_tmds_clock &&
 	    mode->clock > hdmi->chip_data->max_tmds_clock)
@@ -263,26 +261,18 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 	if (hdmi->ref_clk) {
 		int rpclk = clk_round_rate(hdmi->ref_clk, pclk);
 
-		if (abs(rpclk - pclk) > pclk / 1000)
+		if (rpclk < 0 || abs(rpclk - pclk) > pclk / 1000)
 			return MODE_NOCLOCK;
 	}
 
-	for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
-		/*
-		 * For vendor specific phys force an exact match of the pixelclock
-		 * to preserve the original behaviour of the driver.
-		 */
-		if (exact_match && pclk == mpll_cfg[i].mpixelclock)
-			return MODE_OK;
-		/*
-		 * The Synopsys phy can work with pixelclocks up to the value given
-		 * in the corresponding mpll_cfg entry.
-		 */
-		if (!exact_match && pclk <= mpll_cfg[i].mpixelclock)
-			return MODE_OK;
+	if (hdmi->hdmiphy_clk) {
+		int rpclk = clk_round_rate(hdmi->hdmiphy_clk, pclk);
+
+		if (rpclk < 0 || abs(rpclk - pclk) > pclk / 1000)
+			return MODE_NOCLOCK;
 	}
 
-	return MODE_BAD;
+	return MODE_OK;
 }
 
 static void dw_hdmi_rockchip_encoder_disable(struct drm_encoder *encoder)
@@ -607,6 +597,15 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
+	if (hdmi->phy) {
+		struct of_phandle_args clkspec;
+
+		clkspec.np = hdmi->phy->dev.of_node;
+		hdmi->hdmiphy_clk = of_clk_get_from_provider(&clkspec);
+		if (IS_ERR(hdmi->hdmiphy_clk))
+			hdmi->hdmiphy_clk = NULL;
+	}
+
 	if (hdmi->chip_data == &rk3568_chip_data) {
 		regmap_write(hdmi->regmap, RK3568_GRF_VO_CON1,
 			     HIWORD_UPDATE(RK3568_HDMI_SDAIN_MSK |
-- 
2.46.0

