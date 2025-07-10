Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB25B0015B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB7E10E8AE;
	Thu, 10 Jul 2025 12:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/9sgvrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811D010E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752149746; x=1783685746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eOwThlANCOdcD4JdvjuBEkZYTVcOWjZCsg6qjRDsT7Q=;
 b=Y/9sgvrppO0n9mPO07JJZSEZVz6H81i60WjTX8NVTQ1TYgN+9/dfJgN+
 HoG96caYIYlh4/9N0p0JN30B6czxpjPceAsSROWuvwGnMhPZKUgSQN9sP
 W65tT+Wb/iPNDYYZB3HOTN3Bf8usAJl/rydZP7yKtQHGuhesgyAOmUjUu
 z2hwuGVExp4fdHYn3E/7C6CPKEMBxJtrMyixV4LexBCaPGC+jGdewgwcL
 fL49wopMLOiN0igzDYy9HWeKCcpNY2XsKF/6tq3B9DVuHyfoa+3fOXhzh
 n5Yp2NSzZP45U0pKhXDW2u6q1ZgB8j85NIMC3FMGoiGwB+NT7NrPsrmQN w==;
X-CSE-ConnectionGUID: JdORSztlRkGtZcJNpeyAvg==
X-CSE-MsgGUID: UibroQqlRrWxyfZUxgkOeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79863806"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="79863806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:15:45 -0700
X-CSE-ConnectionGUID: lMGZMBSDTzOGy5kt8u7kaw==
X-CSE-MsgGUID: q+wQXCrxTPiICMssF2/A4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156535086"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP; 10 Jul 2025 05:15:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0D2871C9; Thu, 10 Jul 2025 15:15:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Maarten Lankhorst <dev@lankhorst.se>, Natalie Vock <natalie.vock@gmx.de>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Subject: [PATCH v1 1/1] rculist: move list_for_each_rcu() to where it belongs
Date: Thu, 10 Jul 2025 15:15:28 +0300
Message-ID: <20250710121528.780875-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

The list_for_each_rcu() relies on the rcu_dereference() API which is not
provided by the list.h. At the same time list.h is a low-level basic header
that must not have dependencies like RCU, besides the fact of the potential
circular dependencies in some cases. With all that said, move RCU related
API to the rculist.h where it belongs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/list.h    | 10 ----------
 include/linux/rculist.h | 10 ++++++++++
 kernel/cgroup/dmem.c    |  1 +
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/linux/list.h b/include/linux/list.h
index e7e28afd28f8..e7bdad9b8618 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -686,16 +686,6 @@ static inline void list_splice_tail_init(struct list_head *list,
 #define list_for_each(pos, head) \
 	for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
 
-/**
- * list_for_each_rcu - Iterate over a list in an RCU-safe fashion
- * @pos:	the &struct list_head to use as a loop cursor.
- * @head:	the head for your list.
- */
-#define list_for_each_rcu(pos, head)		  \
-	for (pos = rcu_dereference((head)->next); \
-	     !list_is_head(pos, (head)); \
-	     pos = rcu_dereference(pos->next))
-
 /**
  * list_for_each_continue - continue iteration over a list
  * @pos:	the &struct list_head to use as a loop cursor.
diff --git a/include/linux/rculist.h b/include/linux/rculist.h
index 1b11926ddd47..2abba7552605 100644
--- a/include/linux/rculist.h
+++ b/include/linux/rculist.h
@@ -42,6 +42,16 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
  */
 #define list_bidir_prev_rcu(list) (*((struct list_head __rcu **)(&(list)->prev)))
 
+/**
+ * list_for_each_rcu - Iterate over a list in an RCU-safe fashion
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @head:	the head for your list.
+ */
+#define list_for_each_rcu(pos, head)		  \
+	for (pos = rcu_dereference((head)->next); \
+	     !list_is_head(pos, (head)); \
+	     pos = rcu_dereference(pos->next))
+
 /**
  * list_tail_rcu - returns the prev pointer of the head of the list
  * @head: the head of the list
diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 10b63433f057..e12b946278b6 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/page_counter.h>
 #include <linux/parser.h>
+#include <linux/rculist.h>
 #include <linux/slab.h>
 
 struct dmem_cgroup_region {
-- 
2.47.2

