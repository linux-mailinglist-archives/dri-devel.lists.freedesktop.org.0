Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD22C6591
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ECA6EDA6;
	Fri, 27 Nov 2020 12:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33A56EDBA;
 Fri, 27 Nov 2020 12:12:29 +0000 (UTC)
IronPort-SDR: 9dDQQspKjrmXH7atu8o3l5fg3yERmfkPzVSQ6IiwYWK4swAKq6UYcv2olex32SfRu1PZTwFKwg
 pxAuWm5XinvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883884"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883884"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:29 -0800
IronPort-SDR: nd3KDRjTV6IrYvqYc9KmtDS/WSr4wLN2SdptmaxfjmsSazMbi29AqJUbz25MRECv637HcbF5tU
 7KicT7r6cFwg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030065"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 157/162] drm/i915: Improve accuracy of eviction stats
Date: Fri, 27 Nov 2020 12:07:13 +0000
Message-Id: <20201127120718.454037-158-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org,
 CQ Tang <cq.tang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Current code uses jiffie time to do the accounting and then does:

  diff = jiffies - start;
  msec = diff * 1000 / HZ;
  ...
  atomic_long_add(msec, &i915->time_swap_out_ms);

If we assume jiffie can be as non-granular as 10ms and that the current
accounting records all evictions faster than one jiffie as infinite speed,
we can end up over-estimating the reported eviction throughput.

Fix this by accumulating ktime_t and only dividing to more user friendly
granularity at presentation time (debugfs read).

At the same time consolidate the code a bit and convert from multiple
atomics to single seqlock per stat.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 67 ++++++++++----------
 drivers/gpu/drm/i915/i915_debugfs.c        | 73 +++++++++++-----------
 drivers/gpu/drm/i915/i915_drv.h            | 25 +++++---
 drivers/gpu/drm/i915/i915_gem.c            |  5 ++
 4 files changed, 90 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index 8ec59fbaa3e6..1a390e502d5a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -9,14 +9,29 @@
 #include "i915_trace.h"
 #include "i915_gem_mman.h"
 
+static void
+__update_stat(struct i915_mm_swap_stat *stat,
+	      unsigned long pages,
+	      ktime_t start)
+{
+	if (stat) {
+		start = ktime_get() - start;
+
+		write_seqlock(&stat->lock);
+		stat->time = ktime_add(stat->time, start);
+		stat->pages += pages;
+		write_sequnlock(&stat->lock);
+	}
+}
+
 static int
 i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 			      struct sg_table *pages, unsigned int sizes)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct i915_mm_swap_stat *stat = NULL;
 	struct drm_i915_gem_object *dst, *src;
-	unsigned long start, diff, msec;
-	bool blt_completed = false;
+	ktime_t start = ktime_get();
 	int err = -EINVAL;
 
 	GEM_BUG_ON(obj->swapto);
@@ -26,7 +41,6 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	GEM_BUG_ON(!i915->params.enable_eviction);
 
 	assert_object_held(obj);
-	start = jiffies;
 
 	/* create a shadow object on smem region */
 	dst = i915_gem_object_create_shmem(i915, obj->base.size);
@@ -58,10 +72,14 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	if (i915->params.enable_eviction >= 2) {
 		err = i915_window_blt_copy(dst, src);
 		if (!err)
-			blt_completed = true;
+			stat = &i915->mm.blt_swap_stats.out;
 	}
-	if (err && i915->params.enable_eviction != 2)
+
+	if (err && i915->params.enable_eviction != 2) {
 		err = i915_gem_object_memcpy(dst, src);
+		if (!err)
+			stat = &i915->mm.memcpy_swap_stats.out;
+	}
 
 	__i915_gem_object_unpin_pages(src);
 	__i915_gem_object_unset_pages(src);
@@ -73,18 +91,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	else
 		i915_gem_object_put(dst);
 
-	if (!err) {
-		diff = jiffies - start;
-		msec = diff * 1000 / HZ;
-		if (blt_completed) {
-			atomic_long_add(sizes, &i915->num_bytes_swapped_out);
-			atomic_long_add(msec, &i915->time_swap_out_ms);
-		} else {
-			atomic_long_add(sizes,
-					&i915->num_bytes_swapped_out_memcpy);
-			atomic_long_add(msec, &i915->time_swap_out_ms_memcpy);
-		}
-	}
+	__update_stat(stat, sizes >> PAGE_SHIFT, start);
 
 	return err;
 }
@@ -94,9 +101,9 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 			     struct sg_table *pages, unsigned int sizes)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct i915_mm_swap_stat *stat = NULL;
 	struct drm_i915_gem_object *dst, *src;
-	unsigned long start, diff, msec;
-	bool blt_completed = false;
+	ktime_t start = ktime_get();
 	int err = -EINVAL;
 
 	GEM_BUG_ON(!obj->swapto);
@@ -106,7 +113,6 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 	GEM_BUG_ON(!i915->params.enable_eviction);
 
 	assert_object_held(obj);
-	start = jiffies;
 
 	src = obj->swapto;
 
@@ -134,10 +140,14 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 	if (i915->params.enable_eviction >= 2) {
 		err = i915_window_blt_copy(dst, src);
 		if (!err)
-			blt_completed = true;
+			stat = &i915->mm.blt_swap_stats.in;
 	}
-	if (err && i915->params.enable_eviction != 2)
+
+	if (err && i915->params.enable_eviction != 2) {
 		err = i915_gem_object_memcpy(dst, src);
+		if (!err)
+			stat = &i915->mm.memcpy_swap_stats.in;
+	}
 
 	__i915_gem_object_unpin_pages(dst);
 	__i915_gem_object_unset_pages(dst);
@@ -149,18 +159,7 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 		i915_gem_object_put(src);
 	}
 
-	if (!err) {
-		diff = jiffies - start;
-		msec = diff * 1000 / HZ;
-		if (blt_completed) {
-			atomic_long_add(sizes, &i915->num_bytes_swapped_in);
-			atomic_long_add(msec, &i915->time_swap_in_ms);
-		} else {
-			atomic_long_add(sizes,
-					&i915->num_bytes_swapped_in_memcpy);
-			atomic_long_add(msec, &i915->time_swap_in_ms_memcpy);
-		}
-	}
+	__update_stat(stat, sizes >> PAGE_SHIFT, start);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 983030ac39e1..f06f900b598e 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -359,12 +359,46 @@ static void print_context_stats(struct seq_file *m,
 	print_file_stats(m, "[k]contexts", kstats);
 }
 
+static void
+evict_stat(struct seq_file *m,
+	   const char *name,
+	   const char *direction,
+	   struct i915_mm_swap_stat *stat)
+{
+	unsigned long pages;
+	unsigned int seq;
+	u64 time, rate;
+	ktime_t ktime;
+
+	do {
+		seq = read_seqbegin(&stat->lock);
+		pages = stat->pages;
+		ktime = stat->time;
+	} while (read_seqretry(&stat->lock, seq));
+
+	time = ktime_to_us(ktime);
+	rate = time ? div64_u64((u64)pages * PAGE_SIZE, time) : 0;
+	rate = div64_ul(rate * USEC_PER_SEC, 1024 * 1024);
+
+	seq_printf(m, "%s swap %s %lu MiB in %llums, %llu MiB/s.\n",
+		   name, direction, pages * PAGE_SIZE, ktime_to_ms(ktime),
+		   rate);
+}
+
+static void
+evict_stats(struct seq_file *m,
+	    const char *name,
+	    struct i915_mm_swap_stats *stats)
+{
+	evict_stat(m, name, "in", &stats->in);
+	evict_stat(m, name, "out", &stats->out);
+}
+
 static int i915_gem_object_info(struct seq_file *m, void *data)
 {
 	struct drm_i915_private *i915 = node_to_i915(m->private);
 	struct intel_memory_region *mr;
 	enum intel_region_id id;
-	u64 time, bytes, rate;
 
 	seq_printf(m, "%u shrinkable [%u free] objects, %llu bytes\n",
 		   i915->mm.shrink_count,
@@ -374,41 +408,8 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
 		seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
 			   mr->name, &mr->total, &mr->avail);
 
-	time = atomic_long_read(&i915->time_swap_out_ms);
-	bytes = atomic_long_read(&i915->num_bytes_swapped_out);
-	if (time)
-		rate = div64_u64(bytes * 1000, time * 1024 * 1024);
-	else
-		rate = 0;
-	seq_printf(m, "BLT: swapout %llu Bytes in %llu mSec(%llu MB/Sec)\n",
-		   bytes, time, rate);
-
-	time = atomic_long_read(&i915->time_swap_in_ms);
-	bytes = atomic_long_read(&i915->num_bytes_swapped_in);
-	if (time)
-		rate = div64_u64(bytes * 1000, time * 1024 * 1024);
-	else
-		rate = 0;
-	seq_printf(m, "BLT: swapin %llu Bytes in %llu mSec(%llu MB/Sec)\n",
-		   bytes, time, rate);
-
-	time = atomic_long_read(&i915->time_swap_out_ms_memcpy);
-	bytes = atomic_long_read(&i915->num_bytes_swapped_out_memcpy);
-	if (time)
-		rate = div64_u64(bytes * 1000, time * 1024 * 1024);
-	else
-		rate = 0;
-	seq_printf(m, "Memcpy: swapout %llu Bytes in %llu mSec(%llu MB/Sec)\n",
-		   bytes, time, rate);
-
-	time = atomic_long_read(&i915->time_swap_in_ms_memcpy);
-	bytes = atomic_long_read(&i915->num_bytes_swapped_in_memcpy);
-	if (time)
-		rate = div64_u64(bytes * 1000, time * 1024 * 1024);
-	else
-		rate = 0;
-	seq_printf(m, "Memcpy: swapin %llu Bytes in %llu mSec(%llu MB/Sec)\n",
-		   bytes, time, rate);
+	evict_stats(m, "Blitter", &i915->mm.blt_swap_stats);
+	evict_stats(m, "Memcpy", &i915->mm.memcpy_swap_stats);
 	seq_putc(m, '\n');
 
 	print_context_stats(m, i915);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 6f0ab363bdee..45511f2d8da0 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -49,6 +49,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/stackdepot.h>
 #include <linux/xarray.h>
+#include <linux/seqlock.h>
 
 #include <drm/intel-gtt.h>
 #include <drm/drm_legacy.h> /* for struct drm_dma_handle */
@@ -548,6 +549,17 @@ struct intel_l3_parity {
 	int which_slice;
 };
 
+struct i915_mm_swap_stat {
+	seqlock_t lock;
+	unsigned long pages;
+	ktime_t time;
+};
+
+struct i915_mm_swap_stats {
+	struct i915_mm_swap_stat in;
+	struct i915_mm_swap_stat out;
+};
+
 struct i915_gem_mm {
 	/* Protects bound_list/unbound_list and #drm_i915_gem_object.mm.link */
 	spinlock_t obj_lock;
@@ -601,6 +613,9 @@ struct i915_gem_mm {
 
 	/* To protect above two set of vmas */
 	wait_queue_head_t window_queue;
+
+	struct i915_mm_swap_stats blt_swap_stats;
+	struct i915_mm_swap_stats memcpy_swap_stats;
 };
 
 #define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
@@ -1220,16 +1235,6 @@ struct drm_i915_private {
 	 * NOTE: This is the dri1/ums dungeon, don't add stuff here. Your patch
 	 * will be rejected. Instead look for a better place.
 	 */
-
-	atomic_long_t num_bytes_swapped_out;
-	atomic_long_t num_bytes_swapped_in;
-	atomic_long_t time_swap_out_ms;
-	atomic_long_t time_swap_in_ms;
-
-	atomic_long_t num_bytes_swapped_out_memcpy;
-	atomic_long_t num_bytes_swapped_in_memcpy;
-	atomic_long_t time_swap_out_ms_memcpy;
-	atomic_long_t time_swap_in_ms_memcpy;
 };
 
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 85cbdb8e2bb8..e94f3f689b30 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1151,6 +1151,11 @@ static void i915_gem_init__mm(struct drm_i915_private *i915)
 	INIT_LIST_HEAD(&i915->mm.purge_list);
 	INIT_LIST_HEAD(&i915->mm.shrink_list);
 
+	seqlock_init(&i915->mm.blt_swap_stats.in.lock);
+	seqlock_init(&i915->mm.blt_swap_stats.out.lock);
+	seqlock_init(&i915->mm.memcpy_swap_stats.in.lock);
+	seqlock_init(&i915->mm.memcpy_swap_stats.out.lock);
+
 	i915_gem_init__objects(i915);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
