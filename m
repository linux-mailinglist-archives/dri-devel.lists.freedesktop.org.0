Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82947A7E446
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2573010E500;
	Mon,  7 Apr 2025 15:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KukuFIp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62A510E4ED;
 Mon,  7 Apr 2025 15:27:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 140D5432BC;
 Mon,  7 Apr 2025 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744039652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0/FGDDEEv1bADImBm72Eb+o2LF4PnN49TpkyA00SwI=;
 b=KukuFIp0YBL5FQjQWYQ8SGM7gkfrYmCM7nnmPpRASGoNkxuFJbGM0XKXsIwRRilROfUgwq
 ad6wshOz6uKHYkrgtVWgjy4lERLiqko/2OkisS6SdDhqulm4Nde6vJUFhfeICP0joX9rW+
 3HUdgGa3QxSuhSCz2y4T3lB+J8qt3L4ijmDvhjZX1lopmA+XqDyWMcsDNRLcOkAi7xnxeT
 xwZM4PbX4ciQYE4BNO87a6N1atu3bnOtMYTM1+0ptAhQlt+DC6n7wdkkhv9LPFzdVK55zA
 KzbvA57i8wz/lR9Epi8aAVu2EkCKVxnqEqmhObAGuQpYi3hgphLud2IDm1Wngg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 33/34] drm/bridge: add devm_drm_put_bridge()
Date: Mon,  7 Apr 2025 17:27:08 +0200
Message-ID: <20250407-drm-bridge-convert-to-alloc-api-v1-33-42113ff8d9c0@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudffiefgvdfftdffkeejjefhffduleejleeuieetieetgeehtefhjedtgeegieegnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihrdhfrhhithiirdgsohigpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvp
 dhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
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

Bridges obtained via devm_drm_bridge_alloc(dev, ...) will be put when the
requesting device (@dev) is removed.

However drivers which obtained them may need to put the obtained reference
explicitly. One such case is if they bind the devm removal action to a
different device than the one implemented by the driver itself and which
might be removed at a different time, such as bridge/panel.c.

Add devm_drm_put_bridge() to manually release a devm-obtained bridge in
such cases.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Hervé Codina <herve.codina@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: dri-devel@lists.freedesktop.org
Cc: asahi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: chrome-platform@lists.linux.dev
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/gpu/drm/drm_bridge.c | 14 ++++++++++++++
 include/drm/drm_bridge.h     |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b4c89ec01998b849018ce031c7cd84614e65e710..456363d86080b2a55035c3108c16afa4f9e57e06 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1392,6 +1392,20 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
+/**
+ * devm_drm_put_bridge - Release a bridge reference obtained via devm
+ * @dev: device that got the bridge via devm
+ * @bridge: pointer to a struct drm_bridge obtained via devm
+ *
+ * Same as drm_bridge_put() for bridge pointers obtained via devm functions
+ * such as devm_drm_bridge_alloc().
+ */
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge)
+{
+	devm_release_action(dev, drm_bridge_put_void, bridge);
+}
+EXPORT_SYMBOL(devm_drm_put_bridge);
+
 static void drm_bridge_debugfs_show_bridge(struct drm_printer *p,
 					   struct drm_bridge *bridge,
 					   unsigned int idx)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index df9bbf6fd1fb522add28b76406b74cdb7391fc57..5b4e5e935a17ba6fc4a6a53ad0a302e249ca418b 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1167,6 +1167,8 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge) {}
+
 static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 						     struct device_node *node,
 						     u32 port,
@@ -1176,6 +1178,8 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge);
+
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);
 

-- 
2.49.0

