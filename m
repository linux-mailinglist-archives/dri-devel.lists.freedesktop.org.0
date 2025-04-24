Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9A6A9B6EB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 20:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E464510E1B2;
	Thu, 24 Apr 2025 18:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eIzn7Km3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3062710E1B2;
 Thu, 24 Apr 2025 18:59:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84D0C43B6C;
 Thu, 24 Apr 2025 18:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Dywu8eLNbuY2euI5PaAeQfr7NXiVC+dB59ylNMmWR0=;
 b=eIzn7Km3Zj7PoYMALGRwoHJyRZ686rapr3JXBGvvCJdduzDkIgtKkJyqEx1zatTh0KExBN
 d0iXxCktndR9VM6DGToP+kOlIEowZMG5LeBuOt/pSSXJ1gozg1IxB2MzMVv92+sy/IQ6uc
 xJi/KXns5Lvu61bV2Um7VmvII7ZPz3qXmhkyjcsCCUqA5nCiBafCLPDOH9R4pL4uYCB9I5
 KTy6umnuHdKdpyXEM8na1Hu8vs4eYi1/+8278NtZbMvLG+bO5M6LqBWe9gHbA2A+uiywS4
 22X0RPeIZbnQNCDmQUlKr8dzzFS5C6kCDCA13O2VXkomgTz5UXPZ50je36Ygog==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:08 +0200
Subject: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Adam Ford <aford173@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Vitalii Mordan <mordan@ispras.ru>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeiledprhgtphhtthhopehgrhhovggtkhestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhlvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheptghhfhdrfhhri
 hhtiiesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepsghlvghunhhgsegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

devm_drm_bridge_alloc() is the new API to be used for allocating (and
partially initializing) a private driver struct embedding a struct
drm_bridge.

For many drivers having a simple code flow in the probe function, this
commit does a mass conversion automatically with the following semantic
patch. The changes have been reviewed manually for correctness as well as
to find any false positives.

  @@
  type T;
  identifier C;
  identifier BR;
  expression DEV;
  expression FUNCS;
  @@
  -T *C;
  +T *C;
   ...
  (
  -C = devm_kzalloc(DEV, ...);
  -if (!C)
  -    return -ENOMEM;
  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
  +if (IS_ERR(C))
  +     return PTR_ERR(C);
  |
  -C = devm_kzalloc(DEV, ...);
  -if (!C)
  -    return ERR_PTR(-ENOMEM);
  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
  +if (IS_ERR(C))
  +     return PTR_ERR(C);
  )
   ...
  -C->BR.funcs = FUNCS;

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Adam Ford <aford173@gmail.com>
Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Benson Leung <bleung@chromium.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Janne Grunau <j@jannau.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jesse Van Gavere <jesseevg@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Phong LE <ple@baylibre.com>
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Vitalii Mordan <mordan@ispras.ru>

Changed in v2:
- added missing PTR_ERR() in the second spatch alternative
---
 drivers/gpu/drm/adp/adp-mipi.c                      |  8 ++++----
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  9 ++++-----
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  |  9 ++++-----
 drivers/gpu/drm/bridge/aux-bridge.c                 |  9 ++++-----
 drivers/gpu/drm/bridge/aux-hpd-bridge.c             |  9 +++++----
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  8 ++++----
 drivers/gpu/drm/bridge/chipone-icn6211.c            |  9 ++++-----
 drivers/gpu/drm/bridge/chrontel-ch7033.c            |  8 ++++----
 drivers/gpu/drm/bridge/cros-ec-anx7688.c            |  9 ++++-----
 drivers/gpu/drm/bridge/fsl-ldb.c                    |  7 +++----
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      |  9 ++++-----
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        | 10 ++++------
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  8 ++++----
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 ++++----
 drivers/gpu/drm/bridge/ite-it6263.c                 |  9 ++++-----
 drivers/gpu/drm/bridge/ite-it6505.c                 |  9 ++++-----
 drivers/gpu/drm/bridge/ite-it66121.c                |  9 ++++-----
 drivers/gpu/drm/bridge/lontium-lt8912b.c            |  9 ++++-----
 drivers/gpu/drm/bridge/lontium-lt9211.c             |  8 +++-----
 drivers/gpu/drm/bridge/lontium-lt9611.c             |  9 ++++-----
 drivers/gpu/drm/bridge/lvds-codec.c                 |  9 ++++-----
 drivers/gpu/drm/bridge/microchip-lvds.c             |  8 ++++----
 drivers/gpu/drm/bridge/nwl-dsi.c                    |  8 ++++----
 drivers/gpu/drm/bridge/parade-ps8622.c              |  9 ++++-----
 drivers/gpu/drm/bridge/parade-ps8640.c              |  9 ++++-----
 drivers/gpu/drm/bridge/sii9234.c                    |  9 ++++-----
 drivers/gpu/drm/bridge/sil-sii8620.c                |  9 ++++-----
 drivers/gpu/drm/bridge/simple-bridge.c              | 10 ++++------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  8 ++++----
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  8 ++++----
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  8 ++++----
 drivers/gpu/drm/bridge/tc358762.c                   |  9 ++++-----
 drivers/gpu/drm/bridge/tc358764.c                   |  9 ++++-----
 drivers/gpu/drm/bridge/tc358768.c                   |  9 ++++-----
 drivers/gpu/drm/bridge/tc358775.c                   |  9 ++++-----
 drivers/gpu/drm/bridge/thc63lvd1024.c               |  8 ++++----
 drivers/gpu/drm/bridge/ti-dlpc3433.c                |  9 ++++-----
 drivers/gpu/drm/bridge/ti-tdp158.c                  |  8 ++++----
 drivers/gpu/drm/bridge/ti-tfp410.c                  |  9 ++++-----
 drivers/gpu/drm/bridge/ti-tpd12s015.c               |  9 ++++-----
 drivers/gpu/drm/mediatek/mtk_dp.c                   |  9 ++++-----
 drivers/gpu/drm/mediatek/mtk_dpi.c                  |  9 ++++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c                  |  9 ++++-----
 drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  9 ++++-----
 drivers/gpu/drm/meson/meson_encoder_cvbs.c          | 12 ++++++------
 drivers/gpu/drm/meson/meson_encoder_dsi.c           | 12 ++++++------
 drivers/gpu/drm/meson/meson_encoder_hdmi.c          | 12 ++++++------
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  9 ++++-----
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++------
 49 files changed, 201 insertions(+), 237 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp-mipi.c b/drivers/gpu/drm/adp/adp-mipi.c
index 2b60128e2c693e9f85affff569cc57cdb6f47909..cba7d32150a98d78d07a25b1822dec6bf2f08f65 100644
--- a/drivers/gpu/drm/adp/adp-mipi.c
+++ b/drivers/gpu/drm/adp/adp-mipi.c
@@ -229,9 +229,10 @@ static int adp_mipi_probe(struct platform_device *pdev)
 {
 	struct adp_mipi_drv_private *adp;
 
-	adp = devm_kzalloc(&pdev->dev, sizeof(*adp), GFP_KERNEL);
-	if (!adp)
-		return -ENOMEM;
+	adp = devm_drm_bridge_alloc(&pdev->dev, struct adp_mipi_drv_private,
+				    bridge, &adp_dsi_bridge_funcs);
+	if (IS_ERR(adp))
+		return PTR_ERR(adp);
 
 	adp->mipi = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(adp->mipi)) {
@@ -241,7 +242,6 @@ static int adp_mipi_probe(struct platform_device *pdev)
 
 	adp->dsi.dev = &pdev->dev;
 	adp->dsi.ops = &adp_dsi_host_ops;
-	adp->bridge.funcs = &adp_dsi_bridge_funcs;
 	adp->bridge.of_node = pdev->dev.of_node;
 	adp->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	dev_set_drvdata(&pdev->dev, adp);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 1257009e850c1b20184cfaea5b6a4440e75e10d7..4411987cd85109b83e3d4d45e842ee9cf8d21aab 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1224,9 +1224,10 @@ static int adv7511_probe(struct i2c_client *i2c)
 	if (!dev->of_node)
 		return -EINVAL;
 
-	adv7511 = devm_kzalloc(dev, sizeof(*adv7511), GFP_KERNEL);
-	if (!adv7511)
-		return -ENOMEM;
+	adv7511 = devm_drm_bridge_alloc(dev, struct adv7511, bridge,
+					&adv7511_bridge_funcs);
+	if (IS_ERR(adv7511))
+		return PTR_ERR(adv7511);
 
 	adv7511->i2c_main = i2c;
 	adv7511->powered = false;
@@ -1326,8 +1327,6 @@ static int adv7511_probe(struct i2c_client *i2c)
 	ret = adv7511_cec_init(dev, adv7511);
 	if (ret)
 		goto err_unregister_cec;
-
-	adv7511->bridge.funcs = &adv7511_bridge_funcs;
 	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index a83020d6576f78372056069947783a626acf64b1..ba0fc149a9e722a53da6027a851bf62262ba64b2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1193,9 +1193,10 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 	bool found = false;
 	int err;
 
-	anx78xx = devm_kzalloc(&client->dev, sizeof(*anx78xx), GFP_KERNEL);
-	if (!anx78xx)
-		return -ENOMEM;
+	anx78xx = devm_drm_bridge_alloc(&client->dev, struct anx78xx, bridge,
+					&anx78xx_bridge_funcs);
+	if (IS_ERR(anx78xx))
+		return PTR_ERR(anx78xx);
 
 	pdata = &anx78xx->pdata;
 
@@ -1306,8 +1307,6 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 		goto err_poweroff;
 	}
 
-	anx78xx->bridge.funcs = &anx78xx_bridge_funcs;
-
 	drm_bridge_add(&anx78xx->bridge);
 
 	/* If cable is pulled out, just poweroff and wait for HPD event */
diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index c179b86d208f70d95b41e6f2157b78f97bac4d8d..ea9109bdbe088da4ea3411845bf6f27a50e2cebf 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -109,17 +109,16 @@ static int drm_aux_bridge_probe(struct auxiliary_device *auxdev,
 {
 	struct drm_aux_bridge_data *data;
 
-	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
+	data = devm_drm_bridge_alloc(&auxdev->dev, struct drm_aux_bridge_data,
+				     bridge, &drm_aux_bridge_funcs);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
 	data->dev = &auxdev->dev;
 	data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
 	if (IS_ERR(data->next_bridge))
 		return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
 				     "failed to acquire drm_bridge\n");
-
-	data->bridge.funcs = &drm_aux_bridge_funcs;
 	data->bridge.of_node = data->dev->of_node;
 
 	/* passthrough data, allow everything */
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index b3f588b71a7d7ad5c2ee7b07c39079bc5ba34cee..3eb411f874e41b322f732649bd2074c5d8422566 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -171,12 +171,13 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 {
 	struct drm_aux_hpd_bridge_data *data;
 
-	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
+	data = devm_drm_bridge_alloc(&auxdev->dev,
+				     struct drm_aux_hpd_bridge_data, bridge,
+				     &drm_aux_hpd_bridge_funcs);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
 	data->dev = &auxdev->dev;
-	data->bridge.funcs = &drm_aux_hpd_bridge_funcs;
 	data->bridge.of_node = dev_get_platdata(data->dev);
 	data->bridge.ops = DRM_BRIDGE_OP_HPD;
 	data->bridge.type = id->driver_data;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index b431e7efd1f0d749320ea15b6f1f5ca13fc72800..cb5f5a8c539a471290df8435d4c2e3ed696b38d4 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2389,9 +2389,10 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	mhdp = devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
-	if (!mhdp)
-		return -ENOMEM;
+	mhdp = devm_drm_bridge_alloc(dev, struct cdns_mhdp_device, bridge,
+				     &cdns_mhdp_bridge_funcs);
+	if (IS_ERR(mhdp))
+		return PTR_ERR(mhdp);
 
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk)) {
@@ -2481,7 +2482,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->display_fmt.bpc = 8;
 
 	mhdp->bridge.of_node = pdev->dev.of_node;
-	mhdp->bridge.funcs = &cdns_mhdp_bridge_funcs;
 	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HPD;
 	mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 634c5b0306679d2e68798c2b9013aae4491dd44c..9989c6a6f3414295788e77d561ee5b807abc602e 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -691,17 +691,16 @@ static int chipone_common_probe(struct device *dev, struct chipone **icnr)
 	struct chipone *icn;
 	int ret;
 
-	icn = devm_kzalloc(dev, sizeof(struct chipone), GFP_KERNEL);
-	if (!icn)
-		return -ENOMEM;
+	icn = devm_drm_bridge_alloc(dev, struct chipone, bridge,
+				    &chipone_bridge_funcs);
+	if (IS_ERR(icn))
+		return PTR_ERR(icn);
 
 	icn->dev = dev;
 
 	ret = chipone_parse_dt(icn);
 	if (ret)
 		return ret;
-
-	icn->bridge.funcs = &chipone_bridge_funcs;
 	icn->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	icn->bridge.of_node = dev->of_node;
 
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 210c45c1efd48f5b541bf73da66a169c27e110b2..ab92747933568bfba77da45219e019408029f297 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -536,9 +536,10 @@ static int ch7033_probe(struct i2c_client *client)
 	unsigned int val;
 	int ret;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_bridge_alloc(dev, struct ch7033_priv, bridge,
+				     &ch7033_bridge_funcs);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	dev_set_drvdata(dev, priv);
 
@@ -575,7 +576,6 @@ static int ch7033_probe(struct i2c_client *client)
 	}
 
 	INIT_LIST_HEAD(&priv->bridge.list);
-	priv->bridge.funcs = &ch7033_bridge_funcs;
 	priv->bridge.of_node = dev->of_node;
 	drm_bridge_add(&priv->bridge);
 
diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index c8abd9920fee956cf049bcb09827d658b7939333..ab539143f71059e202baced47091cfc1c9174b7c 100644
--- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -103,9 +103,10 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 	u8 buffer[4];
 	int ret;
 
-	anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
-	if (!anx7688)
-		return -ENOMEM;
+	anx7688 = devm_drm_bridge_alloc(dev, struct cros_ec_anx7688, bridge,
+					&cros_ec_anx7688_bridge_funcs);
+	if (IS_ERR(anx7688))
+		return PTR_ERR(anx7688);
 
 	anx7688->client = client;
 	i2c_set_clientdata(client, anx7688);
@@ -152,8 +153,6 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 		/* Warn, but not fail, for backwards compatibility */
 		DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\n",
 			 fw_version);
-
-	anx7688->bridge.funcs = &cros_ec_anx7688_bridge_funcs;
 	drm_bridge_add(&anx7688->bridge);
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 2cb6dfc7a6d3dbdd620a35345204f8fb9cae6651..5c3cf37200bcee1db285c97e2b463c9355ee6acb 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -298,16 +298,15 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
-	fsl_ldb = devm_kzalloc(dev, sizeof(*fsl_ldb), GFP_KERNEL);
-	if (!fsl_ldb)
-		return -ENOMEM;
+	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
+	if (IS_ERR(fsl_ldb))
+		return PTR_ERR(fsl_ldb);
 
 	fsl_ldb->devdata = of_device_get_match_data(dev);
 	if (!fsl_ldb->devdata)
 		return -EINVAL;
 
 	fsl_ldb->dev = &pdev->dev;
-	fsl_ldb->bridge.funcs = &funcs;
 	fsl_ldb->bridge.of_node = dev->of_node;
 
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
index f072c6ed39ef183b10518b43bd6d979bc89e36f9..8069c4881e9058f5462f99116799b589bd52b19e 100644
--- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
+++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
@@ -59,9 +59,10 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
 	struct imx_legacy_bridge *imx_bridge;
 	int ret;
 
-	imx_bridge = devm_kzalloc(dev, sizeof(*imx_bridge), GFP_KERNEL);
-	if (!imx_bridge)
-		return ERR_PTR(-ENOMEM);
+	imx_bridge = devm_drm_bridge_alloc(dev, struct imx_legacy_bridge,
+					   base, &imx_legacy_bridge_funcs);
+	if (IS_ERR(imx_bridge))
+		return PTR_ERR(imx_bridge);
 
 	ret = of_get_drm_display_mode(np,
 				      &imx_bridge->mode,
@@ -71,8 +72,6 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
 		return ERR_PTR(ret);
 
 	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
-
-	imx_bridge->base.funcs = &imx_legacy_bridge_funcs;
 	imx_bridge->base.of_node = np;
 	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
 	imx_bridge->base.type = type;
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 8a4fd7d77a8d516b3b46f41cf07d2633d23bde12..18b60bb60e0042a1d031283fecf95c4b7a9312e1 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -140,9 +140,10 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 	struct device_node *remote;
 	struct imx8mp_hdmi_pvi *pvi;
 
-	pvi = devm_kzalloc(&pdev->dev, sizeof(*pvi), GFP_KERNEL);
-	if (!pvi)
-		return -ENOMEM;
+	pvi = devm_drm_bridge_alloc(&pdev->dev, struct imx8mp_hdmi_pvi,
+				    bridge, &imx_hdmi_pvi_bridge_funcs);
+	if (IS_ERR(pvi))
+		return PTR_ERR(pvi);
 
 	platform_set_drvdata(pdev, pvi);
 	pvi->dev = &pdev->dev;
@@ -164,9 +165,6 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 				     "could not find next bridge\n");
 
 	pm_runtime_enable(&pdev->dev);
-
-	/* Register the bridge. */
-	pvi->bridge.funcs = &imx_hdmi_pvi_bridge_funcs;
 	pvi->bridge.of_node = pdev->dev.of_node;
 	pvi->bridge.timings = pvi->next_bridge->timings;
 
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index e092c9ea99b0224802919ff84b448acb53508951..e5943506981dfb8f113c94ad52ddbba52e00ec3f 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -327,9 +327,10 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
-	if (!pl)
-		return -ENOMEM;
+	pl = devm_drm_bridge_alloc(dev, struct imx8qxp_pixel_link, bridge,
+				   &imx8qxp_pixel_link_bridge_funcs);
+	if (IS_ERR(pl))
+		return PTR_ERR(pl);
 
 	ret = imx_scu_get_handle(&pl->ipc_handle);
 	if (ret) {
@@ -384,7 +385,6 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pl);
 
 	pl->bridge.driver_private = pl;
-	pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
 	pl->bridge.of_node = np;
 
 	drm_bridge_add(&pl->bridge);
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index da138ab51b3bd2c6ebd3780c09818891d5320092..111310acab2ce403a62a47ecbe9d9dd372c75ecd 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -392,9 +392,10 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	p2d = devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
-	if (!p2d)
-		return -ENOMEM;
+	p2d = devm_drm_bridge_alloc(dev, struct imx8qxp_pxl2dpi, bridge,
+				    &imx8qxp_pxl2dpi_bridge_funcs);
+	if (IS_ERR(p2d))
+		return PTR_ERR(p2d);
 
 	p2d->regmap = syscon_node_to_regmap(np->parent);
 	if (IS_ERR(p2d->regmap)) {
@@ -441,7 +442,6 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	p2d->bridge.driver_private = p2d;
-	p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
 	p2d->bridge.of_node = np;
 
 	drm_bridge_add(&p2d->bridge);
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index a3a63a977b0a8487ad38fc08e0eed08672f4d41a..a417b25a65e8369177d4bb09d179a865f6187adc 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -816,9 +816,10 @@ static int it6263_probe(struct i2c_client *client)
 	struct it6263 *it;
 	int ret;
 
-	it = devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
-	if (!it)
-		return -ENOMEM;
+	it = devm_drm_bridge_alloc(dev, struct it6263, bridge,
+				   &it6263_bridge_funcs);
+	if (IS_ERR(it))
+		return PTR_ERR(it);
 
 	it->dev = dev;
 	it->hdmi_i2c = client;
@@ -865,8 +866,6 @@ static int it6263_probe(struct i2c_client *client)
 	it6263_hdmi_config(it);
 
 	i2c_set_clientdata(client, it);
-
-	it->bridge.funcs = &it6263_bridge_funcs;
 	it->bridge.of_node = dev->of_node;
 	/* IT6263 chip doesn't support HPD interrupt. */
 	it->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1383d1e21afea1acb46b7bd28860908b58832dbc..bf2e854210233bcecd1be582ef092370bd652412 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3583,9 +3583,10 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	struct extcon_dev *extcon;
 	int err;
 
-	it6505 = devm_kzalloc(&client->dev, sizeof(*it6505), GFP_KERNEL);
-	if (!it6505)
-		return -ENOMEM;
+	it6505 = devm_drm_bridge_alloc(&client->dev, struct it6505, bridge,
+				       &it6505_bridge_funcs);
+	if (IS_ERR(it6505))
+		return PTR_ERR(it6505);
 
 	mutex_init(&it6505->extcon_lock);
 	mutex_init(&it6505->mode_lock);
@@ -3659,8 +3660,6 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	it6505->aux.dev = dev;
 	it6505->aux.transfer = it6505_aux_transfer;
 	drm_dp_aux_init(&it6505->aux);
-
-	it6505->bridge.funcs = &it6505_bridge_funcs;
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD;
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 7b110ae532918d2d6f91ebc5f747c38e7e77dc07..aee88436d72e3c1c8d8f6b62ab04a8d9be10b413 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1516,9 +1516,10 @@ static int it66121_probe(struct i2c_client *client)
 		return -ENXIO;
 	}
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_bridge_alloc(dev, struct it66121_ctx, bridge,
+				    &it66121_bridge_funcs);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
 	if (!ep)
@@ -1576,8 +1577,6 @@ static int it66121_probe(struct i2c_client *client)
 	    (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
 		return -ENODEV;
 	}
-
-	ctx->bridge.funcs = &it66121_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 3e49d855b3648880cea9bce5f3f04fbb6f838a45..c2a07f7c83fa1e0aefbbbcc855367adc6140f34d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -761,9 +761,10 @@ static int lt8912_probe(struct i2c_client *client)
 	int ret = 0;
 	struct device *dev = &client->dev;
 
-	lt = devm_kzalloc(dev, sizeof(struct lt8912), GFP_KERNEL);
-	if (!lt)
-		return -ENOMEM;
+	lt = devm_drm_bridge_alloc(dev, struct lt8912, bridge,
+				   &lt8912_bridge_funcs);
+	if (IS_ERR(lt))
+		return PTR_ERR(lt);
 
 	lt->dev = dev;
 	lt->i2c_client[0] = client;
@@ -777,8 +778,6 @@ static int lt8912_probe(struct i2c_client *client)
 		goto err_i2c;
 
 	i2c_set_clientdata(client, lt);
-
-	lt->bridge.funcs = &lt8912_bridge_funcs;
 	lt->bridge.of_node = dev->of_node;
 	lt->bridge.ops = (DRM_BRIDGE_OP_EDID |
 			  DRM_BRIDGE_OP_DETECT);
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 9b2dac9bd63c5afd4ffbafafdbbb1230549bc36f..97026fa66c5d39d49cf50ad69f707a84d584b76d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -727,9 +727,9 @@ static int lt9211_probe(struct i2c_client *client)
 	struct lt9211 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_bridge_alloc(dev, struct lt9211, bridge, &lt9211_funcs);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->dev = dev;
 
@@ -754,8 +754,6 @@ static int lt9211_probe(struct i2c_client *client)
 
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
-
-	ctx->bridge.funcs = &lt9211_funcs;
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a35a8b8ca89c2cc138a7cb4de01c796c6211d655..dc82c8db9012bdd46691a5ea7f252d0b99697b9b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1072,9 +1072,10 @@ static int lt9611_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	lt9611 = devm_kzalloc(dev, sizeof(*lt9611), GFP_KERNEL);
-	if (!lt9611)
-		return -ENOMEM;
+	lt9611 = devm_drm_bridge_alloc(dev, struct lt9611, bridge,
+				       &lt9611_bridge_funcs);
+	if (IS_ERR(lt9611))
+		return PTR_ERR(lt9611);
 
 	lt9611->dev = dev;
 	lt9611->client = client;
@@ -1126,8 +1127,6 @@ static int lt9611_probe(struct i2c_client *client)
 
 	/* Disable Audio InfoFrame, enabled by default */
 	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, 0);
-
-	lt9611->bridge.funcs = &lt9611_bridge_funcs;
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 1646e454e0b0b558d00f9421f15bb7084e2aa45a..e6a7147e141b64fc77dfef03a737ee599a0ecd10 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -118,9 +118,10 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	u32 val;
 	int ret;
 
-	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
-	if (!lvds_codec)
-		return -ENOMEM;
+	lvds_codec = devm_drm_bridge_alloc(dev, struct lvds_codec, bridge,
+					   &funcs);
+	if (IS_ERR(lvds_codec))
+		return PTR_ERR(lvds_codec);
 
 	lvds_codec->dev = &pdev->dev;
 	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
@@ -156,8 +157,6 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);
 
-	lvds_codec->bridge.funcs = &funcs;
-
 	/*
 	 * Decoder input LVDS format is a property of the decoder chip or even
 	 * its strapping. Handle data-mapping the same way lvds-panel does. In
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 1d4ae0097df847d9f93c79eecff0c4587ae331ba..9f4ff82bc6b49010f8727da3b367f5a744a28edc 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -157,9 +157,10 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 	if (!dev->of_node)
 		return -ENODEV;
 
-	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
-	if (!lvds)
-		return -ENOMEM;
+	lvds = devm_drm_bridge_alloc(&pdev->dev, struct mchp_lvds, bridge,
+				     &mchp_lvds_bridge_funcs);
+	if (IS_ERR(lvds))
+		return PTR_ERR(lvds);
 
 	lvds->dev = dev;
 
@@ -192,7 +193,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 
 	lvds->bridge.of_node = dev->of_node;
 	lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
-	lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
 
 	dev_set_drvdata(dev, lvds);
 	ret = devm_pm_runtime_enable(dev);
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 55912ae11f46a1d551e11f93a306a8a00ef3f7d8..2f7429b24fc20db104dec17182f1119c6c75e600 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -1149,9 +1149,10 @@ static int nwl_dsi_probe(struct platform_device *pdev)
 	struct nwl_dsi *dsi;
 	int ret;
 
-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return -ENOMEM;
+	dsi = devm_drm_bridge_alloc(dev, struct nwl_dsi, bridge,
+				    &nwl_dsi_bridge_funcs);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
 
 	dsi->dev = dev;
 
@@ -1180,7 +1181,6 @@ static int nwl_dsi_probe(struct platform_device *pdev)
 		dsi->quirks = (uintptr_t)attr->data;
 
 	dsi->bridge.driver_private = dsi;
-	dsi->bridge.funcs = &nwl_dsi_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.timings = &nwl_dsi_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 8726fefc5c654e49bce029d943d241789ca4f802..81aa8dc8ee12af8b55f42d4786b44b3b90266491 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -449,9 +449,10 @@ static int ps8622_probe(struct i2c_client *client)
 	struct drm_bridge *panel_bridge;
 	int ret;
 
-	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
-	if (!ps8622)
-		return -ENOMEM;
+	ps8622 = devm_drm_bridge_alloc(dev, struct ps8622_bridge, bridge,
+				       &ps8622_bridge_funcs);
+	if (IS_ERR(ps8622))
+		return PTR_ERR(ps8622);
 
 	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
 	if (IS_ERR(panel_bridge))
@@ -508,8 +509,6 @@ static int ps8622_probe(struct i2c_client *client)
 		ps8622->bl->props.max_brightness = PS8622_MAX_BRIGHTNESS;
 		ps8622->bl->props.brightness = PS8622_MAX_BRIGHTNESS;
 	}
-
-	ps8622->bridge.funcs = &ps8622_bridge_funcs;
 	ps8622->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 	ps8622->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ps8622->bridge);
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 2422ff68c1042bd8eaa6821ff387d4faad47c550..d58ff094ddc7536acf04211367b9482e487b877a 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -636,9 +636,10 @@ static int ps8640_probe(struct i2c_client *client)
 	int ret;
 	u32 i;
 
-	ps_bridge = devm_kzalloc(dev, sizeof(*ps_bridge), GFP_KERNEL);
-	if (!ps_bridge)
-		return -ENOMEM;
+	ps_bridge = devm_drm_bridge_alloc(dev, struct ps8640, bridge,
+					  &ps8640_bridge_funcs);
+	if (IS_ERR(ps_bridge))
+		return PTR_ERR(ps_bridge);
 
 	mutex_init(&ps_bridge->aux_lock);
 
@@ -661,8 +662,6 @@ static int ps8640_probe(struct i2c_client *client)
 					       GPIOD_OUT_HIGH);
 	if (IS_ERR(ps_bridge->gpio_reset))
 		return PTR_ERR(ps_bridge->gpio_reset);
-
-	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
 	ps_bridge->bridge.of_node = dev->of_node;
 	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index cd7837c9a6e00b572a3fb65e5e0c9fa884555a73..487f355144a0e615298a3dd176b936885c2a8f33 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -888,9 +888,10 @@ static int sii9234_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_bridge_alloc(dev, struct sii9234, bridge,
+				    &sii9234_bridge_funcs);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->dev = dev;
 	mutex_init(&ctx->lock);
@@ -920,8 +921,6 @@ static int sii9234_probe(struct i2c_client *client)
 		return ret;
 
 	i2c_set_clientdata(client, ctx);
-
-	ctx->bridge.funcs = &sii9234_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 3af650dc92a1612ca88fe378319519546b79901f..7de6f0ec4ec2372f633cf1d73853c73fd9caf175 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2291,9 +2291,10 @@ static int sii8620_probe(struct i2c_client *client)
 	struct sii8620 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_bridge_alloc(dev, struct sii8620, bridge,
+				    &sii8620_bridge_funcs);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->dev = dev;
 	mutex_init(&ctx->lock);
@@ -2335,8 +2336,6 @@ static int sii8620_probe(struct i2c_client *client)
 	}
 
 	i2c_set_clientdata(client, ctx);
-
-	ctx->bridge.funcs = &sii8620_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 70db5b99e5bb84f099ec54cf62abbda53475311d..f9be4eafadfd1e4229161375e47da95a3075b090 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -168,9 +168,10 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
 
-	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
-	if (!sbridge)
-		return -ENOMEM;
+	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
+					bridge, &simple_bridge_bridge_funcs);
+	if (IS_ERR(sbridge))
+		return PTR_ERR(sbridge);
 
 	sbridge->info = of_device_get_match_data(&pdev->dev);
 
@@ -202,9 +203,6 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	if (IS_ERR(sbridge->enable))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
-
-	/* Register the bridge. */
-	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 5e5f8c2f95be1f5c4633f1093b17a00f9425bb37..9b1dfdb5e7ee528c876c01916c9821d550cad679 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1045,9 +1045,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 		return ERR_PTR(-ENODEV);
 	}
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return ERR_PTR(-ENOMEM);
+	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
+				     &dw_hdmi_qp_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	hdmi->dev = dev;
 
@@ -1073,7 +1074,6 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 		return ERR_PTR(ret);
 
 	hdmi->bridge.driver_private = hdmi;
-	hdmi->bridge.funcs = &dw_hdmi_qp_bridge_funcs;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index b08ada920a501d6a62f39581944a87019f5e5c15..87886235b8d3a85e0711f7763d048ad9eefd159a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1194,9 +1194,10 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	struct dw_mipi_dsi *dsi;
 	int ret;
 
-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return ERR_PTR(-ENOMEM);
+	dsi = devm_drm_bridge_alloc(dev, struct dw_mipi_dsi, bridge,
+				    &dw_mipi_dsi_bridge_funcs);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
 
 	dsi->dev = dev;
 	dsi->plat_data = plat_data;
@@ -1265,7 +1266,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	}
 
 	dsi->bridge.driver_private = dsi;
-	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
 	dsi->bridge.of_node = pdev->dev.of_node;
 
 	return dsi;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index c76f5f2e74d14bd372f969c6c7832aa57f80772b..9f694f72b521912f5d4af46f2df2fc0fe3f776ea 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -914,9 +914,10 @@ __dw_mipi_dsi2_probe(struct platform_device *pdev,
 	struct dw_mipi_dsi2 *dsi2;
 	int ret;
 
-	dsi2 = devm_kzalloc(dev, sizeof(*dsi2), GFP_KERNEL);
-	if (!dsi2)
-		return ERR_PTR(-ENOMEM);
+	dsi2 = devm_drm_bridge_alloc(dev, struct dw_mipi_dsi2, bridge,
+				     &dw_mipi_dsi2_bridge_funcs);
+	if (IS_ERR(dsi2))
+		return PTR_ERR(dsi2);
 
 	dsi2->dev = dev;
 	dsi2->plat_data = plat_data;
@@ -981,7 +982,6 @@ __dw_mipi_dsi2_probe(struct platform_device *pdev,
 	}
 
 	dsi2->bridge.driver_private = dsi2;
-	dsi2->bridge.funcs = &dw_mipi_dsi2_bridge_funcs;
 	dsi2->bridge.of_node = pdev->dev.of_node;
 
 	return dsi2;
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index edf01476f2ef6e05ef2c144ff4467e7f6babc4c6..690f4c5a6fb113a6d5947a364922605d28d33edf 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -265,9 +265,10 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	struct tc358762 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(struct tc358762), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_bridge_alloc(dev, struct tc358762, bridge,
+				    &tc358762_bridge_funcs);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
@@ -287,8 +288,6 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	ret = tc358762_configure_regulators(ctx);
 	if (ret < 0)
 		return ret;
-
-	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 3f76c890fad9ffa50dc02f289a37378332830516..c54a6e571daccfbce8eeb34e6e38faa7895642df 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -347,9 +347,10 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 	struct tc358764 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(struct tc358764), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_bridge_alloc(dev, struct tc358764, bridge,
+				    &tc358764_bridge_funcs);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 
@@ -367,8 +368,6 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 	ret = tc358764_configure_regulators(ctx);
 	if (ret < 0)
 		return ret;
-
-	ctx->bridge.funcs = &tc358764_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 063f217a17b6cf32e9793b8a96a5ac6128584098..1868026b3ee012edc700f1994c88777765161651 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -1287,9 +1287,10 @@ static int tc358768_i2c_probe(struct i2c_client *client)
 	if (!np)
 		return -ENODEV;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_bridge_alloc(dev, struct tc358768_priv, bridge,
+				     &tc358768_bridge_funcs);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	dev_set_drvdata(dev, priv);
 	priv->dev = dev;
@@ -1320,8 +1321,6 @@ static int tc358768_i2c_probe(struct i2c_client *client)
 
 	priv->dsi_host.dev = dev;
 	priv->dsi_host.ops = &tc358768_dsi_host_ops;
-
-	priv->bridge.funcs = &tc358768_bridge_funcs;
 	priv->bridge.timings = &default_tc358768_timings;
 	priv->bridge.of_node = np;
 
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 1b10e6ee1724ffb4bb8946f86d2f18e53428381a..b7d5ef377049656efeaca96abc5f68e61de1ee1e 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -659,9 +659,10 @@ static int tc_probe(struct i2c_client *client)
 	struct tc_data *tc;
 	int ret;
 
-	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
-	if (!tc)
-		return -ENOMEM;
+	tc = devm_drm_bridge_alloc(dev, struct tc_data, bridge,
+				   &tc_bridge_funcs);
+	if (IS_ERR(tc))
+		return PTR_ERR(tc);
 
 	tc->dev = dev;
 	tc->i2c = client;
@@ -700,8 +701,6 @@ static int tc_probe(struct i2c_client *client)
 		dev_err(dev, "cannot get reset-gpios %d\n", ret);
 		return ret;
 	}
-
-	tc->bridge.funcs = &tc_bridge_funcs;
 	tc->bridge.of_node = dev->of_node;
 	tc->bridge.pre_enable_prev_first = true;
 	drm_bridge_add(&tc->bridge);
diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index e2fc78adebcf22f0d8cdb484078e37b748b776c6..2cb7cd0c060824256bbfa511f833cc00437d318b 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -181,9 +181,10 @@ static int thc63_probe(struct platform_device *pdev)
 	struct thc63_dev *thc63;
 	int ret;
 
-	thc63 = devm_kzalloc(&pdev->dev, sizeof(*thc63), GFP_KERNEL);
-	if (!thc63)
-		return -ENOMEM;
+	thc63 = devm_drm_bridge_alloc(&pdev->dev, struct thc63_dev, bridge,
+				      &thc63_bridge_func);
+	if (IS_ERR(thc63))
+		return PTR_ERR(thc63);
 
 	thc63->dev = &pdev->dev;
 	platform_set_drvdata(pdev, thc63);
@@ -208,7 +209,6 @@ static int thc63_probe(struct platform_device *pdev)
 
 	thc63->bridge.driver_private = thc63;
 	thc63->bridge.of_node = pdev->dev.of_node;
-	thc63->bridge.funcs = &thc63_bridge_func;
 	thc63->bridge.timings = &thc63->timings;
 
 	drm_bridge_add(&thc63->bridge);
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 47638d1c96ec5ad999604c8c7e8839ff85936d98..fdde52208c7c1f17b5fb2ac306fd3011cb1bb427 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -348,9 +348,10 @@ static int dlpc3433_probe(struct i2c_client *client)
 	struct dlpc *dlpc;
 	int ret;
 
-	dlpc = devm_kzalloc(dev, sizeof(*dlpc), GFP_KERNEL);
-	if (!dlpc)
-		return -ENOMEM;
+	dlpc = devm_drm_bridge_alloc(dev, struct dlpc, bridge,
+				     &dlpc_bridge_funcs);
+	if (IS_ERR(dlpc))
+		return PTR_ERR(dlpc);
 
 	dlpc->dev = dev;
 
@@ -364,8 +365,6 @@ static int dlpc3433_probe(struct i2c_client *client)
 
 	dev_set_drvdata(dev, dlpc);
 	i2c_set_clientdata(client, dlpc);
-
-	dlpc->bridge.funcs = &dlpc_bridge_funcs;
 	dlpc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&dlpc->bridge);
 
diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/ti-tdp158.c
index cca75443f0121e39527a6cecf711eff2c0d507b5..27053d020df7c6fabbd5ce631b46c3f2358f12b2 100644
--- a/drivers/gpu/drm/bridge/ti-tdp158.c
+++ b/drivers/gpu/drm/bridge/ti-tdp158.c
@@ -68,9 +68,10 @@ static int tdp158_probe(struct i2c_client *client)
 	struct tdp158 *tdp158;
 	struct device *dev = &client->dev;
 
-	tdp158 = devm_kzalloc(dev, sizeof(*tdp158), GFP_KERNEL);
-	if (!tdp158)
-		return -ENOMEM;
+	tdp158 = devm_drm_bridge_alloc(dev, struct tdp158, bridge,
+				       &tdp158_bridge_funcs);
+	if (IS_ERR(tdp158))
+		return PTR_ERR(tdp158);
 
 	tdp158->next = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(tdp158->next))
@@ -89,7 +90,6 @@ static int tdp158_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(tdp158->enable), "enable");
 
 	tdp158->bridge.of_node = dev->of_node;
-	tdp158->bridge.funcs = &tdp158_bridge_funcs;
 	tdp158->bridge.driver_private = tdp158;
 	tdp158->dev = dev;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index e15d232ddbac55c6f5f966471a6c63f9c29a06c1..a62c43fba854032790055751b713abb012ee0cc6 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -341,14 +341,13 @@ static int tfp410_init(struct device *dev, bool i2c)
 		return -ENXIO;
 	}
 
-	dvi = devm_kzalloc(dev, sizeof(*dvi), GFP_KERNEL);
-	if (!dvi)
-		return -ENOMEM;
+	dvi = devm_drm_bridge_alloc(dev, struct tfp410, bridge,
+				    &tfp410_bridge_funcs);
+	if (IS_ERR(dvi))
+		return PTR_ERR(dvi);
 
 	dvi->dev = dev;
 	dev_set_drvdata(dev, dvi);
-
-	dvi->bridge.funcs = &tfp410_bridge_funcs;
 	dvi->bridge.of_node = dev->of_node;
 	dvi->bridge.timings = &dvi->timings;
 	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index 1c289051a5987e0aec4c286ef4c01ee1a2f9421f..f4d63171da54776e5b314595b6a028fdb819e4a8 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -116,13 +116,12 @@ static int tpd12s015_probe(struct platform_device *pdev)
 	struct gpio_desc *gpio;
 	int ret;
 
-	tpd = devm_kzalloc(&pdev->dev, sizeof(*tpd), GFP_KERNEL);
-	if (!tpd)
-		return -ENOMEM;
+	tpd = devm_drm_bridge_alloc(&pdev->dev, struct tpd12s015_device,
+				    bridge, &tpd12s015_bridge_funcs);
+	if (IS_ERR(tpd))
+		return PTR_ERR(tpd);
 
 	platform_set_drvdata(pdev, tpd);
-
-	tpd->bridge.funcs = &tpd12s015_bridge_funcs;
 	tpd->bridge.of_node = pdev->dev.of_node;
 	tpd->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	tpd->bridge.ops = DRM_BRIDGE_OP_DETECT;
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index b2408abb9d491bf25773d4dcc1be73c89cf208ce..f69a58942d88637d2451c1a3ce49eb568dc5fa2e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2725,9 +2725,10 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
-	if (!mtk_dp)
-		return -ENOMEM;
+	mtk_dp = devm_drm_bridge_alloc(dev, struct mtk_dp, bridge,
+				       &mtk_dp_bridge_funcs);
+	if (IS_ERR(mtk_dp))
+		return PTR_ERR(mtk_dp);
 
 	mtk_dp->dev = dev;
 	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
@@ -2784,8 +2785,6 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	ret = mtk_dp_register_phy(mtk_dp);
 	if (ret)
 		return ret;
-
-	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0f3b1ef8e497354edaf0a56e24660bf356fe01ac..d56beeda2e875cfd8060c87b0281ac457b80c51c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1179,9 +1179,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	struct mtk_dpi *dpi;
 	int ret;
 
-	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
-	if (!dpi)
-		return -ENOMEM;
+	dpi = devm_drm_bridge_alloc(dev, struct mtk_dpi, bridge,
+				    &mtk_dpi_bridge_funcs);
+	if (IS_ERR(dpi))
+		return PTR_ERR(dpi);
 
 	dpi->dev = dev;
 	dpi->conf = (struct mtk_dpi_conf *)of_device_get_match_data(dev);
@@ -1232,8 +1233,6 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return dpi->irq;
 
 	platform_set_drvdata(pdev, dpi);
-
-	dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
 	dpi->bridge.of_node = dev->of_node;
 	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4fe1f38a3c4b7fcbbdbf7f6a82f66c9e2b546c02..e4edf17413ef3d022c3402f3abecb4f93adef2cf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1196,9 +1196,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	int irq_num;
 	int ret;
 
-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return -ENOMEM;
+	dsi = devm_drm_bridge_alloc(dev, struct mtk_dsi, bridge,
+				    &mtk_dsi_bridge_funcs);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
 
 	dsi->driver_data = of_device_get_match_data(dev);
 
@@ -1245,8 +1246,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	init_waitqueue_head(&dsi->irq_wait_queue);
 
 	platform_set_drvdata(pdev, dsi);
-
-	dsi->bridge.funcs = &mtk_dsi_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c9d0c335c519d405d480ffdc2feaa5b847c0e1bb..fa8c752d96381a8593f8c9d20c76db37adae5ab3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1690,9 +1690,10 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = devm_drm_bridge_alloc(dev, struct mtk_hdmi, bridge,
+				     &mtk_hdmi_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	hdmi->dev = dev;
 	hdmi->conf = of_device_get_match_data(dev);
@@ -1718,8 +1719,6 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to register audio driver\n");
-
-	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index c9678dc68fa142882e2beb24fe81185fbdef733b..24a96b0a9e31de8f23192fd36c9515c65c4d87d3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -227,9 +227,12 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	struct device_node *remote;
 	int ret;
 
-	meson_encoder_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_encoder_cvbs), GFP_KERNEL);
-	if (!meson_encoder_cvbs)
-		return -ENOMEM;
+	meson_encoder_cvbs = devm_drm_bridge_alloc(priv->dev,
+						   struct meson_encoder_cvbs,
+						   bridge,
+						   &meson_encoder_cvbs_bridge_funcs);
+	if (IS_ERR(meson_encoder_cvbs))
+		return PTR_ERR(meson_encoder_cvbs);
 
 	/* CVBS Connector Bridge */
 	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
@@ -243,9 +246,6 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	if (!meson_encoder_cvbs->next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find CVBS Connector bridge\n");
-
-	/* CVBS Encoder Bridge */
-	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
 	meson_encoder_cvbs->bridge.of_node = priv->dev->of_node;
 	meson_encoder_cvbs->bridge.type = DRM_MODE_CONNECTOR_Composite;
 	meson_encoder_cvbs->bridge.ops = DRM_BRIDGE_OP_MODES;
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3db518e5f95d324c218b730e0948c3dc845382bd..b98264801ee6ec45a1b9af1c5082d605b9b34aa4 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -106,9 +106,12 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	struct device_node *remote;
 	int ret;
 
-	meson_encoder_dsi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_dsi), GFP_KERNEL);
-	if (!meson_encoder_dsi)
-		return -ENOMEM;
+	meson_encoder_dsi = devm_drm_bridge_alloc(priv->dev,
+						  struct meson_encoder_dsi,
+						  bridge,
+						  &meson_encoder_dsi_bridge_funcs);
+	if (IS_ERR(meson_encoder_dsi))
+		return PTR_ERR(meson_encoder_dsi);
 
 	/* DSI Transceiver Bridge */
 	remote = of_graph_get_remote_node(priv->dev->of_node, 2, 0);
@@ -121,9 +124,6 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	if (!meson_encoder_dsi->next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");
-
-	/* DSI Encoder Bridge */
-	meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
 	meson_encoder_dsi->bridge.of_node = priv->dev->of_node;
 	meson_encoder_dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5f02695aafd1aa8444cd936a36e8f3a8010881a0..abb335ec469576817f5095dd02a58b3fe63827dd 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -373,9 +373,12 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	struct device_node *remote;
 	int ret;
 
-	meson_encoder_hdmi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_hdmi), GFP_KERNEL);
-	if (!meson_encoder_hdmi)
-		return -ENOMEM;
+	meson_encoder_hdmi = devm_drm_bridge_alloc(priv->dev,
+						   struct meson_encoder_hdmi,
+						   bridge,
+						   &meson_encoder_hdmi_bridge_funcs);
+	if (IS_ERR(meson_encoder_hdmi))
+		return PTR_ERR(meson_encoder_hdmi);
 
 	/* HDMI Transceiver Bridge */
 	remote = of_graph_get_remote_node(priv->dev->of_node, 1, 0);
@@ -390,9 +393,6 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 				    "Failed to find HDMI transceiver bridge\n");
 		goto err_put_node;
 	}
-
-	/* HDMI Encoder Bridge */
-	meson_encoder_hdmi->bridge.funcs = &meson_encoder_hdmi_bridge_funcs;
 	meson_encoder_hdmi->bridge.of_node = priv->dev->of_node;
 	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	meson_encoder_hdmi->bridge.interlace_allowed = true;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index a9145253294fcaef6bae4e1406a781f6d710d357..b90c90f31e86ef81bf60827ae9bcb9d3f8fca6e4 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -878,9 +878,10 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	struct rcar_lvds *lvds;
 	int ret;
 
-	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
-	if (lvds == NULL)
-		return -ENOMEM;
+	lvds = devm_drm_bridge_alloc(&pdev->dev, struct rcar_lvds, bridge,
+				     &rcar_lvds_bridge_ops);
+	if (IS_ERR(lvds))
+		return PTR_ERR(lvds);
 
 	platform_set_drvdata(pdev, lvds);
 
@@ -894,8 +895,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	ret = rcar_lvds_parse_dt(lvds);
 	if (ret < 0)
 		return ret;
-
-	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
 	lvds->bridge.of_node = pdev->dev.of_node;
 
 	lvds->mmio = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index dc6ab012cdb69f92a33da69638aef3fc6fdfa46c..cfece6f03afad9fac12e5c54d319b07d008ceb11 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -701,9 +701,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	u32 txsetr;
 	int ret;
 
-	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return -ENOMEM;
+	dsi = devm_drm_bridge_alloc(&pdev->dev, struct rzg2l_mipi_dsi, bridge,
+				    &rzg2l_mipi_dsi_bridge_ops);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
 
 	platform_set_drvdata(pdev, dsi);
 	dsi->dev = &pdev->dev;
@@ -759,9 +760,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	dsi->num_data_lanes = min(((txsetr >> 16) & 3) + 1, num_data_lanes);
 	rzg2l_mipi_dsi_dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
-
-	/* Initialize the DRM bridge. */
-	dsi->bridge.funcs = &rzg2l_mipi_dsi_bridge_ops;
 	dsi->bridge.of_node = dsi->dev->of_node;
 
 	/* Init host device */

-- 
2.49.0

