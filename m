Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3801228D1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2ED6E985;
	Tue, 17 Dec 2019 10:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1C6E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:41:09 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id ca19so2853945pjb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jYap3dKKuBxPh9gprlatxsbbksMd/RItUR+R5/8jN8I=;
 b=nnziR2JiYwqcuWR9TQLbTSY3BIpjemhSWqb0PNXqwhDfpzrO3m26B6S43kbXjG3x40
 KildhODl2xW1yn9gVQCoR61k48f/Aakfo+Bcw+g7dmX2ojY8UAkS3wTd3WszpKt9WpZX
 2c2GZSKiRh4SCwVmPcpLVpsmXFFcb73g+Hx22tPvSH/lokfUz9KNAyQPwuihTN1VhB3K
 LqdpXD0bIEteNYltboGFAO3hvpOslodFE3xS52j5G4iUHq8Q8/7eCC33qe5AmAWhQmAw
 Myuk7zVm7MH7YwM1Co4YEUUVY1vpVC8WbRqtreRmRldplIdLXx+YqyWFBR9ZI/g7ujfz
 rYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jYap3dKKuBxPh9gprlatxsbbksMd/RItUR+R5/8jN8I=;
 b=NrLnwwLs8P2gTPVVu/QBJJMJtXbQ76DIUBbPmxK16vehUtIyLbP244SsfTxZOgSpSA
 f64KBoSBd2qvw8cfMVDXFbInD71RG81FmA+QbK2EJN4trPqeQ8ZzqKZgAiXfMhUQzPFu
 EHay1mmcZmeduuj/6zRN03WfwgppT6Q4j9PFvWQQunmufZ+ItprZhrS6zboa/yXbIhar
 eUUzDQDwH0dSF9HSHqOV7irD1mz6ppi0AkEJUJvCJuV7La8pZ3JGefROE2acNkdMbqz5
 9xPs9egUBRh1vS8pZKXNaFpv7BIuApI2EjtxX49bjyEgny8d5v3mHUrT4dnP/yzvkFRP
 zaew==
X-Gm-Message-State: APjAAAUvB+AJvqrU4FG/+xOYK4ypDt7Rso0ZdORVnG3yxHJhDaM/1f86
 g7XWGIZf/2H6J6ok3qXUKGA=
X-Google-Smtp-Source: APXvYqzYUcgPKeE2PV85xzp5agQQYAt/BCz8tFXtVlYRHQpmN7sNwIeIDX1F6qA+pGj2as3kGaVH8A==
X-Received: by 2002:a17:902:6bca:: with SMTP id
 m10mr15647768plt.212.1576496468953; 
 Mon, 16 Dec 2019 03:41:08 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id p124sm22432269pfb.52.2019.12.16.03.41.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 16 Dec 2019 03:41:08 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v1 2/6] drm/sprd: add Unisoc's drm kms master
Date: Mon, 16 Dec 2019 19:40:15 +0800
Message-Id: <1576496419-12409-3-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
References: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds drm support for the Unisoc's display subsystem.

This is drm device and gem driver. This driver provides support for the
Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/Kconfig         |   2 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/sprd/Kconfig    |  14 ++
 drivers/gpu/drm/sprd/Makefile   |   8 ++
 drivers/gpu/drm/sprd/sprd_drm.c | 286 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
 drivers/gpu/drm/sprd/sprd_gem.c | 178 +++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_gem.h |  30 +++++
 8 files changed, 535 insertions(+)
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index bfdadc3..cead12c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
 
 source "drivers/gpu/drm/mcde/Kconfig"
 
+source "drivers/gpu/drm/sprd/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 9f1c7c4..85ca211 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  += lima/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
+obj-$(CONFIG_DRM_SPRD) += sprd/
diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
new file mode 100644
index 0000000..79f286b
--- /dev/null
+++ b/drivers/gpu/drm/sprd/Kconfig
@@ -0,0 +1,14 @@
+config DRM_SPRD
+	tristate "DRM Support for Unisoc SoCs Platform"
+	depends on ARCH_SPRD
+	depends on DRM && OF
+	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DSI
+	select DRM_PANEL
+	select VIDEOMODE_HELPERS
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  Choose this option if you have a Unisoc chipsets.
+	  If M is selected the module will be called sprd-drm.
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
new file mode 100644
index 0000000..df0b316
--- /dev/null
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ccflags-y += -Iinclude/drm
+
+subdir-ccflags-y += -I$(src)
+
+obj-y := sprd_drm.o \
+	sprd_gem.o
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
new file mode 100644
index 0000000..4aee25fa4
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
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
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "sprd_drm.h"
+#include "sprd_gem.h"
+
+#define DRIVER_NAME	"sprd"
+#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
+#define DRIVER_DATE	"20191101"
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
+static const struct file_operations sprd_drm_fops = {
+	.owner		= THIS_MODULE,
+	.open		= drm_open,
+	.release	= drm_release,
+	.unlocked_ioctl	= drm_ioctl,
+	.compat_ioctl	= drm_compat_ioctl,
+	.poll		= drm_poll,
+	.read		= drm_read,
+	.llseek		= no_llseek,
+	.mmap		= sprd_gem_mmap,
+};
+
+static struct drm_driver sprd_drm_drv = {
+	.driver_features	= DRIVER_GEM | DRIVER_ATOMIC,
+	.fops			= &sprd_drm_fops,
+	.gem_vm_ops		= &drm_gem_cma_vm_ops,
+	.gem_free_object_unlocked	= sprd_gem_free_object,
+	.dumb_create		= sprd_gem_dumb_create,
+	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
+	.gem_prime_import	= drm_gem_prime_import,
+	.gem_prime_import_sg_table = sprd_gem_prime_import_sg_table,
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
+	if (!sprd) {
+		err = -ENOMEM;
+		goto err_free_drm;
+	}
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
+err_free_drm:
+	drm_dev_put(drm);
+	return err;
+}
+
+static void sprd_drm_unbind(struct device *dev)
+{
+	drm_put_dev(dev_get_drvdata(dev));
+}
+
+static const struct component_master_ops sprd_drm_component_ops = {
+	.bind = sprd_drm_bind,
+	.unbind = sprd_drm_unbind,
+};
+
+static int compare_of(struct device *dev, void *data)
+{
+	struct device_node *np = data;
+
+	DRM_DEBUG("compare %s\n", np->full_name);
+
+	return dev->of_node == np;
+}
+
+static int sprd_drm_component_probe(struct device *dev,
+			   const struct component_master_ops *m_ops)
+{
+	struct device_node *ep, *port, *remote;
+	struct component_match *match = NULL;
+	int i;
+
+	if (!dev->of_node)
+		return -EINVAL;
+
+	/*
+	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
+	 * called from encoder's .bind callbacks works as expected
+	 */
+	for (i = 0; ; i++) {
+		port = of_parse_phandle(dev->of_node, "ports", i);
+		if (!port)
+			break;
+
+		if (!of_device_is_available(port->parent)) {
+			of_node_put(port);
+			continue;
+		}
+
+		component_match_add(dev, &match, compare_of, port->parent);
+		of_node_put(port);
+	}
+
+	if (i == 0) {
+		dev_err(dev, "missing 'ports' property\n");
+		return -ENODEV;
+	}
+
+	if (!match) {
+		dev_err(dev, "no available port\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * For bound crtcs, bind the encoders attached to their remote endpoint
+	 */
+	for (i = 0; ; i++) {
+		port = of_parse_phandle(dev->of_node, "ports", i);
+		if (!port)
+			break;
+
+		if (!of_device_is_available(port->parent)) {
+			of_node_put(port);
+			continue;
+		}
+
+		for_each_child_of_node(port, ep) {
+			remote = of_graph_get_remote_port_parent(ep);
+			if (!remote || !of_device_is_available(remote)) {
+				of_node_put(remote);
+				continue;
+			} else if (!of_device_is_available(remote->parent)) {
+				dev_warn(dev, "parent device of %s is not available\n",
+					 remote->full_name);
+				of_node_put(remote);
+				continue;
+			}
+
+			component_match_add(dev, &match, compare_of, remote);
+			of_node_put(remote);
+		}
+		of_node_put(port);
+	}
+
+	return component_master_add_with_match(dev, m_ops, match);
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
+	return sprd_drm_component_probe(&pdev->dev, &sprd_drm_component_ops);
+}
+
+static int sprd_drm_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &sprd_drm_component_ops);
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
+static const struct of_device_id sprd_drm_match_table[] = {
+	{ .compatible = "sprd,display-subsystem",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, sprd_drm_match_table);
+
+static struct platform_driver sprd_drm_driver = {
+	.probe = sprd_drm_probe,
+	.remove = sprd_drm_remove,
+	.shutdown = sprd_drm_shutdown,
+	.driver = {
+		.name = "sprd-drm-drv",
+		.of_match_table = sprd_drm_match_table,
+	},
+};
+
+module_platform_driver(sprd_drm_driver);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
new file mode 100644
index 0000000..137cb27
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_drm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
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
diff --git a/drivers/gpu/drm/sprd/sprd_gem.c b/drivers/gpu/drm/sprd/sprd_gem.c
new file mode 100644
index 0000000..9aec78e
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_gem.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_prime.h>
+
+#include "sprd_drm.h"
+#include "sprd_gem.h"
+
+static struct sprd_gem_obj *sprd_gem_obj_create(struct drm_device *drm,
+						unsigned long size)
+{
+	struct sprd_gem_obj *sprd_gem;
+	int ret;
+
+	sprd_gem = kzalloc(sizeof(*sprd_gem), GFP_KERNEL);
+	if (!sprd_gem)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_gem_object_init(drm, &sprd_gem->base, size);
+	if (ret < 0) {
+		DRM_ERROR("failed to initialize gem object\n");
+		goto error;
+	}
+
+	ret = drm_gem_create_mmap_offset(&sprd_gem->base);
+	if (ret) {
+		drm_gem_object_release(&sprd_gem->base);
+		goto error;
+	}
+
+	return sprd_gem;
+
+error:
+	kfree(sprd_gem);
+	return ERR_PTR(ret);
+}
+
+void sprd_gem_free_object(struct drm_gem_object *obj)
+{
+	struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
+
+	DRM_DEBUG("gem = %p\n", obj);
+
+	if (sprd_gem->vaddr)
+		dma_free_wc(obj->dev->dev, obj->size,
+			sprd_gem->vaddr, sprd_gem->dma_addr);
+	else if (sprd_gem->sgtb)
+		drm_prime_gem_destroy(obj, sprd_gem->sgtb);
+
+	drm_gem_object_release(obj);
+
+	kfree(sprd_gem);
+}
+
+int sprd_gem_dumb_create(struct drm_file *file_priv, struct drm_device *drm,
+			    struct drm_mode_create_dumb *args)
+{
+	struct sprd_gem_obj *sprd_gem;
+	int ret;
+
+	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	args->size = round_up(args->pitch * args->height, PAGE_SIZE);
+
+	sprd_gem = sprd_gem_obj_create(drm, args->size);
+	if (IS_ERR(sprd_gem))
+		return PTR_ERR(sprd_gem);
+
+	sprd_gem->vaddr = dma_alloc_wc(drm->dev, args->size,
+			&sprd_gem->dma_addr, GFP_KERNEL | __GFP_NOWARN | GFP_DMA);
+	if (!sprd_gem->vaddr) {
+		DRM_ERROR("failed to allocate buffer with size %llu\n",
+			  args->size);
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	ret = drm_gem_handle_create(file_priv, &sprd_gem->base, &args->handle);
+	if (ret)
+		goto error;
+
+	drm_gem_object_put_unlocked(&sprd_gem->base);
+
+	return 0;
+
+error:
+	sprd_gem_free_object(&sprd_gem->base);
+	return ret;
+}
+
+static int sprd_gem_object_mmap(struct drm_gem_object *obj,
+				   struct vm_area_struct *vma)
+
+{
+	int ret;
+	struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
+
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_pgoff = 0;
+
+	ret = dma_mmap_wc(obj->dev->dev, vma,
+				    sprd_gem->vaddr, sprd_gem->dma_addr,
+				    vma->vm_end - vma->vm_start);
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+
+int sprd_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_gem_object *obj;
+	int ret;
+
+	ret = drm_gem_mmap(filp, vma);
+	if (ret)
+		return ret;
+
+	obj = vma->vm_private_data;
+
+	return sprd_gem_object_mmap(obj, vma);
+}
+
+int sprd_gem_prime_mmap(struct drm_gem_object *obj,
+			    struct vm_area_struct *vma)
+{
+	int ret;
+
+	ret = drm_gem_mmap_obj(obj, obj->size, vma);
+	if (ret)
+		return ret;
+
+	return sprd_gem_object_mmap(obj, vma);
+}
+
+struct sg_table *sprd_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct sprd_gem_obj *sprd_gem = to_sprd_gem_obj(obj);
+	struct sg_table *sgtb;
+	int ret;
+
+	sgtb = kzalloc(sizeof(*sgtb), GFP_KERNEL);
+	if (!sgtb)
+		return ERR_PTR(-ENOMEM);
+
+	ret = dma_get_sgtable(obj->dev->dev, sgtb, sprd_gem->vaddr,
+			      sprd_gem->dma_addr, obj->size);
+	if (ret) {
+		DRM_ERROR("failed to allocate sg_table, %d\n", ret);
+		kfree(sgtb);
+		return ERR_PTR(ret);
+	}
+
+	return sgtb;
+}
+
+struct drm_gem_object *sprd_gem_prime_import_sg_table(struct drm_device *drm,
+		struct dma_buf_attachment *attach, struct sg_table *sgtb)
+{
+	struct sprd_gem_obj *sprd_gem;
+
+	sprd_gem = sprd_gem_obj_create(drm, attach->dmabuf->size);
+	if (IS_ERR(sprd_gem))
+		return ERR_CAST(sprd_gem);
+
+	DRM_DEBUG("gem = %p\n", &sprd_gem->base);
+
+	if (sgtb->nents == 1)
+		sprd_gem->dma_addr = sg_dma_address(sgtb->sgl);
+
+	sprd_gem->sgtb = sgtb;
+
+	return &sprd_gem->base;
+}
diff --git a/drivers/gpu/drm/sprd/sprd_gem.h b/drivers/gpu/drm/sprd/sprd_gem.h
new file mode 100644
index 0000000..b6740bd
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_gem.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef _SPRD_GEM_H_
+#define _SPRD_GEM_H_
+
+#include <drm/drm_gem.h>
+
+struct sprd_gem_obj {
+	struct drm_gem_object	base;
+	dma_addr_t		dma_addr;
+	struct sg_table		*sgtb;
+	void			*vaddr;
+};
+
+#define to_sprd_gem_obj(x)	container_of(x, struct sprd_gem_obj, base)
+
+void sprd_gem_free_object(struct drm_gem_object *gem);
+int sprd_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
+			    struct drm_mode_create_dumb *args);
+int sprd_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+int sprd_gem_prime_mmap(struct drm_gem_object *obj,
+			 struct vm_area_struct *vma);
+struct sg_table *sprd_gem_prime_get_sg_table(struct drm_gem_object *obj);
+struct drm_gem_object *sprd_gem_prime_import_sg_table(struct drm_device *dev,
+		struct dma_buf_attachment *attach, struct sg_table *sgtb);
+
+#endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
