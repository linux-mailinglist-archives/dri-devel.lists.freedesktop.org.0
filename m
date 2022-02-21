Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2AA4BEDAB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0809710E489;
	Mon, 21 Feb 2022 23:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA40510E4C4;
 Mon, 21 Feb 2022 23:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645485463; x=1677021463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ysWCOx8Qe0FgPrL7lCitOlIRN7GA/uTSmYciHcbFL0=;
 b=E5atYg51AyAZOv7HVW0+MOP4iBgpbKpLlSL4lVyJqeMAsjpAmQIsLAdc
 InPjpHI4ezQhWYK1RcfCqR1yc5yXlys7FNnLd1/QxBH2RFVgDcDbShRpN
 WyocrjmUdnL6qbo9dcDlclScXkJlcTNS7q/rnWQQt9N8CRIpcaWJwPrIH
 k7U4c8yXvTrGHDkNKBMmVx6Q5imOH5cQl1avTh0cev2EcGDzsAW+pKC1A
 6ttTChlts39sZ2KdcqH7S8c1mOsvAP8TI3/Le4TX/mqTzKIZYdUS5OXs5
 9vD6tso+fe8VkCm6xqxCh1RvXEnjbJyvCMk5YTXY2Zs0q25xR9c0SHnpk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="238995983"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="238995983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="638694447"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:40 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH v2 3/9] lib/ref_tracker: __ref_tracker_dir_print improve
 printing
Date: Tue, 22 Feb 2022 00:16:50 +0100
Message-Id: <20220221231705.1481059-9-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221231705.1481059-1-andrzej.hajda@intel.com>
References: <20220221231705.1481059-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To improve readibility of ref_tracker printing following changes
have been performed:
- added display name for ref_tracker_dir,
- stack trace is printed indented, in the same printk call,
- total number of references is printed every time,
- print info about dropped references.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Chris Wilson <chris.p.wilson@intel.com>
---
 include/linux/ref_tracker.h | 15 ++++++++++++---
 lib/ref_tracker.c           | 28 ++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index b9c968a716483..090230e5b485d 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -15,18 +15,26 @@ struct ref_tracker_dir {
 	refcount_t		untracked;
 	struct list_head	list; /* List of active trackers */
 	struct list_head	quarantine; /* List of dead trackers */
+	char			name[32];
 #endif
 };
 
 #ifdef CONFIG_REF_TRACKER
-static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
-					unsigned int quarantine_count)
+
+// Temporary allow two and three arguments, until consumers are converted
+#define ref_tracker_dir_init(_d, _q, args...) _ref_tracker_dir_init(_d, _q, ##args, #_d)
+#define _ref_tracker_dir_init(_d, _q, _n, ...) __ref_tracker_dir_init(_d, _q, _n)
+
+static inline void __ref_tracker_dir_init(struct ref_tracker_dir *dir,
+					unsigned int quarantine_count,
+					const char *name)
 {
 	INIT_LIST_HEAD(&dir->list);
 	INIT_LIST_HEAD(&dir->quarantine);
 	spin_lock_init(&dir->lock);
 	dir->quarantine_avail = quarantine_count;
 	refcount_set(&dir->untracked, 1);
+	strlcpy(dir->name, name, sizeof(dir->name));
 	stack_depot_init();
 }
 
@@ -47,7 +55,8 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 #else /* CONFIG_REF_TRACKER */
 
 static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
-					unsigned int quarantine_count)
+					unsigned int quarantine_count,
+					...)
 {
 }
 
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 0e9c7d2828ccb..943cff08110e3 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -1,4 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
+
+#define pr_fmt(fmt) "ref_tracker: " fmt
+
 #include <linux/export.h>
 #include <linux/list_sort.h>
 #include <linux/ref_tracker.h>
@@ -7,6 +10,7 @@
 #include <linux/stackdepot.h>
 
 #define REF_TRACKER_STACK_ENTRIES 16
+#define STACK_BUF_SIZE 1024
 
 struct ref_tracker {
 	struct list_head	head;   /* anchor into dir->list or dir->quarantine */
@@ -26,31 +30,43 @@ static int ref_tracker_cmp(void *priv, const struct list_head *a, const struct l
 void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
 			   unsigned int display_limit)
 {
-	unsigned int i = 0, count = 0;
+	unsigned int i = 0, count = 0, total = 0;
 	struct ref_tracker *tracker;
 	depot_stack_handle_t stack;
+	char *sbuf;
 
 	lockdep_assert_held(&dir->lock);
 
 	if (list_empty(&dir->list))
 		return;
 
+	sbuf = kmalloc(STACK_BUF_SIZE, GFP_NOWAIT);
+
+	list_for_each_entry(tracker, &dir->list, head)
+		++total;
+
 	list_sort(NULL, &dir->list, ref_tracker_cmp);
 
 	list_for_each_entry(tracker, &dir->list, head) {
-		if (i++ >= display_limit)
-			break;
 		if (!count++)
 			stack = tracker->alloc_stack_handle;
 		if (stack == tracker->alloc_stack_handle &&
 		    !list_is_last(&tracker->head, &dir->list))
 			continue;
+		if (i++ >= display_limit)
+			continue;
 
-		pr_err("leaked %d references.\n", count);
-		if (stack)
-			stack_depot_print(stack);
+		if (sbuf && !stack_depot_snprint(stack, sbuf, STACK_BUF_SIZE, 4))
+			sbuf[0] = 0;
+		pr_err("%s@%pK has %d/%d users at\n%s\n",
+		       dir->name, dir, count, total, sbuf);
 		count = 0;
 	}
+	if (i > display_limit)
+		pr_err("%s@%pK skipped %d/%d reports with %d unique stacks.\n",
+		       dir->name, dir, count, total, i - display_limit);
+
+	kfree(sbuf);
 }
 EXPORT_SYMBOL(__ref_tracker_dir_print);
 
-- 
2.25.1

