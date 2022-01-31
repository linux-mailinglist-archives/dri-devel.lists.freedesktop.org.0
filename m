Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251254A472E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 13:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A3E10E3E9;
	Mon, 31 Jan 2022 12:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9C010E3E8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643632019;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=Mkmqidx/oPx8b5KIx4I1UJMvTrD2DJPEkqRTiAlWLI4=;
 b=CsWmmLRIPzjJ6YdGa38UgOFZcJVrdN5CQ+vuT/6SNxpdIiaZOqqYiPQ6ZJd/pbDhBD
 88aDj9f4TpgehyfOZ6BKQBQ/AcU0KLXYlXU++wSsYywUxuHDfGwDmOrPGDNG/vEW0enR
 ayLex8Ecwp97V+tvgC3OUEDfgbzPeedl7yfhSy74QuiFxMTClR1L4iXdcPztU/neAD+D
 w9fXJAViZOria+AtKZkwhdCrPdph/VoI1jtXyXEudiJsoN3vVs/pIehmm5HeFQooGxD6
 6sjzD8BHJPJz0mkWCIGIOqzO3sUTR2kfKGRAE6tr1rAc5NtnMsYF8gV6+Tcj9O9gtUWI
 VBdA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcK1L0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.38.0 DYNA|AUTH)
 with ESMTPSA id j5fc80y0VCQxu8i
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 31 Jan 2022 13:26:59 +0100 (CET)
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
Subject: [PATCH v12 1/9] drm/ingenic: prepare ingenic drm for later addition
 of JZ4780
Date: Mon, 31 Jan 2022 13:26:47 +0100
Message-Id: <a326a2db8a8b517355b3f47ed91964694d7df19c.1643632014.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1643632014.git.hns@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
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
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This changes the way the regmap is allocated to prepare for the
later addition of the JZ4780 which has more registers and bits
than the others.

Therefore we make the regmap as big as the reg property in
the device tree tells.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index b4943a56be09b..9c60fc4605e4b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -173,7 +173,6 @@ static const struct regmap_config ingenic_drm_regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 
-	.max_register = JZ_REG_LCD_SIZE1,
 	.writeable_reg = ingenic_drm_writeable_reg,
 };
 
@@ -1011,6 +1010,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	struct ingenic_drm_bridge *ib;
 	struct drm_device *drm;
 	void __iomem *base;
+	struct resource *res;
+	struct regmap_config regmap_config;
 	long parent_rate;
 	unsigned int i, clone_mask = 0;
 	int ret, irq;
@@ -1056,14 +1057,16 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	drm->mode_config.funcs = &ingenic_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &ingenic_drm_mode_config_helpers;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base)) {
 		dev_err(dev, "Failed to get memory resource\n");
 		return PTR_ERR(base);
 	}
 
+	regmap_config = ingenic_drm_regmap_config;
+	regmap_config.max_register = res->end - res->start;
 	priv->map = devm_regmap_init_mmio(dev, base,
-					  &ingenic_drm_regmap_config);
+					  &regmap_config);
 	if (IS_ERR(priv->map)) {
 		dev_err(dev, "Failed to create regmap\n");
 		return PTR_ERR(priv->map);
-- 
2.33.0

