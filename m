Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373094B3601
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 16:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF8510E2B3;
	Sat, 12 Feb 2022 15:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [85.215.255.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280CE10E39E
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644681059;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=zCXgJblTF+rQHVFbLwGtG0urpFfPwR+Q4AYo+sbdsy4=;
 b=Tnvpyhcaqr7gO81LE15meAOPLo7jocbovw18AxrBAViz8pJsiqqn7IJwCWrdFZ0uID
 3qFM62+GrVIc7UBGviJAWX2oGistG7DmSKeIiZLkVvTkPZmT54zfHbbqK6we15Xsptzx
 fTZ27ZhrXGhw7VQnvS5jLUD626MEQASeaVprgksjhnJ+8sHqokWsptwb6+CLm1VErLKI
 GuDwjw6CSHF2ZARtyIY2a35u66q1suLBqjPUsSj+ba1moegiId3uMCHuCh8/mCaEKP2T
 en5HoB+u9WtcuCvwONNVYHHTe9HU3TLGpPbg5m4Ac3OyZ7bc4b/Id5LQigXXRr/Jt967
 3AeA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVblcdY="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y1CFoxswu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 12 Feb 2022 16:50:59 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>, Harry Wentland <harry.wentland@amd.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v15 7/7] [RFC] drm/ingenic: add some more features specific to
 jz4780
Date: Sat, 12 Feb 2022 16:50:55 +0100
Message-Id: <ed5e58a299eabf161c40ae7fca49f4dc245fea32.1644681054.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1644681054.git.hns@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
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
Cc: letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

The jz4780 has some more features which should be initialized
according to the vendor kernel.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index dcf44cb00821f..fb2cdb188b993 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -66,6 +66,9 @@ struct jz_soc_info {
 	bool needs_dev_clk;
 	bool has_osd;
 	bool has_alpha;
+	bool has_pcfg;
+	bool has_recover;
+	bool has_rgbc;
 	bool map_noncoherent;
 	bool use_extended_hwdesc;
 	bool plane_f0_not_working;
@@ -732,6 +735,9 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
 	}
 
+	if (priv->soc_info->has_recover)
+		cfg |= JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;
+
 	if (priv->soc_info->use_extended_hwdesc)
 		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
 
@@ -1320,6 +1326,22 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		osdc |= JZ_LCD_OSDC_ALPHAEN;
 	regmap_write(priv->map, JZ_REG_LCD_OSDC, osdc);
 
+	/* Magic values from the vendor kernel for the priority thresholds. */
+	if (soc_info->has_pcfg)
+		regmap_write(priv->map, JZ_REG_LCD_PCFG,
+			     JZ_LCD_PCFG_PRI_MODE |
+			     JZ_LCD_PCFG_HP_BST_16 |
+			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
+			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
+			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));
+
+	/* RGB output control may be superfluous. */
+	if (soc_info->has_rgbc)
+		regmap_write(priv->map, JZ_REG_LCD_RGBC,
+			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
+			     JZ_LCD_RGBC_ODD_RGB |
+			     JZ_LCD_RGBC_EVEN_RGB);
+
 	mutex_init(&priv->clk_mutex);
 	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
 
@@ -1483,6 +1505,9 @@ static const struct jz_soc_info jz4740_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = false,
 	.map_noncoherent = false,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
 	.max_width = 800,
 	.max_height = 600,
 	.formats_f1 = jz4740_formats,
@@ -1494,6 +1519,9 @@ static const struct jz_soc_info jz4725b_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
 	.map_noncoherent = false,
+	.has_pcfg = false,
+	.has_recover = true,
+	.has_rgbc = true,
 	.max_width = 800,
 	.max_height = 600,
 	.formats_f1 = jz4725b_formats_f1,
@@ -1506,6 +1534,9 @@ static const struct jz_soc_info jz4770_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
 	.map_noncoherent = true,
+	.has_pcfg = false,
+	.has_recover = true,
+	.has_rgbc = true,
 	.max_width = 1280,
 	.max_height = 720,
 	.formats_f1 = jz4770_formats_f1,
@@ -1518,6 +1549,9 @@ static const struct jz_soc_info jz4780_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = true,
 	.has_alpha = true,
+	.has_pcfg = true,
+	.has_recover = true,
+	.has_rgbc = true,
 	.use_extended_hwdesc = true,
 	.plane_f0_not_working = true,	/* REVISIT */
 	.max_width = 4096,
-- 
2.33.0

