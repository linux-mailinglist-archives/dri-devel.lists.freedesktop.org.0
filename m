Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28857A445AD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A71410E75F;
	Tue, 25 Feb 2025 16:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="d2sb87hn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A4A10E751
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:16:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD0CB4435C;
 Tue, 25 Feb 2025 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740500187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhrN2RdRmhY01s4zRlL2EVZGrZ0qirN8//YZAm2QyLk=;
 b=d2sb87hn5Y2JoAoHpp/tFzBNo6si80EFt9YAS6hTDJ3R6SUiEbcN+shxHKNjtAxUGSCvbN
 6ulyHiy/1+ASGWHO/plKsA33bx67RXNm+BAtBSyaGWRzQlo0yHCPcaV3nIU55xysyclZFJ
 YR+O+nj/qDNXsBFFXe0ZXunYYkO4tcmSqldjanbECxlh1RaEkfOoNUIqyk03Fn++Htn/G2
 giZTNOxd2m0GbZip3w3omdK2EbUCtWTaILjcyRm4+6OkajVBLtazfOFyHUdfg9g+y0u+k3
 TqhC/5O9TGoWyqP7ZkgB625TDWfocrHt9FPPCC3tABLvBsXWB2En5FPKckalkg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Feb 2025 17:16:20 +0100
Subject: [PATCH v7 1/2] drm/bridge: move bridges_show logic from drm_debugfs.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-drm-debugfs-show-all-bridges-v7-1-8826037ada37@bootlin.com>
References: <20250225-drm-debugfs-show-all-bridges-v7-0-8826037ada37@bootlin.com>
In-Reply-To: <20250225-drm-debugfs-show-all-bridges-v7-0-8826037ada37@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
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

In preparation to expose more info about bridges in debugfs, which will
require more insight into drm_bridge data structures, move the bridges_show
code to drm_bridge.c.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v7.
---
 drivers/gpu/drm/drm_bridge.c  | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_debugfs.c | 27 ++-------------------------
 include/drm/drm_bridge.h      |  8 ++++++++
 3 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 241a384ebce39b4a3db58c208af27960904fc662..6e1e02c1cf443fbaa764765ad369b7a34cc03f2d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1335,6 +1335,39 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
+#ifdef CONFIG_DEBUG_FS
+void drm_bridge_debugfs_show_encoder_bridges(struct drm_printer *p,
+					     struct drm_encoder *encoder)
+{
+	struct drm_bridge *bridge;
+	unsigned int idx = 0;
+
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		drm_printf(p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
+		drm_printf(p, "\ttype: [%d] %s\n",
+			   bridge->type,
+			   drm_get_connector_type_name(bridge->type));
+
+		if (bridge->of_node)
+			drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
+
+		drm_printf(p, "\tops: [0x%x]", bridge->ops);
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+			drm_puts(p, " detect");
+		if (bridge->ops & DRM_BRIDGE_OP_EDID)
+			drm_puts(p, " edid");
+		if (bridge->ops & DRM_BRIDGE_OP_HPD)
+			drm_puts(p, " hpd");
+		if (bridge->ops & DRM_BRIDGE_OP_MODES)
+			drm_puts(p, " modes");
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
+			drm_puts(p, " hdmi");
+		drm_puts(p, "\n");
+	}
+}
+EXPORT_SYMBOL(drm_bridge_debugfs_show_encoder_bridges);
+#endif
+
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
 MODULE_DESCRIPTION("DRM bridge infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b2178864c7ee12db9aa1f562e106b2f604439f8..a625c0c9a9aa076af19c8ba47564dbb24ba71c9a 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -744,31 +744,8 @@ static int bridges_show(struct seq_file *m, void *data)
 {
 	struct drm_encoder *encoder = m->private;
 	struct drm_printer p = drm_seq_file_printer(m);
-	struct drm_bridge *bridge;
-	unsigned int idx = 0;
-
-	drm_for_each_bridge_in_chain(encoder, bridge) {
-		drm_printf(&p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
-		drm_printf(&p, "\ttype: [%d] %s\n",
-			   bridge->type,
-			   drm_get_connector_type_name(bridge->type));
-
-		if (bridge->of_node)
-			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
-
-		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
-		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
-			drm_puts(&p, " detect");
-		if (bridge->ops & DRM_BRIDGE_OP_EDID)
-			drm_puts(&p, " edid");
-		if (bridge->ops & DRM_BRIDGE_OP_HPD)
-			drm_puts(&p, " hpd");
-		if (bridge->ops & DRM_BRIDGE_OP_MODES)
-			drm_puts(&p, " modes");
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
-			drm_puts(&p, " hdmi");
-		drm_puts(&p, "\n");
-	}
+
+	drm_bridge_debugfs_show_encoder_bridges(&p, encoder);
 
 	return 0;
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..23c062853e7bb42d8d73af35ef7f16fb37345a37 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1108,4 +1108,12 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
+#ifdef CONFIG_DEBUG_FS
+void drm_bridge_debugfs_show_encoder_bridges(struct drm_printer *p,
+					     struct drm_encoder *encoder);
+#else
+static inline void drm_bridge_debugfs_show_encoder_bridges(struct drm_printer *p,
+							   struct drm_encoder *encoder) {}
+#endif
+
 #endif

-- 
2.48.1

