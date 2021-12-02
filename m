Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5A44669DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 19:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905F26EDED;
	Thu,  2 Dec 2021 18:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30196ECCF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 18:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638470396;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=CDnhZE/bCmY+sU+9kBR2+/QdGVAtCkJSkm9JjrgStzg=;
 b=bYVVoHyNqRKsCFFr9CFbqgb1Ys221dZi+o/QU3OIzDH/NUmV4vaRTd0sGGMm6imC/w
 W/Hsbebx9ZhVT39HePmB81O3YQugMiKedUIABCXdLIE7174uFT2Vg+iyis/F8WwObGtS
 T7bTg6CwO4pfPgnTIPohnsPUTmaS3rwtydvDdmj0KBTIzaqrD1F0ry0f/dZup/reMtKb
 T20p8yqDmHS/xquo5WJsUhYiNlEBuhDVjC5RWWTBXzvPjsrG66yPUbNPLs4tKn+HeL19
 lYG+eX9jhDHw/3Yk5b1Wdpqc7FjrSHdUTp53vJygoTYsGioiHC93eefjhGCet9UUtKD+
 YXBg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcK1X0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xB2IdteZC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 2 Dec 2021 19:39:55 +0100 (CET)
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
 Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH v11 1/8] drm/ingenic: prepare ingenic drm for later addition
 of JZ4780
Date: Thu,  2 Dec 2021 19:39:46 +0100
Message-Id: <ee65e70e91268b3963f8a6581c8aa6c3b643c53e.1638470392.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1638470392.git.hns@goldelico.com>
References: <cover.1638470392.git.hns@goldelico.com>
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
index 462bc0f35f1bf..0bb590c3910d9 100644
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

