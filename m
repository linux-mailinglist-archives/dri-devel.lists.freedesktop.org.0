Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6491A046
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5410EA47;
	Thu, 27 Jun 2024 07:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NDcKZwsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2971010EA47
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:19:10 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7067a2e9607so3735162b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719472749; x=1720077549;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KOw0F8v0grJ8IuAnZTAplm9tXQhwzs0nBcu+ZgyxR4o=;
 b=NDcKZwsFC1AHcWfhybxyZIjJblwNj15t31T7bfmxyjKg2C9jnky9aGTzFIgbjjQ7VM
 ITYKwEMF2RDXSdbkXrE/FS4zeM1S8FkA9p2Kk8HiIb15AwNQCe4rcgY0XamBYR227iTn
 xPPtJ8kD52VZ6OYevMOS/e12ltNuicjcdPoM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719472749; x=1720077549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KOw0F8v0grJ8IuAnZTAplm9tXQhwzs0nBcu+ZgyxR4o=;
 b=d3Sud6A6hTvJf8zExU9EhIULlTVTAPzwT43GuKBz8a9RTW/7nfeHbZM3RxXiDOraCJ
 AgfD9YiTVYTbq1+qrTVmPoIJLpOWNtdS2v32Ktsdow7Qo7fcQnM1RHHmLP2MFKoC8fXZ
 SFuCCSUYX8AXJhOaC4EKxkr0vaCOy+UldMztpdhiUrfHfcYdnjqIupKv6bG8Ncm3C5NK
 hMIbIVYHmDxIxk02kKC8HcXKw+QihyY9aM/A8KPy3pChqAEXZzGCvXQWps1CzBF2ICbV
 /NISdl03c/l3z+m6aidA8CJKy4Ot3JqTQJ7Aw50ffyztZKNwIMB0B/WXH32VCbrEg1gm
 nLyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuc4u4+XTRaCOhhc0Cmobk5Cj8+wFngGf5B64AKMQPKybWLCpepMORLi0ICQo9dTaOYuKExcMVUh1NU6zcvke3dhacGep5Fl0XaRW1nKPd
X-Gm-Message-State: AOJu0Yz9h8QnKan8lBaNFIRM+liPKLiuEYZUh9gcgwHwJYULkjoSQhOR
 dALyosJApBqNMWLHB9+KdTFuqko8dcZFZBgJoIiPrwyGTAOSafuJrCRDPLwncQ==
X-Google-Smtp-Source: AGHT+IHlncdv9HVyQDeNK4Vd2L7zyyqyfpKGaNI4AodY8XUtdLlWupV4oLXPzaYsiCtGoG1CGijcxA==
X-Received: by 2002:a05:6a20:3d86:b0:1b5:d477:fcd5 with SMTP id
 adf61e73a8af0-1bcf44a7d6emr16341274637.25.1719472749434; 
 Thu, 27 Jun 2024 00:19:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:c8c3:6aca:70ce:49d9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8fe9ecdc8sm718653a91.29.2024.06.27.00.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:19:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2] drm/mipi-dsi: Add OF notifier handler
Date: Thu, 27 Jun 2024 15:19:03 +0800
Message-ID: <20240627071904.4017160-1-wenst@chromium.org>
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
Changes since v1:
- Added stub mipi_dsi_of_notifier in CONFIG_OF=n section for compilation

 drivers/gpu/drm/drm_mipi_dsi.c | 68 +++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a471c46f5ca6..35d6ed1fb587 100644
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
 
@@ -175,10 +177,72 @@ of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
 
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
+static struct notifier_block mipi_dsi_of_notifier __always_unused;
 static struct mipi_dsi_device *
 of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
 {
@@ -1703,6 +1767,8 @@ EXPORT_SYMBOL(mipi_dsi_driver_unregister);
 
 static int __init mipi_dsi_bus_init(void)
 {
+	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
+		WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
 	return bus_register(&mipi_dsi_bus_type);
 }
 postcore_initcall(mipi_dsi_bus_init);
-- 
2.45.2.741.gdbec12cfda-goog

