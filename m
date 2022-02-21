Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F44BEDA4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E99910E437;
	Mon, 21 Feb 2022 23:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D5310E3EA;
 Mon, 21 Feb 2022 23:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645485456; x=1677021456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKcMNiYsgJWI/tUBCVHZc6qZhjqO+LBrBiPvfP3KNy0=;
 b=Q7Zc/O1rJdcRsruHVoF6RX3OFbjn0zggH100aOqCjccY3RHFDpAeEBKV
 wYIrOSUfZdSqXAdzTVgTP3KVi8FcVxc0jF7FUhOBDYnpnZ0+su1tFQtyM
 dz9huK0TacK4ByM6r0LEtg6iIfmktcMaagBOAtlJZDQuk3qeuueXfKbwC
 vZb9kuENHQK1JgQ9romWEACvFDgasdKREVVC5Zkr6uhAPMvHQFT+vLVRR
 YZfjCJjWExoj4Icz3mrXS/3Vauazy90KO+GwL6hcCsp/XiSU/9JrcoT+z
 AC72PmRXYalECLYZulz7C2UBi9A39dsN6zCc8QAJ70e8lcLnbwUSf29Qq w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="238995967"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="238995967"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="638694396"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:17:30 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH v2 2/9] lib/ref_tracker: compact stacktraces before printing
Date: Tue, 22 Feb 2022 00:16:47 +0100
Message-Id: <20220221231705.1481059-6-andrzej.hajda@intel.com>
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

In cases references are taken alternately on multiple exec paths leak
report can grow substantially, sorting and grouping leaks by stack_handle
allows to compact it.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Chris Wilson <chris.p.wilson@intel.com>
---
 lib/ref_tracker.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index 1b0c6d645d64a..0e9c7d2828ccb 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include <linux/export.h>
+#include <linux/list_sort.h>
 #include <linux/ref_tracker.h>
 #include <linux/slab.h>
 #include <linux/stacktrace.h>
@@ -14,23 +15,41 @@ struct ref_tracker {
 	depot_stack_handle_t	free_stack_handle;
 };
 
+static int ref_tracker_cmp(void *priv, const struct list_head *a, const struct list_head *b)
+{
+	const struct ref_tracker *ta = list_entry(a, const struct ref_tracker, head);
+	const struct ref_tracker *tb = list_entry(b, const struct ref_tracker, head);
+
+	return ta->alloc_stack_handle - tb->alloc_stack_handle;
+}
+
 void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
 			   unsigned int display_limit)
 {
+	unsigned int i = 0, count = 0;
 	struct ref_tracker *tracker;
-	unsigned int i = 0;
+	depot_stack_handle_t stack;
 
 	lockdep_assert_held(&dir->lock);
 
+	if (list_empty(&dir->list))
+		return;
+
+	list_sort(NULL, &dir->list, ref_tracker_cmp);
+
 	list_for_each_entry(tracker, &dir->list, head) {
-		if (i < display_limit) {
-			pr_err("leaked reference.\n");
-			if (tracker->alloc_stack_handle)
-				stack_depot_print(tracker->alloc_stack_handle);
-			i++;
-		} else {
+		if (i++ >= display_limit)
 			break;
-		}
+		if (!count++)
+			stack = tracker->alloc_stack_handle;
+		if (stack == tracker->alloc_stack_handle &&
+		    !list_is_last(&tracker->head, &dir->list))
+			continue;
+
+		pr_err("leaked %d references.\n", count);
+		if (stack)
+			stack_depot_print(stack);
+		count = 0;
 	}
 }
 EXPORT_SYMBOL(__ref_tracker_dir_print);
-- 
2.25.1

