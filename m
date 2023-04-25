Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721916ED776
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 00:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEA910E61F;
	Mon, 24 Apr 2023 22:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0FD10E62A;
 Mon, 24 Apr 2023 22:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682373960; x=1713909960;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+ZibFYMqHwqO8S/LEJGbM8uCyH9WZlDakLl+Nlc+RJ0=;
 b=IIuOici5aMIJmKYbtYewRAo521zWzscZXplfUZWpt0hCNPTz8ZBTI59H
 4KdP7wt+Wosi64Vanh2HAvVU1JSF4bs7Uge56LKoozjDYww7eie/weCF4
 W+hBrnRpN/Jv7kP4f5dkD86Uuy9X+1MEy3mkHRZzMuoL9gtyjylXv65dj
 KQTTVAaMIz48p116MCr0Me4MnsE/miKcCa+wq41bZ+HWtI9JNqvaMBdo5
 3q5FghbZnmMoYHPjF+wIM6Jts0pf2bXmzP4M8PideXE/pJoZbVwhwqDCj
 +/ueDUIBitxam33Rv/QByEhNfHkjDDhoqlwtwDoNJxC5pPt+upflSmyUl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335473665"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="335473665"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 15:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939500122"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="939500122"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 15:05:56 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Apr 2023 00:05:39 +0200
Subject: [PATCH v8 2/7] lib/ref_tracker: improve printing stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-track_gt-v8-2-4b6517e61be6@intel.com>
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

In case the library is tracking busy subsystem, simply
printing stack for every active reference will spam log
with long, hard to read, redundant stack traces. To improve
readabilty following changes have been made:
- reports are printed per stack_handle - log is more compact,
- added display name for ref_tracker_dir - it will differentiate
  multiple subsystems,
- stack trace is printed indented, in the same printk call,
- info about dropped references is printed as well.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 include/linux/ref_tracker.h |  9 ++++-
 lib/ref_tracker.c           | 90 +++++++++++++++++++++++++++++++++++++++------
 lib/test_ref_tracker.c      |  2 +-
 net/core/dev.c              |  2 +-
 net/core/net_namespace.c    |  4 +-
 5 files changed, 90 insertions(+), 17 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 87a92f2bec1b88..19a69e7809d6c1 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -17,12 +17,15 @@ struct ref_tracker_dir {
 	bool			dead;
 	struct list_head	list; /* List of active trackers */
 	struct list_head	quarantine; /* List of dead trackers */
+	char			name[32];
 #endif
 };
 
 #ifdef CONFIG_REF_TRACKER
+
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
-					unsigned int quarantine_count)
+					unsigned int quarantine_count,
+					const char *name)
 {
 	INIT_LIST_HEAD(&dir->list);
 	INIT_LIST_HEAD(&dir->quarantine);
@@ -31,6 +34,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->dead = false;
 	refcount_set(&dir->untracked, 1);
 	refcount_set(&dir->no_tracker, 1);
+	strscpy(dir->name, name, sizeof(dir->name));
 	stack_depot_init();
 }
 
@@ -51,7 +55,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 #else /* CONFIG_REF_TRACKER */
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
-					unsigned int quarantine_count)
+					unsigned int quarantine_count,
+					const char *name)
 {
 }
 
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index d4eb0929af8f96..2ffe79c90c1771 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -1,11 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
+
+#define pr_fmt(fmt) "ref_tracker: " fmt
+
 #include <linux/export.h>
+#include <linux/list_sort.h>
 #include <linux/ref_tracker.h>
 #include <linux/slab.h>
 #include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
 
 #define REF_TRACKER_STACK_ENTRIES 16
+#define STACK_BUF_SIZE 1024
 
 struct ref_tracker {
 	struct list_head	head;   /* anchor into dir->list or dir->quarantine */
@@ -14,24 +19,87 @@ struct ref_tracker {
 	depot_stack_handle_t	free_stack_handle;
 };
 
-void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
-				  unsigned int display_limit)
+struct ref_tracker_dir_stats {
+	int total;
+	int count;
+	struct {
+		depot_stack_handle_t stack_handle;
+		unsigned int count;
+	} stacks[];
+};
+
+static struct ref_tracker_dir_stats *
+ref_tracker_get_stats(struct ref_tracker_dir *dir, unsigned int limit)
 {
+	struct ref_tracker_dir_stats *stats;
 	struct ref_tracker *tracker;
-	unsigned int i = 0;
 
-	lockdep_assert_held(&dir->lock);
+	stats = kmalloc(struct_size(stats, stacks, limit),
+			GFP_NOWAIT | __GFP_NOWARN);
+	if (!stats)
+		return ERR_PTR(-ENOMEM);
+	stats->total = 0;
+	stats->count = 0;
 
 	list_for_each_entry(tracker, &dir->list, head) {
-		if (i < display_limit) {
-			pr_err("leaked reference.\n");
-			if (tracker->alloc_stack_handle)
-				stack_depot_print(tracker->alloc_stack_handle);
-			i++;
-		} else {
-			break;
+		depot_stack_handle_t stack = tracker->alloc_stack_handle;
+		int i;
+
+		++stats->total;
+		for (i = 0; i < stats->count; ++i)
+			if (stats->stacks[i].stack_handle == stack)
+				break;
+		if (i >= limit)
+			continue;
+		if (i >= stats->count) {
+			stats->stacks[i].stack_handle = stack;
+			stats->stacks[i].count = 0;
+			++stats->count;
 		}
+		++stats->stacks[i].count;
+	}
+
+	return stats;
+}
+
+void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
+				  unsigned int display_limit)
+{
+	struct ref_tracker_dir_stats *stats;
+	unsigned int i = 0, skipped;
+	depot_stack_handle_t stack;
+	char *sbuf;
+
+	lockdep_assert_held(&dir->lock);
+
+	if (list_empty(&dir->list))
+		return;
+
+	stats = ref_tracker_get_stats(dir, display_limit);
+	if (IS_ERR(stats)) {
+		pr_err("%s@%pK: couldn't get stats, error %pe\n",
+		       dir->name, dir, stats);
+		return;
 	}
+
+	sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT | __GFP_NOWARN);
+
+	for (i = 0, skipped = stats->total; i < stats->count; ++i) {
+		stack = stats->stacks[i].stack_handle;
+		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
+			sbuf[0] = 0;
+		pr_err("%s@%pK has %d/%d users at\n%s\n", dir->name, dir,
+		       stats->stacks[i].count, stats->total, sbuf);
+		skipped -= stats->stacks[i].count;
+	}
+
+	if (skipped)
+		pr_err("%s@%pK skipped reports about %d/%d users.\n",
+		       dir->name, dir, skipped, stats->total);
+
+	kfree(sbuf);
+
+	kfree(stats);
 }
 EXPORT_SYMBOL(ref_tracker_dir_print_locked);
 
diff --git a/lib/test_ref_tracker.c b/lib/test_ref_tracker.c
index 19d7dec70cc62f..49970a7c96f3f4 100644
--- a/lib/test_ref_tracker.c
+++ b/lib/test_ref_tracker.c
@@ -64,7 +64,7 @@ static int __init test_ref_tracker_init(void)
 {
 	int i;
 
-	ref_tracker_dir_init(&ref_dir, 100);
+	ref_tracker_dir_init(&ref_dir, 100, "selftest");
 
 	timer_setup(&test_ref_tracker_timer, test_ref_tracker_timer_func, 0);
 	mod_timer(&test_ref_tracker_timer, jiffies + 1);
diff --git a/net/core/dev.c b/net/core/dev.c
index 1488f700bf819a..cd0de2bca949b8 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10592,7 +10592,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 	dev = PTR_ALIGN(p, NETDEV_ALIGN);
 	dev->padded = (char *)dev - (char *)p;
 
-	ref_tracker_dir_init(&dev->refcnt_tracker, 128);
+	ref_tracker_dir_init(&dev->refcnt_tracker, 128, name);
 #ifdef CONFIG_PCPU_DEV_REFCNT
 	dev->pcpu_refcnt = alloc_percpu(int);
 	if (!dev->pcpu_refcnt)
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index 7b69cf882b8efd..67f65dd3bb674c 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -307,7 +307,7 @@ EXPORT_SYMBOL_GPL(get_net_ns_by_id);
 /* init code that must occur even if setup_net() is not called. */
 static __net_init void preinit_net(struct net *net)
 {
-	ref_tracker_dir_init(&net->notrefcnt_tracker, 128);
+	ref_tracker_dir_init(&net->notrefcnt_tracker, 128, "net notrefcnt");
 }
 
 /*
@@ -321,7 +321,7 @@ static __net_init int setup_net(struct net *net, struct user_namespace *user_ns)
 	LIST_HEAD(net_exit_list);
 
 	refcount_set(&net->ns.count, 1);
-	ref_tracker_dir_init(&net->refcnt_tracker, 128);
+	ref_tracker_dir_init(&net->refcnt_tracker, 128, "net refcnt");
 
 	refcount_set(&net->passive, 1);
 	get_random_bytes(&net->hash_mix, sizeof(u32));

-- 
2.34.1
