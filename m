Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9BA2B025
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17C110E90B;
	Thu,  6 Feb 2025 18:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ngpa34VP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F3210E90B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:15:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 719A543297;
 Thu,  6 Feb 2025 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738865712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3TMHUj+K2chHxrw2j/AgnSqeNwHfofOR/atkdn41Jk=;
 b=ngpa34VP7GHOG616ZNKcHSS9uQYSTzIiw6mhtigy+a6n5jbwCrs76Xvp+R7Nt8NZ5V9bQT
 frZELq1z13fvvesWr4NL0UgPRv/utgsj6hizuPoeprSpLQtIZQ49HOzItZgPPHX57gpJa8
 4Zp8luzqOPbt2QZWYICUb3XTdLmamMMgmKaj01nP86ulbH5WNIiqhA32yXI+hj+yT/xCFg
 I4Fmgc0Pu4/zUuxRf4qfeHrQyURQKdTaSd4dy+qor+ie4FgIXJGtTTnptxHNxUGjSF1A5d
 Yxd+eMEOqQ0BZUV7GPeXpRvhXkxM0mYb7ZUUNph9GVi57OycYM+fIhGEJMZqsw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:28 +0100
Subject: [PATCH v6 13/26] drm/encoder: add drm_encoder_cleanup_from()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
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

Supporting hardware whose final part of the DRM pipeline can be physically
removed requires the ability to detach all bridges from a given point to
the end of the pipeline.

Introduce a variant of drm_encoder_cleanup() for this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v6: none
Changes in v5: none
Changes in v4: none
Changes in v3: none

Changed in v2:
 - fix a typo in a comment
---
 drivers/gpu/drm/drm_encoder.c | 21 +++++++++++++++++++++
 include/drm/drm_encoder.h     |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 8f2bc6a28482229fd0b030a1958f87753ad7885f..472dfbefe2960924a4e83bec425af8c7ef5f5265 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -207,6 +207,27 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
 }
 EXPORT_SYMBOL(drm_encoder_cleanup);
 
+/**
+ * drm_encoder_cleanup_from - remove a given bridge and all the following
+ * @encoder: encoder whole list of bridges shall be pruned
+ * @bridge: first bridge to remove
+ *
+ * Removes from an encoder all the bridges starting with a given bridge
+ * and until the end of the chain.
+ *
+ * This should not be used in "normal" DRM pipelines. It is only useful for
+ * devices whose final part of the DRM chain can be physically removed and
+ * later reconnected (possibly with different hardware).
+ */
+void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
+{
+	struct drm_bridge *next;
+
+	list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
+		drm_bridge_detach(bridge);
+}
+EXPORT_SYMBOL(drm_encoder_cleanup_from);
+
 static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
 {
 	struct drm_encoder *encoder = ptr;
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 977a9381c8ba943b4d3e021635ea14856df8a17d..bafcabb242674880a97dfb62a50d93cc4d80c1d4 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -320,6 +320,7 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
 }
 
 void drm_encoder_cleanup(struct drm_encoder *encoder);
+void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge);
 
 /**
  * drm_for_each_encoder_mask - iterate over encoders specified by bitmask

-- 
2.34.1

