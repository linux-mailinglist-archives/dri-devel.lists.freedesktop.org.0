Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238607BEA18
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5810E2CF;
	Mon,  9 Oct 2023 18:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A4010E2CB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:50:53 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5068692b0d9so3888232e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696877451; x=1697482251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6jVuSzKHgybHn+UGNRYFgxtTU/++A3l0g2VwpsBdZY=;
 b=iJJolHkTYi3fGgvf9buFkxNgesl2ZrC/JIvBYEYuMRdi+5PYCAItJqoB1RhEzZvd40
 USVyMOfz46l/EuCmNj9YKFiuFL6gawHPUN08xHEMdYA5K1RFA6huqpQ4xdlJubvwYt0H
 7/dSzYq0JlIITzhSZ6vm4Zv3+ldWywUpDTktYdJXFNtL0aQs6RJbbvNSs2KLA6QHpvpb
 T+LHofgyy9YsVBxRksHVvbGaIOqdFDFQek9pmZYF5fYa3DD+7+cpmcX6LLajHwBL32/i
 p7kVq/Dm+J27hutHvoPnSErP51f/vBKxcVYiDWgKr4cT45oSyI3giz41McDql3B7o3RB
 5aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696877451; x=1697482251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6jVuSzKHgybHn+UGNRYFgxtTU/++A3l0g2VwpsBdZY=;
 b=iTFVpDm1GwLGkaXPiPYMK/10aJ6QKDwhIyy/kdi+iWDZDYmVch7Ptv4qvudkjwPw9T
 pApB9DHqk/+DaZBoGNfqeqd8XBsqxeuJnqBmaGjrQb9hvqgfVAb9sU7hhG/CuoqJCrFt
 pmDN11zW9TP89iZ1bd/HGn38VrLoDP2lpHM+u8NoRabQrSvT7EUi/UjdqgAWMFkaoNwp
 hrGo62VkniQa8G88YibbinUd01jqDBWc3RHMY+6PacIq+sNKSfFVVqCvPQFuXvvPyB3q
 prlYoJDBx4v2dRJafeTln3q00/dArL64TbD8Vp/d+Szt/9XuCVxIa8NMXasPSXvrIysZ
 3AOw==
X-Gm-Message-State: AOJu0YxlYlccb8lWEX3Xl5JGOgMEbgqN2WWpaB0ENH4lzVKrHgisZysV
 FgE1kKrS2BIGWmJJ3Pos1Qx8Iw==
X-Google-Smtp-Source: AGHT+IE3hsjmUpg08SrCJXSWGftyCk+9LVsV4qrvIxgCK/xwj0bsTiG3ykNWjE+31vqkaGd9IHCCMw==
X-Received: by 2002:a05:6512:3444:b0:504:7cc6:1ad7 with SMTP id
 j4-20020a056512344400b005047cc61ad7mr14080171lfr.1.1696877451403; 
 Mon, 09 Oct 2023 11:50:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056512040700b00501ce0cacb6sm1529262lfk.188.2023.10.09.11.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:50:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 2/3] drm/bridge: migrate bridge_chains to per-encoder file
Date: Mon,  9 Oct 2023 21:50:47 +0300
Message-Id: <20231009185048.2758954-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
References: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
index cfb7dcdb66c4..6cace8ca132e 100644
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

