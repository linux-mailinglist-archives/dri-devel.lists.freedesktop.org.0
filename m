Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5966ED771
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 00:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FCD10E61E;
	Mon, 24 Apr 2023 22:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDEA10E61E;
 Mon, 24 Apr 2023 22:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682373959; x=1713909959;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mqfual4qhwBGATemiquiJwy5ApxQS+xFr1kM/b4gHaA=;
 b=Zcpfd0u+ta+PH5r5XCi5iApguNK95Nd/TRSBqqyiQ+c3QSeZr52BTrWD
 4esE/MavDyFV5qosgWC+KNqHGmqToJ2N+JOKNpsKs7AYnAGPOCo4GUDs4
 wh4LNg4k1IXLmp9dcWOr1IXxDti3YVV/gpKYrT3CsyVpz+57HLzg+Avdi
 A2RwjwR/ZVwHc0bYubNa92IjdQi7bZ2EltQNpSgUq9oYIONtGQVvtxDmJ
 5msjfE6iR1QohDNVMH3cFSm6DdACVtSm6uReZxl2FsDU/Bl2wrUt7HOFf
 GXQBBKP0dXxdWQZklKYj81glqXEAFCUBQmQ4InUDSGGGiHLXCZl2TBZt3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335473644"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="335473644"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 15:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939500112"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="939500112"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 15:05:53 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Apr 2023 00:05:38 +0200
Subject: [PATCH v8 1/7] lib/ref_tracker: add unlocked leak print helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-track_gt-v8-1-4b6517e61be6@intel.com>
References: <20230224-track_gt-v8-0-4b6517e61be6@intel.com>
In-Reply-To: <20230224-track_gt-v8-0-4b6517e61be6@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Dumazet <edumazet@google.com>
X-Mailer: b4 0.11.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To have reliable detection of leaks, caller must be able to check under
the same lock both: tracked counter and the leaks. dir.lock is natural
candidate for such lock and unlocked print helper can be called with this
lock taken.
As a bonus we can reuse this helper in ref_tracker_dir_exit.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
 include/linux/ref_tracker.h |  8 ++++++
 lib/ref_tracker.c           | 66 ++++++++++++++++++++++++++-------------------
 2 files changed, 46 insertions(+), 28 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 9ca353ab712b5e..87a92f2bec1b88 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -36,6 +36,9 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 
 void ref_tracker_dir_exit(struct ref_tracker_dir *dir);
 
+void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
+				  unsigned int display_limit);
+
 void ref_tracker_dir_print(struct ref_tracker_dir *dir,
 			   unsigned int display_limit);
 
@@ -56,6 +59,11 @@ static inline void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 {
 }
 
+static inline void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
+						unsigned int display_limit)
+{
+}
+
 static inline void ref_tracker_dir_print(struct ref_tracker_dir *dir,
 					 unsigned int display_limit)
 {
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index dc7b14aa3431e2..d4eb0929af8f96 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -14,6 +14,38 @@ struct ref_tracker {
 	depot_stack_handle_t	free_stack_handle;
 };
 
+void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
+				  unsigned int display_limit)
+{
+	struct ref_tracker *tracker;
+	unsigned int i = 0;
+
+	lockdep_assert_held(&dir->lock);
+
+	list_for_each_entry(tracker, &dir->list, head) {
+		if (i < display_limit) {
+			pr_err("leaked reference.\n");
+			if (tracker->alloc_stack_handle)
+				stack_depot_print(tracker->alloc_stack_handle);
+			i++;
+		} else {
+			break;
+		}
+	}
+}
+EXPORT_SYMBOL(ref_tracker_dir_print_locked);
+
+void ref_tracker_dir_print(struct ref_tracker_dir *dir,
+			   unsigned int display_limit)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&dir->lock, flags);
+	ref_tracker_dir_print_locked(dir, display_limit);
+	spin_unlock_irqrestore(&dir->lock, flags);
+}
+EXPORT_SYMBOL(ref_tracker_dir_print);
+
 void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 {
 	struct ref_tracker *tracker, *n;
@@ -27,13 +59,13 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 		kfree(tracker);
 		dir->quarantine_avail++;
 	}
-	list_for_each_entry_safe(tracker, n, &dir->list, head) {
-		pr_err("leaked reference.\n");
-		if (tracker->alloc_stack_handle)
-			stack_depot_print(tracker->alloc_stack_handle);
+	if (!list_empty(&dir->list)) {
+		ref_tracker_dir_print_locked(dir, 16);
 		leak = true;
-		list_del(&tracker->head);
-		kfree(tracker);
+		list_for_each_entry_safe(tracker, n, &dir->list, head) {
+			list_del(&tracker->head);
+			kfree(tracker);
+		}
 	}
 	spin_unlock_irqrestore(&dir->lock, flags);
 	WARN_ON_ONCE(leak);
@@ -42,28 +74,6 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 }
 EXPORT_SYMBOL(ref_tracker_dir_exit);
 
-void ref_tracker_dir_print(struct ref_tracker_dir *dir,
-			   unsigned int display_limit)
-{
-	struct ref_tracker *tracker;
-	unsigned long flags;
-	unsigned int i = 0;
-
-	spin_lock_irqsave(&dir->lock, flags);
-	list_for_each_entry(tracker, &dir->list, head) {
-		if (i < display_limit) {
-			pr_err("leaked reference.\n");
-			if (tracker->alloc_stack_handle)
-				stack_depot_print(tracker->alloc_stack_handle);
-			i++;
-		} else {
-			break;
-		}
-	}
-	spin_unlock_irqrestore(&dir->lock, flags);
-}
-EXPORT_SYMBOL(ref_tracker_dir_print);
-
 int ref_tracker_alloc(struct ref_tracker_dir *dir,
 		      struct ref_tracker **trackerp,
 		      gfp_t gfp)

-- 
2.34.1
