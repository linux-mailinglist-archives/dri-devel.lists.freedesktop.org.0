Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DBD4BA266
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FA010EB76;
	Thu, 17 Feb 2022 14:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E2C10EB6C;
 Thu, 17 Feb 2022 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645106703; x=1676642703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKcMNiYsgJWI/tUBCVHZc6qZhjqO+LBrBiPvfP3KNy0=;
 b=Rdr7oD5fucqmvCKf9n+x03YsThJVn6pxYB0EF0S5ndi2Lu9R7m7DirYy
 1Ah7Oeyy/mX5l3XOr+8AXgmYPzf2/yvmlh6BCSBPFstTH0hFqcCAVtX6n
 rsgLph2pus4qRzT+NLlULMB+MpnDmEz5M3EPtyUP7lkZoxX272fkMOKQo
 E+nAVZtPMPHuk9V4sXUW1DVURDP5eRRAj7Yq4yK4mtE1eHQ7VoHKjMNB7
 EZqOlaeuMkZVT2wnKbOuJik5GUD60uARFqLS51bheyr6FYyHgDuFu1PpO
 NLmhAFNYbOFkfwjNccH6xLqX957giYdkrSJcmQ/zgP2xUqbDkgn/FSQbA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230840810"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230840810"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:05:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="530241142"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:04:59 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH 2/9] lib/ref_tracker: compact stacktraces before printing
Date: Thu, 17 Feb 2022 15:04:34 +0100
Message-Id: <20220217140441.1218045-3-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217140441.1218045-1-andrzej.hajda@intel.com>
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
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

