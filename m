Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A39A9B76C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2927A10E2EC;
	Thu, 24 Apr 2025 19:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aaMKmaw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD90F10E85B;
 Thu, 24 Apr 2025 19:01:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 677F343B6C;
 Thu, 24 Apr 2025 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebgCpKb0JBnNyBzMJIKOLuwJd1meFjjT61fyzD63fBQ=;
 b=aaMKmaw48gLBMFqilmrxOH/EqitY5qe7kukExYBsTUf6vFnA9+CRAVOjc5+RKEKpyMxb9C
 dKrjZHkDUz8rxRfFF/citZMTAR5C/SrcFKpSld5mgsJfaln/BgOKwxi7hjIc2BsONZkhap
 E1IS9HkTnj3p93FT2jAGcmCViFN6THz7jqi0MZ10/jfAlxOYKFIsqQen7K7zWNnq47I2X4
 RX6wRuihA3LFNu0xw5GkfbB8MmuFw9c/181aMGFXfASGfv3Cc664jOKJbjwf+Du0GkX70e
 gaJtYAo+P/C/ti8o5SUtk8a5l6wOlzsMqob8vM4+Dp35a5hqoVuSs3vLEfrDqw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:38 +0200
Subject: [PATCH v2 31/34] drm/bridge: imx8*-ldb: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-31-8f91a404d86b@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdejnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvvggurhgvnhhosehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

This is the new API for allocating DRM bridges.

These two drivers are tangled together by the ldb_add_bridge_helper(), so
they are converted at once.

They also have a similar design, each embedding an array of channels in
their main struct, and each channel embeds a drm_bridge. This prevents
dynamic, refcount-based deallocation of the bridges.

To make the new, dynamic bridge allocation possible:

 * change the array of channels into an array of channel pointers
 * allocate each channel using devm_drm_bridge_alloc()
 * adapt ldb_add_bridge_helper() to not set the funcs pointer
   (now done by devm_drm_bridge_alloc())
 * adapt the code wherever using the channels

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c |  4 +---
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h |  3 +--
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c     | 32 ++++++++++++++++++-----------
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c    | 20 ++++++++++++------
 4 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 61347f6ec33d906264f7e06902b0d915d263f3f8..6149ba141a389a04b3c347a67f13e049328c07ff 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -190,8 +190,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 }
 EXPORT_SYMBOL_GPL(ldb_find_next_bridge_helper);
 
-void ldb_add_bridge_helper(struct ldb *ldb,
-			   const struct drm_bridge_funcs *bridge_funcs)
+void ldb_add_bridge_helper(struct ldb *ldb)
 {
 	struct ldb_channel *ldb_ch;
 	int i;
@@ -203,7 +202,6 @@ void ldb_add_bridge_helper(struct ldb *ldb,
 			continue;
 
 		ldb_ch->bridge.driver_private = ldb_ch;
-		ldb_ch->bridge.funcs = bridge_funcs;
 		ldb_ch->bridge.of_node = ldb_ch->np;
 
 		drm_bridge_add(&ldb_ch->bridge);
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
index 38a8a54b37a60e1be942aaa60b1d1bc375a7a131..de187e3269996d284ecad451dd857271056812e1 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
@@ -88,8 +88,7 @@ int ldb_init_helper(struct ldb *ldb);
 
 int ldb_find_next_bridge_helper(struct ldb *ldb);
 
-void ldb_add_bridge_helper(struct ldb *ldb,
-			   const struct drm_bridge_funcs *bridge_funcs);
+void ldb_add_bridge_helper(struct ldb *ldb);
 
 void ldb_remove_bridge_helper(struct ldb *ldb);
 
diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
index 524aac751359f5cd377807508cbeeb6a597529e1..47aa65938e6a521cd6f111535f6feb3920a0dfb7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -47,7 +47,7 @@ struct imx8qm_ldb_channel {
 struct imx8qm_ldb {
 	struct ldb base;
 	struct device *dev;
-	struct imx8qm_ldb_channel channel[MAX_LDB_CHAN_NUM];
+	struct imx8qm_ldb_channel *channel[MAX_LDB_CHAN_NUM];
 	struct clk *clk_pixel;
 	struct clk *clk_bypass;
 	int active_chno;
@@ -107,7 +107,7 @@ static int imx8qm_ldb_bridge_atomic_check(struct drm_bridge *bridge,
 
 	if (is_split) {
 		imx8qm_ldb_ch =
-			&imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
+			imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
 		imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, true,
 				       phy_cfg);
 		ret = phy_validate(imx8qm_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
@@ -158,7 +158,7 @@ imx8qm_ldb_bridge_mode_set(struct drm_bridge *bridge,
 
 	if (is_split) {
 		imx8qm_ldb_ch =
-			&imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
+			imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
 		imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, true,
 				       phy_cfg);
 		ret = phy_configure(imx8qm_ldb_ch->phy, &opts);
@@ -226,13 +226,13 @@ static void imx8qm_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	if (is_split) {
-		ret = phy_power_on(imx8qm_ldb->channel[0].phy);
+		ret = phy_power_on(imx8qm_ldb->channel[0]->phy);
 		if (ret)
 			DRM_DEV_ERROR(dev,
 				      "failed to power on channel0 PHY: %d\n",
 				      ret);
 
-		ret = phy_power_on(imx8qm_ldb->channel[1].phy);
+		ret = phy_power_on(imx8qm_ldb->channel[1]->phy);
 		if (ret)
 			DRM_DEV_ERROR(dev,
 				      "failed to power on channel1 PHY: %d\n",
@@ -261,12 +261,12 @@ static void imx8qm_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
 	ldb_bridge_disable_helper(bridge);
 
 	if (is_split) {
-		ret = phy_power_off(imx8qm_ldb->channel[0].phy);
+		ret = phy_power_off(imx8qm_ldb->channel[0]->phy);
 		if (ret)
 			DRM_DEV_ERROR(dev,
 				      "failed to power off channel0 PHY: %d\n",
 				      ret);
-		ret = phy_power_off(imx8qm_ldb->channel[1].phy);
+		ret = phy_power_off(imx8qm_ldb->channel[1]->phy);
 		if (ret)
 			DRM_DEV_ERROR(dev,
 				      "failed to power off channel1 PHY: %d\n",
@@ -412,7 +412,7 @@ static int imx8qm_ldb_get_phy(struct imx8qm_ldb *imx8qm_ldb)
 	int i, ret;
 
 	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
-		imx8qm_ldb_ch = &imx8qm_ldb->channel[i];
+		imx8qm_ldb_ch = imx8qm_ldb->channel[i];
 		ldb_ch = &imx8qm_ldb_ch->base;
 
 		if (!ldb_ch->is_available)
@@ -448,6 +448,14 @@ static int imx8qm_ldb_probe(struct platform_device *pdev)
 	if (!imx8qm_ldb)
 		return -ENOMEM;
 
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		imx8qm_ldb->channel[i] =
+			devm_drm_bridge_alloc(dev, struct imx8qm_ldb_channel, base.bridge,
+					      &imx8qm_ldb_bridge_funcs);
+		if (IS_ERR(imx8qm_ldb->channel[i]))
+			return PTR_ERR(imx8qm_ldb->channel[i]);
+	}
+
 	imx8qm_ldb->clk_pixel = devm_clk_get(dev, "pixel");
 	if (IS_ERR(imx8qm_ldb->clk_pixel)) {
 		ret = PTR_ERR(imx8qm_ldb->clk_pixel);
@@ -473,7 +481,7 @@ static int imx8qm_ldb_probe(struct platform_device *pdev)
 	ldb->ctrl_reg = 0xe0;
 
 	for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
-		ldb->channel[i] = &imx8qm_ldb->channel[i].base;
+		ldb->channel[i] = &imx8qm_ldb->channel[i]->base;
 
 	ret = ldb_init_helper(ldb);
 	if (ret)
@@ -499,12 +507,12 @@ static int imx8qm_ldb_probe(struct platform_device *pdev)
 		}
 
 		imx8qm_ldb->active_chno = 0;
-		imx8qm_ldb_ch = &imx8qm_ldb->channel[0];
+		imx8qm_ldb_ch = imx8qm_ldb->channel[0];
 		ldb_ch = &imx8qm_ldb_ch->base;
 		ldb_ch->link_type = pixel_order;
 	} else {
 		for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
-			imx8qm_ldb_ch = &imx8qm_ldb->channel[i];
+			imx8qm_ldb_ch = imx8qm_ldb->channel[i];
 			ldb_ch = &imx8qm_ldb_ch->base;
 
 			if (ldb_ch->is_available) {
@@ -525,7 +533,7 @@ static int imx8qm_ldb_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, imx8qm_ldb);
 	pm_runtime_enable(dev);
 
-	ldb_add_bridge_helper(ldb, &imx8qm_ldb_bridge_funcs);
+	ldb_add_bridge_helper(ldb);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index d4f3492ca5abf65a3327d7fa62214832946eb218..5d272916e200980f7253a032701dcd990e0e34f2 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -44,7 +44,7 @@ struct imx8qxp_ldb_channel {
 struct imx8qxp_ldb {
 	struct ldb base;
 	struct device *dev;
-	struct imx8qxp_ldb_channel channel[MAX_LDB_CHAN_NUM];
+	struct imx8qxp_ldb_channel *channel[MAX_LDB_CHAN_NUM];
 	struct clk *clk_pixel;
 	struct clk *clk_bypass;
 	struct drm_bridge *companion;
@@ -410,7 +410,7 @@ static const struct drm_bridge_funcs imx8qxp_ldb_bridge_funcs = {
 static int imx8qxp_ldb_set_di_id(struct imx8qxp_ldb *imx8qxp_ldb)
 {
 	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
-			 &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
+			 imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
 	struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
 	struct device_node *ep, *remote;
 	struct device *dev = imx8qxp_ldb->dev;
@@ -456,7 +456,7 @@ imx8qxp_ldb_check_chno_and_dual_link(struct ldb_channel *ldb_ch, int link)
 static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 {
 	struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
-			 &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
+			 imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
 	struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
 	struct ldb_channel *companion_ldb_ch;
 	struct device_node *companion;
@@ -586,6 +586,14 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	if (!imx8qxp_ldb)
 		return -ENOMEM;
 
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		imx8qxp_ldb->channel[i] =
+			devm_drm_bridge_alloc(dev, struct imx8qxp_ldb_channel, base.bridge,
+					      &imx8qxp_ldb_bridge_funcs);
+		if (IS_ERR(imx8qxp_ldb->channel[i]))
+			return PTR_ERR(imx8qxp_ldb->channel[i]);
+	}
+
 	imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
 	if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
 		ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
@@ -611,7 +619,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	ldb->ctrl_reg = 0xe0;
 
 	for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
-		ldb->channel[i] = &imx8qxp_ldb->channel[i].base;
+		ldb->channel[i] = &imx8qxp_ldb->channel[i]->base;
 
 	ret = ldb_init_helper(ldb);
 	if (ret)
@@ -627,7 +635,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
-		imx8qxp_ldb_ch = &imx8qxp_ldb->channel[i];
+		imx8qxp_ldb_ch = imx8qxp_ldb->channel[i];
 		ldb_ch = &imx8qxp_ldb_ch->base;
 
 		if (ldb_ch->is_available) {
@@ -660,7 +668,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, imx8qxp_ldb);
 	pm_runtime_enable(dev);
 
-	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
+	ldb_add_bridge_helper(ldb);
 
 	return 0;
 }

-- 
2.49.0

