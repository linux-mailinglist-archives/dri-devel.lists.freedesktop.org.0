Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF02BA905
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B3C6E8B8;
	Fri, 20 Nov 2020 11:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086756E8AC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cokdvMihJkuDSU0p90rUvSOE2j6zLc/cBaWABNbhCE0=; b=qvxCy82gnswtnz6ihBhFW9ncRG
 ZFe0YfTy4nFyfrzPmKPppzJee71SNZMFuNuYH4dkBx6IOWH4W0Px1egxaEUdMGl+JfFrw3HUflL+u
 SUDD6bk/wBCTEr4rRRoR1Aj2j2nmZ5BxZh7piuCMMXAxUyEOmpaI+GFnuW7To0YGCxb0k0CxVAZTk
 Ov8xpd2bbAkIDM+ZXPfVHjLg1JXztRPlBIVyI5yNw3Ip3wvAJXMPDeKp+Wd6Wi8xn+wsMk1ii6mkH
 4IIrSe9Cpk4GsYh5uNnRFfKm8lQXNaLMlaWeIrgmslOggXQo4SjIen5MrjwTVNL/mX+JrbWm5cJZF
 wZqWFqcw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kg4Yr-0003lG-12; Fri, 20 Nov 2020 13:26:41 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v4 09/21] gpu: host1x: DMA fences and userspace fence creation
Date: Fri, 20 Nov 2020 13:25:48 +0200
Message-Id: <20201120112600.935082-10-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
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

Add an implementation of dma_fences based on syncpoints. Syncpoint
interrupts are used to signal fences. Additionally, after
software signaling has been enabled, a 30 second timeout is started.
If the syncpoint threshold is not reached within this period,
the fence is signalled with an -ETIMEDOUT error code. This is to
allow fences that would never reach their syncpoint threshold to
be cleaned up.

Additionally, add a new /dev/host1x IOCTL for creating sync_file
file descriptors backed by syncpoint fences.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v4:
* Fix _signal prototype and include it to avoid warning
* Remove use of unused local in error path
v3:
* Move declaration of host1x_fence_extract to public header
---
 drivers/gpu/host1x/Makefile |   1 +
 drivers/gpu/host1x/fence.c  | 208 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/fence.h  |  13 +++
 drivers/gpu/host1x/intr.c   |   9 ++
 drivers/gpu/host1x/intr.h   |   2 +
 drivers/gpu/host1x/uapi.c   | 103 ++++++++++++++++++
 include/linux/host1x.h      |   4 +
 7 files changed, 340 insertions(+)
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 882f928d75e1..a48af2cefae1 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -10,6 +10,7 @@ host1x-y = \
 	debug.o \
 	mipi.o \
 	uapi.o \
+	fence.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
 	hw/host1x04.o \
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
new file mode 100644
index 000000000000..b2484606c311
--- /dev/null
+++ b/drivers/gpu/host1x/fence.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Syncpoint dma_fence implementation
+ *
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#include <linux/dma-fence.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/sync_file.h>
+
+#include "fence.h"
+#include "intr.h"
+#include "syncpt.h"
+
+DEFINE_SPINLOCK(lock);
+
+struct host1x_syncpt_fence {
+	struct dma_fence base;
+
+	atomic_t signaling;
+
+	struct host1x_syncpt *sp;
+	u32 threshold;
+
+	struct host1x_waitlist *waiter;
+	void *waiter_ref;
+
+	struct delayed_work timeout_work;
+};
+
+static const char *syncpt_fence_get_driver_name(struct dma_fence *f)
+{
+	return "host1x";
+}
+
+static const char *syncpt_fence_get_timeline_name(struct dma_fence *f)
+{
+	return "syncpoint";
+}
+
+static bool syncpt_fence_enable_signaling(struct dma_fence *f)
+{
+	struct host1x_syncpt_fence *sf =
+		container_of(f, struct host1x_syncpt_fence, base);
+	int err;
+
+	if (host1x_syncpt_is_expired(sf->sp, sf->threshold))
+		return false;
+
+	dma_fence_get(f);
+
+	/*
+	 * The dma_fence framework requires the fence driver to keep a
+	 * reference to any fences for which 'enable_signaling' has been
+	 * called (and that have not been signalled).
+	 * 
+	 * We provide a userspace API to create arbitrary syncpoint fences,
+	 * so we cannot normally guarantee that all fences get signalled.
+	 * As such, setup a timeout, so that long-lasting fences will get
+	 * reaped eventually.
+	 */
+	schedule_delayed_work(&sf->timeout_work, msecs_to_jiffies(30000));
+
+	err = host1x_intr_add_action(sf->sp->host, sf->sp, sf->threshold,
+				     HOST1X_INTR_ACTION_SIGNAL_FENCE, f,
+				     sf->waiter, &sf->waiter_ref);
+	if (err) {
+		cancel_delayed_work_sync(&sf->timeout_work);
+		dma_fence_put(f);
+		return false;
+	}
+
+	/* intr framework takes ownership of waiter */
+	sf->waiter = NULL;
+
+	/*
+	 * The fence may get signalled at any time after the above call,
+	 * so we need to initialize all state used by signalling
+	 * before it.
+	 */
+
+	return true;
+}
+
+static void syncpt_fence_release(struct dma_fence *f)
+{
+	struct host1x_syncpt_fence *sf =
+		container_of(f, struct host1x_syncpt_fence, base);
+
+	if (sf->waiter)
+		kfree(sf->waiter);
+
+	dma_fence_free(f);
+}
+
+const struct dma_fence_ops syncpt_fence_ops = {
+	.get_driver_name = syncpt_fence_get_driver_name,
+	.get_timeline_name = syncpt_fence_get_timeline_name,
+	.enable_signaling = syncpt_fence_enable_signaling,
+	.release = syncpt_fence_release,
+};
+
+void host1x_fence_signal(struct host1x_syncpt_fence *f)
+{
+	if (atomic_xchg(&f->signaling, 1))
+		return;
+
+	/*
+	 * Cancel pending timeout work - if it races, it will
+	 * not get 'f->signaling' and return.
+	 */
+	cancel_delayed_work_sync(&f->timeout_work);
+
+	host1x_intr_put_ref(f->sp->host, f->sp->id, f->waiter_ref);
+
+	dma_fence_signal(&f->base);
+	dma_fence_put(&f->base);
+}
+
+static void do_fence_timeout(struct work_struct *work)
+{
+	struct delayed_work *dwork = (struct delayed_work *)work;
+	struct host1x_syncpt_fence *f =
+		container_of(dwork, struct host1x_syncpt_fence, timeout_work);
+
+	if (atomic_xchg(&f->signaling, 1))
+		return;
+
+	/*
+	 * Cancel pending timeout work - if it races, it will
+	 * not get 'f->signaling' and return.
+	 */
+	host1x_intr_put_ref(f->sp->host, f->sp->id, f->waiter_ref);
+
+	dma_fence_set_error(&f->base, -ETIMEDOUT);
+	dma_fence_signal(&f->base);
+	dma_fence_put(&f->base);
+}
+
+struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold)
+{
+	struct host1x_syncpt_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	fence->waiter = kzalloc(sizeof(*fence->waiter), GFP_KERNEL);
+	if (!fence->waiter)
+		return ERR_PTR(-ENOMEM);
+
+	fence->sp = sp;
+	fence->threshold = threshold;
+
+	dma_fence_init(&fence->base, &syncpt_fence_ops, &lock,
+		       dma_fence_context_alloc(1), 0);
+
+	INIT_DELAYED_WORK(&fence->timeout_work, do_fence_timeout);
+
+	return &fence->base;
+}
+EXPORT_SYMBOL(host1x_fence_create);
+
+int host1x_fence_create_fd(struct host1x_syncpt *sp, u32 threshold)
+{
+	struct sync_file *file;
+	struct dma_fence *f;
+	int fd;
+
+	f = host1x_fence_create(sp, threshold);
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		dma_fence_put(f);
+		return fd;
+	}
+
+	file = sync_file_create(f);
+	dma_fence_put(f);
+	if (!file)
+		return -ENOMEM;
+
+	fd_install(fd, file->file);
+
+	return fd;
+}
+EXPORT_SYMBOL(host1x_fence_create_fd);
+
+int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32 *threshold)
+{
+	struct host1x_syncpt_fence *f;
+
+	if (fence->ops != &syncpt_fence_ops)
+		return -EINVAL;
+
+	f = container_of(fence, struct host1x_syncpt_fence, base);
+
+	*id = f->sp->id;
+	*threshold = f->threshold;
+
+	return 0;
+}
+EXPORT_SYMBOL(host1x_fence_extract);
diff --git a/drivers/gpu/host1x/fence.h b/drivers/gpu/host1x/fence.h
new file mode 100644
index 000000000000..70c91de82f14
--- /dev/null
+++ b/drivers/gpu/host1x/fence.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#ifndef HOST1X_FENCE_H
+#define HOST1X_FENCE_H
+
+struct host1x_syncpt_fence;
+
+void host1x_fence_signal(struct host1x_syncpt_fence *fence);
+
+#endif
diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 5d328d20ce6d..19b59c5c94d0 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -13,6 +13,7 @@
 #include <trace/events/host1x.h>
 #include "channel.h"
 #include "dev.h"
+#include "fence.h"
 #include "intr.h"
 
 /* Wait list management */
@@ -121,12 +122,20 @@ static void action_wakeup_interruptible(struct host1x_waitlist *waiter)
 	wake_up_interruptible(wq);
 }
 
+static void action_signal_fence(struct host1x_waitlist *waiter)
+{
+	struct host1x_syncpt_fence *f = waiter->data;
+
+	host1x_fence_signal(f);
+}
+
 typedef void (*action_handler)(struct host1x_waitlist *waiter);
 
 static const action_handler action_handlers[HOST1X_INTR_ACTION_COUNT] = {
 	action_submit_complete,
 	action_wakeup,
 	action_wakeup_interruptible,
+	action_signal_fence,
 };
 
 static void run_handlers(struct list_head completed[HOST1X_INTR_ACTION_COUNT])
diff --git a/drivers/gpu/host1x/intr.h b/drivers/gpu/host1x/intr.h
index aac38194398f..dedbd0f700fb 100644
--- a/drivers/gpu/host1x/intr.h
+++ b/drivers/gpu/host1x/intr.h
@@ -33,6 +33,8 @@ enum host1x_intr_action {
 	 */
 	HOST1X_INTR_ACTION_WAKEUP_INTERRUPTIBLE,
 
+	HOST1X_INTR_ACTION_SIGNAL_FENCE,
+
 	HOST1X_INTR_ACTION_COUNT
 };
 
diff --git a/drivers/gpu/host1x/uapi.c b/drivers/gpu/host1x/uapi.c
index 27b8761c3f35..e931756a5e16 100644
--- a/drivers/gpu/host1x/uapi.c
+++ b/drivers/gpu/host1x/uapi.c
@@ -11,8 +11,10 @@
 #include <linux/fs.h>
 #include <linux/host1x.h>
 #include <linux/nospec.h>
+#include <linux/sync_file.h>
 
 #include "dev.h"
+#include "fence.h"
 #include "syncpt.h"
 #include "uapi.h"
 
@@ -195,6 +197,99 @@ static int dev_file_ioctl_alloc_syncpoint(struct host1x *host1x,
 	return err;
 }
 
+static int dev_file_ioctl_create_fence(struct host1x *host1x, void __user *data)
+{
+	struct host1x_create_fence args;
+	unsigned long copy_err;
+	int fd;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	if (args.reserved[0])
+		return -EINVAL;
+
+	if (args.id >= host1x_syncpt_nb_pts(host1x))
+		return -EINVAL;
+
+	args.id = array_index_nospec(args.id, host1x_syncpt_nb_pts(host1x));
+
+	fd = host1x_fence_create_fd(&host1x->syncpt[args.id], args.threshold);
+	if (fd < 0)
+		return fd;
+
+	args.fence_fd = fd;
+
+	copy_err = copy_to_user(data, &args, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	return 0;
+}
+
+static int dev_file_ioctl_fence_extract(struct host1x *host1x, void __user *data)
+{
+	struct host1x_fence_extract_fence __user *fences_user_ptr;
+	struct dma_fence *fence, **fences;
+	struct host1x_fence_extract args;
+	struct dma_fence_array *array;
+	unsigned int num_fences, i;
+	unsigned long copy_err;
+	int err;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	fences_user_ptr = u64_to_user_ptr(args.fences_ptr);
+
+	if (args.reserved[0] || args.reserved[1])
+		return -EINVAL;
+
+	fence = sync_file_get_fence(args.fence_fd);
+	if (!fence)
+		return -EINVAL;
+
+	array = to_dma_fence_array(fence);
+	if (array) {
+		fences = array->fences;
+		num_fences = array->num_fences;
+	} else {
+		fences = &fence;
+		num_fences = 1;
+	}
+
+	for (i = 0; i < min(num_fences, args.num_fences); i++) {
+		struct host1x_fence_extract_fence f;
+
+		err = host1x_fence_extract(fences[i], &f.id, &f.threshold);
+		if (err)
+			goto put_fence;
+
+		copy_err = copy_to_user(fences_user_ptr + i, &f, sizeof(f));
+		if (copy_err) {
+			err = -EFAULT;
+			goto put_fence;
+		}
+	}
+
+	args.num_fences = i+1;
+
+	copy_err = copy_to_user(data, &args, sizeof(args));
+	if (copy_err) {
+		err = -EFAULT;
+		goto put_fence;
+	}
+
+	return 0;
+
+put_fence:
+	dma_fence_put(fence);
+
+	return err;
+}
+
 static long dev_file_ioctl(struct file *file, unsigned int cmd,
 			   unsigned long arg)
 {
@@ -210,6 +305,14 @@ static long dev_file_ioctl(struct file *file, unsigned int cmd,
 		err = dev_file_ioctl_alloc_syncpoint(file->private_data, data);
 		break;
 
+	case HOST1X_IOCTL_CREATE_FENCE:
+		err = dev_file_ioctl_create_fence(file->private_data, data);
+		break;
+
+	case HOST1X_IOCTL_FENCE_EXTRACT:
+		err = dev_file_ioctl_fence_extract(file->private_data, data);
+		break;
+
 	default:
 		err = -ENOTTY;
 	}
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 8f6d61e13e05..bcfb1cc9a1c1 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -165,6 +165,10 @@ u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
 
 struct host1x_syncpt *host1x_syncpt_fd_get(int fd);
 
+struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold);
+int host1x_fence_create_fd(struct host1x_syncpt *sp, u32 threshold);
+int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32 *threshold);
+
 /*
  * host1x channel
  */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
