Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5808380238A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D1610E2BA;
	Sun,  3 Dec 2023 11:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE3910E2B7
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:53:20 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9b956c68cso37464881fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701604398; x=1702209198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UCdMNWs57/LLtlNDuSVwj1QQKxWwJWHckRoUFyfJo8=;
 b=hOjAuBqSj2BUeLFXEkZzwye18Jl2VtPa+u/RLxLzGFeHKDBQIN5f53u1D88VyqYW77
 YpLA+L/9ubOh5mDDg/5Zc4jse/6CnmyL/BN6N+ApzwJNXTwjkryNo0xyEGqHgB/Z5jHn
 HGrBP8SZxUNlre4ljLFOByqYLK7XPpZe5fA8e9/74BtrKUVwsxxFaCVkwnvgvJxFPRG7
 e2drAqbFMgx12/dEIbYAClZE50D+lb4MhPlrCebyOEUPuC/DuvTw4UAbK49/J9Vb5ZCq
 JrOE8W5591PJrVoHcTXfFV/pNmF++5JK+4B9GW2xcNTpxCQ3QOgGZ4E+YELAhfbWjFBV
 M2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701604398; x=1702209198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UCdMNWs57/LLtlNDuSVwj1QQKxWwJWHckRoUFyfJo8=;
 b=HYj2VmaTwZj3dwOETsbcwJfkPF24OkvSZP6fGnN7rlzvjVthmV1IS0eOaP0cqALyjV
 i/6ftdBODssehc3uLKFe/zu+aGHFv7C8EpCNDLhUXexZbDndbWhgmlMraRltPvHBZOVj
 Pljx31ZxWLs64Iythjw3rujLm3CkkPz2aAd3m68XC+C+oEXZCZwy3agnpxWInoVymD8t
 bwJh8kI4woo50jiuykG5WhiWBV7gtIm0jDktggXGKZ7HELRgQj+Y0SetgCsDZWGDNIIf
 dWgb5L2u6PT4+2N92bbSLHn7IiwnH8j7jExy2wL7l90M07U40tcIaFh6vTq14W1U1xjv
 uK7Q==
X-Gm-Message-State: AOJu0Yy5nk/CT3xhfl50nj814KfjI+srwIQlnEKl4RR2bIRJfAHRPovg
 ngDidoWrJ0F0WIV2m/t8XZqFcA==
X-Google-Smtp-Source: AGHT+IH3j5uuStP88OXUP9MyXu2+6v0HF+6Oh5Cwp1nrxWa8RZL/Nv1GjH5KL+wYABmLrHaIkXIOKQ==
X-Received: by 2002:a2e:7a14:0:b0:2ca:135:2204 with SMTP id
 v20-20020a2e7a14000000b002ca01352204mr208688ljc.16.1701604398348; 
 Sun, 03 Dec 2023 03:53:18 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e9645000000b002c9c21d01c2sm900437ljh.101.2023.12.03.03.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:53:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND v2 2/3] drm/bridge: migrate bridge_chains to
 per-encoder file
Date: Sun,  3 Dec 2023 14:53:14 +0300
Message-Id: <20231203115315.1306124-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of having a single file with all bridge chains, list bridges
under a corresponding per-encoder debugfs directory.

While we are at it, also slightly improve the formatting of the bridge
data: split a single line entry into multiple lines, include the symbol
name of the bridge funcs and add the textual representation of the
bridge ops.

Example of the listing:

$ cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dsi_mgr_bridge_funcs
	type: [0] Unknown
	ops: [0]
bridge[1]: lt9611uxc_bridge_funcs
	type: [11] HDMI-A
	OF: /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b:lontium,lt9611uxc
	ops: [7] detect edid hpd

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge.c  | 44 -----------------------------------
 drivers/gpu/drm/drm_debugfs.c | 40 ++++++++++++++++++++++++++++---
 include/drm/drm_bridge.h      |  2 --
 3 files changed, 37 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 30d66bee0ec6..cee3188adf3d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1347,50 +1347,6 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
-#ifdef CONFIG_DEBUG_FS
-static int drm_bridge_chains_info(struct seq_file *m, void *data)
-{
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-	struct drm_printer p = drm_seq_file_printer(m);
-	struct drm_mode_config *config = &dev->mode_config;
-	struct drm_encoder *encoder;
-	unsigned int bridge_idx = 0;
-
-	list_for_each_entry(encoder, &config->encoder_list, head) {
-		struct drm_bridge *bridge;
-
-		drm_printf(&p, "encoder[%u]\n", encoder->base.id);
-
-		drm_for_each_bridge_in_chain(encoder, bridge) {
-			drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
-				   bridge_idx, bridge->type, bridge->ops);
-
-#ifdef CONFIG_OF
-			if (bridge->of_node)
-				drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
-#endif
-
-			drm_printf(&p, "\n");
-
-			bridge_idx++;
-		}
-	}
-
-	return 0;
-}
-
-static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
-	{ "bridge_chains", drm_bridge_chains_info, 0 },
-};
-
-void drm_bridge_debugfs_init(struct drm_device *dev)
-{
-	drm_debugfs_add_files(dev, drm_bridge_debugfs_list,
-			      ARRAY_SIZE(drm_bridge_debugfs_list));
-}
-#endif
-
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
 MODULE_DESCRIPTION("DRM bridge infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 00406b4f3235..02e7481758c0 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -314,10 +314,8 @@ void drm_debugfs_dev_register(struct drm_device *dev)
 		drm_framebuffer_debugfs_init(dev);
 		drm_client_debugfs_init(dev);
 	}
-	if (drm_drv_uses_atomic_modeset(dev)) {
+	if (drm_drv_uses_atomic_modeset(dev))
 		drm_atomic_debugfs_init(dev);
-		drm_bridge_debugfs_init(dev);
-	}
 }
 
 int drm_debugfs_register(struct drm_minor *minor, int minor_id,
@@ -589,6 +587,38 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
 	crtc->debugfs_entry = NULL;
 }
 
+static int bridges_show(struct seq_file *m, void *data)
+{
+	struct drm_encoder *encoder = m->private;
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_bridge *bridge;
+	unsigned int idx = 0;
+
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		drm_printf(&p, "bridge[%d]: %ps\n", idx++, bridge->funcs);
+		drm_printf(&p, "\ttype: [%d] %s\n",
+			   bridge->type,
+			   drm_get_connector_type_name(bridge->type));
+#ifdef CONFIG_OF
+		if (bridge->of_node)
+			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
+#endif
+		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+			drm_puts(&p, " detect");
+		if (bridge->ops & DRM_BRIDGE_OP_EDID)
+			drm_puts(&p, " edid");
+		if (bridge->ops & DRM_BRIDGE_OP_HPD)
+			drm_puts(&p, " hpd");
+		if (bridge->ops & DRM_BRIDGE_OP_MODES)
+			drm_puts(&p, " modes");
+		drm_puts(&p, "\n");
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(bridges);
+
 void drm_debugfs_encoder_add(struct drm_encoder *encoder)
 {
 	struct drm_minor *minor = encoder->dev->primary;
@@ -604,6 +634,10 @@ void drm_debugfs_encoder_add(struct drm_encoder *encoder)
 
 	encoder->debugfs_entry = root;
 
+	/* bridges list */
+	debugfs_create_file("bridges", 0444, root, encoder,
+			    &bridges_fops);
+
 	if (encoder->funcs->debugfs_init)
 		encoder->funcs->debugfs_init(encoder, root);
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9ef461aa9b9e..e39da5807ba7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -950,6 +950,4 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
-void drm_bridge_debugfs_init(struct drm_device *dev);
-
 #endif
-- 
2.39.2

