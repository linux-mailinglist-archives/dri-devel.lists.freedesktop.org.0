Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079056CC59E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82D810E945;
	Tue, 28 Mar 2023 15:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A688C10E91C;
 Tue, 28 Mar 2023 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680016553; x=1711552553;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=kEFDoIdEQUaoXtYqPzYKibOwd36nmghIfH3/F6UGSm4=;
 b=KnMPlv+4CVuAguuHqEjFNa+1kPGyhnS0f7d65/lJfYgOSRGoBcbfgpdB
 CD95dwg2OPweqZl18q/aCndxdyshKsp5bR8MPjQU+KqrJ4qcW/OPuO5mp
 VbnNbb1sBP7ogWUC35A/Jikf65Wr5cSZwfiwUXclz5J5NMbu3vSjrSrwr
 CEA1u6lAffVNnLTLhBpgqrve+bZUXD/ZEZDSvx0anq3RvLBbkuEbLGVKk
 UjAaNG5GONS9QY8SFZr3KUvWcL0PucZE41lxwUByMdjUhIcZJqUvcLkDK
 Zq3LCc3bSmPSl9eaAUB9mr8/B8vSkb8XUAzijwaQOwzMp7DA3SnpqQkO7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403208642"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="403208642"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 08:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773181756"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="773181756"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 08:15:50 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 28 Mar 2023 17:15:25 +0200
Subject: [PATCH v5 2/8] lib/ref_tracker: improve printing stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-track_gt-v5-2-77be86f2c872@intel.com>
References: <20230224-track_gt-v5-0-77be86f2c872@intel.com>
In-Reply-To: <20230224-track_gt-v5-0-77be86f2c872@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Eric Dumazet <edumazet@google.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Vyukov <dvyukov@google.com>
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
---
 include/linux/ref_tracker.h | 15 ++++++--
 lib/ref_tracker.c           | 90 +++++++++++++++++++++++++++++++++++++++------
 2 files changed, 91 insertions(+), 14 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 87a92f2bec1b88..fc9ef9952f01fd 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -17,12 +17,19 @@ struct ref_tracker_dir {
 	bool			dead;
 	struct list_head	list; /* List of active trackers */
 	struct list_head	quarantine; /* List of dead trackers */
+	char			name[32];
 #endif
 };
 
 #ifdef CONFIG_REF_TRACKER
-static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
-					unsigned int quarantine_count)
+
+/* Temporary allow two and three arguments, until consumers are converted */
+#define ref_tracker_dir_init(_d, _q, args...) _ref_tracker_dir_init(_d, _q, ##args, #_d)
+#define _ref_tracker_dir_init(_d, _q, _n, ...) __ref_tracker_dir_init(_d, _q, _n)
+
+static inline void __ref_tracker_dir_init(struct ref_tracker_dir *dir,
+					unsigned int quarantine_count,
+					const char *name)
 {
 	INIT_LIST_HEAD(&dir->list);
 	INIT_LIST_HEAD(&dir->quarantine);
@@ -31,6 +38,7 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 	dir->dead = false;
 	refcount_set(&dir->untracked, 1);
 	refcount_set(&dir->no_tracker, 1);
+	strlcpy(dir->name, name, sizeof(dir->name));
 	stack_depot_init();
 }
 
@@ -51,7 +59,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 #else /* CONFIG_REF_TRACKER */
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
-					unsigned int quarantine_count)
+					unsigned int quarantine_count,
+					...)
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
 

-- 
2.34.1
