Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1B78865B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFA610E65F;
	Fri, 25 Aug 2023 11:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5039F10E652;
 Fri, 25 Aug 2023 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964285; x=1724500285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zsxo/o+PAYdojeeCJ2En9Lh104G0+nK28U2pv1lLqkk=;
 b=SC2ne8tY8Jpv/Wt283nVK/mNifMPWz5L01yklXIz3xXXQoWV9sgsY7Wl
 L6Wr+8Q/vb2DoFrbDajChwFLyJGc/m0Bq4NubH22YyEL3/6uSGlt7Zx4h
 8dpVVSgKeqwCY6pyXoJqUxHzSd29PRRwWMxp+xOfUwkE5d62/nEDm8faf
 hBdGNyOLzc8JYa71oi+3+lKoBdGbaaAYbtRnvaq5sKB+4AtXzL6fUjMcV
 IVtV1Y5MyQ2XwOJsaXgK35acx9QKRB4dUT+9Y3trXSc619qkbvufWTrPq
 Y3WWWZ0UEiLb9WTB6UZlGb43cATZJ71B80O0XBDgP7GFrpbBdU9wAff+S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359694715"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359694715"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="881153534"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:28 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 1/5] drm/netlink: Add netlink infrastructure
Date: Fri, 25 Aug 2023 17:25:27 +0530
Message-Id: <20230825115531.800574-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
References: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define the netlink registration interface and commands, attributes that
can be commonly used across by drm drivers. This patch intends to use
the generic netlink family to expose various stats of device. At present
it defines some commands that shall be used to expose RAS error counters.

v2:
define common interfaces to genl netlink subsystem that all drm drivers
can leverage.(Tomer Tayar)

Cc: Tomer Tayar <ttayar@habana.ai>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/Makefile       |   1 +
 drivers/gpu/drm/drm_drv.c      |   7 ++
 drivers/gpu/drm/drm_netlink.c  | 175 +++++++++++++++++++++++++++++++++
 include/drm/drm_device.h       |   8 ++
 include/drm/drm_drv.h          |  14 +++
 include/drm/drm_netlink.h      |  39 ++++++++
 include/uapi/drm/drm_netlink.h |  63 ++++++++++++
 7 files changed, 307 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_netlink.c
 create mode 100644 include/drm/drm_netlink.h
 create mode 100644 include/uapi/drm/drm_netlink.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 795abcc0ca7e..c91f947edf07 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -35,6 +35,7 @@ drm-y := \
 	drm_mode_object.o \
 	drm_modes.o \
 	drm_modeset_lock.o \
+	drm_netlink.o \
 	drm_plane.o \
 	drm_prime.o \
 	drm_print.o \
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index cee0cc522ed9..c9cfbf76da64 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -928,6 +928,12 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_minors;
 
+	if (drm_core_check_feature(dev, DRIVER_NETLINK)) {
+		ret = drm_genl_register(dev);
+		if (ret)
+			goto err_minors;
+	}
+
 	ret = create_compat_control_link(dev);
 	if (ret)
 		goto err_minors;
@@ -1062,6 +1068,7 @@ static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
 	accel_core_exit();
+	drm_genl_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
new file mode 100644
index 000000000000..e41127963968
--- /dev/null
+++ b/drivers/gpu/drm/drm_netlink.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_netlink.h>
+#include <drm/drm_print.h>
+
+DEFINE_XARRAY(drm_dev_xarray);
+
+/**
+ * drm_genl_send - Send genl command
+ * @msg: socket buffer
+ * @info: receiver information
+ * @usrhdr: pointer to user specific header in the message buffer
+ *
+ * RETURNS:
+ * 0 on success and negative error code on failure
+ */
+int drm_genl_send(struct sk_buff *msg, struct genl_info *info, void *usrhdr)
+{
+	int ret;
+
+	genlmsg_end(msg, usrhdr);
+
+	ret = genlmsg_reply(msg, info);
+	if (ret)
+		nlmsg_free(msg);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_genl_send);
+
+/**
+ * drm_genl_alloc_msg - allocate genl message buffer
+ * @dev: drm_device for which the message is being allocated
+ * @info: receiver information
+ * @usrhdr: pointer to user specific header in the message buffer
+ *
+ * RETURNS:
+ * pointer to new allocated buffer on success, NULL on failure
+ */
+struct sk_buff *
+drm_genl_alloc_msg(struct drm_device *dev,
+		   struct genl_info *info,
+		   size_t msg_size, void **usrhdr)
+{
+	struct sk_buff *new_msg;
+
+	new_msg = genlmsg_new(msg_size, GFP_KERNEL);
+	if (!new_msg)
+		return new_msg;
+
+	*usrhdr = genlmsg_put_reply(new_msg, info, &dev->drm_genl_family, 0, info->genlhdr->cmd);
+	if (!*usrhdr) {
+		nlmsg_free(new_msg);
+		new_msg = NULL;
+	}
+
+	return new_msg;
+}
+EXPORT_SYMBOL(drm_genl_alloc_msg);
+
+static struct drm_device *genl_to_dev(struct genl_info *info)
+{
+	return xa_load(&drm_dev_xarray, info->nlhdr->nlmsg_type);
+}
+
+static int drm_genl_list_errors(struct sk_buff *msg, struct genl_info *info)
+{
+	struct drm_device *dev = genl_to_dev(info);
+
+	if (WARN_ON(!dev->driver->genl_ops[info->genlhdr->cmd].doit))
+		return -EOPNOTSUPP;
+
+	return dev->driver->genl_ops[info->genlhdr->cmd].doit(dev, msg, info);
+}
+
+static int drm_genl_read_error(struct sk_buff *msg, struct genl_info *info)
+{
+	struct drm_device *dev = genl_to_dev(info);
+
+	if (WARN_ON(!dev->driver->genl_ops[info->genlhdr->cmd].doit))
+		return -EOPNOTSUPP;
+
+	return dev->driver->genl_ops[info->genlhdr->cmd].doit(dev, msg, info);
+}
+
+/* drm genl operations definition */
+const struct genl_ops drm_genl_ops[] = {
+	{
+		.cmd = DRM_RAS_CMD_QUERY,
+		.doit = drm_genl_list_errors,
+		.policy = drm_attr_policy_query,
+	},
+	{
+		.cmd = DRM_RAS_CMD_READ_ONE,
+		.doit = drm_genl_read_error,
+		.policy = drm_attr_policy_read_one,
+	},
+	{
+		.cmd = DRM_RAS_CMD_READ_ALL,
+		.doit = drm_genl_list_errors,
+		.policy = drm_attr_policy_query,
+	},
+};
+
+static void drm_genl_family_init(struct drm_device *dev)
+{
+	/* Use drm primary node name eg: card0 to name the genl family */
+	snprintf(dev->drm_genl_family.name, sizeof(dev->drm_genl_family.name), "%s", dev->primary->kdev->kobj.name);
+	dev->drm_genl_family.version = DRM_GENL_VERSION;
+	dev->drm_genl_family.parallel_ops = true;
+	dev->drm_genl_family.ops = drm_genl_ops;
+	dev->drm_genl_family.n_ops = ARRAY_SIZE(drm_genl_ops);
+	dev->drm_genl_family.maxattr = DRM_ATTR_MAX;
+	dev->drm_genl_family.module = dev->dev->driver->owner;
+}
+
+static void drm_genl_deregister(struct drm_device *dev,  void *arg)
+{
+	drm_dbg_driver(dev, "unregistering genl family %s\n", dev->drm_genl_family.name);
+
+	xa_erase(&drm_dev_xarray, dev->drm_genl_family.id);
+
+	genl_unregister_family(&dev->drm_genl_family);
+}
+
+/**
+ * drm_genl_register - Register genl family
+ * @dev: drm_device for which genl family needs to be registered
+ *
+ * RETURNS:
+ * 0 on success and negative error code on failure
+ */
+int drm_genl_register(struct drm_device *dev)
+{
+	int ret;
+
+	/*
+	 * If driver_genl_ops is not set then it is expected that the driver
+	 * would initialize drm_genl_family.
+	 *
+	 */
+	if (dev->driver->genl_ops)
+		drm_genl_family_init(dev);
+
+	BUG_ON(!dev->drm_genl_family.name);
+
+	ret = genl_register_family(&dev->drm_genl_family);
+	if (ret < 0) {
+		drm_warn(dev, "genl family registration failed\n");
+		return ret;
+	}
+
+	drm_dbg_driver(dev, "genl family id %d and name %s\n", dev->drm_genl_family.id, dev->drm_genl_family.name);
+
+	xa_store(&drm_dev_xarray, dev->drm_genl_family.id, dev, GFP_KERNEL);
+
+	ret = drmm_add_action_or_reset(dev, drm_genl_deregister, NULL);
+
+	return ret;
+}
+
+/**
+ * drm_genl_exit: destroy drm_dev_xarray
+ */
+void drm_genl_exit(void)
+{
+	xa_destroy(&drm_dev_xarray);
+}
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 7cf4afae2e79..a984f34a11a2 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_legacy.h>
 #include <drm/drm_mode_config.h>
+#include <drm/drm_netlink.h>
 
 struct drm_driver;
 struct drm_minor;
@@ -326,6 +327,13 @@ struct drm_device {
 	 */
 	struct list_head debugfs_list;
 
+	/**
+	 * @drm_genl_family:
+	 *
+	 * Generic netlink family registration structure.
+	 */
+	struct genl_family drm_genl_family;
+
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b419c59c4bef..df704b5d564a 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -104,6 +104,13 @@ enum drm_driver_feature {
 	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
 	 */
 	DRIVER_COMPUTE_ACCEL            = BIT(7),
+	/**
+	 * @DRIVER_NETLINK
+	 *
+	 * Driver supports communicating some of the important device stats
+	 * like errors to userspace via netlink messages.
+	 */
+	DRIVER_NETLINK			= BIT(8),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
@@ -443,6 +450,13 @@ struct drm_driver {
 	 */
 	const struct file_operations *fops;
 
+	/**
+	 * @genl_ops:
+	 *
+	 * Drivers private callback to genl commands
+	 */
+	const struct driver_genl_ops *genl_ops;
+
 #ifdef CONFIG_DRM_LEGACY
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
new file mode 100644
index 000000000000..60f7ee39ae0a
--- /dev/null
+++ b/include/drm/drm_netlink.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __DRM_NETLINK_H__
+#define __DRM_NETLINK_H__
+
+#include <linux/netdevice.h>
+#include <net/genetlink.h>
+#include <net/sock.h>
+#include <uapi/drm/drm_netlink.h>
+
+struct drm_device;
+
+struct driver_genl_ops {
+	int		       (*doit)(struct drm_device *dev,
+				       struct sk_buff *skb,
+				       struct genl_info *info);
+};
+
+/* attribute policies */
+static const struct nla_policy drm_attr_policy_query[DRM_ATTR_MAX + 1] = {
+	[DRM_RAS_ATTR_REQUEST] = { .type = NLA_U8 },
+};
+
+static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
+	[DRM_RAS_ATTR_ERROR_ID] = { .type = NLA_U64 },
+};
+
+int drm_genl_register(struct drm_device *dev);
+void drm_genl_exit(void);
+int drm_genl_send(struct sk_buff *msg, struct genl_info *info, void *usrhdr);
+struct sk_buff *
+drm_genl_alloc_msg(struct drm_device *dev,
+		   struct genl_info *info,
+		   size_t msg_size, void **usrhdr);
+#endif
+
diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
new file mode 100644
index 000000000000..a3ccc68f782d
--- /dev/null
+++ b/include/uapi/drm/drm_netlink.h
@@ -0,0 +1,63 @@
+/*
+ * Copyright 2023 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef _DRM_NETLINK_H_
+#define _DRM_NETLINK_H_
+
+#define DRM_GENL_VERSION 1
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+enum error_cmds {
+	DRM_CMD_UNSPEC,
+	/* command to list all errors names with config-id */
+	DRM_RAS_CMD_QUERY,
+	/* command to get a counter for a specific error */
+	DRM_RAS_CMD_READ_ONE,
+	/* command to get counters of all errors */
+	DRM_RAS_CMD_READ_ALL,
+
+	__DRM_CMD_MAX,
+	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
+};
+
+enum error_attr {
+	DRM_ATTR_UNSPEC,
+	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
+	DRM_RAS_ATTR_REQUEST, /* NLA_U8 */
+	DRM_RAS_ATTR_QUERY_REPLY, /* NLA_NESTED */
+	DRM_RAS_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
+	DRM_RAS_ATTR_ERROR_ID, /* NLA_U64 */
+	DRM_RAS_ATTR_ERROR_VALUE, /* NLA_U64 */
+
+	__DRM_ATTR_MAX,
+	DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif
-- 
2.25.1

