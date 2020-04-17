Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02951AE605
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 21:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54586E85E;
	Fri, 17 Apr 2020 19:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009896E866
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587152552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tw6iakFOYLBCIQFxeQmRTj7YdAKorrHXZZ6y3q0wXB8=;
 b=Jw5EmA8ZuKiUbMBvzmltS8Iy/kxe6+A6qL3Xl2PMWwA8Hqf8C/LWcochUobh4O4lIBWusw
 g1MSP/geNPgkkzszEYzOE0MpggnW+xlL7OKVc2GeyC0oEmXMfjzS8gr/ivSAnDsi4jHQOV
 RDMcwdDDkNMfWxwErSboTusUtGcMPvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-DdxAzQy7O0W857mAi20rxQ-1; Fri, 17 Apr 2020 15:42:30 -0400
X-MC-Unique: DdxAzQy7O0W857mAi20rxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 561BC10CE784;
 Fri, 17 Apr 2020 19:42:28 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CBC55DA7C;
 Fri, 17 Apr 2020 19:42:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v3 02/11] kthread: Introduce __kthread_queue_work()
Date: Fri, 17 Apr 2020 15:40:49 -0400
Message-Id: <20200417194145.36350-3-lyude@redhat.com>
In-Reply-To: <20200417194145.36350-1-lyude@redhat.com>
References: <20200417194145.36350-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Petr Mladek <pmladek@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Liang Chen <cl@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While kthread_queue_work() is fine for basic kthread_worker usecases,
it's a little limiting if you want to create your own delayed work
implementations that delay off things other than a clock. Looking at
kthread_delayed_works for instance, all of the code shares the lock in
kthread_work so that that both the timer_list and actual kthread_worker
can be inspected and modified together atomically.

Currently, we want to be able to implement a type of delayed
kthread_work in DRM that delays until a specific vblank sequence has
passed, which we refer to as a drm_vblank_work, as opposed to using a
simple time-based delay. Some of the requirements we have for this are
the ability to allow for rescheduling and flushing on drm_vblank_works,
which become a lot harder to do properly if we can't re-queue work under
lock. Additionally, being able to specify a custom position in the
kthread_worker's work_list (which requires being under lock) is
important to be able to do since it's needed for implementing a custom
work flushing mechanism that waits for both the vblank sequence and
kthread_worker to complete once.

So - let's expose an unlocked version of kthread_queue_work() called
__kthread_queue_work(), which also allows for specifying a custom list
position in which to insert the work before.

Cc: Tejun Heo <tj@kernel.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/linux/kthread.h |  3 +++
 kernel/kthread.c        | 34 ++++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/include/linux/kthread.h b/include/linux/kthread.h
index 8bbcaad7ef0f..02e0c1c157bf 100644
--- a/include/linux/kthread.h
+++ b/include/linux/kthread.h
@@ -179,6 +179,9 @@ __printf(3, 4) struct kthread_worker *
 kthread_create_worker_on_cpu(int cpu, unsigned int flags,
 			     const char namefmt[], ...);
 
+bool __kthread_queue_work(struct kthread_worker *worker,
+			  struct kthread_work *work,
+			  struct list_head *pos);
 bool kthread_queue_work(struct kthread_worker *worker,
 			struct kthread_work *work);
 
diff --git a/kernel/kthread.c b/kernel/kthread.c
index bfbfa481be3a..46de56142593 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -816,6 +816,35 @@ static void kthread_insert_work(struct kthread_worker *worker,
 		wake_up_process(worker->task);
 }
 
+/**
+ * __kthread_queue_work - queue a kthread_work while under lock
+ * @worker: target kthread_worker
+ * @work: kthread_work to queue
+ * @pos: The position in @worker.work_list to insert @work before
+ *
+ * This is the same as kthread_queue_work(), except that it already expects
+ * the caller to be holding &kthread_worker.lock and allows for specifying a
+ * custom position in @worker.work_list to insert @work before.
+ *
+ * This function is mostly useful for users which might need to create their
+ * own delayed kthread_worker implementations.
+ *
+ * Returns: %true if @work was successfully queued, %false if it was already
+ * pending.
+ */
+bool __kthread_queue_work(struct kthread_worker *worker,
+			  struct kthread_work *work,
+			  struct list_head *pos)
+{
+	if (!queuing_blocked(worker, work)) {
+		kthread_insert_work(worker, work, pos);
+		return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(__kthread_queue_work);
+
 /**
  * kthread_queue_work - queue a kthread_work
  * @worker: target kthread_worker
@@ -835,10 +864,7 @@ bool kthread_queue_work(struct kthread_worker *worker,
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&worker->lock, flags);
-	if (!queuing_blocked(worker, work)) {
-		kthread_insert_work(worker, work, &worker->work_list);
-		ret = true;
-	}
+	ret = __kthread_queue_work(worker, work, &worker->work_list);
 	raw_spin_unlock_irqrestore(&worker->lock, flags);
 	return ret;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
