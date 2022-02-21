Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1B94BEDB1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D1D10E520;
	Mon, 21 Feb 2022 23:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1FF10E50C;
 Mon, 21 Feb 2022 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645485473; x=1677021473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tQY4mR2KDwyrHcJb7GxZeyIMhFFAwu7Cvbv8/dkN8c0=;
 b=QfhJPG3XQrsENJ6Ab4usoaF9vDm5kIFUoesn62gbybpdATkTvsIlSI18
 YR56q7vnmNSbzPW55sWqH8ivLCsZBHxveFpqKZbKmZzGB7yq85uqqpPGf
 0xj6iX2pzb4reQ8XhnXf3beVdq+Lj7iasaJXrCNMGB8DkAYc6/rouv0il
 5VH/vAqip9UxTa4F61VWFLcx4wDK6Pu6cSIUteyIq5uo/4zhc/Zzmox8n
 +VfmfYBE9Os+F1fiZCobzsBkYgh7Ku0gbXKeqxKGonP/zavVDkCMHPQqU
 nIq1IdjqXd6bD7WaVGV59O4IWhGQwP82PaFhWkSuOWdMvL8U2JKb5bO1I A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="238996001"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="238996001"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="638694491"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:50 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH v2 04/11] lib/ref_tracker: add unlocked leak print helper
Date: Tue, 22 Feb 2022 00:16:53 +0100
Message-Id: <20220221231705.1481059-12-andrzej.hajda@intel.com>
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

To have reliable detection of leaks, caller must be able to check under the same
lock both: tracked counter and the leaks. dir.lock is natural candidate for such
lock and unlocked print helper can be called with this lock taken.
As a bonus we can reuse this helper in ref_tracker_dir_exit.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Chris Wilson <chris.p.wilson@intel.com>
---
 include/linux/ref_tracker.h |  8 +++++
 lib/ref_tracker.c           | 66 +++++++++++++++++++++----------------
 2 files changed, 46 insertions(+), 28 deletions(-)

diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
index 9ca353ab712b5..3e9e9df2a41f5 100644
--- a/include/linux/ref_tracker.h
+++ b/include/linux/ref_tracker.h
@@ -36,6 +36,9 @@ static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
 
 void ref_tracker_dir_exit(struct ref_tracker_dir *dir);
 
+void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
+			   unsigned int display_limit);
+
 void ref_tracker_dir_print(struct ref_tracker_dir *dir,
 			   unsigned int display_limit);
 
@@ -56,6 +59,11 @@ static inline void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
 {
 }
 
+static inline void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
+					   unsigned int display_limit)
+{
+}
+
 static inline void ref_tracker_dir_print(struct ref_tracker_dir *dir,
 					 unsigned int display_limit)
 {
diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index dc7b14aa3431e..5e9f90bbf771b 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -14,6 +14,38 @@ struct ref_tracker {
 	depot_stack_handle_t	free_stack_handle;
 };
 
+void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
+			   unsigned int display_limit)
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
+EXPORT_SYMBOL(__ref_tracker_dir_print);
+
+void ref_tracker_dir_print(struct ref_tracker_dir *dir,
+			   unsigned int display_limit)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&dir->lock, flags);
+	__ref_tracker_dir_print(dir, display_limit);
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
+		__ref_tracker_dir_print(dir, 16);
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
2.25.1

