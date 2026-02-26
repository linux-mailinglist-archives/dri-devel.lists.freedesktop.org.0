Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKCnIp0IoGm4fQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:47:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB341A2DBF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904C610E863;
	Thu, 26 Feb 2026 08:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AFqXTFzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E4210E863
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:47:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso5150525e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772095640; x=1772700440;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Gz2hLRf9thY7Y4IL7mf20V5pomIiOvMEviOrABeY6U=;
 b=AFqXTFzjjrXD5EXBKPFF8mRUOQWfHgTWAqm4utY4pER2WlrmvPMxh0shvWY1Tq7VF3
 A68ckXCYWa96Xj2qmy0dLHbIBk7U19DNzWJmlimpQX0Wfls4i2Sl9G/0JYdNBzEgNgni
 tZnnOuxFA7s/LvMNhzCJJsazdEy5m2nwX/WWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772095640; x=1772700440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7Gz2hLRf9thY7Y4IL7mf20V5pomIiOvMEviOrABeY6U=;
 b=CVpzRK0G/TDfz11/7qEdy3dvKhGQ6qN3XS+iWqsPyREaeAzZ9fYTrzvate2qUCjAMN
 rP7rGGd5eJF2XLVA/EPF4Jbg/YHlnM4+caQcOq9yIfOJM7+Prulq5G8qFeUTKb4SBc//
 zAYmw3rOsGVju0A2V0GYNt9vJqcICqO4srd/IBXfuOeCMk9StS6faApwI3W81ebnMZ3e
 TwcyfpDDk68X2tqSY9IXDkjYiFEI2H0kBlnrK7fLM5YBgIrQ6RXSXy3rakrrE1OyTvao
 ZlToLrYMmdUXExai3Vr5aXJWGgEyw7Zb38Qo6wV0AjLCjiuV1S5EzjoZAFkqbbXGVtnh
 ybOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtSWzxEmUFAnr+wiMzWnMeGZ/DGu/0dGJAKmOwQxio47259LR0KYMINRBfqyhoY2s5WP241/RyudU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJnOyzwuiK9j4G3g4DMos2Y9hVV7aCAcqkLIDpNG4MZYFqVrXU
 oJISbCTJSGgQ5kIuOU9OHXGB8JzCklvbwq73m/ZeZhRm+AJLCHEceMjNk7jYXOTGico=
X-Gm-Gg: ATEYQzwEb55g/fZnvKxQPkx++jvHxX9mqoQDAKeqMDIzpLGd61Ga7+LsuQ0y1dAIg+6
 oHFiNZZJf80wW4I+j0NnKPC7RctdVDNwPFjm27ueMkwiS9FY2/czsEFaOysWT1c/rh5V9AfbaTn
 I4r7VJ8KR65lcBQWVR20u4SO5WoY45BOeRku5zB3qlodezSGdqlLEtyxBKsWoY+sNrqfquPSEYQ
 0UvykgIf643/8ZKyZXkP94+l+l2+ntWuY+VLji3SslmhnorP6SsjYjt3D6PEWXf3teKV0eFqFgC
 qa127FyoPXMf1pK6MoakG5UTzNJ9xKO2l5JQEjMCaoXCH0SLtNl1ySe5M9T19dyaRNpbQJBuQ0b
 Nh15Hp0TdWX7xhx+xXGQtQ3M8V5ZWAr0sYYKvosu1ACDPsYYa0cRHkVVYQMq4q0CkR0wuodMZ59
 PC+oCOzjXvWbxFkVt9Kv5OXJe3/q0voIj4Vmop50WyOKtioMc369hfy6P3L0A2ZeaHOiKXPcg3G
 UPX9+pTRWP5+lyjeGC+QEA4+96VyEXNhjdwbZpbqkala1z9H+dj9Zu8HnJUj6OePDfi2d+Agp+F
 AAZNUjgJ3yWcEjnJ9AvXeWkT
X-Received: by 2002:a05:600c:1381:b0:483:7783:5373 with SMTP id
 5b1f17b1804b1-483c21a5835mr56480305e9.23.1772095640070; 
 Thu, 26 Feb 2026 00:47:20 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb85c58sm31581075e9.9.2026.02.26.00.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:47:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v4 2/4] drm/panel: ilitek-ili9806e: split core and DSI
 logic
Date: Thu, 26 Feb 2026 09:47:01 +0100
Message-ID: <20260226084713.2566672-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226084713.2566672-1-dario.binacchi@amarulasolutions.com>
References: <20260226084713.2566672-1-dario.binacchi@amarulasolutions.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,gmail.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,dlh.de:email,edgeble.ai:email]
X-Rspamd-Queue-Id: DDB341A2DBF
X-Rspamd-Action: no action

Split the driver to support multiple transport buses. The core logic
(power, GPIO, backlight) is moved to a dedicated core module, while
DSI-specific code is restricted to the DSI module.

Introduce DRM_PANEL_ILITEK_ILI9806E_CORE as a hidden Kconfig symbol
selected by the bus-specific configuration.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Fix "WARNING: unmet direct dependencies detected for
  DRM_PANEL_ILITEK_ILI9806E_CORE" reported by kernel test robot

 MAINTAINERS                                   |   2 +-
 drivers/gpu/drm/panel/Kconfig                 |   4 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-ilitek-ili9806e-core.c    | 129 +++++++++++++++
 .../drm/panel/panel-ilitek-ili9806e-core.h    |  15 ++
 .../gpu/drm/panel/panel-ilitek-ili9806e-dsi.c | 151 +++++-------------
 6 files changed, 193 insertions(+), 109 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8bd673456cda..46bd910ba2c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8032,7 +8032,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 DRM DRIVER FOR ILITEK ILI9806E PANELS
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
-F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-*
 
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 142f32a1d256..7fc20421cba5 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -257,11 +257,15 @@ config DRM_PANEL_ILITEK_ILI9805
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9805 controller.
 
+config DRM_PANEL_ILITEK_ILI9806E_CORE
+	tristate
+
 config DRM_PANEL_ILITEK_ILI9806E_DSI
 	tristate "Ilitek ILI9806E-based DSI panels"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_PANEL_ILITEK_ILI9806E_CORE
 	help
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9806E controller using DSI.
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 2ceeec7e2110..f56dafb36499 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_CORE) += panel-ilitek-ili9806e-core.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
new file mode 100644
index 000000000000..c088685d9d85
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ilitek ILI9806E core driver.
+ *
+ * Copyright (c) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <drm/drm_panel.h>
+
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include "panel-ilitek-ili9806e-core.h"
+
+struct ili9806e {
+	void *transport;
+	struct drm_panel panel;
+
+	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset_gpio;
+};
+
+static const char * const regulator_names[] = {
+	"vdd",
+	"vccio",
+};
+
+void *ili9806e_get_transport(struct drm_panel *panel)
+{
+	struct ili9806e *ctx = container_of(panel, struct ili9806e, panel);
+
+	return ctx->transport;
+}
+EXPORT_SYMBOL_GPL(ili9806e_get_transport);
+
+int ili9806e_power_on(struct device *dev)
+{
+	struct ili9806e *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	gpiod_set_value(ctx->reset_gpio, 1);
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret) {
+		dev_err(dev, "regulator bulk enable failed: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(10000, 20000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ili9806e_power_on);
+
+int ili9806e_power_off(struct device *dev)
+{
+	struct ili9806e *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	gpiod_set_value(ctx->reset_gpio, 1);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret)
+		dev_err(dev, "regulator bulk disable failed: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ili9806e_power_off);
+
+int ili9806e_probe(struct device *dev, void *transport,
+		  const struct drm_panel_funcs *funcs,
+		  int connector_type)
+{
+	struct ili9806e *ctx;
+	int i, ret;
+
+	ctx = devm_kzalloc(dev, sizeof(struct ili9806e), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, ctx);
+	ctx->transport = transport;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
+		ctx->supplies[i].supply = regulator_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
+				      ctx->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	drm_panel_init(&ctx->panel, dev, funcs, connector_type);
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	ctx->panel.prepare_prev_first = true;
+	drm_panel_add(&ctx->panel);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(ili9806e_probe);
+
+void ili9806e_remove(struct device *dev)
+{
+	struct ili9806e *ctx = dev_get_drvdata(dev);
+
+	drm_panel_remove(&ctx->panel);
+}
+EXPORT_SYMBOL_GPL(ili9806e_remove);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_AUTHOR("Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>");
+MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
+MODULE_DESCRIPTION("Ilitek ILI9806E Controller Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
new file mode 100644
index 000000000000..dddece62cf42
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _PANEL_ILITEK_ILI9806E_CORE_H
+#define _PANEL_ILITEK_ILI9806E_CORE_H
+
+void *ili9806e_get_transport(struct drm_panel *panel);
+int ili9806e_power_off(struct device *dev);
+int ili9806e_power_on(struct device *dev);
+
+int ili9806e_probe(struct device *dev, void *transport,
+		   const struct drm_panel_funcs *funcs,
+		   int connector_type);
+void ili9806e_remove(struct device *dev);
+
+#endif /* _PANEL_ILITEK_ILI9806E_CORE_H */
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
index c337c4f1a1c7..ecdbed8d4a3a 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
@@ -1,15 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/property.h>
-#include <linux/regulator/consumer.h>
 
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
@@ -18,7 +15,9 @@
 
 #include <video/mipi_display.h>
 
-struct panel_desc {
+#include "panel-ilitek-ili9806e-core.h"
+
+struct ili9806e_dsi_panel_desc {
 	const struct drm_display_mode *display_mode;
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
@@ -26,60 +25,13 @@ struct panel_desc {
 	void (*init_sequence)(struct mipi_dsi_multi_context *ctx);
 };
 
-struct ili9806e_panel {
-	struct drm_panel panel;
+struct ili9806e_dsi_panel {
 	struct mipi_dsi_device *dsi;
-	struct gpio_desc *reset_gpio;
-	struct regulator_bulk_data supplies[2];
-	const struct panel_desc *desc;
+	const struct ili9806e_dsi_panel_desc *desc;
 	enum drm_panel_orientation orientation;
 };
 
-static const char * const regulator_names[] = {
-	"vdd",
-	"vccio",
-};
-
-static inline struct ili9806e_panel *to_ili9806e_panel(struct drm_panel *panel)
-{
-	return container_of(panel, struct ili9806e_panel, panel);
-}
-
-static int ili9806e_power_on(struct ili9806e_panel *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret;
-
-	gpiod_set_value(ctx->reset_gpio, 1);
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0) {
-		dev_err(&dsi->dev, "regulator bulk enable failed: %d\n", ret);
-		return ret;
-	}
-
-	usleep_range(10000, 20000);
-	gpiod_set_value(ctx->reset_gpio, 0);
-	usleep_range(10000, 20000);
-
-	return 0;
-}
-
-static int ili9806e_power_off(struct ili9806e_panel *ctx)
-{
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret;
-
-	gpiod_set_value(ctx->reset_gpio, 1);
-
-	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret)
-		dev_err(&dsi->dev, "regulator bulk disable failed: %d\n", ret);
-
-	return ret;
-}
-
-static int ili9806e_on(struct ili9806e_panel *ili9806e)
+static int ili9806e_dsi_on(struct ili9806e_dsi_panel *ili9806e)
 {
 	struct mipi_dsi_multi_context ctx = { .dsi = ili9806e->dsi };
 
@@ -93,7 +45,7 @@ static int ili9806e_on(struct ili9806e_panel *ili9806e)
 	return ctx.accum_err;
 }
 
-static int ili9806e_off(struct ili9806e_panel *panel)
+static int ili9806e_dsi_off(struct ili9806e_dsi_panel *panel)
 {
 	struct mipi_dsi_multi_context ctx = { .dsi = panel->dsi };
 
@@ -104,88 +56,75 @@ static int ili9806e_off(struct ili9806e_panel *panel)
 	return ctx.accum_err;
 }
 
-static int ili9806e_prepare(struct drm_panel *panel)
+static int ili9806e_dsi_prepare(struct drm_panel *panel)
 {
-	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
+	struct ili9806e_dsi_panel *ctx = ili9806e_get_transport(panel);
+	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	ret = ili9806e_power_on(ctx);
+	ret = ili9806e_power_on(dev);
 	if (ret < 0)
 		return ret;
 
-	ret = ili9806e_on(ctx);
+	ret = ili9806e_dsi_on(ctx);
 	if (ret < 0) {
-		ili9806e_power_off(ctx);
+		ili9806e_power_off(dev);
 		return ret;
 	}
 
 	return 0;
 }
 
-static int ili9806e_unprepare(struct drm_panel *panel)
+static int ili9806e_dsi_unprepare(struct drm_panel *panel)
 {
-	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct ili9806e_dsi_panel *ctx = ili9806e_get_transport(panel);
+	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	ili9806e_off(ctx);
+	ili9806e_dsi_off(ctx);
 
-	ret = ili9806e_power_off(ctx);
+	ret = ili9806e_power_off(dev);
 	if (ret < 0)
-		dev_err(&dsi->dev, "power off failed: %d\n", ret);
+		dev_err(dev, "power off failed: %d\n", ret);
 
 	return ret;
 }
 
-static int ili9806e_get_modes(struct drm_panel *panel,
+static int ili9806e_dsi_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
-	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
+	struct ili9806e_dsi_panel *ctx = ili9806e_get_transport(panel);
 	const struct drm_display_mode *mode = ctx->desc->display_mode;
 
 	return drm_connector_helper_get_modes_fixed(connector, mode);
 }
 
-static enum drm_panel_orientation ili9806e_get_orientation(struct drm_panel *panel)
+static enum drm_panel_orientation ili9806e_dsi_get_orientation(struct drm_panel *panel)
 {
-	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
+	struct ili9806e_dsi_panel *ctx = ili9806e_get_transport(panel);
 
 	return ctx->orientation;
 }
 
-static const struct drm_panel_funcs ili9806e_funcs = {
-	.prepare = ili9806e_prepare,
-	.unprepare = ili9806e_unprepare,
-	.get_modes = ili9806e_get_modes,
-	.get_orientation = ili9806e_get_orientation,
+static const struct drm_panel_funcs ili9806e_dsi_funcs = {
+	.prepare = ili9806e_dsi_prepare,
+	.unprepare = ili9806e_dsi_unprepare,
+	.get_modes = ili9806e_dsi_get_modes,
+	.get_orientation = ili9806e_dsi_get_orientation,
 };
 
 static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
-	struct ili9806e_panel *ctx;
-	int i, ret;
+	struct ili9806e_dsi_panel *ctx;
+	int ret;
 
-	ctx = devm_drm_panel_alloc(dev, struct ili9806e_panel, panel, &ili9806e_funcs,
-				   DRM_MODE_CONNECTOR_DSI);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
+	ctx = devm_kzalloc(dev, sizeof(struct ili9806e_dsi_panel), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
 
 	ctx->desc = device_get_match_data(dev);
 
-	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
-		ctx->supplies[i].supply = regulator_names[i];
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
-				      ctx->supplies);
-	if (ret < 0)
-		return ret;
-
-	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
-				     "Failed to get reset-gpios\n");
-
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 
@@ -197,17 +136,15 @@ static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get orientation\n");
 
-	ret = drm_panel_of_backlight(&ctx->panel);
+	ret = ili9806e_probe(dev, ctx, &ili9806e_dsi_funcs,
+			     DRM_MODE_CONNECTOR_DSI);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get backlight\n");
-
-	ctx->panel.prepare_prev_first = true;
-	drm_panel_add(&ctx->panel);
+		return ret;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
-		drm_panel_remove(&ctx->panel);
+		ili9806e_remove(dev);
 		return ret;
 	}
 
@@ -216,10 +153,8 @@ static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
 
 static void ili9806e_dsi_remove(struct mipi_dsi_device *dsi)
 {
-	struct ili9806e_panel *ctx = mipi_dsi_get_drvdata(dsi);
-
 	mipi_dsi_detach(dsi);
-	drm_panel_remove(&ctx->panel);
+	ili9806e_remove(&dsi->dev);
 }
 
 static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
@@ -369,7 +304,7 @@ static const struct drm_display_mode com35h3p70ulc_default_mode = {
 	.height_mm = 71,
 };
 
-static const struct panel_desc com35h3p70ulc_desc = {
+static const struct ili9806e_dsi_panel_desc com35h3p70ulc_desc = {
 	.init_sequence = com35h3p70ulc_init,
 	.display_mode = &com35h3p70ulc_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
@@ -533,7 +468,7 @@ static const struct drm_display_mode dmt028vghmcmi_1d_default_mode = {
 	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
-static const struct panel_desc dmt028vghmcmi_1d_desc = {
+static const struct ili9806e_dsi_panel_desc dmt028vghmcmi_1d_desc = {
 	.init_sequence = dmt028vghmcmi_1d_init,
 	.display_mode = &dmt028vghmcmi_1d_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
@@ -542,17 +477,17 @@ static const struct panel_desc dmt028vghmcmi_1d_desc = {
 	.lanes = 2,
 };
 
-static const struct of_device_id ili9806e_of_match[] = {
+static const struct of_device_id ili9806e_dsi_of_match[] = {
 	{ .compatible = "densitron,dmt028vghmcmi-1d", .data = &dmt028vghmcmi_1d_desc },
 	{ .compatible = "ortustech,com35h3p70ulc", .data = &com35h3p70ulc_desc },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, ili9806e_of_match);
+MODULE_DEVICE_TABLE(of, ili9806e_dsi_of_match);
 
 static struct mipi_dsi_driver ili9806e_dsi_driver = {
 	.driver = {
 		.name = "ili9806e-dsi",
-		.of_match_table = ili9806e_of_match,
+		.of_match_table = ili9806e_dsi_of_match,
 	},
 	.probe = ili9806e_dsi_probe,
 	.remove = ili9806e_dsi_remove,
-- 
2.43.0

