Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F3673991
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D18210E923;
	Thu, 19 Jan 2023 13:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261010E924
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZnC1ql9ot76j997v/IKUEMj0kO5bAhz7bOeizc9L4wU=; b=aNPH+AiRaNL5zTzcCAHkZaP4Ga
 PxTuBUo/pYRwFCY7ezScVs5qil72N5gZZqdcRRyzFDSzV8a8nbpq4ap8lo3vkoCk/I1A+NaG7xl95
 mWmZUACmM+wzjgXYlmQDbX23DQp1R2N+/B1BKyUXykFJFFkbMnn96dXjmugwAunludKz2pZK6iBjh
 /pAliwWfArkuc26CyVX0viqglJjBFrxSvQRlKmOyJ14hsQvZrXA4lT4HbswFWn0e5vc+MFy4lqIQX
 qFrC5f2YS3WFul0ndJOctUGbXxf6hHNyhf6tQf5nVA1GVmS44g1K+uR1l7D0C1q5abiRRG1MguIJ9
 wD5H1I9Q==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1pIUff-000zLh-9z; Thu, 19 Jan 2023 15:09:35 +0200
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/4] gpu: host1x: Rewrite syncpoint interrupt handling
Date: Thu, 19 Jan 2023 15:09:20 +0200
Message-Id: <20230119130921.1882602-3-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119130921.1882602-1-cyndis@kapsi.fi>
References: <20230119130921.1882602-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Move from the old, complex intr handling code to a new implementation
based on dma_fences. While there is a fair bit of churn to get there,
the new implementation is much simpler and likely faster as well due
to allowing signaling directly from interrupt context.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/debug.c      |   7 +-
 drivers/gpu/host1x/dev.c        |   4 +-
 drivers/gpu/host1x/dev.h        |  10 +-
 drivers/gpu/host1x/fence.c      |  96 ++++-----
 drivers/gpu/host1x/fence.h      |  18 +-
 drivers/gpu/host1x/hw/intr_hw.c |  74 ++-----
 drivers/gpu/host1x/intr.c       | 334 ++++++--------------------------
 drivers/gpu/host1x/intr.h       |  83 +-------
 drivers/gpu/host1x/syncpt.h     |   3 +-
 9 files changed, 149 insertions(+), 480 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 6649b04b7131..a18cc8d8caf5 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -77,6 +77,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 
 static void show_syncpts(struct host1x *m, struct output *o, bool show_all)
 {
+	unsigned long irqflags;
 	struct list_head *pos;
 	unsigned int i;
 	int err;
@@ -92,10 +93,10 @@ static void show_syncpts(struct host1x *m, struct output *o, bool show_all)
 		u32 min = host1x_syncpt_load(m->syncpt + i);
 		unsigned int waiters = 0;
 
-		spin_lock(&m->syncpt[i].intr.lock);
-		list_for_each(pos, &m->syncpt[i].intr.wait_head)
+		spin_lock_irqsave(&m->syncpt[i].fences.lock, irqflags);
+		list_for_each(pos, &m->syncpt[i].fences.list)
 			waiters++;
-		spin_unlock(&m->syncpt[i].intr.lock);
+		spin_unlock_irqrestore(&m->syncpt[i].fences.lock, irqflags);
 
 		if (!kref_read(&m->syncpt[i].ref))
 			continue;
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index f31039aca03c..4872d183d860 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -516,7 +516,7 @@ static int host1x_probe(struct platform_device *pdev)
 			return PTR_ERR(host->regs);
 	}
 
-	syncpt_irq = platform_get_irq(pdev, 0);
+	host->syncpt_irq = platform_get_irq(pdev, 0);
 	if (syncpt_irq < 0)
 		return syncpt_irq;
 
@@ -578,7 +578,7 @@ static int host1x_probe(struct platform_device *pdev)
 		goto free_contexts;
 	}
 
-	err = host1x_intr_init(host, syncpt_irq);
+	err = host1x_intr_init(host);
 	if (err) {
 		dev_err(&pdev->dev, "failed to initialize interrupts\n");
 		goto deinit_syncpt;
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 920e5548cfbc..75de50fe03d0 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -74,8 +74,7 @@ struct host1x_syncpt_ops {
 };
 
 struct host1x_intr_ops {
-	int (*init_host_sync)(struct host1x *host, u32 cpm,
-		void (*syncpt_thresh_work)(struct work_struct *work));
+	int (*init_host_sync)(struct host1x *host, u32 cpm);
 	void (*set_syncpt_threshold)(
 		struct host1x *host, unsigned int id, u32 thresh);
 	void (*enable_syncpt_intr)(struct host1x *host, unsigned int id);
@@ -125,6 +124,7 @@ struct host1x {
 	void __iomem *regs;
 	void __iomem *hv_regs; /* hypervisor region */
 	void __iomem *common_regs;
+	int syncpt_irq;
 	struct host1x_syncpt *syncpt;
 	struct host1x_syncpt_base *bases;
 	struct device *dev;
@@ -138,7 +138,6 @@ struct host1x {
 	dma_addr_t iova_end;
 
 	struct mutex intr_mutex;
-	int intr_syncpt_irq;
 
 	const struct host1x_syncpt_ops *syncpt_op;
 	const struct host1x_intr_ops *intr_op;
@@ -216,10 +215,9 @@ static inline void host1x_hw_syncpt_enable_protection(struct host1x *host)
 	return host->syncpt_op->enable_protection(host);
 }
 
-static inline int host1x_hw_intr_init_host_sync(struct host1x *host, u32 cpm,
-			void (*syncpt_thresh_work)(struct work_struct *))
+static inline int host1x_hw_intr_init_host_sync(struct host1x *host, u32 cpm)
 {
-	return host->intr_op->init_host_sync(host, cpm, syncpt_thresh_work);
+	return host->intr_op->init_host_sync(host, cpm);
 }
 
 static inline void host1x_hw_intr_set_syncpt_threshold(struct host1x *host,
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index df428bcbae69..df5b56692d2c 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -15,22 +15,6 @@
 #include "intr.h"
 #include "syncpt.h"
 
-static DEFINE_SPINLOCK(lock);
-
-struct host1x_syncpt_fence {
-	struct dma_fence base;
-
-	atomic_t signaling;
-
-	struct host1x_syncpt *sp;
-	u32 threshold;
-
-	struct host1x_waitlist *waiter;
-	void *waiter_ref;
-
-	struct delayed_work timeout_work;
-};
-
 static const char *host1x_syncpt_fence_get_driver_name(struct dma_fence *f)
 {
 	return "host1x";
@@ -49,11 +33,12 @@ static struct host1x_syncpt_fence *to_host1x_fence(struct dma_fence *f)
 static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 {
 	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
-	int err;
 
 	if (host1x_syncpt_is_expired(sf->sp, sf->threshold))
 		return false;
 
+	/* One reference for interrupt path, one for timeout path. */
+	dma_fence_get(f);
 	dma_fence_get(f);
 
 	/*
@@ -61,24 +46,13 @@ static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 	 * reference to any fences for which 'enable_signaling' has been
 	 * called (and that have not been signalled).
 	 *
-	 * We provide a userspace API to create arbitrary syncpoint fences,
-	 * so we cannot normally guarantee that all fences get signalled.
+	 * We cannot (for now) normally guarantee that all fences get signalled.
 	 * As such, setup a timeout, so that long-lasting fences will get
 	 * reaped eventually.
 	 */
 	schedule_delayed_work(&sf->timeout_work, msecs_to_jiffies(30000));
 
-	err = host1x_intr_add_action(sf->sp->host, sf->sp, sf->threshold,
-				     HOST1X_INTR_ACTION_SIGNAL_FENCE, f,
-				     sf->waiter, &sf->waiter_ref);
-	if (err) {
-		cancel_delayed_work_sync(&sf->timeout_work);
-		dma_fence_put(f);
-		return false;
-	}
-
-	/* intr framework takes ownership of waiter */
-	sf->waiter = NULL;
+	host1x_intr_add_fence_locked(sf->sp->host, sf);
 
 	/*
 	 * The fence may get signalled at any time after the above call,
@@ -89,37 +63,32 @@ static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 	return true;
 }
 
-static void host1x_syncpt_fence_release(struct dma_fence *f)
-{
-	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
-
-	if (sf->waiter)
-		kfree(sf->waiter);
-
-	dma_fence_free(f);
-}
-
 static const struct dma_fence_ops host1x_syncpt_fence_ops = {
 	.get_driver_name = host1x_syncpt_fence_get_driver_name,
 	.get_timeline_name = host1x_syncpt_fence_get_timeline_name,
 	.enable_signaling = host1x_syncpt_fence_enable_signaling,
-	.release = host1x_syncpt_fence_release,
 };
 
 void host1x_fence_signal(struct host1x_syncpt_fence *f)
 {
-	if (atomic_xchg(&f->signaling, 1))
+	if (atomic_xchg(&f->signaling, 1)) {
+		/*
+		 * Already on timeout path, but we removed the fence before
+		 * timeout path could, so drop interrupt path reference.
+		 */
+		dma_fence_put(&f->base);
 		return;
+	}
 
-	/*
-	 * Cancel pending timeout work - if it races, it will
-	 * not get 'f->signaling' and return.
-	 */
-	cancel_delayed_work_sync(&f->timeout_work);
-
-	host1x_intr_put_ref(f->sp->host, f->sp->id, f->waiter_ref, false);
+	if (cancel_delayed_work(&f->timeout_work)) {
+		/*
+		 * We know that the timeout path will not be entered.
+		 * Safe to drop the timeout path's reference now.
+		 */
+		dma_fence_put(&f->base);
+	}
 
-	dma_fence_signal(&f->base);
+	dma_fence_signal_locked(&f->base);
 	dma_fence_put(&f->base);
 }
 
@@ -129,17 +98,24 @@ static void do_fence_timeout(struct work_struct *work)
 	struct host1x_syncpt_fence *f =
 		container_of(dwork, struct host1x_syncpt_fence, timeout_work);
 
-	if (atomic_xchg(&f->signaling, 1))
+	if (atomic_xchg(&f->signaling, 1)) {
+		/* Already on interrupt path, drop timeout path reference. */
+		dma_fence_put(&f->base);
 		return;
+	}
 
-	/*
-	 * Cancel pending timeout work - if it races, it will
-	 * not get 'f->signaling' and return.
-	 */
-	host1x_intr_put_ref(f->sp->host, f->sp->id, f->waiter_ref, true);
+	if (host1x_intr_remove_fence(f->sp->host, f)) {
+		/*
+		 * Managed to remove fence from queue, so it's safe to drop
+		 * the interrupt path's reference.
+		 */
+		dma_fence_put(&f->base);
+	}
 
 	dma_fence_set_error(&f->base, -ETIMEDOUT);
 	dma_fence_signal(&f->base);
+
+	/* Drop timeout path reference. */
 	dma_fence_put(&f->base);
 }
 
@@ -151,16 +127,10 @@ struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold)
 	if (!fence)
 		return ERR_PTR(-ENOMEM);
 
-	fence->waiter = kzalloc(sizeof(*fence->waiter), GFP_KERNEL);
-	if (!fence->waiter) {
-		kfree(fence);
-		return ERR_PTR(-ENOMEM);
-	}
-
 	fence->sp = sp;
 	fence->threshold = threshold;
 
-	dma_fence_init(&fence->base, &host1x_syncpt_fence_ops, &lock,
+	dma_fence_init(&fence->base, &host1x_syncpt_fence_ops, &sp->fences.lock,
 		       dma_fence_context_alloc(1), 0);
 
 	INIT_DELAYED_WORK(&fence->timeout_work, do_fence_timeout);
diff --git a/drivers/gpu/host1x/fence.h b/drivers/gpu/host1x/fence.h
index 70c91de82f14..4352d046f92c 100644
--- a/drivers/gpu/host1x/fence.h
+++ b/drivers/gpu/host1x/fence.h
@@ -6,7 +6,23 @@
 #ifndef HOST1X_FENCE_H
 #define HOST1X_FENCE_H
 
-struct host1x_syncpt_fence;
+struct host1x_syncpt_fence {
+	struct dma_fence base;
+
+	atomic_t signaling;
+
+	struct host1x_syncpt *sp;
+	u32 threshold;
+
+	struct delayed_work timeout_work;
+
+	struct list_head list;
+};
+
+struct host1x_fence_list {
+	spinlock_t lock;
+	struct list_head list;
+};
 
 void host1x_fence_signal(struct host1x_syncpt_fence *fence);
 
diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index 9acccdb139e6..b915ef7d0348 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -13,23 +13,6 @@
 #include "../intr.h"
 #include "../dev.h"
 
-/*
- * Sync point threshold interrupt service function
- * Handles sync point threshold triggers, in interrupt context
- */
-static void host1x_intr_syncpt_handle(struct host1x_syncpt *syncpt)
-{
-	unsigned int id = syncpt->id;
-	struct host1x *host = syncpt->host;
-
-	host1x_sync_writel(host, BIT(id % 32),
-		HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(id / 32));
-	host1x_sync_writel(host, BIT(id % 32),
-		HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(id / 32));
-
-	schedule_work(&syncpt->intr.work);
-}
-
 static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
 {
 	struct host1x *host = dev_id;
@@ -39,17 +22,20 @@ static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
 	for (i = 0; i < DIV_ROUND_UP(host->info->nb_pts, 32); i++) {
 		reg = host1x_sync_readl(host,
 			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
-		for_each_set_bit(id, &reg, 32) {
-			struct host1x_syncpt *syncpt =
-				host->syncpt + (i * 32 + id);
-			host1x_intr_syncpt_handle(syncpt);
-		}
+
+		host1x_sync_writel(host, reg,
+			HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(i));
+		host1x_sync_writel(host, reg,
+			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
+
+		for_each_set_bit(id, &reg, 32)
+			host1x_intr_handle_interrupt(host, i * 32 + id);
 	}
 
 	return IRQ_HANDLED;
 }
 
-static void _host1x_intr_disable_all_syncpt_intrs(struct host1x *host)
+static void host1x_intr_disable_all_syncpt_intrs(struct host1x *host)
 {
 	unsigned int i;
 
@@ -90,45 +76,38 @@ static void intr_hw_init(struct host1x *host, u32 cpm)
 }
 
 static int
-_host1x_intr_init_host_sync(struct host1x *host, u32 cpm,
-			    void (*syncpt_thresh_work)(struct work_struct *))
+host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
 {
-	unsigned int i;
 	int err;
 
 	host1x_hw_intr_disable_all_syncpt_intrs(host);
 
-	for (i = 0; i < host->info->nb_pts; i++)
-		INIT_WORK(&host->syncpt[i].intr.work, syncpt_thresh_work);
-
-	err = devm_request_irq(host->dev, host->intr_syncpt_irq,
+	err = devm_request_irq(host->dev, host->syncpt_irq,
 			       syncpt_thresh_isr, IRQF_SHARED,
 			       "host1x_syncpt", host);
-	if (err < 0) {
-		WARN_ON(1);
+	if (err < 0)
 		return err;
-	}
 
 	intr_hw_init(host, cpm);
 
 	return 0;
 }
 
-static void _host1x_intr_set_syncpt_threshold(struct host1x *host,
+static void host1x_intr_set_syncpt_threshold(struct host1x *host,
 					      unsigned int id,
 					      u32 thresh)
 {
 	host1x_sync_writel(host, thresh, HOST1X_SYNC_SYNCPT_INT_THRESH(id));
 }
 
-static void _host1x_intr_enable_syncpt_intr(struct host1x *host,
+static void host1x_intr_enable_syncpt_intr(struct host1x *host,
 					    unsigned int id)
 {
 	host1x_sync_writel(host, BIT(id % 32),
 		HOST1X_SYNC_SYNCPT_THRESH_INT_ENABLE_CPU0(id / 32));
 }
 
-static void _host1x_intr_disable_syncpt_intr(struct host1x *host,
+static void host1x_intr_disable_syncpt_intr(struct host1x *host,
 					     unsigned int id)
 {
 	host1x_sync_writel(host, BIT(id % 32),
@@ -137,23 +116,10 @@ static void _host1x_intr_disable_syncpt_intr(struct host1x *host,
 		HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(id / 32));
 }
 
-static int _host1x_free_syncpt_irq(struct host1x *host)
-{
-	unsigned int i;
-
-	devm_free_irq(host->dev, host->intr_syncpt_irq, host);
-
-	for (i = 0; i < host->info->nb_pts; i++)
-		cancel_work_sync(&host->syncpt[i].intr.work);
-
-	return 0;
-}
-
 static const struct host1x_intr_ops host1x_intr_ops = {
-	.init_host_sync = _host1x_intr_init_host_sync,
-	.set_syncpt_threshold = _host1x_intr_set_syncpt_threshold,
-	.enable_syncpt_intr = _host1x_intr_enable_syncpt_intr,
-	.disable_syncpt_intr = _host1x_intr_disable_syncpt_intr,
-	.disable_all_syncpt_intrs = _host1x_intr_disable_all_syncpt_intrs,
-	.free_syncpt_irq = _host1x_free_syncpt_irq,
+	.init_host_sync = host1x_intr_init_host_sync,
+	.set_syncpt_threshold = host1x_intr_set_syncpt_threshold,
+	.enable_syncpt_intr = host1x_intr_enable_syncpt_intr,
+	.disable_syncpt_intr = host1x_intr_disable_syncpt_intr,
+	.disable_all_syncpt_intrs = host1x_intr_disable_all_syncpt_intrs,
 };
diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 965ba21818b1..995bfa980837 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -2,299 +2,113 @@
 /*
  * Tegra host1x Interrupt Management
  *
- * Copyright (c) 2010-2013, NVIDIA Corporation.
+ * Copyright (c) 2010-2021, NVIDIA Corporation.
  */
 
 #include <linux/clk.h>
-#include <linux/interrupt.h>
-#include <linux/slab.h>
-#include <linux/irq.h>
 
-#include <trace/events/host1x.h>
-#include "channel.h"
 #include "dev.h"
 #include "fence.h"
 #include "intr.h"
 
-/* Wait list management */
-
-enum waitlist_state {
-	WLS_PENDING,
-	WLS_REMOVED,
-	WLS_CANCELLED,
-	WLS_HANDLED
-};
-
-static void waiter_release(struct kref *kref)
-{
-	kfree(container_of(kref, struct host1x_waitlist, refcount));
-}
-
-/*
- * add a waiter to a waiter queue, sorted by threshold
- * returns true if it was added at the head of the queue
- */
-static bool add_waiter_to_queue(struct host1x_waitlist *waiter,
-				struct list_head *queue)
-{
-	struct host1x_waitlist *pos;
-	u32 thresh = waiter->thresh;
-
-	list_for_each_entry_reverse(pos, queue, list)
-		if ((s32)(pos->thresh - thresh) <= 0) {
-			list_add(&waiter->list, &pos->list);
-			return false;
-		}
-
-	list_add(&waiter->list, queue);
-	return true;
-}
-
-/*
- * run through a waiter queue for a single sync point ID
- * and gather all completed waiters into lists by actions
- */
-static void remove_completed_waiters(struct list_head *head, u32 sync,
-			struct list_head completed[HOST1X_INTR_ACTION_COUNT])
+static void host1x_intr_add_fence_to_list(struct host1x_fence_list *list,
+					  struct host1x_syncpt_fence *fence)
 {
-	struct list_head *dest;
-	struct host1x_waitlist *waiter, *next, *prev;
-
-	list_for_each_entry_safe(waiter, next, head, list) {
-		if ((s32)(waiter->thresh - sync) > 0)
-			break;
+	struct host1x_syncpt_fence *fence_in_list;
 
-		dest = completed + waiter->action;
-
-		/* consolidate submit cleanups */
-		if (waiter->action == HOST1X_INTR_ACTION_SUBMIT_COMPLETE &&
-		    !list_empty(dest)) {
-			prev = list_entry(dest->prev,
-					  struct host1x_waitlist, list);
-			if (prev->data == waiter->data) {
-				prev->count++;
-				dest = NULL;
-			}
+	list_for_each_entry_reverse(fence_in_list, &list->list, list) {
+		if ((s32)(fence_in_list->threshold - fence->threshold) <= 0) {
+			/* Fence in list is before us, we can insert here */
+			list_add(&fence->list, &fence_in_list->list);
+			return;
 		}
-
-		/* PENDING->REMOVED or CANCELLED->HANDLED */
-		if (atomic_inc_return(&waiter->state) == WLS_HANDLED || !dest) {
-			list_del(&waiter->list);
-			kref_put(&waiter->refcount, waiter_release);
-		} else
-			list_move_tail(&waiter->list, dest);
 	}
-}
-
-static void reset_threshold_interrupt(struct host1x *host,
-				      struct list_head *head,
-				      unsigned int id)
-{
-	u32 thresh =
-		list_first_entry(head, struct host1x_waitlist, list)->thresh;
-
-	host1x_hw_intr_set_syncpt_threshold(host, id, thresh);
-	host1x_hw_intr_enable_syncpt_intr(host, id);
-}
-
-static void action_submit_complete(struct host1x_waitlist *waiter)
-{
-	struct host1x_channel *channel = waiter->data;
-
-	host1x_cdma_update(&channel->cdma);
-
-	/*  Add nr_completed to trace */
-	trace_host1x_channel_submit_complete(dev_name(channel->dev),
-					     waiter->count, waiter->thresh);
-}
 
-static void action_wakeup(struct host1x_waitlist *waiter)
-{
-	wait_queue_head_t *wq = waiter->data;
-
-	wake_up(wq);
-}
-
-static void action_wakeup_interruptible(struct host1x_waitlist *waiter)
-{
-	wait_queue_head_t *wq = waiter->data;
-
-	wake_up_interruptible(wq);
+	/* Add as first in list */
+	list_add(&fence->list, &list->list);
 }
 
-static void action_signal_fence(struct host1x_waitlist *waiter)
+static void host1x_intr_update_hw_state(struct host1x *host, struct host1x_syncpt *sp)
 {
-	struct host1x_syncpt_fence *f = waiter->data;
-
-	host1x_fence_signal(f);
-}
+	struct host1x_syncpt_fence *fence;
 
-typedef void (*action_handler)(struct host1x_waitlist *waiter);
+	if (!list_empty(&sp->fences.list)) {
+		fence = list_first_entry(&sp->fences.list, struct host1x_syncpt_fence, list);
 
-static const action_handler action_handlers[HOST1X_INTR_ACTION_COUNT] = {
-	action_submit_complete,
-	action_wakeup,
-	action_wakeup_interruptible,
-	action_signal_fence,
-};
-
-static void run_handlers(struct list_head completed[HOST1X_INTR_ACTION_COUNT])
-{
-	struct list_head *head = completed;
-	unsigned int i;
-
-	for (i = 0; i < HOST1X_INTR_ACTION_COUNT; ++i, ++head) {
-		action_handler handler = action_handlers[i];
-		struct host1x_waitlist *waiter, *next;
-
-		list_for_each_entry_safe(waiter, next, head, list) {
-			list_del(&waiter->list);
-			handler(waiter);
-			WARN_ON(atomic_xchg(&waiter->state, WLS_HANDLED) !=
-				WLS_REMOVED);
-			kref_put(&waiter->refcount, waiter_release);
-		}
+		host1x_hw_intr_set_syncpt_threshold(host, sp->id, fence->threshold);
+		host1x_hw_intr_enable_syncpt_intr(host, sp->id);
+	} else {
+		host1x_hw_intr_disable_syncpt_intr(host, sp->id);
 	}
 }
 
-/*
- * Remove & handle all waiters that have completed for the given syncpt
- */
-static int process_wait_list(struct host1x *host,
-			     struct host1x_syncpt *syncpt,
-			     u32 threshold)
+void host1x_intr_add_fence_locked(struct host1x *host, struct host1x_syncpt_fence *fence)
 {
-	struct list_head completed[HOST1X_INTR_ACTION_COUNT];
-	unsigned int i;
-	int empty;
-
-	for (i = 0; i < HOST1X_INTR_ACTION_COUNT; ++i)
-		INIT_LIST_HEAD(completed + i);
-
-	spin_lock(&syncpt->intr.lock);
-
-	remove_completed_waiters(&syncpt->intr.wait_head, threshold,
-				 completed);
-
-	empty = list_empty(&syncpt->intr.wait_head);
-	if (empty)
-		host1x_hw_intr_disable_syncpt_intr(host, syncpt->id);
-	else
-		reset_threshold_interrupt(host, &syncpt->intr.wait_head,
-					  syncpt->id);
-
-	spin_unlock(&syncpt->intr.lock);
-
-	run_handlers(completed);
-
-	return empty;
-}
+	struct host1x_fence_list *fence_list = &fence->sp->fences;
 
-/*
- * Sync point threshold interrupt service thread function
- * Handles sync point threshold triggers, in thread context
- */
+	INIT_LIST_HEAD(&fence->list);
 
-static void syncpt_thresh_work(struct work_struct *work)
-{
-	struct host1x_syncpt_intr *syncpt_intr =
-		container_of(work, struct host1x_syncpt_intr, work);
-	struct host1x_syncpt *syncpt =
-		container_of(syncpt_intr, struct host1x_syncpt, intr);
-	unsigned int id = syncpt->id;
-	struct host1x *host = syncpt->host;
-
-	(void)process_wait_list(host, syncpt,
-				host1x_syncpt_load(host->syncpt + id));
+	host1x_intr_add_fence_to_list(fence_list, fence);
+	host1x_intr_update_hw_state(host, fence->sp);
 }
 
-int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
-			   u32 thresh, enum host1x_intr_action action,
-			   void *data, struct host1x_waitlist *waiter,
-			   void **ref)
+bool host1x_intr_remove_fence(struct host1x *host, struct host1x_syncpt_fence *fence)
 {
-	int queue_was_empty;
-
-	if (waiter == NULL) {
-		pr_warn("%s: NULL waiter\n", __func__);
-		return -EINVAL;
-	}
-
-	/* initialize a new waiter */
-	INIT_LIST_HEAD(&waiter->list);
-	kref_init(&waiter->refcount);
-	if (ref)
-		kref_get(&waiter->refcount);
-	waiter->thresh = thresh;
-	waiter->action = action;
-	atomic_set(&waiter->state, WLS_PENDING);
-	waiter->data = data;
-	waiter->count = 1;
-
-	spin_lock(&syncpt->intr.lock);
+	struct host1x_fence_list *fence_list = &fence->sp->fences;
+	unsigned long irqflags;
 
-	queue_was_empty = list_empty(&syncpt->intr.wait_head);
+	spin_lock_irqsave(&fence_list->lock, irqflags);
 
-	if (add_waiter_to_queue(waiter, &syncpt->intr.wait_head)) {
-		/* added at head of list - new threshold value */
-		host1x_hw_intr_set_syncpt_threshold(host, syncpt->id, thresh);
-
-		/* added as first waiter - enable interrupt */
-		if (queue_was_empty)
-			host1x_hw_intr_enable_syncpt_intr(host, syncpt->id);
+	if (list_empty(&fence->list)) {
+		spin_unlock_irqrestore(&fence_list->lock, irqflags);
+		return false;
 	}
 
-	if (ref)
-		*ref = waiter;
+	list_del_init(&fence->list);
+	host1x_intr_update_hw_state(host, fence->sp);
 
-	spin_unlock(&syncpt->intr.lock);
+	spin_unlock_irqrestore(&fence_list->lock, irqflags);
 
-	return 0;
+	return true;
 }
 
-void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref,
-			 bool flush)
+void host1x_intr_handle_interrupt(struct host1x *host, unsigned int id)
 {
-	struct host1x_waitlist *waiter = ref;
-	struct host1x_syncpt *syncpt;
+	struct host1x_syncpt *sp = &host->syncpt[id];
+	struct host1x_syncpt_fence *fence, *tmp;
+	unsigned int value;
 
-	atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
+	value = host1x_syncpt_load(sp);
 
-	syncpt = host->syncpt + id;
+	spin_lock(&sp->fences.lock);
 
-	spin_lock(&syncpt->intr.lock);
-	if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) ==
-	    WLS_CANCELLED) {
-		list_del(&waiter->list);
-		kref_put(&waiter->refcount, waiter_release);
-	}
-	spin_unlock(&syncpt->intr.lock);
+	list_for_each_entry_safe(fence, tmp, &sp->fences.list, list) {
+		if (((value - fence->threshold) & 0x80000000U) != 0U) {
+			/* Fence is not yet expired, we are done */
+			break;
+		}
 
-	if (flush) {
-		/* Wait until any concurrently executing handler has finished. */
-		while (atomic_read(&waiter->state) != WLS_HANDLED)
-			schedule();
+		list_del_init(&fence->list);
+		host1x_fence_signal(fence);
 	}
 
-	kref_put(&waiter->refcount, waiter_release);
+	/* Re-enable interrupt if necessary */
+	host1x_intr_update_hw_state(host, sp);
+
+	spin_unlock(&sp->fences.lock);
 }
 
-int host1x_intr_init(struct host1x *host, unsigned int irq_sync)
+int host1x_intr_init(struct host1x *host)
 {
 	unsigned int id;
-	u32 nb_pts = host1x_syncpt_nb_pts(host);
 
 	mutex_init(&host->intr_mutex);
-	host->intr_syncpt_irq = irq_sync;
 
-	for (id = 0; id < nb_pts; ++id) {
-		struct host1x_syncpt *syncpt = host->syncpt + id;
+	for (id = 0; id < host1x_syncpt_nb_pts(host); ++id) {
+		struct host1x_syncpt *syncpt = &host->syncpt[id];
 
-		spin_lock_init(&syncpt->intr.lock);
-		INIT_LIST_HEAD(&syncpt->intr.wait_head);
-		snprintf(syncpt->intr.thresh_irq_name,
-			 sizeof(syncpt->intr.thresh_irq_name),
-			 "host1x_sp_%02u", id);
+		spin_lock_init(&syncpt->fences.lock);
+		INIT_LIST_HEAD(&syncpt->fences.list);
 	}
 
 	return 0;
@@ -310,8 +124,7 @@ void host1x_intr_start(struct host1x *host)
 	int err;
 
 	mutex_lock(&host->intr_mutex);
-	err = host1x_hw_intr_init_host_sync(host, DIV_ROUND_UP(hz, 1000000),
-					    syncpt_thresh_work);
+	err = host1x_hw_intr_init_host_sync(host, DIV_ROUND_UP(hz, 1000000));
 	if (err) {
 		mutex_unlock(&host->intr_mutex);
 		return;
@@ -321,36 +134,5 @@ void host1x_intr_start(struct host1x *host)
 
 void host1x_intr_stop(struct host1x *host)
 {
-	unsigned int id;
-	struct host1x_syncpt *syncpt = host->syncpt;
-	u32 nb_pts = host1x_syncpt_nb_pts(host);
-
-	mutex_lock(&host->intr_mutex);
-
 	host1x_hw_intr_disable_all_syncpt_intrs(host);
-
-	for (id = 0; id < nb_pts; ++id) {
-		struct host1x_waitlist *waiter, *next;
-
-		list_for_each_entry_safe(waiter, next,
-			&syncpt[id].intr.wait_head, list) {
-			if (atomic_cmpxchg(&waiter->state,
-			    WLS_CANCELLED, WLS_HANDLED) == WLS_CANCELLED) {
-				list_del(&waiter->list);
-				kref_put(&waiter->refcount, waiter_release);
-			}
-		}
-
-		if (!list_empty(&syncpt[id].intr.wait_head)) {
-			/* output diagnostics */
-			mutex_unlock(&host->intr_mutex);
-			pr_warn("%s cannot stop syncpt intr id=%u\n",
-				__func__, id);
-			return;
-		}
-	}
-
-	host1x_hw_intr_free_syncpt_irq(host);
-
-	mutex_unlock(&host->intr_mutex);
 }
diff --git a/drivers/gpu/host1x/intr.h b/drivers/gpu/host1x/intr.h
index e4c346099273..3b5610b525e5 100644
--- a/drivers/gpu/host1x/intr.h
+++ b/drivers/gpu/host1x/intr.h
@@ -2,87 +2,17 @@
 /*
  * Tegra host1x Interrupt Management
  *
- * Copyright (c) 2010-2013, NVIDIA Corporation.
+ * Copyright (c) 2010-2021, NVIDIA Corporation.
  */
 
 #ifndef __HOST1X_INTR_H
 #define __HOST1X_INTR_H
 
-#include <linux/interrupt.h>
-#include <linux/workqueue.h>
-
-struct host1x_syncpt;
 struct host1x;
-
-enum host1x_intr_action {
-	/*
-	 * Perform cleanup after a submit has completed.
-	 * 'data' points to a channel
-	 */
-	HOST1X_INTR_ACTION_SUBMIT_COMPLETE = 0,
-
-	/*
-	 * Wake up a  task.
-	 * 'data' points to a wait_queue_head_t
-	 */
-	HOST1X_INTR_ACTION_WAKEUP,
-
-	/*
-	 * Wake up a interruptible task.
-	 * 'data' points to a wait_queue_head_t
-	 */
-	HOST1X_INTR_ACTION_WAKEUP_INTERRUPTIBLE,
-
-	HOST1X_INTR_ACTION_SIGNAL_FENCE,
-
-	HOST1X_INTR_ACTION_COUNT
-};
-
-struct host1x_syncpt_intr {
-	spinlock_t lock;
-	struct list_head wait_head;
-	char thresh_irq_name[12];
-	struct work_struct work;
-};
-
-struct host1x_waitlist {
-	struct list_head list;
-	struct kref refcount;
-	u32 thresh;
-	enum host1x_intr_action action;
-	atomic_t state;
-	void *data;
-	int count;
-};
-
-/*
- * Schedule an action to be taken when a sync point reaches the given threshold.
- *
- * @id the sync point
- * @thresh the threshold
- * @action the action to take
- * @data a pointer to extra data depending on action, see above
- * @waiter waiter structure - assumes ownership
- * @ref must be passed if cancellation is possible, else NULL
- *
- * This is a non-blocking api.
- */
-int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
-			   u32 thresh, enum host1x_intr_action action,
-			   void *data, struct host1x_waitlist *waiter,
-			   void **ref);
-
-/*
- * Unreference an action submitted to host1x_intr_add_action().
- * You must call this if you passed non-NULL as ref.
- * @ref the ref returned from host1x_intr_add_action()
- * @flush wait until any pending handlers have completed before returning.
- */
-void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref,
-			 bool flush);
+struct host1x_syncpt_fence;
 
 /* Initialize host1x sync point interrupt */
-int host1x_intr_init(struct host1x *host, unsigned int irq_sync);
+int host1x_intr_init(struct host1x *host);
 
 /* Deinitialize host1x sync point interrupt */
 void host1x_intr_deinit(struct host1x *host);
@@ -93,5 +23,10 @@ void host1x_intr_start(struct host1x *host);
 /* Disable host1x sync point interrupt */
 void host1x_intr_stop(struct host1x *host);
 
-irqreturn_t host1x_syncpt_thresh_fn(void *dev_id);
+void host1x_intr_handle_interrupt(struct host1x *host, unsigned int id);
+
+void host1x_intr_add_fence_locked(struct host1x *host, struct host1x_syncpt_fence *fence);
+
+bool host1x_intr_remove_fence(struct host1x *host, struct host1x_syncpt_fence *fence);
+
 #endif
diff --git a/drivers/gpu/host1x/syncpt.h b/drivers/gpu/host1x/syncpt.h
index 95cd29b79d6d..4c3f3b2f0e9c 100644
--- a/drivers/gpu/host1x/syncpt.h
+++ b/drivers/gpu/host1x/syncpt.h
@@ -14,6 +14,7 @@
 #include <linux/kref.h>
 #include <linux/sched.h>
 
+#include "fence.h"
 #include "intr.h"
 
 struct host1x;
@@ -39,7 +40,7 @@ struct host1x_syncpt {
 	struct host1x_syncpt_base *base;
 
 	/* interrupt data */
-	struct host1x_syncpt_intr intr;
+	struct host1x_fence_list fences;
 
 	/*
 	 * If a submission incrementing this syncpoint fails, lock it so that
-- 
2.39.0

