Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878F2C9959
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75CE6E526;
	Tue,  1 Dec 2020 08:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52F96E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:28:47 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id l23so540528pjg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qsfbB3ftc4SWRo6fqf2S6NDmY/XvU+iKe8BxMSK5i4w=;
 b=eL0yKj2119MuLv+0j2Filygf1JEgF90PHnyUvjviUQEQMM21WjQEN2KmH/1gM04Ghy
 DmUFWHOX1jcZvES+slNk4i4tPFg1+CLUP0bMu+x1kBZdiBA2efgzXBgOj4idg4sGflh4
 XmwGvNd3gbq/eQ3DT7Gt2mC5NH0ZOK8ZilePEMhUZRoxWGvJqUEemlB6Ug0up9zNAaMp
 K57NFwMy+6MvBE4BbOFRKfaKdtTZo4wLnjgNWcTQ/oAVD0yZT/XJA7bud1fBzg9J1n6e
 tzJbXZortG8QIUP3OOBSXGwjlydmGgZ9JXWWVRqDynKu05Dv5pUmaqz/0cY8WTcGvtb2
 Jc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qsfbB3ftc4SWRo6fqf2S6NDmY/XvU+iKe8BxMSK5i4w=;
 b=L/qA35ozHVY2cqawBddivU+ioCDzkVms53aa34Dp1MOWLJWcRvR0fw5/wFZbANnRxw
 ZQi+e+0iBII0wFJN6gelInXkLR1iVpEAlwkBFxnvtKIWOOAWr5wP1Q0ZGEtWv+TghJIa
 DsrCbZFYna+HCArjDQm66akSd3heZIRsHt9M2ALMa6QetDd9OF0ATQ07/dJQvVnaOPHX
 lUtr1vbM8w+Tv/hWhnMqkrWQQ9PoYZJ0CnURsZV3UM7p00ZNxIMKOfuCBJr6p7Se3L79
 58GwHJ9rELFCJGT/69Effz7rtA2m5ZDUtV+BtIB/DOfCOkRdI3z0TnoLd/qFIsMfZ08B
 8Eng==
X-Gm-Message-State: AOAM532GP+9RYeFsg+1AlJIJbA7UkMyFRjxtS+inqEHZ1Igf69qHe9+0
 x1rTs4xiPix34YZuluEymGh3GvFVeAc=
X-Google-Smtp-Source: ABdhPJzLVI6u5oFpyaCAaizN019TG26T4ZcnwNppqBzLOs2Znw7P+8zC9InynoPMtdivBvPDYqGIRA==
X-Received: by 2002:a17:902:e787:b029:d9:f88d:c32d with SMTP id
 cp7-20020a170902e787b02900d9f88dc32dmr18992489plb.79.1606746527537; 
 Mon, 30 Nov 2020 06:28:47 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 17sm15580479pfh.173.2020.11.30.06.28.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 06:28:46 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH 2/6] drm/sprd: add Unisoc's drm kms master
Date: Mon, 30 Nov 2020 22:28:29 +0800
Message-Id: <1606746513-30909-3-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
References: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
 drivers/gpu/drm/sprd/sprd_drm.c | 222 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
 6 files changed, 258 insertions(+)
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 147d61b..15b4e13 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -388,6 +388,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
 
 source "drivers/gpu/drm/xlnx/Kconfig"
 
+source "drivers/gpu/drm/sprd/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8156900..d3001e7 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -124,3 +124,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
 obj-y			+= xlnx/
+obj-$(CONFIG_DRM_SPRD) += sprd/
diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
new file mode 100644
index 0000000..6e80cc9
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
+	  Choose this option if you have a Unisoc chipset.
+	  If M is selected the module will be called sprd_drm.
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
index 0000000..ec101de
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -0,0 +1,222 @@
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
+	DRM_GEM_CMA_DRIVER_OPS,
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
+	struct drm_device *drm = dev_get_drvdata(dev);
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	sprd_drm_mode_config_init(drm);
+
+	/* bind and init sub drivers */
+	ret = component_bind_all(drm->dev, drm);
+	if (ret) {
+		drm_err(drm, "failed to bind all component.\n");
+		goto err_dc_cleanup;
+	}
+
+	/* vblank init */
+	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (ret) {
+		drm_err(drm, "failed to initialize vblank.\n");
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
+	ret = drm_dev_register(drm, 0);
+	if (ret < 0)
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
+	return ret;
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
+	struct device *dev = &pdev->dev;
+	struct drm_device *drm;
+	struct sprd_drm *sprd;
+	int ret;
+
+	sprd = devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm, drm);
+	if (IS_ERR(sprd))
+		return PTR_ERR(sprd);
+
+	drm = &sprd->drm;
+
+	ret = dma_set_mask_and_coherent(dev, ~0UL);
+	if (ret) {
+		drm_err(drm, "dma_set_mask_and_coherent failed (%d)\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, drm);
+
+	return drm_of_component_probe(dev, compare_of, &drm_component_ops);
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
+		drm_warn(drm, "drm device is not available, no shutdown\n");
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
index 0000000..9781fd5
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
+	struct drm_device drm;
+};
+
+#endif /* _SPRD_DRM_H_ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
