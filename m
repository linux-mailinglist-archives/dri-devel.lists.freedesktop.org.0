Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E0802361
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A53F10E2A6;
	Sun,  3 Dec 2023 11:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B56F10E29F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:43:39 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9f7fe6623so5842271fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701603817; x=1702208617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsxiF3RR8Q8pIIQKfcVcIm1Yhwobx7V2r81Uy4z6CiM=;
 b=S+++TUCGXMtsgFJ/krf/8u7qhJjaisMdKy0jYRafWZBTV1sWlBNX94ehlMA8pwE8i9
 BFI5YvZ8ZlBiXnp3Xv8FgkVaZFmZXXLDY/tTxAzP3uluMmkDoF5t/CmNLKpc9tQvf9ai
 NzRkUy+Krlu24AS4B8le9aolkOrr15b2nRHTb14Vt9u1ISGx8o1jPMkkqHF9qP96Uk2i
 R+OobsYTK/Ci3/nlafRWXpLSyqnTXf+BtvU14QGYIMicB/uY5/tAb9MEJgtki6NNCGuy
 vBTHWEhTrNq6oGnfQ47TDETX/sINFBJ+M+L+XIkv+6U55AHWdReooz44m1PyGp+LCRqa
 2dIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701603817; x=1702208617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsxiF3RR8Q8pIIQKfcVcIm1Yhwobx7V2r81Uy4z6CiM=;
 b=EID3t2go/NL/gvKJzgN/Ej2crbAmu8Upw1HvawfnjbTtPC+o8uqdknWAKHVqDe9xk0
 R/rk6b3dtoRy/kmWiwtJuopSTMLeLAZwsFxUgGTeS8GIW+VcNjt4vxPYWi6eC/IR2fv/
 LUj3ra8GXN9RKsgKVi7yNtSOuwd3BQ7q+1RdcaIYhJpFJrLfDdQxdoRkzxS/+Xso/+me
 pV8g1y5eWYqDLAwB1ZNklEwofZhy+3bDi04Tktx2SZov5IlhWtJEMT6CIbBQrQX4flmq
 Q2EOPlrLRRVG04T6RrW0E+j6ywNx48Hxrdhxan7nil0XpNpMZ1mGj0wsyonxLZGBoNxJ
 m7Ow==
X-Gm-Message-State: AOJu0YwEuBtTXkjE8WaMOh17p5o588b6lLnE7W/4xC6NCczUX5QQcKFw
 WDYjgKHyJBOYl4R40KjM/RmnTg==
X-Google-Smtp-Source: AGHT+IG4tbSCWRL5GtzpaoK/x3h+2/Aatr6tpnA382tTLYiZ14jxGuGwGzQPSkFJ9GhoMIoxbmqXbQ==
X-Received: by 2002:a2e:8602:0:b0:2c9:eaca:e602 with SMTP id
 a2-20020a2e8602000000b002c9eacae602mr824480lji.28.1701603817623; 
 Sun, 03 Dec 2023 03:43:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a2e90d1000000b002c993c5d4c6sm894666ljg.105.2023.12.03.03.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:43:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH RESEND 4/6] drm/bridge: implement generic DP HPD bridge
Date: Sun,  3 Dec 2023 14:43:31 +0300
Message-Id: <20231203114333.1305826-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several USB-C controllers implement a pretty simple DRM bridge which
implements just the HPD notification operations. Add special helper
for creating such simple bridges.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/Kconfig          |   8 ++
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 164 ++++++++++++++++++++++++
 include/drm/bridge/aux-bridge.h         |  18 +++
 4 files changed, 191 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index f12eab62799f..19d2dc05c397 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -21,6 +21,14 @@ config DRM_AUX_BRIDGE
 	  Simple transparent bridge that is used by several non-DRM drivers to
 	  build bridges chain.
 
+config DRM_AUX_HPD_BRIDGE
+	tristate
+	depends on DRM_BRIDGE && OF
+	select AUXILIARY_BUS
+	help
+	  Simple bridge that terminates the bridge chain and provides HPD
+	  support.
+
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 918e3bfff079..017b5832733b 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
+obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
new file mode 100644
index 000000000000..4defac8ec63f
--- /dev/null
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ *
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
+
+static DEFINE_IDA(drm_aux_hpd_bridge_ida);
+
+struct drm_aux_hpd_bridge_data {
+	struct drm_bridge bridge;
+	struct device *dev;
+};
+
+static void drm_aux_hpd_bridge_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&drm_aux_hpd_bridge_ida, adev->id);
+
+	of_node_put(adev->dev.platform_data);
+
+	kfree(adev);
+}
+
+static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+/**
+ * drm_dp_hpd_bridge_register - Create a simple HPD DisplayPort bridge
+ * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
+ *
+ * Creates a simple DRM bridge with the type set to
+ * DRM_MODE_CONNECTOR_DisplayPort, which terminates the bridge chain and is
+ * able to send the HPD events.
+ *
+ * Return: device instance that will handle created bridge or an error code
+ * encoded into the pointer.
+ */
+struct device *drm_dp_hpd_bridge_register(struct device *parent,
+					  struct device_node *np)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return ERR_PTR(-ENOMEM);
+
+	ret = ida_alloc(&drm_aux_hpd_bridge_ida, GFP_KERNEL);
+	if (ret < 0) {
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	adev->id = ret;
+	adev->name = "dp_hpd_bridge";
+	adev->dev.parent = parent;
+	adev->dev.of_node = parent->of_node;
+	adev->dev.release = drm_aux_hpd_bridge_release;
+	adev->dev.platform_data = np;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ERR_PTR(ret);
+	}
+
+	ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_unregister_adev, adev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &adev->dev;
+
+}
+EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
+
+/**
+ * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * @dev: device created for the HPD bridge
+ * @status: output connection status
+ *
+ * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
+ * detection events for bridges created via drm_dp_hpd_bridge_register().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
+
+	if (!data)
+		return;
+
+	drm_bridge_hpd_notify(&data->bridge, status);
+}
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+
+static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
+}
+
+static const struct drm_bridge_funcs drm_aux_hpd_bridge_funcs = {
+	.attach	= drm_aux_hpd_bridge_attach,
+};
+
+static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
+				   const struct auxiliary_device_id *id)
+{
+	struct drm_aux_hpd_bridge_data *data;
+
+	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &auxdev->dev;
+	data->bridge.funcs = &drm_aux_hpd_bridge_funcs;
+	data->bridge.of_node = dev_get_platdata(data->dev);
+	data->bridge.ops = DRM_BRIDGE_OP_HPD;
+	data->bridge.type = id->driver_data;
+
+	auxiliary_set_drvdata(auxdev, data);
+
+	return devm_drm_bridge_add(data->dev, &data->bridge);
+}
+
+static const struct auxiliary_device_id drm_aux_hpd_bridge_table[] = {
+	{ .name = KBUILD_MODNAME ".dp_hpd_bridge", .driver_data = DRM_MODE_CONNECTOR_DisplayPort, },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, drm_aux_hpd_bridge_table);
+
+static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
+	.name = "aux_hpd_bridge",
+	.id_table = drm_aux_hpd_bridge_table,
+	.probe = drm_aux_hpd_bridge_probe,
+};
+module_auxiliary_driver(drm_aux_hpd_bridge_drv);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("DRM HPD bridge");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index 441ab3f0e920..33adaf4e4daa 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -7,6 +7,8 @@
 #ifndef DRM_AUX_BRIDGE_H
 #define DRM_AUX_BRIDGE_H
 
+#include <drm/drm_connector.h>
+
 #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
 int drm_aux_bridge_register(struct device *parent);
 #else
@@ -16,4 +18,20 @@ static inline int drm_aux_bridge_register(struct device *parent)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
+struct device *drm_dp_hpd_bridge_register(struct device *parent,
+					  struct device_node *np);
+void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+#else
+static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
+							struct device_node *np)
+{
+	return 0;
+}
+
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+}
+#endif
+
 #endif
-- 
2.39.2

