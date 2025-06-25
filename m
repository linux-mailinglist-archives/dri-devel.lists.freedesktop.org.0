Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3343AE8A6B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8A110E78E;
	Wed, 25 Jun 2025 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QDi7yTgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF97B10E794
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:46:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1470344386;
 Wed, 25 Jun 2025 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5cWt4DQ5z/OAZZXRdVZQGA3iOK8m5DLnXiWLrcVyqfk=;
 b=QDi7yTgx9bfCMGT1OziOEhW2QV3zPR3QIERv1kIwcdYQzUrwGh1ojuRb+9RU3y+EZagkT8
 ga+Aot/Nt3lTh3E1GVuqNoCZ2EnWzhSZbdWQc81yGupwENqZEXUILO4g95d1zgThdI2wML
 RzK+R5bCj3N8TEy7bxsQpm7FsBCyaGTRruMhsf6XT5sytqUj6wfeea45zSBbbFknQ/p8XA
 0so0RW6xyHjQS6Ih9SHFnwKoetXm0O1S7xq68ek3gALBVgwejXSsnMt54bDv33ULGQixj5
 FJUhUJ3rWmW844thWEsR9ubTBNnl0GIv6pgZ8vnCYyjERZTCn2xEoPzG4/uXUg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:35 +0200
Subject: [PATCH 31/32] drm/mcde: use the DSI host pointer in mcde_dsi_irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-31-e36bc258a7c5@bootlin.com>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepvdeknecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
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

mcde_dsi_irq() takes a struct mipi_dsi_device which it uses solely to get
the struct mipi_dsi_host pointer.

We want to get rid of mipi_dsi_device pointers in host drivers, so use
directly the struct dsi_host pointer which is now stored in struct
mcde.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 2 +-
 drivers/gpu/drm/mcde/mcde_drm.h     | 2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 18b8ed1456d436dc8e7b7778461d76a251509ecf..70f8d92ed23a192f4cdb51c7f68b9973147b2113 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -89,7 +89,7 @@ void mcde_display_irq(struct mcde *mcde)
 	 *
 	 * TODO: Currently only one DSI link is supported.
 	 */
-	if (!mcde->dpi_output && mcde_dsi_irq(mcde->mdsi)) {
+	if (!mcde->dpi_output && mcde_dsi_irq(mcde->dsi_host)) {
 		u32 val;
 
 		/*
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index 4ae32e92d7f36707dfd91adb2cc9c76ec32a677e..23f9a6473d8ac0f91b3e3665f22e52ef8e696a17 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -104,7 +104,7 @@ static inline bool mcde_flow_is_video(struct mcde *mcde)
 		mcde->flow_mode == MCDE_VIDEO_FORMATTER_FLOW);
 }
 
-bool mcde_dsi_irq(struct mipi_dsi_device *mdsi);
+bool mcde_dsi_irq(struct mipi_dsi_host *host);
 void mcde_dsi_te_request(struct mcde *mcde);
 void mcde_dsi_enable(struct drm_bridge *bridge);
 void mcde_dsi_disable(struct drm_bridge *bridge);
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 2df2fdf45bd7d6259c631f1c402191db49336cd0..b97b9541b6277ad3e024845d3bb61c9e73d627f7 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -64,13 +64,13 @@ static inline struct mcde_dsi *host_to_mcde_dsi(struct mipi_dsi_host *h)
 	return container_of(h, struct mcde_dsi, dsi_host);
 }
 
-bool mcde_dsi_irq(struct mipi_dsi_device *mdsi)
+bool mcde_dsi_irq(struct mipi_dsi_host *host)
 {
 	struct mcde_dsi *d;
 	u32 val;
 	bool te_received = false;
 
-	d = host_to_mcde_dsi(mdsi->host);
+	d = host_to_mcde_dsi(host);
 
 	dev_dbg(d->dev, "%s called\n", __func__);
 

-- 
2.49.0

