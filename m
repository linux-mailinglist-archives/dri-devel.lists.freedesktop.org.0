Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26017BCD7F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 11:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C8510E0C5;
	Sun,  8 Oct 2023 09:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145910E09B;
 Sun,  8 Oct 2023 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696757028; x=1728293028;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bWB3H867LCJ8Tbg+UUrNk4TzHb8Ud0UeqrZnIcpy3Wk=;
 b=ZcNOfw5OkuyX7BeqGVnzptcuEFic+yQvk87DihIX3nwLN4FIpoYnLkrs
 rPElpFxMfft0yboSOVSZze+OARrcYdJOvIuwPnvWTpESl9gKKO9MRtzVP
 7vXp6i8LDQhep4Y9owRYQEZfVnX+e/GEk4YzjZwStSBx5dHpUNspcWse7
 qmqULAbaO9fyDgky344PUBkeVTPNkMJAJh4nSFFOzAB2fZIs/lxR1ZN96
 PWzdxENVdXzyMIHza6BTs8LKjeWh4awHN1XyNQcDALHBgYOv4C26oKS5+
 KdX0lBiqw3gXSbBx4yUBrTHMbPGzrFu7Dtfu0Iaif6ZdvBH4VlHsndBJ9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="364278965"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="364278965"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="1084007081"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="1084007081"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:44 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, ogabbay@kernel.org, ttayar@habana.ai,
 Hawking.Zhang@amd.com, Harish.Kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, Luben.Tuikov@amd.com
Subject: [RFC v3 1/5] drm/netlink: Add netlink infrastructure
Date: Sun,  8 Oct 2023 14:56:12 +0530
Message-Id: <20231008092616.1457995-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
References: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define the netlink registration interface and commands, attributes that
can be commonly used across by drm drivers. This patch intends to use
the generic netlink family to expose various stats of device. At present
it defines some commands that shall be used to expose RAS error counters.

v2:
define common interfaces to genl netlink subsystem that all drm drivers
can leverage.(Tomer Tayar)

v3: drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
register to netlink subsystem (Daniel Vetter)

Cc: Tomer Tayar <ttayar@habana.ai>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/Makefile       |   1 +
 drivers/gpu/drm/drm_drv.c      |   7 ++
 drivers/gpu/drm/drm_netlink.c  | 175 +++++++++++++++++++++++++++++++++
 include/drm/drm_device.h       |   8 ++
 include/drm/drm_drv.h          |   7 ++
 include/drm/drm_netlink.h      |  39 ++++++++
 include/uapi/drm/drm_netlink.h |  83 ++++++++++++++++
 7 files changed, 320 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_netlink.c
 create mode 100644 include/drm/drm_netlink.h
 create mode 100644 include/uapi/drm/drm_netlink.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1ad88efb1752..d0d8dc730c43 100644
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
index 3eda026ffac6..c10c955186ce 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -928,6 +928,12 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_minors;
 
+	if (driver->genl_ops) {
+		ret = drm_genl_register(dev);
+		if (ret)
+			goto err_minors;
+	}
+
 	ret = create_compat_control_link(dev);
 	if (ret)
 		goto err_minors;
@@ -1064,6 +1070,7 @@ static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
 	accel_core_exit();
+	drm_genl_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
new file mode 100644
index 000000000000..843b2919b6ed
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
+	if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_REQUEST))
+		return -EINVAL;
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
+	if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_ERROR_ID))
+		return -EINVAL;
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
+	BUG_ON(!dev->driver->genl_ops);
+
+	drm_genl_family_init(dev);
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
index 9813fa759b75..480510714605 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -434,6 +434,13 @@ struct drm_driver {
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
index 000000000000..aab42147a20e
--- /dev/null
+++ b/include/uapi/drm/drm_netlink.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: MIT */
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
+/**
+ * enum drm_genl_error_cmds - Supported error commands
+ *
+ */
+enum drm_genl_error_cmds {
+	DRM_CMD_UNSPEC,
+	/** @DRM_RAS_CMD_QUERY: Command to list all errors names with config-id */
+	DRM_RAS_CMD_QUERY,
+	/** @DRM_RAS_CMD_READ_ONE: Command to get a counter for a specific error */
+	DRM_RAS_CMD_READ_ONE,
+	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all errors */
+	DRM_RAS_CMD_READ_ALL,
+
+	__DRM_CMD_MAX,
+	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
+};
+
+/**
+ * enum drm_error_attr - Attributes to use with drm_genl_error_cmds
+ *
+ */
+enum drm_error_attr {
+	DRM_ATTR_UNSPEC,
+	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
+	/**
+	 * @DRM_RAS_ATTR_REQUEST: Should be used with DRM_RAS_CMD_QUERY,
+	 * DRM_RAS_CMD_READ_ALL
+	 */
+	DRM_RAS_ATTR_REQUEST, /* NLA_U8 */
+	/**
+	 * @DRM_RAS_ATTR_QUERY_REPLY: First Nested attributed sent as a
+	 * response to DRM_RAS_CMD_QUERY, DRM_RAS_CMD_READ_ALL commands.
+	 */
+	DRM_RAS_ATTR_QUERY_REPLY, /*NLA_NESTED*/
+	/** @DRM_RAS_ATTR_ERROR_NAME: Used to pass error name */
+	DRM_RAS_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
+	/** @DRM_RAS_ATTR_ERROR_ID: Used to pass error id */
+	DRM_RAS_ATTR_ERROR_ID, /* NLA_U64 */
+	/** @DRM_RAS_ATTR_ERROR_VALUE: Used to pass error value */
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

