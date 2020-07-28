Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07392312A5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745C36E3D8;
	Tue, 28 Jul 2020 19:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202AD6E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:08:13 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id il6so5426379pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YVHBc50K3SDU/AR5HSgkYFIR7/MqT5dAoAdMt2hCe8g=;
 b=o6uNJD4ZHCGD7GoZwtYa+xgq2s+TYZZKMe2E3998Dr+nULKKvCGw4IiDWMa5Kx/dlF
 PQMJBiZYeHgiX7ndXi+jqk0GLZmdyWUJ9HEH/32GCMdiVZbkum9+Opnpatwvc6ZkmDmF
 DHkxn9Smr+nNANsSR2TI72E8NmC/fZGPsNItDoPgA6c3V+KesWb6+WvbG/DlLo3pg8SK
 q2eSIg3wmHYo8+Y689k8mAR4JdM2/3lp6zKXDNxEIwK87SPc956AWI/yVPlDt4pzamCs
 vIfdoQ4wIyCgrzEYYFP3fKrDa4E7AR/Vih7PpxfT1/pR988cQXm3tgVfL99LsoUt2+hj
 uwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YVHBc50K3SDU/AR5HSgkYFIR7/MqT5dAoAdMt2hCe8g=;
 b=NEK3SuD6d4QS4WIZepB37UspT0rnD+XNxXgDlLuBIFwsWM2tX/f8rpsjMPA44gU6A7
 8HuMYXWyGS0/qAvSbz5JtkKoEwrcLVEhtf6Q7Qf+DIc7YT+pTbysKSON8FWRk+3bK7Nd
 gSGl+3tX4UXL1nJh57tQqkZEHVcoyADYvWHFOOa4HbmZ/ILDPkOQgm5yX1a1JNUg0iOx
 EgvOkU8OQoA6a2A03beXoAHUBwM/tp1BeRclk21xPZLUFK0EnR+AozweEim1uL9XdsgU
 /KldJgfBopX49d7bJsgixlE8wpiG/gX+oPZ7EAnjfIRiXP0VfOoLw7sePkYgvqr7fVnC
 D+fQ==
X-Gm-Message-State: AOAM531zLiQYXuaPDKDgwqci74oXEdUnW0w8KqF2aJebpLXA97Rb1dB5
 Z+SBOn2DQA9xVud+rPFlaxIlS/iRhz0=
X-Google-Smtp-Source: ABdhPJwxF8oYfckuc3ibQfxxsb1ZRY/lvpQo5LGE+uCi+HNvhJA58d6+pm4pQipI/e1PHAdfP/i+xw==
X-Received: by 2002:a17:90b:374c:: with SMTP id
 ne12mr3829095pjb.120.1595930892717; 
 Tue, 28 Jul 2020 03:08:12 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id e76sm1704593pfh.108.2020.07.28.03.08.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 03:08:12 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v6 2/6] drm/sprd: add Unisoc's drm kms master
Date: Tue, 28 Jul 2020 18:07:55 +0800
Message-Id: <1595930879-2478-3-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds drm support for the Unisoc's display subsystem.

This is drm kms driver, this driver provides support for the
application framework in Android, Yocto and more.

Application framework can access Unisoc's display internel
peripherals through libdrm or libkms, it's test ok by modetest
(DRM/KMS test tool) and Android HWComposer.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/Kconfig         |   2 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/sprd/Kconfig    |  12 +++
 drivers/gpu/drm/sprd/Makefile   |   5 +
 drivers/gpu/drm/sprd/sprd_drm.c | 226 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
 6 files changed, 262 insertions(+)
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c4fd57d..7fe7ab91 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -386,6 +386,8 @@ source "drivers/gpu/drm/mcde/Kconfig"
 
 source "drivers/gpu/drm/tidss/Kconfig"
 
+source "drivers/gpu/drm/sprd/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c0e5a7..ee2ccd9 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -123,3 +123,4 @@ obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
+obj-$(CONFIG_DRM_SPRD) += sprd/
diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
new file mode 100644
index 0000000..b189a54
--- /dev/null
+++ b/drivers/gpu/drm/sprd/Kconfig
@@ -0,0 +1,12 @@
+config DRM_SPRD
+	tristate "DRM Support for Unisoc SoCs Platform"
+	depends on ARCH_SPRD || COMPILE_TEST
+	depends on DRM && OF
+	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DSI
+	help
+	  Choose this option if you have a Unisoc chipsets.
+	  If M is selected the module will be called sprd-drm.
+
diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
new file mode 100644
index 0000000..86d95d9
--- /dev/null
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -I$(srctree)/$(src)
+
+obj-y := sprd_drm.o
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
new file mode 100644
index 0000000..4706185
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#include <linux/component.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "sprd_drm.h"
+
+#define DRIVER_NAME	"sprd"
+#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
+#define DRIVER_DATE	"20200201"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_helper = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static void sprd_drm_mode_config_init(struct drm_device *drm)
+{
+	drm_mode_config_init(drm);
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	drm->mode_config.max_width = 8192;
+	drm->mode_config.max_height = 8192;
+	drm->mode_config.allow_fb_modifiers = true;
+
+	drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
+	drm->mode_config.helper_private = &sprd_drm_mode_config_helper;
+}
+
+DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
+
+static struct drm_driver sprd_drm_drv = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &sprd_drm_fops,
+
+	/* GEM Operations */
+  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.date			= DRIVER_DATE,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+};
+
+static int sprd_drm_bind(struct device *dev)
+{
+	struct drm_device *drm;
+	struct sprd_drm *sprd;
+	int err;
+
+	drm = drm_dev_alloc(&sprd_drm_drv, dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	dev_set_drvdata(dev, drm);
+
+	sprd = devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
+	if (!sprd)
+		err = -ENOMEM;
+
+	drm->dev_private = sprd;
+
+	sprd_drm_mode_config_init(drm);
+
+	/* bind and init sub drivers */
+	err = component_bind_all(drm->dev, drm);
+	if (err) {
+		DRM_ERROR("failed to bind all component.\n");
+		goto err_dc_cleanup;
+	}
+
+	/* vblank init */
+	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (err) {
+		DRM_ERROR("failed to initialize vblank.\n");
+		goto err_unbind_all;
+	}
+	/* with irq_enabled = true, we can use the vblank feature. */
+	drm->irq_enabled = true;
+
+	/* reset all the states of crtc/plane/encoder/connector */
+	drm_mode_config_reset(drm);
+
+	/* init kms poll for handling hpd */
+	drm_kms_helper_poll_init(drm);
+
+	err = drm_dev_register(drm, 0);
+	if (err < 0)
+		goto err_kms_helper_poll_fini;
+
+	return 0;
+
+err_kms_helper_poll_fini:
+	drm_kms_helper_poll_fini(drm);
+err_unbind_all:
+	component_unbind_all(drm->dev, drm);
+err_dc_cleanup:
+	drm_mode_config_cleanup(drm);
+	return err;
+}
+
+static void sprd_drm_unbind(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+
+	drm_dev_unregister(drm);
+
+	drm_kms_helper_poll_fini(drm);
+
+	drm_mode_config_cleanup(drm);
+
+	component_unbind_all(drm->dev, drm);
+	drm->dev_private = NULL;
+	dev_set_drvdata(dev, NULL);
+
+	drm_dev_put(drm);
+}
+
+static const struct component_master_ops drm_component_ops = {
+	.bind = sprd_drm_bind,
+	.unbind = sprd_drm_unbind,
+};
+
+static int compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static int sprd_drm_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	if (ret) {
+		DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret);
+		return ret;
+	}
+
+	return drm_of_component_probe(&pdev->dev, compare_of, &drm_component_ops);
+}
+
+static int sprd_drm_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &drm_component_ops);
+	return 0;
+}
+
+static void sprd_drm_shutdown(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	if (!drm) {
+		DRM_WARN("drm device is not available, no shutdown\n");
+		return;
+	}
+
+	drm_atomic_helper_shutdown(drm);
+}
+
+static const struct of_device_id drm_match_table[] = {
+	{ .compatible = "sprd,display-subsystem", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, drm_match_table);
+
+static struct platform_driver sprd_drm_driver = {
+	.probe = sprd_drm_probe,
+	.remove = sprd_drm_remove,
+	.shutdown = sprd_drm_shutdown,
+	.driver = {
+		.name = "sprd-drm-drv",
+		.of_match_table = drm_match_table,
+	},
+};
+
+static struct platform_driver *sprd_drm_drivers[]  = {
+	&sprd_drm_driver,
+};
+
+static int __init sprd_drm_init(void)
+{
+	int ret;
+
+	ret = platform_register_drivers(sprd_drm_drivers,
+					ARRAY_SIZE(sprd_drm_drivers));
+	return ret;
+}
+
+static void __exit sprd_drm_exit(void)
+{
+	platform_unregister_drivers(sprd_drm_drivers,
+				    ARRAY_SIZE(sprd_drm_drivers));
+}
+
+module_init(sprd_drm_init);
+module_exit(sprd_drm_exit);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
new file mode 100644
index 0000000..edf0881
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_drm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef _SPRD_DRM_H_
+#define _SPRD_DRM_H_
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_print.h>
+
+struct sprd_drm {
+	struct drm_device *drm;
+};
+
+#endif /* _SPRD_DRM_H_ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
