Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF5B2C11A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1D910E5BA;
	Tue, 19 Aug 2025 11:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524A10E5B8;
 Tue, 19 Aug 2025 11:49:50 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?=27Thomas=20Hellstr=C3=B6m=27?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <dev@lankhorst.se>,
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?=27Michal=20Koutn=C3=BD=27?= <mkoutny@suse.com>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: [RFC 1/3] page_counter: Allow for pinning some amount of memory
Date: Tue, 19 Aug 2025 13:49:34 +0200
Message-ID: <20250819114932.597600-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819114932.597600-5-dev@lankhorst.se>
References: <20250819114932.597600-5-dev@lankhorst.se>
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

Add a pinned member, and use it for implementing pinning accounting.
Memory to be pinned has to already be accounted for as normally used,
and only memory up to the 'min' limit is allowed to be pinned.

This limit is chosen because cgroups already guarantees that memory
up to that limit will not evicted.

Pinned memory affects min and low calculations, so alter those slightly.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 include/linux/page_counter.h |  8 +++
 mm/page_counter.c            | 98 +++++++++++++++++++++++++++++++++---
 2 files changed, 99 insertions(+), 7 deletions(-)

diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index d649b6bbbc871..5836c6dfb3c76 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -13,6 +13,7 @@ struct page_counter {
 	 * v2. The memcg->memory.usage is a hot member of struct mem_cgroup.
 	 */
 	atomic_long_t usage;
+	atomic_long_t pinned;
 	unsigned long failcnt; /* v1-only field */
 
 	CACHELINE_PADDING(_pad1_);
@@ -68,11 +69,18 @@ static inline unsigned long page_counter_read(struct page_counter *counter)
 	return atomic_long_read(&counter->usage);
 }
 
+static inline unsigned long page_counter_pinned(struct page_counter *counter)
+{
+	return atomic_long_read(&counter->pinned);
+}
+
 void page_counter_cancel(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_charge(struct page_counter *counter, unsigned long nr_pages);
 bool page_counter_try_charge(struct page_counter *counter,
 			     unsigned long nr_pages,
 			     struct page_counter **fail);
+bool page_counter_try_pin(struct page_counter *counter, unsigned long nr_pages);
+void page_counter_unpin(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_uncharge(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_set_min(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_set_low(struct page_counter *counter, unsigned long nr_pages);
diff --git a/mm/page_counter.c b/mm/page_counter.c
index 661e0f2a5127a..d29d0ed01ec18 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -184,6 +184,82 @@ void page_counter_uncharge(struct page_counter *counter, unsigned long nr_pages)
 		page_counter_cancel(c, nr_pages);
 }
 
+static void page_counter_unpin_one(struct page_counter *counter, unsigned long nr_pages)
+{
+	long new;
+
+	new = atomic_long_sub_return(nr_pages, &counter->pinned);
+	/* More uncharges than charges? */
+	if (WARN_ONCE(new < 0, "page_counter pinned underflow: %ld nr_pages=%lu\n",
+		      new, nr_pages))
+		atomic_long_set(&counter->pinned, 0);
+}
+
+/**
+ * page_counter_try_pin - try to hierarchically pin pages
+ * @counter: counter
+ * @nr_pages: number of pages to charge
+ *
+ * Returns %true on success, or %false if any counter goes above,
+ * the 'min' limit. Failing cgroup is not returned, as pinned memory
+ * cannot be evicted.
+ */
+bool page_counter_try_pin(struct page_counter *counter,
+			     unsigned long nr_pages)
+{
+	struct page_counter *c, *fail;
+	bool track_failcnt = counter->track_failcnt;
+
+	for (c = counter; c; c = c->parent) {
+		long new;
+		/*
+		 * Pin speculatively to avoid an expensive CAS.  If
+		 * a bigger charge fails, it might falsely lock out a
+		 * racing smaller charge and send it into reclaim
+		 * early, but the error is limited to the difference
+		 * between the two sizes, which is less than 2M/4M in
+		 * case of a THP locking out a regular page charge.
+		 *
+		 * The atomic_long_add_return() implies a full memory
+		 * barrier between incrementing the count and reading
+		 * the limit.  When racing with page_counter_set_max(),
+		 * we either see the new limit or the setter sees the
+		 * counter has changed and retries.
+		 */
+		new = atomic_long_add_return(nr_pages, &c->pinned);
+		if (new > READ_ONCE(c->min)) {
+			atomic_long_sub(nr_pages, &c->pinned);
+			/*
+			 * This is racy, but we can live with some
+			 * inaccuracy in the failcnt which is only used
+			 * to report stats.
+			 */
+			if (track_failcnt)
+				data_race(c->failcnt++);
+			fail = c;
+			goto failed;
+		}
+	}
+	return true;
+
+failed:
+	for (c = counter; c != fail; c = c->parent)
+		page_counter_unpin_one(c, nr_pages);
+
+	return false;
+}
+
+/**
+ * page_counter_unpin - hierarchically unpin pages
+ * @counter: counter
+ * @nr_pages: number of pages to uncharge
+ */
+void page_counter_unpin(struct page_counter *counter, unsigned long nr_pages)
+{
+	for (struct page_counter *c = counter; c; c = c->parent)
+		page_counter_unpin_one(c, nr_pages);
+}
+
 /**
  * page_counter_set_max - set the maximum number of pages allowed
  * @counter: counter
@@ -425,7 +501,7 @@ void page_counter_calculate_protection(struct page_counter *root,
 				       struct page_counter *counter,
 				       bool recursive_protection)
 {
-	unsigned long usage, parent_usage;
+	unsigned long usage, parent_usage, pinned, min, low;
 	struct page_counter *parent = counter->parent;
 
 	/*
@@ -442,23 +518,31 @@ void page_counter_calculate_protection(struct page_counter *root,
 	if (!usage)
 		return;
 
+	pinned = page_counter_pinned(counter);
+
+	/* For calculation purposes, pinned memory is subtracted from min/low */
+	min = READ_ONCE(counter->min);
+	if (pinned > min)
+		min = 0;
+	low = READ_ONCE(counter->low);
+	if (pinned > low)
+		low = 0;
+
 	if (parent == root) {
-		counter->emin = READ_ONCE(counter->min);
-		counter->elow = READ_ONCE(counter->low);
+		counter->emin = min;
+		counter->elow = low;
 		return;
 	}
 
 	parent_usage = page_counter_read(parent);
 
 	WRITE_ONCE(counter->emin, effective_protection(usage, parent_usage,
-			READ_ONCE(counter->min),
-			READ_ONCE(parent->emin),
+			min, READ_ONCE(parent->emin),
 			atomic_long_read(&parent->children_min_usage),
 			recursive_protection));
 
 	WRITE_ONCE(counter->elow, effective_protection(usage, parent_usage,
-			READ_ONCE(counter->low),
-			READ_ONCE(parent->elow),
+			low, READ_ONCE(parent->elow),
 			atomic_long_read(&parent->children_low_usage),
 			recursive_protection));
 }
-- 
2.50.0

