Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43DB3A29CC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442E96ECDE;
	Thu, 10 Jun 2021 11:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FC66ECDE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=quIYRmui7ztG6rSp+DGE09yB0cTXb5OQ2XWzck8e6To=; b=NQ4AmEksd55cTei1H/etKS+442
 +rRrSb5L7G/z96kh1gvCgKCCYQUFacrfy3SMHbRrSR05z1I6KZxSDyZXyEAOD+86SWU3MqJ7zQ5sa
 i3LbYcpetxjmD1US+arJ/7bs1D2Ix8HnIFjAwyrFwwRcWwj5cqMw6Rf36YT6z4qTV/eXJu0JudOH8
 K11GxGTKxP3dY3ULRv528hg+2SzX9pACR7JV6wM+t+K5WshJ03WOmLPSq2QIZdm9uJCyYOqJcNbai
 tI0qIJ6gKvFdU1hrSzx8BdTEgkD6HApexX3ahQJrRJZdJpM0A7EpFGU8+dtsyqSZSe+8zlThQ54lI
 /shMXmGw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lrIUs-0001s7-N8; Thu, 10 Jun 2021 14:05:14 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v7 01/15] gpu: host1x: Add DMA fence implementation
Date: Thu, 10 Jun 2021 14:04:42 +0300
Message-Id: <20210610110456.3692391-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an implementation of dma_fences based on syncpoints. Syncpoint
interrupts are used to signal fences. Additionally, after
software signaling has been enabled, a 30 second timeout is started.
If the syncpoint threshold is not reached within this period,
the fence is signalled with an -ETIMEDOUT error code. This is to
allow fences that would never reach their syncpoint threshold to
be cleaned up. The timeout can potentially be removed in the future
after job tracking code has been refactored.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v7:
* Remove unused fence_create_fd function
v6:
* Removed userspace interface.
* Add host1x_ prefixes in various places.
v5:
* Update for change in put_ref prototype.
v4:
* Fix _signal prototype and include it to avoid warning
* Remove use of unused local in error path
v3:
* Move declaration of host1x_fence_extract to public header
---
 drivers/gpu/host1x/Makefile |   1 +
 drivers/gpu/host1x/fence.c  | 184 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/fence.h  |  13 +++
 drivers/gpu/host1x/intr.c   |   9 ++
 drivers/gpu/host1x/intr.h   |   2 +
 include/linux/host1x.h      |   3 +
 6 files changed, 212 insertions(+)
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
index 000000000000..2b0bb97f053f
--- /dev/null
+++ b/drivers/gpu/host1x/fence.c
@@ -0,0 +1,184 @@
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
+	if (sf->waiter)
+		kfree(sf->waiter);
+
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
2.30.1

