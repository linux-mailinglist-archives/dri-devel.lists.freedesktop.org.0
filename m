Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CAF4B3579
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 15:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC65710E470;
	Sat, 12 Feb 2022 14:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1782D10E161
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644675569;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=85VAZNuu0z1bN9MxYW4uH2B00Go3jp3bKylcOi2Byxs=;
 b=rc/Fc/IOGjosKwkQcNEMs7JkgSXK5WZdICMAQNoO/81cxdnXiGadZGKpxtgOEk08Ht
 JAvwHJVv1LJPgJYZxRVHejRtxoD04eb/t2kklG1uA1WRM65B5xGkUoJYJVq5HXPYx70t
 c5oqeaOdQDjtRnQOKkvNR+DunF0i+03PA8KVkesMpwtL3KwW0Z5gYeKstH5ll7FBKEB6
 Q+Qo5mHnPn+fyDJLrga0KRCo+CNAIwve6R/TrHw7cCImbjWpzQ/Z28J/b5TCw0Q8BKKF
 jtRSM/bxhhGTU2BO04IixUK9TdxYWGBOciX9F507SgzBd/UXeAOGWmWRLwBBizXmXjr9
 iZFQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVblcdY="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y1CEJTsqS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 12 Feb 2022 15:19:29 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v14 1/9] drm/ingenic: Add support for JZ4780 and HDMI output
Date: Sat, 12 Feb 2022 15:19:19 +0100
Message-Id: <31eff2819f94fefcb01aa5cb23c79ccf302d9238.1644675566.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1644675566.git.hns@goldelico.com>
References: <cover.1644675566.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Ezequiel Garcia <ezequiel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

Add support for the LCD controller present on JZ4780 SoCs.
This SoC uses 8-byte descriptors which extend the current
4-byte descriptors used for other Ingenic SoCs.

Note that plane f0 is not working and disabled to be
seen from user-space.

Tested on MIPS Creator CI20 board.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 7f10d6eed549d..dcf44cb00821f 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -65,8 +65,10 @@ struct ingenic_dma_hwdescs {
 struct jz_soc_info {
 	bool needs_dev_clk;
 	bool has_osd;
+	bool has_alpha;
 	bool map_noncoherent;
 	bool use_extended_hwdesc;
+	bool plane_f0_not_working;
 	unsigned int max_width, max_height;
 	const u32 *formats_f0, *formats_f1;
 	unsigned int num_formats_f0, num_formats_f1;
@@ -453,7 +455,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc)
 		return 0;
 
-	if (plane == &priv->f0)
+	if (priv->soc_info->plane_f0_not_working && plane == &priv->f0)
 		return -EINVAL;
 
 	crtc_state = drm_atomic_get_existing_crtc_state(state,
@@ -1055,6 +1057,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	long parent_rate;
 	unsigned int i, clone_mask = 0;
 	int ret, irq;
+	u32 osdc = 0;
 
 	soc_info = of_device_get_match_data(dev);
 	if (!soc_info) {
@@ -1312,7 +1315,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 	/* Enable OSD if available */
 	if (soc_info->has_osd)
-		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
+		osdc |= JZ_LCD_OSDC_OSDEN;
+	if (soc_info->has_alpha)
+		osdc |= JZ_LCD_OSDC_ALPHAEN;
+	regmap_write(priv->map, JZ_REG_LCD_OSDC, osdc);
 
 	mutex_init(&priv->clk_mutex);
 	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
@@ -1511,7 +1517,9 @@ static const struct jz_soc_info jz4770_soc_info = {
 static const struct jz_soc_info jz4780_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = true,
+	.has_alpha = true,
 	.use_extended_hwdesc = true,
+	.plane_f0_not_working = true,	/* REVISIT */
 	.max_width = 4096,
 	.max_height = 2048,
 	.formats_f1 = jz4770_formats_f1,
-- 
2.33.0

