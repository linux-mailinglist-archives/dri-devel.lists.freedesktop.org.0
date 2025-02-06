Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC80A2B02B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6071A10E915;
	Thu,  6 Feb 2025 18:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AREd3kQj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746C110E914
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:15:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF2A8442BE;
 Thu,  6 Feb 2025 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCyiZrk1wZv+6lsBh4aT/JUbtqG9ImrmSJSb0HiDc9A=;
 b=AREd3kQjJ5MTwvg4Dp7t6dvP4wFGZE9QXGJLQY+LDRgEiRXM1FTT8rIKcYUayo9OK1OPZW
 GXu667LdmHyFEYqs8ycBhfOZzN6QB96v/XKBV9zSNqqXDEHkztUyQsxt2NqALN6g6MU1MV
 91LnmL9cUXLJ6tgH1r2zRWhZT7d+6g/xNVaEmC1sfOOpntSbrysfY3/42ZtJX6XqWz8INN
 vbgpmcFXbGf/ay46QDA7qKOLCRBJwe6WaItl7ZiIQnWWsP99GTO/KflixkdfD87igkqpXo
 1UGorCaUmLK8li4s39xnfjtrsTcOjZ3iXly1Axlz9SvA5hnARHSC1CYDrSOyHg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:36 +0100
Subject: [PATCH v6 21/26] drm/bridge: add list of removed refcounted
 bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-21-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedukeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
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

Between drm_bridge_add() and drm_bridge_remove() bridges "published" to the
DRM core via the global bridge_list and visible in
/sys/kernel/debug/dri/bridges. However between drm_bridge_remove() and the
last drm_bridge_put(), a refcounted bridge memory is still allocated even
though the bridge is not "published", i.e. not in bridges_list, so it is
invisible in debugfs. This prevents debugging refcounted bridges lifetime,
especially leaks doe to any missing drm_bridge_put().

In order to allow debugfs to also show the removed refcounted bridges, move
such bridges into a new ad-hoc list until they are freed.

Note this requires adding INIT_LIST_HEAD(&bridge->list) in the bridge
initialization code: the lack of such init was not exposing any bug so far,
but it would with the new code.

Document the new behaviour of drm_bridge_remove() and update the
drm_bridge_add() documentation to stay consistent.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c   | 23 ++++++++++++++++++++---
 drivers/gpu/drm/drm_internal.h |  1 +
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index fc44a5d227a89a12b5c3299a29776cfddb36ce27..b315c7c4e32cc27723c69c795efe4f3313134204 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -315,9 +315,10 @@
  * driver.
  */
 
-/* Protect bridge_list */
+/* Protect bridge_list and bridge_removed_list */
 DEFINE_MUTEX(bridge_lock);
 LIST_HEAD(bridge_list);
+LIST_HEAD(bridge_removed_list);
 
 /* Internal function (for refcounted bridges) */
 void __drm_bridge_free(struct kref *kref)
@@ -327,6 +328,10 @@ void __drm_bridge_free(struct kref *kref)
 
 	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);
 
+	mutex_lock(&bridge_lock);
+	list_del(&bridge->list);
+	mutex_unlock(&bridge_lock);
+
 	kfree(container);
 }
 EXPORT_SYMBOL(__drm_bridge_free);
@@ -355,6 +360,8 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 		return ERR_PTR(-ENOMEM);
 
 	bridge = container + offset;
+
+	INIT_LIST_HEAD(&bridge->list);
 	bridge->container_offset = offset;
 	bridge->funcs = funcs;
 	kref_init(&bridge->refcount);
@@ -371,7 +378,10 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 EXPORT_SYMBOL(__devm_drm_bridge_alloc);
 
 /**
- * drm_bridge_add - add the given bridge to the global bridge list
+ * drm_bridge_add - add to published bridges
+ *
+ * Adds the given bridge to the global bridge list, so it can be found by
+ * of_drm_find_bridge().
  *
  * @bridge: bridge control structure
  */
@@ -423,7 +433,12 @@ int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
 EXPORT_SYMBOL(devm_drm_bridge_add);
 
 /**
- * drm_bridge_remove - remove the given bridge from the global bridge list
+ * drm_bridge_remove - remove from published bridges
+ *
+ * Remove the given bridge from the global bridge list, so it won't be
+ * found by of_drm_find_bridge(). If the bridge is refcounted it also adds
+ * it to the removed bridge list, to keep track of removed bridges until
+ * their allocated memory is finally freed.
  *
  * @bridge: bridge control structure
  */
@@ -435,6 +450,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 
 	mutex_lock(&bridge_lock);
 	list_del_init(&bridge->list);
+	if (drm_bridge_is_refcounted(bridge))
+		list_add_tail(&bridge->list, &bridge_removed_list);
 	mutex_unlock(&bridge_lock);
 
 	list_for_each_entry_safe(br, tmp, &bridge_list, list)
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b6e875d4b25faae6bb0bb952c3c12bd4819698ec..bbfc938b21c13bc69c36d3833f6cb6d5d22d1c54 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -51,6 +51,7 @@ struct drm_vblank_crtc;
 // for drm_debugfs.c
 extern struct mutex bridge_lock;
 extern struct list_head bridge_list;
+extern struct list_head bridge_removed_list;
 
 /* drm_client_event.c */
 #if defined(CONFIG_DRM_CLIENT)

-- 
2.34.1

