Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51792A9B75C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD1B10E471;
	Thu, 24 Apr 2025 19:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gQDDO6pe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DA710E84D;
 Thu, 24 Apr 2025 19:01:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A6C64439D;
 Thu, 24 Apr 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/6Zj+wUweRTx+VHVK1CTlVxOlTH40bx6xBYT/U2MxM=;
 b=gQDDO6peFD+MeoI/74dTBBtnqibz0ajwpOD6hA379Dlwkj8gyJ1ZuG4Joul5jS46/Bcmwe
 6tZhghLt8TzyEA9SQi0+HGiTKpHKM/GWIYwv3tqz2h9qm3bN9y/FLbaSwcxepoGlcUIy+p
 AcIktOmce3cZK3joICgcRsf1c5HGqeUQqvAEcLPXHO3rKvnhH7JePomK23u6cKK27GXoZF
 4i63+MMSbHHZac4oeLP/LHROm8sys3wsU5lOXfpQn9fXZLK3fYA2rjt0brvZBz2tIFIoms
 yrt97216v1rEf1bGQ+5Vyw/QLeWnpqyNTrc7oZ82yNjcr4Oub8dwXSlWv4eD3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:34 +0200
Subject: [PATCH v2 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopegurghvvgdrshhtvghvvghnshhonhesrhgrshhpsggvrhhrhihpihdrtghom
 hdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
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

This driver already implements refcounting of the struct vc4_dsi, which
embeds struct drm_bridge. Now this is a duplicate of the refcounting
implemented by the DRM bridge core, so convert the vc4_dsi_get/put() calls
into drm_bridge_get/put() calls and get rid of the driver-specific
refcounting implementation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

Changed in v2:
- fix error code checking
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 34 +++++-----------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index efc6f6078b026764c59cfb2a33b28a88b7018c3a..458e5d9879645f18bcbcaeeb71b5f1038f9581da 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -552,8 +552,6 @@ struct vc4_dsi {
 	struct vc4_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 
-	struct kref kref;
-
 	struct platform_device *pdev;
 
 	struct drm_bridge *out_bridge;
@@ -1622,29 +1620,11 @@ static void vc4_dsi_dma_chan_release(void *ptr)
 	dsi->reg_dma_chan = NULL;
 }
 
-static void vc4_dsi_release(struct kref *kref)
-{
-	struct vc4_dsi *dsi =
-		container_of(kref, struct vc4_dsi, kref);
-
-	kfree(dsi);
-}
-
-static void vc4_dsi_get(struct vc4_dsi *dsi)
-{
-	kref_get(&dsi->kref);
-}
-
-static void vc4_dsi_put(struct vc4_dsi *dsi)
-{
-	kref_put(&dsi->kref, &vc4_dsi_release);
-}
-
 static void vc4_dsi_release_action(struct drm_device *drm, void *ptr)
 {
 	struct vc4_dsi *dsi = ptr;
 
-	vc4_dsi_put(dsi);
+	drm_bridge_put(&dsi->bridge);
 }
 
 static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
@@ -1655,7 +1635,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_encoder *encoder = &dsi->encoder.base;
 	int ret;
 
-	vc4_dsi_get(dsi);
+	drm_bridge_get(&dsi->bridge);
 
 	ret = drmm_add_action_or_reset(drm, vc4_dsi_release_action, dsi);
 	if (ret)
@@ -1810,15 +1790,12 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi;
 
-	dsi = kzalloc(sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return -ENOMEM;
+	dsi = devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge, &vc4_dsi_bridge_funcs);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
 	dev_set_drvdata(dev, dsi);
 
-	kref_init(&dsi->kref);
-
 	dsi->pdev = pdev;
-	dsi->bridge.funcs = &vc4_dsi_bridge_funcs;
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = dev->of_node;
 #endif
@@ -1836,7 +1813,6 @@ static void vc4_dsi_dev_remove(struct platform_device *pdev)
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
-	vc4_dsi_put(dsi);
 }
 
 struct platform_driver vc4_dsi_driver = {

-- 
2.49.0

