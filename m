Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071A25E70B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 12:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6726ED41;
	Sat,  5 Sep 2020 10:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9D06ED3E
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hpZRxbQbU4UZPUFLy0f8wBeus4l9994rDf201H0TeU0=; b=tsgESgwxBCI1v0+Djr+UhcHFr1
 +ATuRmHicisQJhrWZ5fqiDPUhF49rlVbmbJOUJS33k0THiXJZEy4iZ7RMhGuX0RC8pfuDFdS550CS
 C7MpLmD8vWmwPD5GqPL9zoXBi/uMkPLBUZZoMiV7ZTLXGdzdVfSAX9u5DjlH3t++BsIqxpQspP6pq
 kkwLsWyUzc4KHzx3AGROo94aAkoSjWIet8Kn1PJjXCe2blv2lb2DRn6mv/PiZJz2UQXKbiuydL9k6
 eixfxm7RzxgAPvW8iCDgfZnwrc80ISqw4YLve2sKT6dBxWIaOrbY/UIbHmH/OJsww521jIg7JrgpA
 J/jndxvg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kEVXx-0003SS-GX; Sat, 05 Sep 2020 13:35:49 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH v2 08/17] gpu: host1x: Implement /dev/host1x device node
Date: Sat,  5 Sep 2020 13:34:11 +0300
Message-Id: <20200905103420.3021852-9-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the /dev/host1x device node, implementing the following
functionality:

- Reading syncpoint values
- Allocating syncpoints (providing syncpoint FDs)
- Incrementing syncpoints (based on syncpoint FD)

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/Makefile |   1 +
 drivers/gpu/host1x/dev.c    |   9 ++
 drivers/gpu/host1x/dev.h    |   3 +
 drivers/gpu/host1x/uapi.c   | 275 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/uapi.h   |  22 +++
 include/linux/host1x.h      |   2 +
 6 files changed, 312 insertions(+)
 create mode 100644 drivers/gpu/host1x/uapi.c
 create mode 100644 drivers/gpu/host1x/uapi.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 096017b8789d..882f928d75e1 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -9,6 +9,7 @@ host1x-y = \
 	job.o \
 	debug.o \
 	mipi.o \
+	uapi.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
 	hw/host1x04.o \
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d0ebb70e2fdd..641317d23828 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -461,6 +461,12 @@ static int host1x_probe(struct platform_device *pdev)
 		goto deinit_syncpt;
 	}
 
+	err = host1x_uapi_init(&host->uapi, host);
+	if (err) {
+		dev_err(&pdev->dev, "failed to initialize uapi\n");
+		goto deinit_intr;
+	}
+
 	host1x_debug_init(host);
 
 	if (host->info->has_hypervisor)
@@ -480,6 +486,8 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_unregister(host);
 deinit_debugfs:
 	host1x_debug_deinit(host);
+	host1x_uapi_deinit(&host->uapi);
+deinit_intr:
 	host1x_intr_deinit(host);
 deinit_syncpt:
 	host1x_syncpt_deinit(host);
@@ -501,6 +509,7 @@ static int host1x_remove(struct platform_device *pdev)
 
 	host1x_unregister(host);
 	host1x_debug_deinit(host);
+	host1x_uapi_deinit(&host->uapi);
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
 	reset_control_assert(host->rst);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 63010ae37a97..7b8b7e20e32b 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -17,6 +17,7 @@
 #include "intr.h"
 #include "job.h"
 #include "syncpt.h"
+#include "uapi.h"
 
 struct host1x_syncpt;
 struct host1x_syncpt_base;
@@ -143,6 +144,8 @@ struct host1x {
 	struct list_head list;
 
 	struct device_dma_parameters dma_parms;
+
+	struct host1x_uapi uapi;
 };
 
 void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
diff --git a/drivers/gpu/host1x/uapi.c b/drivers/gpu/host1x/uapi.c
new file mode 100644
index 000000000000..bc10e5fc0813
--- /dev/null
+++ b/drivers/gpu/host1x/uapi.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * /dev/host1x syncpoint interface
+ *
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/cdev.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/host1x.h>
+#include <linux/nospec.h>
+
+#include "dev.h"
+#include "syncpt.h"
+#include "uapi.h"
+
+#include <uapi/linux/host1x.h>
+
+static int syncpt_file_release(struct inode *inode, struct file *file)
+{
+	struct host1x_syncpt *sp = file->private_data;
+
+	host1x_syncpt_put(sp);
+
+	return 0;
+}
+
+static int syncpt_file_ioctl_info(struct host1x_syncpt *sp, void __user *data)
+{
+	struct host1x_syncpoint_info args;
+	unsigned long copy_err;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	if (args.reserved[0] || args.reserved[1] || args.reserved[2])
+		return -EINVAL;
+
+	args.id = sp->id;
+
+	copy_err = copy_to_user(data, &args, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	return 0;
+}
+
+static int syncpt_file_ioctl_incr(struct host1x_syncpt *sp, void __user *data)
+{
+	struct host1x_syncpoint_increment args;
+	unsigned long copy_err;
+	u32 i;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	for (i = 0; i < args.count; i++) {
+		host1x_syncpt_incr(sp);
+		if (signal_pending(current))
+			return -EINTR;
+	}
+
+	return 0;
+}
+
+static long syncpt_file_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	void __user *data = (void __user *)arg;
+	long err;
+
+	switch (cmd) {
+	case HOST1X_IOCTL_SYNCPOINT_INFO:
+		err = syncpt_file_ioctl_info(file->private_data, data);
+		break;
+
+	case HOST1X_IOCTL_SYNCPOINT_INCREMENT:
+		err = syncpt_file_ioctl_incr(file->private_data, data);
+		break;
+
+	default:
+		err = -ENOTTY;
+	}
+
+	return err;
+}
+
+static const struct file_operations syncpt_file_fops = {
+	.owner = THIS_MODULE,
+	.release = syncpt_file_release,
+	.unlocked_ioctl = syncpt_file_ioctl,
+	.compat_ioctl = syncpt_file_ioctl,
+};
+
+struct host1x_syncpt *host1x_syncpt_fd_get(int fd)
+{
+	struct host1x_syncpt *sp;
+	struct file *file = fget(fd);
+
+	if (!file)
+		return ERR_PTR(-EINVAL);
+
+	if (file->f_op != &syncpt_file_fops) {
+		fput(file);
+		return ERR_PTR(-EINVAL);
+	}
+
+	sp = file->private_data;
+
+	host1x_syncpt_get(sp);
+
+	fput(file);
+
+	return sp;
+}
+EXPORT_SYMBOL(host1x_syncpt_fd_get);
+
+static int dev_file_open(struct inode *inode, struct file *file)
+{
+	struct host1x_uapi *uapi =
+		container_of(inode->i_cdev, struct host1x_uapi, cdev);
+
+	file->private_data = container_of(uapi, struct host1x, uapi);
+
+	return 0;
+}
+
+static int dev_file_ioctl_read_syncpoint(struct host1x *host1x,
+					 void __user *data)
+{
+	struct host1x_read_syncpoint args;
+	unsigned long copy_err;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	if (args.id >= host1x_syncpt_nb_pts(host1x))
+		return -EINVAL;
+
+	args.id = array_index_nospec(args.id, host1x_syncpt_nb_pts(host1x));
+	args.value = host1x_syncpt_read(&host1x->syncpt[args.id]);
+
+	copy_err = copy_to_user(data, &args, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	return 0;
+}
+
+static int dev_file_ioctl_alloc_syncpoint(struct host1x *host1x,
+					  void __user *data)
+{
+	struct host1x_allocate_syncpoint args;
+	struct host1x_syncpt *sp;
+	unsigned long copy_err;
+	int err;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	if (args.reserved[0] || args.reserved[1] || args.reserved[2])
+		return -EINVAL;
+
+	sp = host1x_syncpt_alloc(host1x, NULL, HOST1X_SYNCPT_CLIENT_MANAGED);
+	if (!sp)
+		return -EBUSY;
+
+	err = anon_inode_getfd("host1x_syncpt", &syncpt_file_fops, sp,
+			       O_CLOEXEC);
+	if (err < 0)
+		goto free_syncpt;
+
+	args.fd = err;
+
+	copy_err = copy_to_user(data, &args, sizeof(args));
+	if (copy_err) {
+		err = -EFAULT;
+		goto put_fd;
+	}
+
+	return 0;
+
+put_fd:
+	put_unused_fd(args.fd);
+free_syncpt:
+	host1x_syncpt_put(sp);
+
+	return err;
+}
+
+static long dev_file_ioctl(struct file *file, unsigned int cmd,
+			   unsigned long arg)
+{
+	void __user *data = (void __user *)arg;
+	long err;
+
+	switch (cmd) {
+	case HOST1X_IOCTL_READ_SYNCPOINT:
+		err = dev_file_ioctl_read_syncpoint(file->private_data, data);
+		break;
+
+	case HOST1X_IOCTL_ALLOCATE_SYNCPOINT:
+		err = dev_file_ioctl_alloc_syncpoint(file->private_data, data);
+		break;
+
+	default:
+		err = -ENOTTY;
+	}
+
+	return err;
+}
+
+static const struct file_operations dev_file_fops = {
+	.owner = THIS_MODULE,
+	.open = dev_file_open,
+	.unlocked_ioctl = dev_file_ioctl,
+	.compat_ioctl = dev_file_ioctl,
+};
+
+int host1x_uapi_init(struct host1x_uapi *uapi, struct host1x *host1x)
+{
+	int err;
+	dev_t dev_num;
+
+	err = alloc_chrdev_region(&dev_num, 0, 1, "host1x");
+	if (err)
+		return err;
+
+	uapi->class = class_create(THIS_MODULE, "host1x");
+	if (IS_ERR(uapi->class)) {
+		err = PTR_ERR(uapi->class);
+		goto unregister_chrdev_region;
+	}
+
+	cdev_init(&uapi->cdev, &dev_file_fops);
+	err = cdev_add(&uapi->cdev, dev_num, 1);
+	if (err)
+		goto destroy_class;
+
+	uapi->dev = device_create(uapi->class, host1x->dev,
+				  dev_num, NULL, "host1x");
+	if (IS_ERR(uapi->dev)) {
+		err = PTR_ERR(uapi->dev);
+		goto del_cdev;
+	}
+
+	cdev_add(&uapi->cdev, dev_num, 1);
+
+	uapi->dev_num = dev_num;
+
+	return 0;
+
+del_cdev:
+	cdev_del(&uapi->cdev);
+destroy_class:
+	class_destroy(uapi->class);
+unregister_chrdev_region:
+	unregister_chrdev_region(dev_num, 1);
+
+	return err;
+}
+
+void host1x_uapi_deinit(struct host1x_uapi *uapi)
+{
+	device_destroy(uapi->class, uapi->dev_num);
+	cdev_del(&uapi->cdev);
+	class_destroy(uapi->class);
+	unregister_chrdev_region(uapi->dev_num, 1);
+}
diff --git a/drivers/gpu/host1x/uapi.h b/drivers/gpu/host1x/uapi.h
new file mode 100644
index 000000000000..7beb5e44c1b1
--- /dev/null
+++ b/drivers/gpu/host1x/uapi.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#ifndef HOST1X_UAPI_H
+#define HOST1X_UAPI_H
+
+#include <linux/cdev.h>
+
+struct host1x_uapi {
+	struct class *class;
+
+	struct cdev cdev;
+	struct device *dev;
+	dev_t dev_num;
+};
+
+int host1x_uapi_init(struct host1x_uapi *uapi, struct host1x *host1x);
+void host1x_uapi_deinit(struct host1x_uapi *uapi);
+
+#endif
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index da87ceb33c2d..b970e1bbc29d 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -160,6 +160,8 @@ void host1x_syncpt_put(struct host1x_syncpt *sp);
 struct host1x_syncpt_base *host1x_syncpt_get_base(struct host1x_syncpt *sp);
 u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
 
+struct host1x_syncpt *host1x_syncpt_fd_get(int fd);
+
 /*
  * host1x channel
  */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
