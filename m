Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD8A6EB72C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 05:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66F110E349;
	Sat, 22 Apr 2023 03:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B18A10E13A;
 Sat, 22 Apr 2023 03:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682134878; x=1713670878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBI4lO3CACYTFuMAxM4W15yRVkDsPpMok2G68kitpbg=;
 b=HUl/rjpJhUeBeqKk1NryLsaiYaY39YB3T6ie9i9oAaNj6HdGBRexAXSg
 5Jz5kNM5Yp61VkUnsA3nQ4GrWcvbB3WJ0gymeVcdHA9o2ZcVV0I9tnCgT
 toKsPg1dYlma7rl9v3nf1VpRXQLIGHaBA9mP7yYYO4Ry6pKsyo1tYuEWG
 w+I5mSrycYN/Eh42ywNLRj67XExRttg0M6pPvpK0/Oe1NBiaIEmvLf2/e
 yeos4SRlk9t7QskutBxuTJz48rbrwIUKf+4rlMXjt837LWkeFkkeB9fE8
 t9AV+1181CASP6zug5NaB+eKl4oGWRdXLm/w6Rkg5yyvUx61f3qWJ4Xo7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="344874148"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="344874148"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 20:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781805208"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="781805208"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 20:41:17 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/4] mei: gsc_proxy: add gsc proxy driver
Date: Fri, 21 Apr 2023 20:40:59 -0700
Message-Id: <20230422034101.3922290-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422034101.3922290-1-daniele.ceraolospurio@intel.com>
References: <20230422034101.3922290-1-daniele.ceraolospurio@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Usyskin <alexander.usyskin@intel.com>

Add GSC proxy driver. It to allows messaging between GSC component
on Intel graphics card and CSE device.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

v2: re-order included, drop reference to "on board" card in commit
message and comments.

 drivers/misc/mei/Kconfig                   |   2 +-
 drivers/misc/mei/Makefile                  |   1 +
 drivers/misc/mei/gsc_proxy/Kconfig         |  14 ++
 drivers/misc/mei/gsc_proxy/Makefile        |   7 +
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c | 208 +++++++++++++++++++++
 5 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
 create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
 create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c

diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index d21486d69df2..37db142de413 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -62,4 +62,4 @@ config INTEL_MEI_GSC
 
 source "drivers/misc/mei/hdcp/Kconfig"
 source "drivers/misc/mei/pxp/Kconfig"
-
+source "drivers/misc/mei/gsc_proxy/Kconfig"
diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile
index fb740d754900..14aee253ae48 100644
--- a/drivers/misc/mei/Makefile
+++ b/drivers/misc/mei/Makefile
@@ -30,3 +30,4 @@ CFLAGS_mei-trace.o = -I$(src)
 
 obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
 obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
+obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
diff --git a/drivers/misc/mei/gsc_proxy/Kconfig b/drivers/misc/mei/gsc_proxy/Kconfig
new file mode 100644
index 000000000000..5f68d9f3d691
--- /dev/null
+++ b/drivers/misc/mei/gsc_proxy/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2022-2023, Intel Corporation. All rights reserved.
+#
+config INTEL_MEI_GSC_PROXY
+	tristate "Intel GSC Proxy services of ME Interface"
+	select INTEL_MEI_ME
+	depends on DRM_I915
+	help
+         MEI Support for GSC Proxy Services on Intel platforms.
+
+         MEI GSC proxy enables messaging between GSC service on
+         Intel graphics card and services on CSE (MEI) firmware
+         residing SoC or PCH.
+
diff --git a/drivers/misc/mei/gsc_proxy/Makefile b/drivers/misc/mei/gsc_proxy/Makefile
new file mode 100644
index 000000000000..358847e9aaa9
--- /dev/null
+++ b/drivers/misc/mei/gsc_proxy/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2022-2023, Intel Corporation. All rights reserved.
+#
+# Makefile - GSC Proxy client driver for Intel MEI Bus Driver.
+
+obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += mei_gsc_proxy.o
diff --git a/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
new file mode 100644
index 000000000000..be52b113aea9
--- /dev/null
+++ b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2023 Intel Corporation
+ */
+
+/**
+ * DOC: MEI_GSC_PROXY Client Driver
+ *
+ * The mei_gsc_proxy driver acts as a translation layer between
+ * proxy user (I915) and ME FW by proxying messages to ME FW
+ */
+
+#include <linux/component.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/uuid.h>
+#include <drm/drm_connector.h>
+#include <drm/i915_component.h>
+#include <drm/i915_gsc_proxy_mei_interface.h>
+
+/**
+ * mei_gsc_proxy_send - Sends a proxy message to ME FW.
+ * @dev: device corresponding to the mei_cl_device
+ * @buf: a message buffer to send
+ * @size: size of the message
+ * Return: bytes sent on Success, <0 on Failure
+ */
+static int mei_gsc_proxy_send(struct device *dev, const void *buf, size_t size)
+{
+	ssize_t ret;
+
+	if (!dev || !buf)
+		return -EINVAL;
+
+	ret = mei_cldev_send(to_mei_cl_device(dev), buf, size);
+	if (ret < 0)
+		dev_dbg(dev, "mei_cldev_send failed. %zd\n", ret);
+
+	return ret;
+}
+
+/**
+ * mei_gsc_proxy_recv - Receives a proxy message from ME FW.
+ * @dev: device corresponding to the mei_cl_device
+ * @buf: a message buffer to contain the received message
+ * @size: size of the buffer
+ * Return: bytes received on Success, <0 on Failure
+ */
+static int mei_gsc_proxy_recv(struct device *dev, void *buf, size_t size)
+{
+	ssize_t ret;
+
+	if (!dev || !buf)
+		return -EINVAL;
+
+	ret = mei_cldev_recv(to_mei_cl_device(dev), buf, size);
+	if (ret < 0)
+		dev_dbg(dev, "mei_cldev_recv failed. %zd\n", ret);
+
+	return ret;
+}
+
+static const struct i915_gsc_proxy_component_ops mei_gsc_proxy_ops = {
+	.owner = THIS_MODULE,
+	.send = mei_gsc_proxy_send,
+	.recv = mei_gsc_proxy_recv,
+};
+
+static int mei_component_master_bind(struct device *dev)
+{
+	struct mei_cl_device *cldev = to_mei_cl_device(dev);
+	struct i915_gsc_proxy_component *comp_master = mei_cldev_get_drvdata(cldev);
+
+	comp_master->ops = &mei_gsc_proxy_ops;
+	comp_master->mei_dev = dev;
+	return component_bind_all(dev, comp_master);
+}
+
+static void mei_component_master_unbind(struct device *dev)
+{
+	struct mei_cl_device *cldev = to_mei_cl_device(dev);
+	struct i915_gsc_proxy_component *comp_master = mei_cldev_get_drvdata(cldev);
+
+	component_unbind_all(dev, comp_master);
+}
+
+static const struct component_master_ops mei_component_master_ops = {
+	.bind = mei_component_master_bind,
+	.unbind = mei_component_master_unbind,
+};
+
+/**
+ * mei_gsc_proxy_component_match - compare function for matching mei.
+ *
+ *    The function checks if the device is pci device and
+ *    Intel VGA adapter, the subcomponent is SW Proxy
+ *    and the parent of MEI PCI and the parent of VGA are the same PCH device.
+ *
+ * @dev: master device
+ * @subcomponent: subcomponent to match (I915_COMPONENT_SWPROXY)
+ * @data: compare data (mei pci parent)
+ *
+ * Return:
+ * * 1 - if components match
+ * * 0 - otherwise
+ */
+static int mei_gsc_proxy_component_match(struct device *dev, int subcomponent,
+					 void *data)
+{
+	struct pci_dev *pdev;
+
+	if (!dev_is_pci(dev))
+		return 0;
+
+	pdev = to_pci_dev(dev);
+
+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
+	    pdev->vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (subcomponent != I915_COMPONENT_GSC_PROXY)
+		return 0;
+
+	return component_compare_dev(dev->parent, ((struct device *)data)->parent);
+}
+
+static int mei_gsc_proxy_probe(struct mei_cl_device *cldev,
+			       const struct mei_cl_device_id *id)
+{
+	struct i915_gsc_proxy_component *comp_master;
+	struct component_match *master_match = NULL;
+	int ret;
+
+	ret = mei_cldev_enable(cldev);
+	if (ret < 0) {
+		dev_err(&cldev->dev, "mei_cldev_enable Failed. %d\n", ret);
+		goto enable_err_exit;
+	}
+
+	comp_master = kzalloc(sizeof(*comp_master), GFP_KERNEL);
+	if (!comp_master) {
+		ret = -ENOMEM;
+		goto err_exit;
+	}
+
+	component_match_add_typed(&cldev->dev, &master_match,
+				  mei_gsc_proxy_component_match, cldev->dev.parent);
+	if (IS_ERR_OR_NULL(master_match)) {
+		ret = -ENOMEM;
+		goto err_exit;
+	}
+
+	mei_cldev_set_drvdata(cldev, comp_master);
+	ret = component_master_add_with_match(&cldev->dev,
+					      &mei_component_master_ops,
+					      master_match);
+	if (ret < 0) {
+		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
+		goto err_exit;
+	}
+
+	return 0;
+
+err_exit:
+	mei_cldev_set_drvdata(cldev, NULL);
+	kfree(comp_master);
+	mei_cldev_disable(cldev);
+enable_err_exit:
+	return ret;
+}
+
+static void mei_gsc_proxy_remove(struct mei_cl_device *cldev)
+{
+	struct i915_gsc_proxy_component *comp_master = mei_cldev_get_drvdata(cldev);
+	int ret;
+
+	component_master_del(&cldev->dev, &mei_component_master_ops);
+	kfree(comp_master);
+	mei_cldev_set_drvdata(cldev, NULL);
+
+	ret = mei_cldev_disable(cldev);
+	if (ret)
+		dev_warn(&cldev->dev, "mei_cldev_disable() failed %d\n", ret);
+}
+
+#define MEI_UUID_GSC_PROXY UUID_LE(0xf73db04, 0x97ab, 0x4125, \
+				   0xb8, 0x93, 0xe9, 0x4, 0xad, 0xd, 0x54, 0x64)
+
+static struct mei_cl_device_id mei_gsc_proxy_tbl[] = {
+	{ .uuid = MEI_UUID_GSC_PROXY, .version = MEI_CL_VERSION_ANY },
+	{ }
+};
+MODULE_DEVICE_TABLE(mei, mei_gsc_proxy_tbl);
+
+static struct mei_cl_driver mei_gsc_proxy_driver = {
+	.id_table = mei_gsc_proxy_tbl,
+	.name = KBUILD_MODNAME,
+	.probe = mei_gsc_proxy_probe,
+	.remove	= mei_gsc_proxy_remove,
+};
+
+module_mei_cl_driver(mei_gsc_proxy_driver);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MEI GSC PROXY");
-- 
2.40.0

