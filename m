Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D49A08FA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 14:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BD610E08F;
	Wed, 16 Oct 2024 12:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="h117pxWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBD910E08F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fQwte2Pq5sfQjXvRZtawm/4SKy+5okgSAZtXCSQMGaI=; b=h117pxWIw6t9/QalicXzjBy8uK
 glMU8yI81X7+khpF6I12sQtK5PHDndWqMAGk0YG1/3Us2CzbXJDxK/Io+unUwRO+Tea6Jwfj4QQ/q
 KKz2o5fcicXtGHSZ/KBW8vxY9Hd4oXzCRrsRHZsKtISQfnut//1VNKoSeN/iZUntwxD4l0/wkIQLN
 m/JnQS0W9Or8ALAV4k7YJeq2AtuqI678zQZn/MeBoHhJ4PHY1lkeYsQdUMInmqoedHbczecd5PZfd
 vB9WAma+647xPUinTYd9Tg/bvbJqwEXvXBbev6qABqr1JTYrUz/thbwQWwBmLp7fTobq+sboTKhnJ
 FloCYweA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t12k3-00000007qYy-0q86; Wed, 16 Oct 2024 12:03:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id EEC51300777; Wed, 16 Oct 2024 14:03:02 +0200 (CEST)
Date: Wed, 16 Oct 2024 14:03:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <20241016120302.GP33184@noisy.programming.kicks-ass.net>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
 <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
 <20241014192519.GN16066@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014192519.GN16066@noisy.programming.kicks-ass.net>
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

On Mon, Oct 14, 2024 at 09:25:19PM +0200, Peter Zijlstra wrote:

> Let me ponder that a little bit.

So I did the thing on top of the get/put thing that would allow you to
get rid of the ->closed thing, and before I was finished I already hated
all of it :-(

The thing is, if you're going to the effort of adding get/put and
putting the responsibility on the implementation, then the ->closed
thing is only a little extra ask.

So... I wondered, how hard it would be for perf_pmu_unregister() to do
what you want.

Time passed, hacks were done...

and while what I have is still riddled with holes (more work is
definitely required), it does pass your dummy_pmu test scipt.

I'll poke at this a little longer. Afaict it should be possible to make
this good enough for what you want. Just needs more holes filled.

---
 include/linux/perf_event.h |  13 ++-
 kernel/events/core.c       | 260 ++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 228 insertions(+), 45 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index fb908843f209..20995d33d27e 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -318,6 +318,9 @@ struct perf_output_handle;
 struct pmu {
 	struct list_head		entry;
 
+	spinlock_t			events_lock;
+	struct list_head		events;
+
 	struct module			*module;
 	struct device			*dev;
 	struct device			*parent;
@@ -612,9 +615,10 @@ struct perf_addr_filter_range {
  * enum perf_event_state - the states of an event:
  */
 enum perf_event_state {
-	PERF_EVENT_STATE_DEAD		= -4,
-	PERF_EVENT_STATE_EXIT		= -3,
-	PERF_EVENT_STATE_ERROR		= -2,
+	PERF_EVENT_STATE_DEAD		= -5,
+	PERF_EVENT_STATE_REVOKED	= -4, /* pmu gone, must not touch */
+	PERF_EVENT_STATE_EXIT		= -3, /* task died, still inherit */
+	PERF_EVENT_STATE_ERROR		= -2, /* scheduling error, can enable */
 	PERF_EVENT_STATE_OFF		= -1,
 	PERF_EVENT_STATE_INACTIVE	=  0,
 	PERF_EVENT_STATE_ACTIVE		=  1,
@@ -853,6 +857,7 @@ struct perf_event {
 	void *security;
 #endif
 	struct list_head		sb_list;
+	struct list_head		pmu_list;
 
 	/*
 	 * Certain events gets forwarded to another pmu internally by over-
@@ -1103,7 +1108,7 @@ extern void perf_aux_output_flag(struct perf_output_handle *handle, u64 flags);
 extern void perf_event_itrace_started(struct perf_event *event);
 
 extern int perf_pmu_register(struct pmu *pmu, const char *name, int type);
-extern void perf_pmu_unregister(struct pmu *pmu);
+extern int perf_pmu_unregister(struct pmu *pmu);
 
 extern void __perf_event_task_sched_in(struct task_struct *prev,
 				       struct task_struct *task);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index cdd09769e6c5..e66827367a97 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2406,7 +2406,9 @@ ctx_time_update_event(struct perf_event_context *ctx, struct perf_event *event)
 
 #define DETACH_GROUP	0x01UL
 #define DETACH_CHILD	0x02UL
-#define DETACH_DEAD	0x04UL
+#define DETACH_EXIT	0x04UL
+#define DETACH_REVOKE	0x08UL
+#define DETACH_DEAD	0x10UL
 
 /*
  * Cross CPU call to remove a performance event
@@ -2421,6 +2423,7 @@ __perf_remove_from_context(struct perf_event *event,
 			   void *info)
 {
 	struct perf_event_pmu_context *pmu_ctx = event->pmu_ctx;
+	enum perf_event_state state = PERF_EVENT_STATE_OFF;
 	unsigned long flags = (unsigned long)info;
 
 	ctx_time_update(cpuctx, ctx);
@@ -2429,16 +2432,22 @@ __perf_remove_from_context(struct perf_event *event,
 	 * Ensure event_sched_out() switches to OFF, at the very least
 	 * this avoids raising perf_pending_task() at this time.
 	 */
-	if (flags & DETACH_DEAD)
+	if (flags & DETACH_EXIT)
+		state = PERF_EVENT_STATE_EXIT;
+	if (flags & DETACH_REVOKE)
+		state = PERF_EVENT_STATE_REVOKED;
+	if (flags & DETACH_DEAD) {
 		event->pending_disable = 1;
+		state = PERF_EVENT_STATE_DEAD;
+	}
 	event_sched_out(event, ctx);
 	if (flags & DETACH_GROUP)
 		perf_group_detach(event);
 	if (flags & DETACH_CHILD)
 		perf_child_detach(event);
 	list_del_event(event, ctx);
-	if (flags & DETACH_DEAD)
-		event->state = PERF_EVENT_STATE_DEAD;
+
+	event->state = state;
 
 	if (!pmu_ctx->nr_events) {
 		pmu_ctx->rotate_necessary = 0;
@@ -4508,7 +4517,8 @@ static void perf_event_enable_on_exec(struct perf_event_context *ctx)
 
 static void perf_remove_from_owner(struct perf_event *event);
 static void perf_event_exit_event(struct perf_event *event,
-				  struct perf_event_context *ctx);
+				  struct perf_event_context *ctx,
+				  bool revoke);
 
 /*
  * Removes all events from the current task that have been marked
@@ -4535,7 +4545,7 @@ static void perf_event_remove_on_exec(struct perf_event_context *ctx)
 
 		modified = true;
 
-		perf_event_exit_event(event, ctx);
+		perf_event_exit_event(event, ctx, false);
 	}
 
 	raw_spin_lock_irqsave(&ctx->lock, flags);
@@ -5121,6 +5131,7 @@ static bool is_sb_event(struct perf_event *event)
 	    attr->context_switch || attr->text_poke ||
 	    attr->bpf_event)
 		return true;
+
 	return false;
 }
 
@@ -5321,6 +5332,8 @@ static void perf_pending_task_sync(struct perf_event *event)
 
 static void _free_event(struct perf_event *event)
 {
+	struct pmu *pmu = event->pmu;
+
 	irq_work_sync(&event->pending_irq);
 	irq_work_sync(&event->pending_disable_irq);
 	perf_pending_task_sync(event);
@@ -5330,6 +5343,7 @@ static void _free_event(struct perf_event *event)
 	security_perf_event_free(event);
 
 	if (event->rb) {
+		WARN_ON_ONCE(!pmu);
 		/*
 		 * Can happen when we close an event with re-directed output.
 		 *
@@ -5349,12 +5363,16 @@ static void _free_event(struct perf_event *event)
 			put_callchain_buffers();
 	}
 
-	perf_event_free_bpf_prog(event);
-	perf_addr_filters_splice(event, NULL);
-	kfree(event->addr_filter_ranges);
+	if (pmu) {
+		perf_event_free_bpf_prog(event);
+		perf_addr_filters_splice(event, NULL);
+		kfree(event->addr_filter_ranges);
+	}
 
-	if (event->destroy)
+	if (event->destroy) {
+		WARN_ON_ONCE(!pmu);
 		event->destroy(event);
+	}
 
 	/*
 	 * Must be after ->destroy(), due to uprobe_perf_close() using
@@ -5363,8 +5381,10 @@ static void _free_event(struct perf_event *event)
 	if (event->hw.target)
 		put_task_struct(event->hw.target);
 
-	if (event->pmu_ctx)
+	if (event->pmu_ctx) {
+		WARN_ON_ONCE(!pmu);
 		put_pmu_ctx(event->pmu_ctx);
+	}
 
 	/*
 	 * perf_event_free_task() relies on put_ctx() being 'last', in particular
@@ -5373,8 +5393,14 @@ static void _free_event(struct perf_event *event)
 	if (event->ctx)
 		put_ctx(event->ctx);
 
-	exclusive_event_destroy(event);
-	module_put(event->pmu->module);
+	if (pmu) {
+		exclusive_event_destroy(event);
+		module_put(pmu->module);
+		scoped_guard(spinlock, &pmu->events_lock) {
+			list_del(&event->pmu_list);
+			wake_up_var(pmu);
+		}
+	}
 
 	call_rcu(&event->rcu_head, free_event_rcu);
 }
@@ -5492,7 +5518,11 @@ int perf_event_release_kernel(struct perf_event *event)
 	 * Thus this guarantees that we will in fact observe and kill _ALL_
 	 * child events.
 	 */
-	perf_remove_from_context(event, DETACH_GROUP|DETACH_DEAD);
+	if (event->state > PERF_EVENT_STATE_REVOKED) {
+		perf_remove_from_context(event, DETACH_GROUP|DETACH_DEAD);
+	} else {
+		event->state = PERF_EVENT_STATE_DEAD;
+	}
 
 	perf_event_ctx_unlock(event, ctx);
 
@@ -5803,7 +5833,7 @@ __perf_read(struct perf_event *event, char __user *buf, size_t count)
 	 * error state (i.e. because it was pinned but it couldn't be
 	 * scheduled on to the CPU at some point).
 	 */
-	if (event->state == PERF_EVENT_STATE_ERROR)
+	if (event->state <= PERF_EVENT_STATE_ERROR)
 		return 0;
 
 	if (count < event->read_size)
@@ -5842,8 +5872,14 @@ static __poll_t perf_poll(struct file *file, poll_table *wait)
 	struct perf_buffer *rb;
 	__poll_t events = EPOLLHUP;
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return EPOLLERR;
+
 	poll_wait(file, &event->waitq, wait);
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return EPOLLERR;
+
 	if (is_event_hup(event))
 		return events;
 
@@ -6013,7 +6049,7 @@ static inline int perf_fget_light(int fd, struct fd *p)
 }
 
 static int perf_event_set_output(struct perf_event *event,
-				 struct perf_event *output_event);
+				 struct perf_event *output_event, bool force);
 static int perf_event_set_filter(struct perf_event *event, void __user *arg);
 static int perf_copy_attr(struct perf_event_attr __user *uattr,
 			  struct perf_event_attr *attr);
@@ -6023,6 +6059,9 @@ static long _perf_ioctl(struct perf_event *event, unsigned int cmd, unsigned lon
 	void (*func)(struct perf_event *);
 	u32 flags = arg;
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return -ENODEV;
+
 	switch (cmd) {
 	case PERF_EVENT_IOC_ENABLE:
 		func = _perf_event_enable;
@@ -6065,10 +6104,10 @@ static long _perf_ioctl(struct perf_event *event, unsigned int cmd, unsigned lon
 			if (ret)
 				return ret;
 			output_event = fd_file(output)->private_data;
-			ret = perf_event_set_output(event, output_event);
+			ret = perf_event_set_output(event, output_event, false);
 			fdput(output);
 		} else {
-			ret = perf_event_set_output(event, NULL);
+			ret = perf_event_set_output(event, NULL, false);
 		}
 		return ret;
 	}
@@ -6472,6 +6511,7 @@ static void perf_mmap_close(struct vm_area_struct *vma)
 	unsigned long size = perf_data_size(rb);
 	bool detach_rest = false;
 
+	/* FIXIES vs perf_pmu_unregister() */
 	if (event->pmu->event_unmapped)
 		event->pmu->event_unmapped(event, vma->vm_mm);
 
@@ -6591,7 +6631,15 @@ static int perf_mmap(struct file *file, struct vm_area_struct *vma)
 	unsigned long vma_size;
 	unsigned long nr_pages;
 	long user_extra = 0, extra = 0;
-	int ret = 0, flags = 0;
+	int ret, flags = 0;
+
+	ret = security_perf_event_read(event);
+	if (ret)
+		return ret;
+
+	/* XXX needs event->mmap_mutex? */
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return -ENODEV;
 
 	/*
 	 * Don't allow mmap() of inherited per-task counters. This would
@@ -6604,10 +6652,6 @@ static int perf_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
-	ret = security_perf_event_read(event);
-	if (ret)
-		return ret;
-
 	vma_size = vma->vm_end - vma->vm_start;
 
 	if (vma->vm_pgoff == 0) {
@@ -6810,6 +6854,9 @@ static int perf_fasync(int fd, struct file *filp, int on)
 	struct perf_event *event = filp->private_data;
 	int retval;
 
+	if (event->state <= PERF_EVENT_STATE_REVOKED)
+		return -ENODEV;
+
 	inode_lock(inode);
 	retval = fasync_helper(fd, filp, on, &event->fasync);
 	inode_unlock(inode);
@@ -11513,6 +11560,7 @@ static int perf_event_idx_default(struct perf_event *event)
 
 static void free_pmu_context(struct pmu *pmu)
 {
+	free_percpu(pmu->pmu_disable_count);
 	free_percpu(pmu->cpu_pmu_context);
 }
 
@@ -11753,6 +11801,7 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 	if (type >= 0)
 		max = type;
 
+	// XXX broken vs perf_init_event(), this publishes before @pmu is finalized
 	ret = idr_alloc(&pmu_idr, pmu, max, 0, GFP_KERNEL);
 	if (ret < 0)
 		goto free_pdc;
@@ -11809,8 +11858,14 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 	if (!pmu->event_idx)
 		pmu->event_idx = perf_event_idx_default;
 
-	list_add_rcu(&pmu->entry, &pmus);
 	atomic_set(&pmu->exclusive_cnt, 0);
+	INIT_LIST_HEAD(&pmu->events);
+	spin_lock_init(&pmu->events_lock);
+
+	/*
+	 * Publish the pmu after it is fully initialized.
+	 */
+	list_add_rcu(&pmu->entry, &pmus);
 	ret = 0;
 unlock:
 	mutex_unlock(&pmus_lock);
@@ -11832,10 +11887,110 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 }
 EXPORT_SYMBOL_GPL(perf_pmu_register);
 
-void perf_pmu_unregister(struct pmu *pmu)
+static void __pmu_detach_event(struct pmu *pmu, struct perf_event *event,
+			       struct perf_event_context *ctx)
 {
+	/*
+	 * De-schedule the event and mark it EXIT_PMU.
+	 */
+	perf_event_exit_event(event, ctx, true);
+
+	/*
+	 * All _free_event() bits that rely on event->pmu:
+	 */
+	perf_event_set_output(event, NULL, true);
+
+	perf_event_free_bpf_prog(event);
+	perf_addr_filters_splice(event, NULL);
+	kfree(event->addr_filter_ranges);
+
+	if (event->destroy) {
+		event->destroy(event);
+		event->destroy = NULL;
+	}
+
+	if (event->pmu_ctx) {
+		/*
+		 * Make sure pmu->cpu_pmu_context is unused. An alternative is
+		 * to have it be pointers and make put_pmu_ctx()'s
+		 * epc->embedded case be another RCU free case.
+		 */
+		put_pmu_ctx(event->pmu_ctx);
+		event->pmu_ctx = NULL;
+	}
+
+	exclusive_event_destroy(event);
+	module_put(pmu->module);
+
+	event->pmu = NULL; /* force fault instead of UAF */
+}
+
+static void pmu_detach_event(struct pmu *pmu, struct perf_event *event)
+{
+	struct perf_event_context *ctx;
+
+	ctx = perf_event_ctx_lock(event);
+	__pmu_detach_event(pmu, event, ctx);
+	perf_event_ctx_unlock(event, ctx);
+
+	scoped_guard(spinlock, &pmu->events_lock)
+		list_del(&event->pmu_list);
+}
+
+static struct perf_event *pmu_get_event(struct pmu *pmu)
+{
+	struct perf_event *event;
+
+	guard(spinlock)(&pmu->events_lock);
+	list_for_each_entry(event, &pmu->events, pmu_list) {
+		if (atomic_long_inc_not_zero(&event->refcount))
+			return event;
+	}
+
+	return NULL;
+}
+
+static bool pmu_empty(struct pmu *pmu)
+{
+	guard(spinlock)(&pmu->events_lock);
+	return list_empty(&pmu->events);
+}
+
+static void pmu_detach_events(struct pmu *pmu)
+{
+	struct perf_event *event;
+
+	for (;;) {
+		event = pmu_get_event(pmu);
+		if (!event)
+			break;
+
+		pmu_detach_event(pmu, event);
+		put_event(event);
+	}
+
+	/*
+	 * wait for pending _free_event()s
+	 */
+	wait_var_event(pmu, pmu_empty(pmu));
+}
+
+int perf_pmu_unregister(struct pmu *pmu)
+{
+	/*
+	 * FIXME!
+	 *
+	 *   perf_mmap_close(); event->pmu->event_unmapped()
+	 *
+	 * XXX this check is racy vs perf_event_alloc()
+	 */
+	if (pmu->event_unmapped && !pmu_empty(pmu))
+		return -EBUSY;
+
 	mutex_lock(&pmus_lock);
 	list_del_rcu(&pmu->entry);
+	idr_remove(&pmu_idr, pmu->type);
+	mutex_unlock(&pmus_lock);
 
 	/*
 	 * We dereference the pmu list under both SRCU and regular RCU, so
@@ -11844,16 +11999,29 @@ void perf_pmu_unregister(struct pmu *pmu)
 	synchronize_srcu(&pmus_srcu);
 	synchronize_rcu();
 
-	free_percpu(pmu->pmu_disable_count);
-	idr_remove(&pmu_idr, pmu->type);
+	/*
+	 * PMU is removed from the pmus list, so no new events will
+	 * be created, now take care of the existing ones.
+	 */
+	pmu_detach_events(pmu);
+
+	/*
+	 * PMU is unused, make it go away.
+	 */
 	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
 		if (pmu->nr_addr_filters)
 			device_remove_file(pmu->dev, &dev_attr_nr_addr_filters);
 		device_del(pmu->dev);
 		put_device(pmu->dev);
 	}
+
+	/* 
+	 * XXX -- broken? can still contain SW events at this point?
+	 * audit more, make sure DETACH_GROUP DTRT
+	 */
 	free_pmu_context(pmu);
-	mutex_unlock(&pmus_lock);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);
 
@@ -12330,6 +12498,9 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	/* symmetric to unaccount_event() in _free_event() */
 	account_event(event);
 
+	scoped_guard(spinlock, &pmu->events_lock)
+		list_add(&event->pmu_list, &pmu->events);
+
 	return event;
 
 err_callchain_buffer:
@@ -12493,7 +12664,7 @@ static void mutex_lock_double(struct mutex *a, struct mutex *b)
 }
 
 static int
-perf_event_set_output(struct perf_event *event, struct perf_event *output_event)
+perf_event_set_output(struct perf_event *event, struct perf_event *output_event, bool force)
 {
 	struct perf_buffer *rb = NULL;
 	int ret = -EINVAL;
@@ -12549,8 +12720,12 @@ perf_event_set_output(struct perf_event *event, struct perf_event *output_event)
 	mutex_lock_double(&event->mmap_mutex, &output_event->mmap_mutex);
 set:
 	/* Can't redirect output if we've got an active mmap() */
-	if (atomic_read(&event->mmap_count))
-		goto unlock;
+	if (atomic_read(&event->mmap_count)) {
+		if (!force)
+			goto unlock;
+
+		WARN_ON_ONCE(event->pmu->event_unmapped);
+	}
 
 	if (output_event) {
 		/* get the rb we want to redirect to */
@@ -12740,6 +12915,10 @@ SYSCALL_DEFINE5(perf_event_open,
 		if (err)
 			goto err_fd;
 		group_leader = fd_file(group)->private_data;
+		if (group_leader->state <= PERF_EVENT_STATE_REVOKED) {
+			err = -ENODEV;
+			goto err_group_fd;
+		}
 		if (flags & PERF_FLAG_FD_OUTPUT)
 			output_event = group_leader;
 		if (flags & PERF_FLAG_FD_NO_GROUP)
@@ -12916,7 +13095,7 @@ SYSCALL_DEFINE5(perf_event_open,
 	event->pmu_ctx = pmu_ctx;
 
 	if (output_event) {
-		err = perf_event_set_output(event, output_event);
+		err = perf_event_set_output(event, output_event, false);
 		if (err)
 			goto err_context;
 	}
@@ -13287,10 +13466,11 @@ static void sync_child_event(struct perf_event *child_event)
 }
 
 static void
-perf_event_exit_event(struct perf_event *event, struct perf_event_context *ctx)
+perf_event_exit_event(struct perf_event *event,
+		      struct perf_event_context *ctx, bool revoke)
 {
 	struct perf_event *parent_event = event->parent;
-	unsigned long detach_flags = 0;
+	unsigned long detach_flags = DETACH_EXIT;
 
 	if (parent_event) {
 		/*
@@ -13305,16 +13485,14 @@ perf_event_exit_event(struct perf_event *event, struct perf_event_context *ctx)
 		 * Do destroy all inherited groups, we don't care about those
 		 * and being thorough is better.
 		 */
-		detach_flags = DETACH_GROUP | DETACH_CHILD;
+		detach_flags |= DETACH_GROUP | DETACH_CHILD;
 		mutex_lock(&parent_event->child_mutex);
 	}
 
-	perf_remove_from_context(event, detach_flags);
+	if (revoke)
+		detach_flags |= DETACH_GROUP | DETACH_REVOKE;
 
-	raw_spin_lock_irq(&ctx->lock);
-	if (event->state > PERF_EVENT_STATE_EXIT)
-		perf_event_set_state(event, PERF_EVENT_STATE_EXIT);
-	raw_spin_unlock_irq(&ctx->lock);
+	perf_remove_from_context(event, detach_flags);
 
 	/*
 	 * Child events can be freed.
@@ -13390,7 +13568,7 @@ static void perf_event_exit_task_context(struct task_struct *child)
 	perf_event_task(child, child_ctx, 0);
 
 	list_for_each_entry_safe(child_event, next, &child_ctx->event_list, event_entry)
-		perf_event_exit_event(child_event, child_ctx);
+		perf_event_exit_event(child_event, child_ctx, false);
 
 	mutex_unlock(&child_ctx->mutex);
 
