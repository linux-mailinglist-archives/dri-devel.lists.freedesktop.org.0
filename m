Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988732C44EF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 17:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9648F6EA22;
	Wed, 25 Nov 2020 16:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2DD6EA18
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 16:25:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w24so2705221wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 08:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNSb6Wp1AZE4VV1tRwOeD55taeEGpBqVtqBoZlJ/7FM=;
 b=QMYNGEeA4YfhfQORAYeqBZnZcsSUcenw0mAE059wCrKDDwvxV6pkAgR4/U23dLWec0
 RevBzZUbIN+mA+zBM07VEiG7Y25QELLdsH60N6ottEwiWDuwJQpLTRsg7/QipBmILxir
 xUhl44+qhKqBTkmVewpxVXpAPVi4yZQtwpPgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNSb6Wp1AZE4VV1tRwOeD55taeEGpBqVtqBoZlJ/7FM=;
 b=INnt5QFebaIFwUi+l2NOwwTz4uMglUaEfKqqL+1GGCMatirqruMJLtfwZc97d67bRW
 pg/vgl6KYNdv7cgEh785ERjn8yIp9xCNz8yH/0ufbMsMcf9kY8tqAG+YixL9+vUWoQpW
 vKirhyAwfjYLcktKsrsp6VoMPYqxwdp9Q9AO2oSJWVkmpt8dijY2krFz2TYy4cNqHE7t
 9dcW5IOZLTHP6jrMdadDJ2KWt5cO9n2MozKt4+LGbfLCS/aJWAfEZDo9sD3+1WrBw5Fx
 AQWaNkQYPMaILoS4rskHgYSQ6GpXAeu+VZRGcLcRQm/fW2Y41NDYqSNEf/0yV3OvO1BQ
 SrSg==
X-Gm-Message-State: AOAM531eJ+gHbLLoPnf28GrgyvobXw2qDb6D7JMzpZZcHhw1QpBGkF55
 HQFidBwUo1oD9JeQhmH88B5MD6++ocjt9Q==
X-Google-Smtp-Source: ABdhPJy7GHHP/Ip7I6Y1Tn4QI7dFjHyZUmuEZ7U3OT2GK1eKINNZ3obuKDnLln9NKOQlPoUBDiVX7A==
X-Received: by 2002:a1c:6209:: with SMTP id w9mr4886901wmb.120.1606321541410; 
 Wed, 25 Nov 2020 08:25:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a21sm4855187wmb.38.2020.11.25.08.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 08:25:40 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 2/3] mm: Extract might_alloc() debug check
Date: Wed, 25 Nov 2020 17:25:30 +0100
Message-Id: <20201125162532.1299794-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
References: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Christoph Lameter <cl@linux.com>,
 Michel Lespinasse <walken@google.com>, Ingo Molnar <mingo@kernel.org>,
 linux-xfs@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>,
 linux-fsdevel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extracted from slab.h, which seems to have the most complete version
including the correct might_sleep() check. Roll it out to slob.c.

Motivated by a discussion with Paul about possibly changing call_rcu
behaviour to allocate memory, but only roughly every 500th call.

There are a lot fewer places in the kernel that care about whether
allocating memory is allowed or not (due to deadlocks with reclaim
code) than places that care whether sleeping is allowed. But debugging
these also tends to be a lot harder, so nice descriptive checks could
come in handy. I might have some use eventually for annotations in
drivers/gpu.

Note that unlike fs_reclaim_acquire/release gfpflags_allow_blocking
does not consult the PF_MEMALLOC flags. But there is no flag
equivalent for GFP_NOWAIT, hence this check can't go wrong due to
memalloc_no*_save/restore contexts. Willy is working on a patch series
which might change this:

https://lore.kernel.org/linux-mm/20200625113122.7540-7-willy@infradead.org/

I think best would be if that updates gfpflags_allow_blocking(), since
there's a ton of callers all over the place for that already.

v2: Fix typos in kerneldoc (Randy)

Acked-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc. Randy Dunlap <rdunlap@infradead.org>
Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Michel Lespinasse <walken@google.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Waiman Long <longman@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org
Cc: Dave Chinner <david@fromorbit.com>
Cc: Qian Cai <cai@lca.pw>
Cc: linux-xfs@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 include/linux/sched/mm.h | 16 ++++++++++++++++
 mm/slab.h                |  5 +----
 mm/slob.c                |  6 ++----
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index d5ece7a9a403..a11a61b5226f 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -180,6 +180,22 @@ static inline void fs_reclaim_acquire(gfp_t gfp_mask) { }
 static inline void fs_reclaim_release(gfp_t gfp_mask) { }
 #endif
 
+/**
+ * might_alloc - Mark possible allocation sites
+ * @gfp_mask: gfp_t flags that would be used to allocate
+ *
+ * Similar to might_sleep() and other annotations, this can be used in functions
+ * that might allocate, but often don't. Compiles to nothing without
+ * CONFIG_LOCKDEP. Includes a conditional might_sleep() if @gfp allows blocking.
+ */
+static inline void might_alloc(gfp_t gfp_mask)
+{
+	fs_reclaim_acquire(gfp_mask);
+	fs_reclaim_release(gfp_mask);
+
+	might_sleep_if(gfpflags_allow_blocking(gfp_mask));
+}
+
 /**
  * memalloc_noio_save - Marks implicit GFP_NOIO allocation scope.
  *
diff --git a/mm/slab.h b/mm/slab.h
index 6d7c6a5056ba..37b981247e5d 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -500,10 +500,7 @@ static inline struct kmem_cache *slab_pre_alloc_hook(struct kmem_cache *s,
 {
 	flags &= gfp_allowed_mask;
 
-	fs_reclaim_acquire(flags);
-	fs_reclaim_release(flags);
-
-	might_sleep_if(gfpflags_allow_blocking(flags));
+	might_alloc(flags);
 
 	if (should_failslab(s, flags))
 		return NULL;
diff --git a/mm/slob.c b/mm/slob.c
index 7cc9805c8091..8d4bfa46247f 100644
--- a/mm/slob.c
+++ b/mm/slob.c
@@ -474,8 +474,7 @@ __do_kmalloc_node(size_t size, gfp_t gfp, int node, unsigned long caller)
 
 	gfp &= gfp_allowed_mask;
 
-	fs_reclaim_acquire(gfp);
-	fs_reclaim_release(gfp);
+	might_alloc(gfp);
 
 	if (size < PAGE_SIZE - minalign) {
 		int align = minalign;
@@ -597,8 +596,7 @@ static void *slob_alloc_node(struct kmem_cache *c, gfp_t flags, int node)
 
 	flags &= gfp_allowed_mask;
 
-	fs_reclaim_acquire(flags);
-	fs_reclaim_release(flags);
+	might_alloc(flags);
 
 	if (c->size < PAGE_SIZE) {
 		b = slob_alloc(c->size, flags, c->align, node, 0);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
