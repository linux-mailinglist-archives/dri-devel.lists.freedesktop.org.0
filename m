Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD7A46D5D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 22:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD1310E2F4;
	Wed, 26 Feb 2025 21:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ikf0by6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6007810E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 21:24:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAF6C4435B;
 Wed, 26 Feb 2025 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740605094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjXIFbrycUalHpcnR/F5qePySLzaC2KIyI6Go0Y3H6o=;
 b=ikf0by6PP6wDzBzH4f1AW/7i/C50BiqT4SRCVXjtBq8jUBcsVS9BqRMC/ofjH0KTQiqIzR
 H0RueAaGHUHfIErOLGlCgP6uXHEhjX+2YhxbOTWqyaF2sIqaa7MXullaZFsiwz6pt8iFII
 ICoEC6T3Cw5nxBTW9AQl6sJT4Bw9PrH+CpK3saQqljwg+K7PELliMqLIEYl/1GHOi9vCvE
 sn0GJxmAiFfzOUwy5VCZITyTyiFCZkmPT6s6PYmyZ19qirlXaHncsHl3naVH/UfV4Jcy55
 gNqwDwifbgXjFk9kHk2GTgHVfgoyqfgOsZYdJabdGx+Gmq7EnTirFIEY8gMAGw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 26 Feb 2025 22:23:53 +0100
Subject: [PATCH v8 2/2] drm/debugfs: add top-level 'bridges' file showing
 all added bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-drm-debugfs-show-all-bridges-v8-2-bb511cc49d83@bootlin.com>
References: <20250226-drm-debugfs-show-all-bridges-v8-0-bb511cc49d83@bootlin.com>
In-Reply-To: <20250226-drm-debugfs-show-all-bridges-v8-0-bb511cc49d83@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekheeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhop
 ehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomh
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

The global bridges_list holding all the bridges between drm_bridge_add()
and drm_bridge_remove() cannot be inspected via debugfs. Add a file showing
it.

To avoid code duplication, move the code printing a bridge info to a common
function.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v8:
- add the file in drm_bridge.c, which avois the added #if CONFIG_DEBUG_FS
- fix incorrect (but harmless) idx increment in
  drm_bridge_debugfs_show_bridge()

Changed in v7:
- move implementation to drm_bridge.c to avoid exporting bridge_list and
  bridge_mutex

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c | 72 ++++++++++++++++++++++++++++++--------------
 drivers/gpu/drm/drm_drv.c    |  2 ++
 include/drm/drm_bridge.h     |  1 +
 3 files changed, 53 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a6bf1a565e3c3a8d24de60448972849f6d86ba72..9c6e35d41ed54a14d5745e684a341c907ed84d6b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1336,6 +1336,49 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
+static void drm_bridge_debugfs_show_bridge(struct drm_printer *p,
+					   struct drm_bridge *bridge,
+					   unsigned int idx)
+{
+	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
+	drm_printf(p, "\ttype: [%d] %s\n",
+		   bridge->type,
+		   drm_get_connector_type_name(bridge->type));
+
+	if (bridge->of_node)
+		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
+
+	drm_printf(p, "\tops: [0x%x]", bridge->ops);
+	if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+		drm_puts(p, " detect");
+	if (bridge->ops & DRM_BRIDGE_OP_EDID)
+		drm_puts(p, " edid");
+	if (bridge->ops & DRM_BRIDGE_OP_HPD)
+		drm_puts(p, " hpd");
+	if (bridge->ops & DRM_BRIDGE_OP_MODES)
+		drm_puts(p, " modes");
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
+		drm_puts(p, " hdmi");
+	drm_puts(p, "\n");
+}
+
+static int allbridges_show(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_bridge *bridge;
+	unsigned int idx = 0;
+
+	mutex_lock(&bridge_lock);
+
+	list_for_each_entry(bridge, &bridge_list, list)
+		drm_bridge_debugfs_show_bridge(&p, bridge, idx++);
+
+	mutex_unlock(&bridge_lock);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(allbridges);
+
 static int encoder_bridges_show(struct seq_file *m, void *data)
 {
 	struct drm_encoder *encoder = m->private;
@@ -1343,33 +1386,18 @@ static int encoder_bridges_show(struct seq_file *m, void *data)
 	struct drm_bridge *bridge;
 	unsigned int idx = 0;
 
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
+	drm_for_each_bridge_in_chain(encoder, bridge)
+		drm_bridge_debugfs_show_bridge(&p, bridge, idx++);
 
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(encoder_bridges);
 
+void drm_bridge_debugfs_params(struct dentry *root)
+{
+	debugfs_create_file("bridges", 0444, root, NULL, &allbridges_fops);
+}
+
 void drm_bridge_debugfs_encoder_params(struct dentry *root,
 				       struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3cf440eee8a2ab3de134d925db8f1d2ce68062b7..22e8cd0a6a37a0ac25535e9d570da25571b0b2bc 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -38,6 +38,7 @@
 #include <linux/xarray.h>
 
 #include <drm/drm_accel.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_client_event.h>
 #include <drm/drm_color_mgmt.h>
@@ -1120,6 +1121,7 @@ static int __init drm_core_init(void)
 	}
 
 	drm_debugfs_root = debugfs_create_dir("dri", NULL);
+	drm_bridge_debugfs_params(drm_debugfs_root);
 
 	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
 	if (ret < 0)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0890acfe04b99b1ccbbff10b507cb8c2b2705e06..2a99d70865571f24db0ca75c758cfd09d3a5d459 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1108,6 +1108,7 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
+void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);
 
 #endif

-- 
2.48.1

