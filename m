Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEFQGcRUmGmSGQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 13:34:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B896916782D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 13:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D89F10E35B;
	Fri, 20 Feb 2026 12:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="aCAOLCUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4794E10E1A8;
 Fri, 20 Feb 2026 12:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771590272;
 bh=h8gesliv2aJhuiBkLG/BT/6Z3Rk89daisOe021JD1A0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aCAOLCUb5QadOcugreIqGg29CYem9i6wqgO3WTp3qTrXawR/Fnrd+7NvUtzLjcvWd
 7v45qAEC1BUC6YeD87K3b3eJ0eeEf1EqeTMZ9CFNeEfb87lC5TniPZGqykEbSUlpPI
 SrOberbcPT4CvOoKJS/aXR4+uxH9gzP9YfChg+qSafeJgrkubFIUPakF6cKjaePyrC
 m9CAxxczh4UdaKKjBjZ/SWD1W5IV1y/jtuK4L3/qG/AbkVhuM4WhUyxX7cfVo1dWdx
 kqd33/io+VOfogWFlDnncf8yCNtVU7YLBTS7/CDfP6fHPeDzDipZpC323/WXRN93A/
 k53yz87vuxARA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v6.1 1/1] drm/vblank_work: Add methods to schedule
 vblank_work in 2 stages
Date: Fri, 20 Feb 2026 13:24:25 +0100
Message-ID: <20260220122425.97902-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220083657.28815-27-dev@lankhorst.se>
References: <20260220083657.28815-27-dev@lankhorst.se>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[lankhorst.se:mid,lankhorst.se:dkim,lankhorst.se:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[lankhorst.se:s=default];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lankhorst.se,none];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.462];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lankhorst.se:mid,lankhorst.se:dkim,lankhorst.se:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B896916782D
X-Rspamd-Action: add header
X-Spam: Yes

In case of vblank evasion in intel/display, it's necessary to
perform some work in advance, so the critical section will always run in
constant time on PREEMPT_RT.

By preparing all the work in advance, the part that needs to finish in
constant time only has to write a single variable instead. This allows
PREEMPT_RT to keep the interrupts disabled at the most critical part,
without completely reworking all locks to be raw spinlocks.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
I had a small bug where I set armed = true for drm_vblank_work_schedule_disabled(),
fortunately found by CI. Fix it to ensure work is delayed correctly.

 drivers/gpu/drm/drm_vblank_work.c | 106 ++++++++++++++++++++++--------
 include/drm/drm_vblank_work.h     |  12 ++++
 2 files changed, 92 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index 70f0199251ea0..6acb240b9c112 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -54,7 +54,8 @@ void drm_handle_vblank_works(struct drm_vblank_crtc *vblank)
 	assert_spin_locked(&vblank->dev->event_lock);
 
 	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
-		if (!drm_vblank_passed(count, work->count))
+		/* READ_ONCE pairs with WRITE_ONCE in drm_vblank_work_enable() */
+		if (!READ_ONCE(work->armed) || !drm_vblank_passed(count, work->count))
 			continue;
 
 		list_del_init(&work->node);
@@ -86,30 +87,8 @@ void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank)
 	wake_up_all(&vblank->work_wait_queue);
 }
 
-/**
- * drm_vblank_work_schedule - schedule a vblank work
- * @work: vblank work to schedule
- * @count: target vblank count
- * @nextonmiss: defer until the next vblank if target vblank was missed
- *
- * Schedule @work for execution once the crtc vblank count reaches @count.
- *
- * If the crtc vblank count has already reached @count and @nextonmiss is
- * %false the work starts to execute immediately.
- *
- * If the crtc vblank count has already reached @count and @nextonmiss is
- * %true the work is deferred until the next vblank (as if @count has been
- * specified as crtc vblank count + 1).
- *
- * If @work is already scheduled, this function will reschedule said work
- * using the new @count. This can be used for self-rearming work items.
- *
- * Returns:
- * %1 if @work was successfully (re)scheduled, %0 if it was either already
- * scheduled or cancelled, or a negative error code on failure.
- */
-int drm_vblank_work_schedule(struct drm_vblank_work *work,
-			     u64 count, bool nextonmiss)
+static int __drm_vblank_work_schedule(struct drm_vblank_work *work,
+				      u64 count, bool nextonmiss, bool armed)
 {
 	struct drm_vblank_crtc *vblank = work->vblank;
 	struct drm_device *dev = vblank->dev;
@@ -139,6 +118,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 		rescheduling = true;
 	}
 
+	work->armed = armed;
 	work->count = count;
 	cur_vbl = drm_vblank_count(dev, vblank->pipe);
 	passed = drm_vblank_passed(cur_vbl, count);
@@ -147,7 +127,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 			     "crtc %d vblank %llu already passed (current %llu)\n",
 			     vblank->pipe, count, cur_vbl);
 
-	if (!nextonmiss && passed) {
+	if (!nextonmiss && passed && armed) {
 		drm_vblank_put(dev, vblank->pipe);
 		ret = kthread_queue_work(vblank->worker, &work->base);
 
@@ -167,8 +147,82 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 		wake_up_all(&vblank->work_wait_queue);
 	return ret;
 }
+
+/**
+ * drm_vblank_work_schedule - schedule a vblank work
+ * @work: vblank work to schedule
+ * @count: target vblank count
+ * @nextonmiss: defer until the next vblank if target vblank was missed
+ *
+ * Schedule @work for execution once the crtc vblank count reaches @count.
+ *
+ * If the crtc vblank count has already reached @count and @nextonmiss is
+ * %false the work starts to execute immediately.
+ *
+ * If the crtc vblank count has already reached @count and @nextonmiss is
+ * %true the work is deferred until the next vblank (as if @count has been
+ * specified as crtc vblank count + 1).
+ *
+ * If @work is already scheduled, this function will reschedule said work
+ * using the new @count. This can be used for self-rearming work items.
+ *
+ * Returns:
+ * %1 if @work was successfully (re)scheduled, %0 if it was either already
+ * scheduled or cancelled, or a negative error code on failure.
+ */
+int drm_vblank_work_schedule(struct drm_vblank_work *work,
+			     u64 count, bool nextonmiss)
+{
+	return __drm_vblank_work_schedule(work, count, nextonmiss, true);
+}
 EXPORT_SYMBOL(drm_vblank_work_schedule);
 
+
+/**
+ * drm_vblank_work_schedule_disabled - schedule a vblank work, withoug enabling
+ * @work: vblank work to schedule
+ * @count: target vblank count
+ *
+ * Schedule @work for execution once the crtc vblank count reaches @count.
+ *
+ * The vblank work will not be scheduled until drm_vblank_work_enable() is called.
+ * If the crtc vblank count has already reached @count, the work will still
+ * not be scheduled until the first following vblank.
+ *
+ * If @work is already scheduled, this function will reschedule said work
+ * using the new @count. This can be used for self-rearming work items.
+ *
+ * Returns:
+ * %1 if @work was successfully (re)scheduled, %0 if it was either already
+ * scheduled or cancelled, or a negative error code on failure.
+ */
+int drm_vblank_work_schedule_disabled(struct drm_vblank_work *work, u64 count)
+{
+	return __drm_vblank_work_schedule(work, count, true, false);
+}
+EXPORT_SYMBOL(drm_vblank_work_schedule_disabled);
+
+/**
+ * drm_vblank_work_enable - enable vblank work
+ * @work: vblank work to enable
+ *
+ * This function is specifically only for when drm_vblank_work_schedule_disabled() is
+ * called. It allows for the work to be armed in any context, without any locks.
+ *
+ * The work will be signalled earliest at the @count argument, if it has been passed,
+ * it will signalled at the next vblank.
+ *
+ * This is particularly useful for PREEMPT_RT, where the spin_lock is converted
+ * into a sleeping rtmutex, and vblank evasion requires some work to be
+ * scheduled on completion with interrupts disabled.
+ */
+void drm_vblank_work_enable(struct drm_vblank_work *work)
+{
+	WARN_ON(work->armed);
+	WRITE_ONCE(work->armed, true);
+}
+EXPORT_SYMBOL(drm_vblank_work_enable);
+
 /**
  * drm_vblank_work_cancel_sync - cancel a vblank work and wait for it to
  * finish executing
diff --git a/include/drm/drm_vblank_work.h b/include/drm/drm_vblank_work.h
index e04d436b72973..e19351200da24 100644
--- a/include/drm/drm_vblank_work.h
+++ b/include/drm/drm_vblank_work.h
@@ -47,6 +47,14 @@ struct drm_vblank_work {
 	 */
 	int cancelling;
 
+	/**
+	 * @armed: If false, the work item has been added to the
+	 * drm_vblank_crtc.pending_work list, but will not yet be signalled.
+	 *
+	 * Call drm_vblank_work_enable() to fire on next vblank.
+	 */
+	bool armed;
+
 	/**
 	 * @node: The position of this work item in
 	 * &drm_vblank_crtc.pending_work.
@@ -64,6 +72,10 @@ struct drm_vblank_work {
 
 int drm_vblank_work_schedule(struct drm_vblank_work *work,
 			     u64 count, bool nextonmiss);
+
+int drm_vblank_work_schedule_disabled(struct drm_vblank_work *work, u64 count);
+void drm_vblank_work_enable(struct drm_vblank_work *work);
+
 void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc *crtc,
 			  void (*func)(struct kthread_work *work));
 bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work);
-- 
2.51.0

