Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052011A4F8B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 13:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F836E2E8;
	Sat, 11 Apr 2020 11:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1F06E2E8;
 Sat, 11 Apr 2020 11:39:48 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CD7D20673;
 Sat, 11 Apr 2020 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586605188;
 bh=M7V5A8QK48VN23yNQaiCbyRoZ/OW7lWBsyjfM7+h1UI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=PgEvBYY51bij94omsMeZUHvn+rsbMkHv1LNHx6fFFNKQEQnraVAZW+W4DnwfWdI+m
 i5vNuMvgBwBiR4cBUIevsEkPn6sSeNpHchTx2DRfv4faAeMyN67dxnX+7Pnv1Cz1Ij
 n9spG31txQeH6ecri7rZhvJegYnDUnUlEWs0GVNg=
Subject: Patch "drm/i915: Fix ref->mutex deadlock in i915_active_wait()" has
 been added to the 5.4-stable tree
To: airlied@linux.ie, chris@chris-wilson.co.uk, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, greg@kroah.com, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 sultan@kerneltoast.com
From: <gregkh@linuxfoundation.org>
Date: Sat, 11 Apr 2020 13:39:46 +0200
In-Reply-To: <20200407203222.2493-1-sultan@kerneltoast.com>
Message-ID: <1586605186111105@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/i915: Fix ref->mutex deadlock in i915_active_wait()

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-i915-fix-ref-mutex-deadlock-in-i915_active_wait.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From sultan@kerneltoast.com  Sat Apr 11 13:39:11 2020
From: Sultan Alsawaf <sultan@kerneltoast.com>
Date: Tue,  7 Apr 2020 13:32:22 -0700
Subject: drm/i915: Fix ref->mutex deadlock in i915_active_wait()
To: stable@vger.kernel.org
Cc: Greg KH <greg@kroah.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Sultan Alsawaf <sultan@kerneltoast.com>
Message-ID: <20200407203222.2493-1-sultan@kerneltoast.com>

From: Sultan Alsawaf <sultan@kerneltoast.com>

The following deadlock exists in i915_active_wait() due to a double lock
on ref->mutex (call chain listed in order from top to bottom):
 i915_active_wait();
 mutex_lock_interruptible(&ref->mutex); <-- ref->mutex first acquired
 i915_active_request_retire();
 node_retire();
 active_retire();
 mutex_lock_nested(&ref->mutex, SINGLE_DEPTH_NESTING); <-- DEADLOCK

Fix the deadlock by skipping the second ref->mutex lock when
active_retire() is called through i915_active_request_retire().

Note that this bug only affects 5.4 and has since been fixed in 5.5.
Normally, a backport of the fix from 5.5 would be in order, but the
patch set that fixes this deadlock involves massive changes that are
neither feasible nor desirable for backporting [1][2][3]. Therefore,
this small patch was made to address the deadlock specifically for 5.4.

[1] 274cbf20fd10 ("drm/i915: Push the i915_active.retire into a worker")
[2] 093b92287363 ("drm/i915: Split i915_active.mutex into an irq-safe spinlock for the rbtree")
[3] 750bde2fd4ff ("drm/i915: Serialise with remote retirement")

Fixes: 12c255b5dad1 ("drm/i915: Provide an i915_active.acquire callback")
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/i915/i915_active.c |   29 +++++++++++++++++++----------
 drivers/gpu/drm/i915/i915_active.h |    4 ++--
 2 files changed, 21 insertions(+), 12 deletions(-)

--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -121,7 +121,7 @@ static inline void debug_active_assert(s
 #endif
 
 static void
-__active_retire(struct i915_active *ref)
+__active_retire(struct i915_active *ref, bool lock)
 {
 	struct active_node *it, *n;
 	struct rb_root root;
@@ -138,7 +138,8 @@ __active_retire(struct i915_active *ref)
 		retire = true;
 	}
 
-	mutex_unlock(&ref->mutex);
+	if (likely(lock))
+		mutex_unlock(&ref->mutex);
 	if (!retire)
 		return;
 
@@ -153,21 +154,28 @@ __active_retire(struct i915_active *ref)
 }
 
 static void
-active_retire(struct i915_active *ref)
+active_retire(struct i915_active *ref, bool lock)
 {
 	GEM_BUG_ON(!atomic_read(&ref->count));
 	if (atomic_add_unless(&ref->count, -1, 1))
 		return;
 
 	/* One active may be flushed from inside the acquire of another */
-	mutex_lock_nested(&ref->mutex, SINGLE_DEPTH_NESTING);
-	__active_retire(ref);
+	if (likely(lock))
+		mutex_lock_nested(&ref->mutex, SINGLE_DEPTH_NESTING);
+	__active_retire(ref, lock);
 }
 
 static void
 node_retire(struct i915_active_request *base, struct i915_request *rq)
 {
-	active_retire(node_from_active(base)->ref);
+	active_retire(node_from_active(base)->ref, true);
+}
+
+static void
+node_retire_nolock(struct i915_active_request *base, struct i915_request *rq)
+{
+	active_retire(node_from_active(base)->ref, false);
 }
 
 static struct i915_active_request *
@@ -364,7 +372,7 @@ int i915_active_acquire(struct i915_acti
 void i915_active_release(struct i915_active *ref)
 {
 	debug_active_assert(ref);
-	active_retire(ref);
+	active_retire(ref, true);
 }
 
 static void __active_ungrab(struct i915_active *ref)
@@ -391,7 +399,7 @@ void i915_active_ungrab(struct i915_acti
 {
 	GEM_BUG_ON(!test_bit(I915_ACTIVE_GRAB_BIT, &ref->flags));
 
-	active_retire(ref);
+	active_retire(ref, true);
 	__active_ungrab(ref);
 }
 
@@ -421,12 +429,13 @@ int i915_active_wait(struct i915_active
 			break;
 		}
 
-		err = i915_active_request_retire(&it->base, BKL(ref));
+		err = i915_active_request_retire(&it->base, BKL(ref),
+						 node_retire_nolock);
 		if (err)
 			break;
 	}
 
-	__active_retire(ref);
+	__active_retire(ref, true);
 	if (err)
 		return err;
 
--- a/drivers/gpu/drm/i915/i915_active.h
+++ b/drivers/gpu/drm/i915/i915_active.h
@@ -309,7 +309,7 @@ i915_active_request_isset(const struct i
  */
 static inline int __must_check
 i915_active_request_retire(struct i915_active_request *active,
-			   struct mutex *mutex)
+			   struct mutex *mutex, i915_active_retire_fn retire)
 {
 	struct i915_request *request;
 	long ret;
@@ -327,7 +327,7 @@ i915_active_request_retire(struct i915_a
 	list_del_init(&active->link);
 	RCU_INIT_POINTER(active->request, NULL);
 
-	active->retire(active, request);
+	retire(active, request);
 
 	return 0;
 }


Patches currently in stable-queue which might be from sultan@kerneltoast.com are

queue-5.4/drm-i915-fix-ref-mutex-deadlock-in-i915_active_wait.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
