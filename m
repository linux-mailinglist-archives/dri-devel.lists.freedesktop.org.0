Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C316A2B024
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13F010E912;
	Thu,  6 Feb 2025 18:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DZ/1NcWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE7010E910
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:15:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06C4344264;
 Thu,  6 Feb 2025 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGVO+QbU0hs3mabM5lWL+R6oDUNoq4UxfAsW2GhkoGA=;
 b=DZ/1NcWug2cys6H/JNqGshU/Xo24P11YOh993tdanJxk9kvVnFe475NPxvy644vsLb1PxQ
 wMwSsJHTbaPq0eTPiBjNOzfBLFs2h27LXxtKsK8a2yUYWvLFB1C0G5JbmHrhKQVwTc47ci
 2U9kF6U/XChUQn4GifaEgqdT9XXCkpPPfBYJVYTmjyE8uim/smB3dMqib28HMRiXl7lopS
 rQuz6SPtkxt0FmExvCi5u2hiG/EPtyZ3aDtCb2zerdVye0ceF3bEM4wAdGiU0s/jrQSHwf
 vWH8LewgF31ZkOGjE0rv882i4ucnJyW5i4kaOfzviMfo3wTuY0aTf8OumoNwhg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:30 +0100
Subject: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedufeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

Add a devm/drmm action to these functions so the bridge reference is
dropped automatically when the caller is removed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f694b32ca59cb91c32846bc00b43360df41cc1ad..497ec06dfcb05ab5dee8ea5e8f1eafb9c2807612 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -33,6 +33,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
@@ -1459,6 +1460,13 @@ static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
 	return ret;
 }
 
+static void devm_drm_bridge_put_void(void *data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)data;
+
+	drm_bridge_put(bridge);
+}
+
 /**
  * devm_drm_of_get_bridge - Return next bridge in the chain
  * @dev: device to tie the bridge lifetime to
@@ -1469,6 +1477,10 @@ static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
  * Given a DT node's port and endpoint number, finds the connected node
  * and returns the associated bridge if any.
  *
+ * The refcount of the returned bridge is incremented, but the caller does
+ * not have to call drm_bridge_put() when done with the bridge. It will be
+ * done by devres when @dev is removed.
+ *
  * Returns a pointer to the bridge if successful, or an error pointer
  * otherwise.
  */
@@ -1483,6 +1495,10 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = devm_add_action_or_reset(dev, devm_drm_bridge_put_void, bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge);
@@ -1497,6 +1513,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge);
  * graph link search is not enough, e.g. for drivers that need to support
  * panels described only as subnodes.
  *
+ * The refcount of the returned bridge is incremented, but the caller does
+ * not have to call drm_bridge_put() when done with the bridge. It will be
+ * done by devres when @dev is removed.
+ *
  * RETURNS:
  * A pointer to the bridge if successful, or an error pointer otherwise.
  */
@@ -1513,10 +1533,21 @@ struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
 	if (!bridge)
 		return ERR_PTR(-ENODEV);
 
+	ret = devm_add_action_or_reset(dev, devm_drm_bridge_put_void, bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
 
+static void drmm_bridge_put_void(struct drm_device *drm, void *ptr)
+{
+	struct drm_bridge *bridge = ptr;
+
+	drm_bridge_put(bridge);
+}
+
 /**
  * drmm_of_get_bridge - Return next bridge in the chain
  * @drm: device to tie the bridge lifetime to
@@ -1527,6 +1558,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
  * Given a DT node's port and endpoint number, finds the connected node
  * and returns the associated bridge if any.
  *
+ * The refcount of the returned bridge is incremented, but the caller does
+ * not have to call drm_bridge_put() when done with the bridge. It will be
+ * done by drmm when @dev is removed.
+ *
  * Returns a drmm managed pointer to the bridge if successful, or an error
  * pointer otherwise.
  */
@@ -1541,6 +1576,10 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = drmm_add_action_or_reset(drm, drmm_bridge_put_void, bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return bridge;
 }
 EXPORT_SYMBOL(drmm_of_get_bridge);

-- 
2.34.1

