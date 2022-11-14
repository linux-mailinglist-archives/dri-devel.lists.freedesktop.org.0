Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FED628502
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 17:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664E610E2E7;
	Mon, 14 Nov 2022 16:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AFD10E2F0;
 Mon, 14 Nov 2022 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668442929; x=1699978929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=42wLHufKcTQDWt2yx4w3/+GC/vlLxKREtDgJtLik068=;
 b=g2pCg9GnfdIDkJRomS9DpHTJjmehllPP7SbhqMzJP7MRk+8WEtwczpAf
 hWq5XevRIhq2McRMhgMSDWMfIatoR5sFB2po43RyKPWD7TCnIvfe+uIVI
 U1IN+EIXSPXpzjSnuTGKUoEjqYgJpQoPDNWLZDGKO08K3O5538w6fRP1M
 Y9b43YU84Hld4Q4TLCAb8XMNfjZD/m4q2rceUBenOHO7rJ/gryQfvEHk5
 KHWUkN2ZxOE0XXtS4fu3W7bCDpGASjAotgn7XXzm2zzlYe4F5Fu5pEPTW
 jr2tHffAUx31na/PKTDtM2JpAlWFjPhOH3UJUrok/SZq6LLvnuEalhBDG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="299531493"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="299531493"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="616372365"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="616372365"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Nov 2022 08:21:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A79732F3; Mon, 14 Nov 2022 18:22:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 1/4] i915: Move list_count() to list.h for broader use
Date: Mon, 14 Nov 2022 18:22:04 +0200
Message-Id: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kevin Cernekee <cernekee@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of the existing users, and definitely will be new ones, want to
count existing nodes in the list. Provide a generic API for that by
moving code from i915 to list.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: dropped the duplicate code in i915 (LKP)
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +------------
 include/linux/list.h                      | 13 +++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 6ae8b07cfaa1..b5d474be564d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2085,17 +2085,6 @@ static void print_request_ring(struct drm_printer *m, struct i915_request *rq)
 	}
 }
 
-static unsigned long list_count(struct list_head *list)
-{
-	struct list_head *pos;
-	unsigned long count = 0;
-
-	list_for_each(pos, list)
-		count++;
-
-	return count;
-}
-
 static unsigned long read_ul(void *p, size_t x)
 {
 	return *(unsigned long *)(p + x);
@@ -2270,7 +2259,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 	engine_dump_active_requests(engine, m);
 
-	drm_printf(m, "\tOn hold?: %lu\n",
+	drm_printf(m, "\tOn hold?: %zu\n",
 		   list_count(&engine->sched_engine->hold));
 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 
diff --git a/include/linux/list.h b/include/linux/list.h
index 61762054b4be..098eccf8c1b6 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -655,6 +655,19 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     !list_is_head(pos, (head)); \
 	     pos = n, n = pos->prev)
 
+/**
+ * list_count - count nodes in the list
+ * @head:	the head for your list.
+ */
+#define list_count(head)		\
+({					\
+	struct list_head *__tmp;	\
+	size_t __i = 0;			\
+	list_for_each(__tmp, head)	\
+		__i++;			\
+	__i;				\
+})
+
 /**
  * list_entry_is_head - test if the entry points to the head of the list
  * @pos:	the type * to cursor
-- 
2.35.1

