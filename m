Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E006FA9B762
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E96610E851;
	Thu, 24 Apr 2025 19:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FFzFS01G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B4610E853;
 Thu, 24 Apr 2025 19:01:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6726443A8;
 Thu, 24 Apr 2025 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfk1kaPUb8jTQgYvcZdTdUyZhZFAInoALAL+cRhzIsQ=;
 b=FFzFS01GlQrZfB6BQDbzmZPOeavhG0G7hdda1dZnT4d4jRflZ0ewpQz5QD2UKjYOns2kqM
 bVcf5tDVqCifr+gZfX040V6ikCiR+7MgGDXzKsIeJsyKrRavDgvo987htFgEGqydjrOe4R
 uXqNaiDLqZeptN9doc9ytWeQeaf7u9mf7J6zpEqd+/KePQ9MVH/suwyp/urS0SkZ7GmT95
 Gt/dJFkhMhj85N0HObD5Uekhcw1ZlA+berplmz5fYBIqfOV6Sqqf6COs44K7NDKEiVRQe6
 CYAnFtj+yTg3l9rtmWCNyJRpjmguJntf8JIs+7rX0EUEAeek5PhP7puY6Gu6Vw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:36 +0200
Subject: [PATCH v2 29/34] drm: zynqmp_dp: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-29-8f91a404d86b@bootlin.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdehnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
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

This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
which delegates to a submodule (zynqmp_dp.c) the allocation of a
sub-structure embedding the drm_bridge and its initialization, however it
does not delegate the drm_bridge_add(). Hence, following carefully the code
flow, it is correct to change the allocation function and .funcs assignment
in the submodule, while the drm_bridge_add() is not in that submodule.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Changes in v2:
- rebased on current drm-misc-next
- remove the kfree() calls too, as we are converting from kzalloc+kfree,
  not from devm_kzalloc
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c    | 31 +++++++++++--------------------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c |  1 -
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 238cbb49963efa6e8cc737d8a6e76250f6531276..02e1feaa611596a24217136ee8ce7f5d2f1900a2 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2439,9 +2439,9 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	struct zynqmp_dp *dp;
 	int ret;
 
-	dp = kzalloc(sizeof(*dp), GFP_KERNEL);
-	if (!dp)
-		return -ENOMEM;
+	dp = devm_drm_bridge_alloc(&pdev->dev, struct zynqmp_dp, bridge, &zynqmp_dp_bridge_funcs);
+	if (IS_ERR(dp))
+		return PTR_ERR(dp);
 
 	dp->dev = &pdev->dev;
 	dp->dpsub = dpsub;
@@ -2454,31 +2454,25 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 
 	/* Acquire all resources (IOMEM, IRQ and PHYs). */
 	dp->iomem = devm_platform_ioremap_resource_byname(pdev, "dp");
-	if (IS_ERR(dp->iomem)) {
-		ret = PTR_ERR(dp->iomem);
-		goto err_free;
-	}
+	if (IS_ERR(dp->iomem))
+		return PTR_ERR(dp->iomem);
 
 	dp->irq = platform_get_irq(pdev, 0);
-	if (dp->irq < 0) {
-		ret = dp->irq;
-		goto err_free;
-	}
+	if (dp->irq < 0)
+		return dp->irq;
 
 	dp->reset = devm_reset_control_get(dp->dev, NULL);
-	if (IS_ERR(dp->reset)) {
-		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
+	if (IS_ERR(dp->reset))
+		return dev_err_probe(dp->dev, PTR_ERR(dp->reset),
 				    "failed to get reset\n");
-		goto err_free;
-	}
 
 	ret = zynqmp_dp_reset(dp, true);
 	if (ret < 0)
-		goto err_free;
+		return ret;
 
 	ret = zynqmp_dp_reset(dp, false);
 	if (ret < 0)
-		goto err_free;
+		return ret;
 
 	ret = zynqmp_dp_phy_probe(dp);
 	if (ret)
@@ -2486,7 +2480,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 
 	/* Initialize the bridge. */
 	bridge = &dp->bridge;
-	bridge->funcs = &zynqmp_dp_bridge_funcs;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 		    | DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
@@ -2539,8 +2532,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	zynqmp_dp_phy_exit(dp);
 err_reset:
 	zynqmp_dp_reset(dp, true);
-err_free:
-	kfree(dp);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 3a9544b97bc5311f9adeb57c08c837a04b6922fa..2764c4b17c5e49611db8adf41dd09e3134c2d524 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -180,7 +180,6 @@ static int zynqmp_dpsub_parse_dt(struct zynqmp_dpsub *dpsub)
 void zynqmp_dpsub_release(struct zynqmp_dpsub *dpsub)
 {
 	kfree(dpsub->disp);
-	kfree(dpsub->dp);
 	kfree(dpsub);
 }
 

-- 
2.49.0

