Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A99164FD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 12:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD6010E07C;
	Tue, 25 Jun 2024 10:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dGbjhU3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9993210E07C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 10:08:24 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id
 98e67ed59e1d1-2c2dee9d9cfso4131512a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719310104; x=1719914904;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P0VI4tQBTmZ5EZUuvascNs7IsaJGTBT4lhzcT7XH/+M=;
 b=dGbjhU3pZZ7wZQ2X1+gemMIKS0RlaW/vj36RenxxVDHqRsCsxHwt7qq6dqFSAa25pa
 Mtpw2kwD/djGj1jrXx+zItglVho5E5SjgrO9+I034qg2KG4+8FumvKnw5wn5kJeL0kbt
 tcQvamojiGkkxawenMew8Is+/3oVKcsVVoVZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719310104; x=1719914904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0VI4tQBTmZ5EZUuvascNs7IsaJGTBT4lhzcT7XH/+M=;
 b=gsCRM6qEmZkgUICw2ub2H/UpGw29BkLSak98+Ai40+aM3RJ75fuQmuDKmhHQnubrve
 p1Mr0HdUUZgV2JOlN3itcn/1ONE0E+UxDafzXcJjsjIMnXwRD+4xWXGfcF3rxvpqtbgc
 RG9cs568D2aBqTWhu7hsi3iF/FSfFC9K/JGWlcL+kXw5DJcwjcprQhsuYwI2pz1UCbCZ
 YnJ7Xsech3VshBPhYHURbc7To/jH/xLybOtdCHQn1QH8K5wfW3CVMbDTT15zSH9pjXoC
 DtTCDQJmn2CwEEzrE+mkJ0mhbOrHed6nUokvGdmrohtKkXBEX/a2XEgtjnNQWBARV5Pj
 ACTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhlxecP4T2Vx0FlUo551wr/e/ZCOaAKgqJRUFxKCdIe73Lzgb3VoUmVAeNC8YxGfD8Nb5DFo+UrK9kqwkSZVt7l8sxROLPD/WxHIL2if7r
X-Gm-Message-State: AOJu0Yxgv6YAvFi+tT2CfsFOJTjyRVXBnzT3Bng6SovA5iYnKFOPvhu1
 /Xutfb55zOJVQy1TXvJEWq8RQb5nUculDoNrblb18/gVjV/hNW/C42oWY+hOz3QD78ApfK888Tz
 Tr9dzDJw=
X-Google-Smtp-Source: AGHT+IH5OdAV9csYNq1eqW1UaiZqOfB6WW6Pq0nAQiIUqAEOfTwBZ1zBKWpXAJ+WtCc4g8XzMAVHfQ==
X-Received: by 2002:a17:90a:398f:b0:2c7:c703:ef26 with SMTP id
 98e67ed59e1d1-2c8613d5b2emr5468261a91.24.1719310103953; 
 Tue, 25 Jun 2024 03:08:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:ea5a:67dd:bd1e:edef])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819dbb979sm8313305a91.46.2024.06.25.03.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 03:08:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] drm/mipi-dsi: Add OF notifier handler
Date: Tue, 25 Jun 2024 18:08:17 +0800
Message-ID: <20240625100818.3478242-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OF notifier handler needed for creating/destroying MIPI DSI devices
according to dynamic runtime changes in the DT live tree. This code is
enabled when CONFIG_OF_DYNAMIC is selected.

This is based on existing code for I2C and SPI subsystems.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is a patch I wrote for the ChromeOS SKU component prober [1]. That
series is still being worked on, but in the meantime I thought this
patch might be useful to Luca. Luca talked about a hot-pluggable
connector that has DSI at ELC earlier this year. If DT live tree
patching is used in this case, this patch could be needed.

[1] https://lore.kernel.org/linux-arm-kernel/20231109100606.1245545-1-wenst@chromium.org/

 drivers/gpu/drm/drm_mipi_dsi.c | 67 +++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a471c46f5ca6..a47e8928db53 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -118,6 +118,7 @@ static void mipi_dsi_dev_release(struct device *dev)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 
+	of_node_clear_flag(dev->of_node, OF_POPULATED);
 	of_node_put(dev->of_node);
 	kfree(dsi);
 }
@@ -158,6 +159,7 @@ static struct mipi_dsi_device *
 of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
 {
 	struct mipi_dsi_device_info info = { };
+	struct mipi_dsi_device *device;
 	int ret;
 	u32 reg;
 
@@ -175,9 +177,70 @@ of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
 
 	info.channel = reg;
 	info.node = of_node_get(node);
+	of_node_set_flag(node, OF_POPULATED);
 
-	return mipi_dsi_device_register_full(host, &info);
+	device = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(device))
+		of_node_clear_flag(node, OF_POPULATED);
+
+	return device;
 }
+
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+static int of_mipi_dsi_notify(struct notifier_block *nb, unsigned long action, void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+	struct mipi_dsi_host *host;
+	struct mipi_dsi_device *device;
+
+	switch (of_reconfig_get_state_change(action, rd)) {
+	case OF_RECONFIG_CHANGE_ADD:
+		host = of_find_mipi_dsi_host_by_node(rd->dn->parent);
+		if (!host)
+			return NOTIFY_OK;	/* not for us */
+
+		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
+			return NOTIFY_OK;
+
+		/*
+		 * Clear the flag before adding the device so that fw_devlink
+		 * doesn't skip adding consumers to this device.
+		 */
+		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
+		device = of_mipi_dsi_device_add(host, rd->dn);
+		if (IS_ERR(device)) {
+			dev_err(host->dev, "failed to create device for '%pOF'\n", rd->dn);
+			of_node_clear_flag(rd->dn, OF_POPULATED);
+			return notifier_from_errno(PTR_ERR(device));
+		}
+		break;
+	case OF_RECONFIG_CHANGE_REMOVE:
+		/* already depopulated? */
+		if (!of_node_check_flag(rd->dn, OF_POPULATED))
+			return NOTIFY_OK;
+
+		/* find our device by node */
+		device = of_find_mipi_dsi_device_by_node(rd->dn);
+		if (!device)
+			return NOTIFY_OK;	/* no? not meant for us */
+
+		/* unregister takes one ref away */
+		mipi_dsi_device_unregister(device);
+
+		/* and put the reference of the find */
+		put_device(&device->dev);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block mipi_dsi_of_notifier = {
+	.notifier_call = of_mipi_dsi_notify,
+};
+#else
+static struct notifier_block mipi_dsi_of_notifier __always_unused;
+#endif
 #else
 static struct mipi_dsi_device *
 of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
@@ -1703,6 +1766,8 @@ EXPORT_SYMBOL(mipi_dsi_driver_unregister);
 
 static int __init mipi_dsi_bus_init(void)
 {
+	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
+		WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
 	return bus_register(&mipi_dsi_bus_type);
 }
 postcore_initcall(mipi_dsi_bus_init);
-- 
2.45.2.741.gdbec12cfda-goog

