Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A9CFED6B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 17:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE1310E638;
	Wed,  7 Jan 2026 16:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gf3+E3Zr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406DC10E638
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 16:22:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0D90F1A26E4;
 Wed,  7 Jan 2026 16:22:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D4357606F8;
 Wed,  7 Jan 2026 16:22:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 72981103C87C9; Wed,  7 Jan 2026 17:22:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767802958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ST179KMkx3KAXksoGXwbmWOr+cYParM2ZEAFdnlrrzM=;
 b=gf3+E3Zrot6ORWwKRshSfPbFg7fbgq4507Z+9VG0hEjM0D51xpU8YmGZzK4gI5mKCHz2EI
 Kflt7d9Ohg7QHoUz1fsaeOdeLx1hMR4JPrWEavVvZimIKPhdKYiDvrfsOHz7JRaXnXO11x
 lNZQiMvNUtfiECi1dR13lE50fBXABfVsFu2d8lkUXYxo8RmzGIvp783FIZD/mamBG2titk
 Qv38gwAxQ/P9e6ki4KHYNXF9lzfsB7hNnVJbfH1usv/PKkiGMeIKRVKbaaC/FJ/vB8xiwH
 5ibUIiEYSAog2IBJKcKEdLQD5M6sYQX6OM0on54yVAxfH4uwoIP/3Ra6UQfcZQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 17:22:02 +0100
Subject: [PATCH 4/6] drm/mediatek: mtk_hdmi*: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c        | 4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 4 ++--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0face4dcaa36..1ea259854780 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -986,8 +986,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (hdmi->next_bridge) {
-		ret = drm_bridge_attach(encoder, hdmi->next_bridge,
+	if (hdmi->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, hdmi->bridge.next_bridge,
 					bridge, flags);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..40ded86dbea3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -315,8 +315,8 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return -EINVAL;
 
 	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		hdmi->next_bridge = of_drm_find_bridge(remote);
-		if (!hdmi->next_bridge) {
+		hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+		if (!hdmi->bridge.next_bridge) {
 			dev_err(dev, "Waiting for external bridge\n");
 			of_node_put(remote);
 			return -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index de5e064585f8..cace3c5dc067 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -150,7 +150,6 @@ struct mtk_hdmi_conf {
 
 struct mtk_hdmi {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
 	struct device *dev;
 	const struct mtk_hdmi_conf *conf;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..2adeece499b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -940,8 +940,8 @@ static int mtk_hdmi_v2_bridge_attach(struct drm_bridge *bridge,
 		DRM_ERROR("The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
 		return -EINVAL;
 	}
-	if (hdmi->next_bridge) {
-		ret = drm_bridge_attach(encoder, hdmi->next_bridge, bridge, flags);
+	if (hdmi->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, hdmi->bridge.next_bridge, bridge, flags);
 		if (ret)
 			return ret;
 	}

-- 
2.52.0

