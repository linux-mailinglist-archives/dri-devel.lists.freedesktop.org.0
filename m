Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1CA3A76E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 20:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E300D10E745;
	Tue, 18 Feb 2025 19:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BkBjOZpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E436910E109
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 19:30:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e05780509dso4055204a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907035; x=1740511835;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A496sD4a/2Yi1AUooRYlTxVGsi1ThKtEtWKAWQ65LbM=;
 b=BkBjOZpuxpeb/rqv94NJhysnDiJZE3xya4qDRf7sX7/D5Uwz3Cv/9XDgxxxuvzXOS1
 +Xdb23Mn2brF5ieUrZeegqQ7DsghzFk7looFqPy3RpUSV/GEP4C75feUMwXi25G9pd6G
 HPHvOBtZxydZ0VrWMVm6a0R8T/Rkt8SStNAEM6P6TwUZZM45EgkBFzXbs89m7TAk8E8V
 eZ5soFR+j5CQjHGdaP7fI9QEEKBVhbs3FqfaG7/Zq3LrPVkarIW09IUWFz64Iswwscmp
 uckDdi0hShd9CsovbyNHc7goQhsF6KXcYaHfme5P/4RfHCSrkZBhmAUYDtfFevZoMmYs
 1MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739907035; x=1740511835;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A496sD4a/2Yi1AUooRYlTxVGsi1ThKtEtWKAWQ65LbM=;
 b=QjApsdnxU5qzDig4xZ/lOvAOZXrKmYXkpukabc8meMxHclfgtPtfVQ7QDSbuoLMu3/
 cuTn95iXJOQhMNiirv1/ze44EwH7RvBsueNO0ntSqVZ6YwoHKzzcwZ67CuCcx0nDybVt
 XWRcP04Yiynv5qI+s+Z8uaizwTw8+qpR2KCDDl05cVhiz3j+eJADGf+weniTcLAMlPNq
 d6xAx8KtfLeDBifca/wZz/sydUpDiMZQ3oBx60YIbzO/WKwf6kD+A43ABAs2BVyDhZKF
 dnMYx9Mf1bcf0how0nHDF+OsUXfo23lQBSYk/555iwChTzkJvFeig8+l/pBdDv2vx0UU
 I8AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSXGeoieeIzjR7ahBzSDpytPGb03KpWjU7uacXwgG4aMreFiI1TnWNsZD3ggyE4Qq/GIJNIJ0pCWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4v/SbazR344i6QacFUDVgOWKgo1tec0Tz+8dfQluX6SxqIrGl
 MO8xF9ghvTSWrXBT2lsC8bqh8LsfCwXzAloW0/PDF85zno+dFHo7Ua71Jd3hwlk=
X-Gm-Gg: ASbGncunRYX8399wxgp1V69S5E4wQZbC0cO+3KQvXqjbMOTn5WKl3G4QuizUVDU1hUc
 7GilBWSA0K56WKdcJL9gDL7/OlGzLcBQ5+Bjv/99xCGTul/0O9cQZ/bSnFXIvBI3KE4pnVRb4KE
 3OINZpChk1oe651o0CWRBKP6gafYp0LbFHOSWdB0mhSNR/5J717Z5Q3gCjs5KKTch9ZH/g2Qbkd
 fEzKOHEFN5+yWIdz9gYs9Mp8NbmO9TEOxuGwKjUZgP1KBPutiY/pN88hY8jEUN0C6supSbP9zPA
 CMXjZamHEnSp81EBCSzfab3l7Cy1
X-Google-Smtp-Source: AGHT+IE5Wa5KJ5irXNEqRMx0DZmNPYCFnRuPmEtxdUqVwUY8iuRTnfmnPlFGCgRgwZYmZjYuGxKlHA==
X-Received: by 2002:a05:6402:3589:b0:5e0:82a0:50d9 with SMTP id
 4fb4d7f45d1cf-5e082a0580dmr1610706a12.25.1739907035420; 
 Tue, 18 Feb 2025 11:30:35 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 11:30:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:46 +0100
Subject: [PATCH v4 1/8] driver core: auxiliary bus: add device creation helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5226; i=jbrunet@baylibre.com; 
 h=from:subject:message-id;
 bh=PkjdIaC56eTrgW6J5aLTcTBWZbxgsIMKj1P2361ZPvk=; 
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/PpRSgjntFL4im0pKu+WkiaMHGJvFgAMlXT
 2MCP0memWuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7TfzwAKCRDm/A8cN/La
 hUPFEACcW0XW9/B/qo7EEmYWuIE8aUcE5HUVtsI0TkkMJMo5YnwHLpUNDoSEEbkKbv14vquBqbK
 Iy+dvIFKZ8BWMQZBDDHhi6jRtAFTgeQEsZMQIg2J0/+IlKhpJPF6AscLdg5p1Dgg1HXCauRxeou
 1VbEV6GrwhuTydry6GLWfyOUlmQju6OvpILm+L4mwrJpX9ykPJ6gwNIuVAlkqcJFHXmKBqJFgj6
 KmJeCGEATTKhIA/om6qi2z2GpvWfCdIjowrVc2yMdeagAGBqUnPLvJxYn6/bwDJ6h742YWZ9goy
 yRyWpO1O2zJ/6uRzZgkE1tCxJhV1BCaER8ZC7ZWzRmZhcfP6T5zY6x8Z33wkUs/HFqTl3HgAfuE
 nZdvMSmzDoGdQe4cDAzwVpup4fg2nKxCgjDq7p19/7CQWZU/HryiyHo6ek/pOAUc0xw9szxXdPV
 pJ7sSRrMpc9RV5K8nGfJW40rcwG+cKC2qkas/TwbNgzYhnn0M7XyVAVMUyQ28Gyhe3nAdEIpfHB
 rdQPj4DLQq3e/67HhncZL8agAL/LVgSmQ2/7PdJB44hJsNi1V7VGMLF9MD8RrZu1m5x/nSyXkq2
 LbPW+TWunsUuPoXm0HIZln4YNEsHFz6LlLOFjeAbeKtyzFEDL2/pqWRat04XTNU1u7RsW1bHRrR
 EFlV+exOQmrhA/Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
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

Add helper functions to create a device on the auxiliary bus.

This is meant for fairly simple usage of the auxiliary bus, to avoid having
the same code repeated in the different drivers.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h |  17 +++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
 }
 EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
 
+static void auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev);
+}
+
+/**
+ * auxiliary_device_create - create a device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Helper to create an auxiliary bus device.
+ * The device created matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *auxiliary_device_create(struct device *dev,
+						 const char *modname,
+						 const char *devname,
+						 void *platform_data,
+						 int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return NULL;
+
+	auxdev->id = id;
+	auxdev->name = devname;
+	auxdev->dev.parent = dev;
+	auxdev->dev.platform_data = platform_data;
+	auxdev->dev.release = auxiliary_device_release;
+	device_set_of_node_from_dev(&auxdev->dev, dev);
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		kfree(auxdev);
+		return NULL;
+	}
+
+	ret = __auxiliary_device_add(auxdev, modname);
+	if (ret) {
+		/*
+		 * It may look odd but auxdev should not be freed here.
+		 * auxiliary_device_uninit() calls device_put() which call
+		 * the device release function, freeing auxdev.
+		 */
+		auxiliary_device_uninit(auxdev);
+		return NULL;
+	}
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(auxiliary_device_create);
+
+/**
+ * auxiliary_device_destroy - remove an auxiliary device
+ * @auxdev: pointer to the auxdev to be removed
+ *
+ * Helper to remove an auxiliary device created with
+ * auxiliary_device_create()
+ */
+void auxiliary_device_destroy(void *auxdev)
+{
+	struct auxiliary_device *_auxdev = auxdev;
+
+	auxiliary_device_delete(_auxdev);
+	auxiliary_device_uninit(_auxdev);
+}
+EXPORT_SYMBOL_GPL(auxiliary_device_destroy);
+
+/**
+ * __devm_auxiliary_device_create - create a managed device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Device managed helper to create an auxiliary bus device.
+ * The device created matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
+	if (IS_ERR(auxdev))
+		return auxdev;
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
+				       auxdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(__devm_auxiliary_device_create);
+
 void __init auxiliary_bus_init(void)
 {
 	WARN_ON(bus_register(&auxiliary_bus_type));
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 65dd7f15437474468acf0e28f6932a7ff2cfff2c..4086afd0cc6b96084c190f24acc304cde5d1749a 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -254,6 +254,23 @@ int __auxiliary_driver_register(struct auxiliary_driver *auxdrv, struct module *
 
 void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 
+struct auxiliary_device *auxiliary_device_create(struct device *dev,
+						 const char *modname,
+						 const char *devname,
+						 void *platform_data,
+						 int id);
+void auxiliary_device_destroy(void *auxdev);
+
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id);
+
+#define devm_auxiliary_device_create(dev, devname, platform_data)     \
+	__devm_auxiliary_device_create(dev, KBUILD_MODNAME, devname,  \
+				       platform_data, 0)
+
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
  * @__auxiliary_driver: auxiliary driver struct

-- 
2.47.2

