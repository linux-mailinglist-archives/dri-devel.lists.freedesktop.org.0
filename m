Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED68D3C299A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C913E6EA62;
	Fri,  9 Jul 2021 19:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6036EA62
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a13so13543826wrf.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HC3uZ/xCD4mCXwrSpW0A6Uy0b/o4faXsI0P7Ey8sdRo=;
 b=Tm0DMcFeSZ1rrp40F1HZXC/7MwGoWHYym+E+mOAYbQDolOGmXeKqeKUwYh9fGtkPFu
 eEED9B9km8kbV9VFDxPlMtgbKJoRfdPaS4HyoIJRDbrQJm/BrX8Qve1apNDcNkXIOg0V
 +aB1ObsZbgIrg1UG/GkuZ/ZBi1DwhPNXBCrMcKZLaHeFKPuIp97QiM5eVyd3KXdi8j/b
 ooiCfQ6FT2uSPHlNzqvxU/myTh/4e+Pom8VoSo/+KjX7aDxHdLP7VIDlKGUq+c/oKkcK
 Pt9YOZi4LZEBh55pvi666DE2GB/Y+ar/JR5vT7dICPdvjVKKQcoAhFpU5VGWtIMFuIOM
 Cahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HC3uZ/xCD4mCXwrSpW0A6Uy0b/o4faXsI0P7Ey8sdRo=;
 b=ZZgBKl444wqVj4urGJTDf5+vXntCdGL+y3cXOlfU74iOt70uQ7BMl0Uwyi+jfngcGm
 8ZLA84J1gxxGh81Apgfo8VEAMu1o4g4F1LHZEgo42/t+3z9O+IHLyelglQErHRiCr+x4
 HrUmcdWzUQ8lCrBJOhUAkmPsPd+vOeJzmSPkh6Qw8hCOBjXiyfkZXvmtprnaxa//tdX2
 4CS0qp6OKZ+0xy/nrldVJ2j9KqrZuKmktCu2/w2kl/M3s0L2SgHJMZyR2ykYV4rTbMGx
 72Op21rLy8/2D4ikuDYrv3b1oMmqDegm5h3B1akuH45h+qkPA4JPKkkRUDSNC5fQSE1o
 uJPA==
X-Gm-Message-State: AOAM5316TPO58HT1jX5uwUAL01Q5JqZCiUuThXTIYGQJDms1vP39PpRR
 UNEYSvpNIXmmc8VLMjSRBVM=
X-Google-Smtp-Source: ABdhPJxIGDdtCachg9fY0Rgh43/bW9N0VPL6OoetPtqvrJwDxJZvI1dNytEKWP5/LKwYARHiMmmD3A==
X-Received: by 2002:a5d:6b8d:: with SMTP id n13mr13516326wrx.258.1625858958746; 
 Fri, 09 Jul 2021 12:29:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f14sm12661030wmq.10.2021.07.09.12.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 01/14] gpu: host1x: Add DMA fence implementation
Date: Fri,  9 Jul 2021 21:31:33 +0200
Message-Id: <20210709193146.2859516-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add an implementation of dma_fences based on syncpoints. Syncpoint
interrupts are used to signal fences. Additionally, after
software signaling has been enabled, a 30 second timeout is started.
If the syncpoint threshold is not reached within this period,
the fence is signalled with an -ETIMEDOUT error code. This is to
allow fences that would never reach their syncpoint threshold to
be cleaned up. The timeout can potentially be removed in the future
after job tracking code has been refactored.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/Makefile |   1 +
 drivers/gpu/host1x/fence.c  | 209 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/fence.h  |  13 +++
 drivers/gpu/host1x/intr.c   |   9 ++
 drivers/gpu/host1x/intr.h   |   2 +
 include/linux/host1x.h      |   3 +
 6 files changed, 237 insertions(+)
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 096017b8789d..d2b6f7de0498 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -9,6 +9,7 @@ host1x-y = \
 	job.o \
 	debug.o \
 	mipi.o \
+	fence.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
 	hw/host1x04.o \
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
new file mode 100644
index 000000000000..06c6b86237bd
--- /dev/null
+++ b/drivers/gpu/host1x/fence.c
@@ -0,0 +1,209 @@
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
+static const char *host1x_syncpt_fence_get_driver_name(struct dma_fence *f)
+{
+	return "host1x";
+}
+
+static const char *host1x_syncpt_fence_get_timeline_name(struct dma_fence *f)
+{
+	return "syncpoint";
+}
+
+static struct host1x_syncpt_fence *to_host1x_fence(struct dma_fence *f)
+{
+	return container_of(f, struct host1x_syncpt_fence, base);
+}
+
+static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
+{
+	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
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
+static void host1x_syncpt_fence_release(struct dma_fence *f)
+{
+	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
+
+	kfree(sf->waiter);
+	dma_fence_free(f);
+}
+
+const struct dma_fence_ops host1x_syncpt_fence_ops = {
+	.get_driver_name = host1x_syncpt_fence_get_driver_name,
+	.get_timeline_name = host1x_syncpt_fence_get_timeline_name,
+	.enable_signaling = host1x_syncpt_fence_enable_signaling,
+	.release = host1x_syncpt_fence_release,
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
+	host1x_intr_put_ref(f->sp->host, f->sp->id, f->waiter_ref, false);
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
+	host1x_intr_put_ref(f->sp->host, f->sp->id, f->waiter_ref, true);
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
+	dma_fence_init(&fence->base, &host1x_syncpt_fence_ops, &lock,
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
+	if (fence->ops != &host1x_syncpt_fence_ops)
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
index 6d1f3c0fdbe7..45b6be927ec4 100644
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
index 6ea55e615e3a..e4c346099273 100644
--- a/drivers/gpu/host1x/intr.h
+++ b/drivers/gpu/host1x/intr.h
@@ -33,6 +33,8 @@ enum host1x_intr_action {
 	 */
 	HOST1X_INTR_ACTION_WAKEUP_INTERRUPTIBLE,
 
+	HOST1X_INTR_ACTION_SIGNAL_FENCE,
+
 	HOST1X_INTR_ACTION_COUNT
 };
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9b0487c88571..59e4a3bea0b0 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -170,6 +170,9 @@ u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
 void host1x_syncpt_release_vblank_reservation(struct host1x_client *client,
 					      u32 syncpt_id);
 
+struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold);
+int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32 *threshold);
+
 /*
  * host1x channel
  */
-- 
2.32.0

