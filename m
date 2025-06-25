Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A51AE8A71
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C963210E795;
	Wed, 25 Jun 2025 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CNNRYbXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F5B10E78E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:46:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E22544385;
 Wed, 25 Jun 2025 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDJ3EtpkuDN9Ku0moJtIwyqVQ/u80fKaKJRdWczN4K4=;
 b=CNNRYbXqLHwCsIX3UNkvqSM7Wh3C/KnZMZ+HZlIBgspOqvRUY1N3Pl75Yidp7GrKT4EOo4
 WhLfhl3Z8yUFrbVqo9+sWh64y/xLG+77F4TO9kF2+5s6iUgc5M1QXLV7QW9VZmg0H7/PI5
 WVaUBzpRDSYGODTKf+lM71oIUlP0ORDekyWKaxJNOGIw4LoWhfFNsXT8woP6wKnXhIjCM9
 BhnpDqfUqzZzJ3x86pZWmEjn8PColHDZ3LP1VcbAaZyAiuMHaq6UBD1+10y8fFUKRLnEjK
 GzN9uqu/Wutg8DX6b3Gh85xyCR4UF6Orm4XsEOz3IY+Dz0KbPeXgPHF0DCipPA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:34 +0200
Subject: [PATCH 30/32] drm/mcde: store a pointer to mipi_dsi_host to
 perform TE requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-30-e36bc258a7c5@bootlin.com>
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

The MCDE driver stores a struct mipi_dsi_device pointer in struct mcde for
two uses: sending commands via mcde_dsi_te_request() and accessing the DSI
bus format parameters (lanes, channel etc).

We want to get rid of mipi_dsi_device pointers in host drivers. This patch
removes the first usage by additionally storing a pointer to the struct
mipi_dsi_host, and using it in host_to_mcde_dsi().

The second usage is removed in a following patch.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 2 +-
 drivers/gpu/drm/mcde/mcde_drm.h     | 3 ++-
 drivers/gpu/drm/mcde/mcde_dsi.c     | 9 ++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 52043a12a2e8e5ae2f0d6d279b2314ba31c98b5b..18b8ed1456d436dc8e7b7778461d76a251509ecf 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -1339,7 +1339,7 @@ static void mcde_start_flow(struct mcde *mcde)
 {
 	/* Request a TE ACK only in TE+BTA mode */
 	if (mcde->flow_mode == MCDE_COMMAND_BTA_TE_FLOW)
-		mcde_dsi_te_request(mcde->mdsi);
+		mcde_dsi_te_request(mcde);
 
 	/* Enable FIFO A flow */
 	mcde_enable_fifo(mcde, MCDE_FIFO_A);
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index ecb70b4b737c0e74b93c6f3e81f1170774303f78..4ae32e92d7f36707dfd91adb2cc9c76ec32a677e 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -73,6 +73,7 @@ struct mcde {
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
 	struct drm_simple_display_pipe pipe;
+	struct mipi_dsi_host *dsi_host;
 	struct mipi_dsi_device *mdsi;
 	bool dpi_output;
 	s16 stride;
@@ -104,7 +105,7 @@ static inline bool mcde_flow_is_video(struct mcde *mcde)
 }
 
 bool mcde_dsi_irq(struct mipi_dsi_device *mdsi);
-void mcde_dsi_te_request(struct mipi_dsi_device *mdsi);
+void mcde_dsi_te_request(struct mcde *mcde);
 void mcde_dsi_enable(struct drm_bridge *bridge);
 void mcde_dsi_disable(struct drm_bridge *bridge);
 extern struct platform_driver mcde_dsi_driver;
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 04041ad9231bd53cf4bfa18ad41caa19df3b838a..2df2fdf45bd7d6259c631f1c402191db49336cd0 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -148,6 +148,7 @@ bool mcde_dsi_irq(struct mipi_dsi_device *mdsi)
 static void mcde_dsi_attach_to_mcde(struct mcde_dsi *d)
 {
 	d->mcde->mdsi = d->mdsi;
+	d->mcde->dsi_host = &d->dsi_host;
 
 	/*
 	 * Select the way the DSI data flow is pushing to the display:
@@ -190,8 +191,10 @@ static int mcde_dsi_host_detach(struct mipi_dsi_host *host,
 	struct mcde_dsi *d = host_to_mcde_dsi(host);
 
 	d->mdsi = NULL;
-	if (d->mcde)
+	if (d->mcde) {
 		d->mcde->mdsi = NULL;
+		d->mcde->dsi_host = NULL;
+	}
 
 	return 0;
 }
@@ -381,12 +384,12 @@ static const struct mipi_dsi_host_ops mcde_dsi_host_ops = {
 };
 
 /* This sends a direct (short) command to request TE */
-void mcde_dsi_te_request(struct mipi_dsi_device *mdsi)
+void mcde_dsi_te_request(struct mcde *mcde)
 {
 	struct mcde_dsi *d;
 	u32 val;
 
-	d = host_to_mcde_dsi(mdsi->host);
+	d = host_to_mcde_dsi(mcde->dsi_host);
 
 	/* Command "nature" TE request */
 	val = DSI_DIRECT_CMD_MAIN_SETTINGS_CMD_NAT_TE_REQ;

-- 
2.49.0

