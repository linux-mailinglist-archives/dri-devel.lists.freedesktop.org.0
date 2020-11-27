Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E12C6574
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA626ED7C;
	Fri, 27 Nov 2020 12:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA9C6ED65;
 Fri, 27 Nov 2020 12:12:00 +0000 (UTC)
IronPort-SDR: ZCVlz9UMYKhFo4e2JdhElOv4hfPohvLF+3Mp1FBLhow4QZkoZ1pk2HADyVIYggt/ROVtSXdqmf
 to/Th4rghSQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092978"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092978"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:00 -0800
IronPort-SDR: uPGXAOG3kv8kJ4S9jvWIFZ2t8plv42cOjgOwStYQl/+GqOt7BLJC23W2t556aglSDF9DtoqLp3
 bQPyAfGNClyg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029949"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 141/162] drm/i915: Lmem eviction statistics by category
Date: Fri, 27 Nov 2020 12:06:57 +0000
Message-Id: <20201127120718.454037-142-matthew.auld@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

Number of bytes swapped in and out are captured for both blitter and
memcpy based evictions with time taken for the process.

Debugfs is extended to provide the eviction statistics through both
methods with rate of transfer.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 32 +++++++++++++---
 drivers/gpu/drm/i915/i915_debugfs.c        | 43 +++++++++++++++++++---
 drivers/gpu/drm/i915/i915_drv.h            |  5 +++
 3 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index f9ff0aa31752..1ec6528498c8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -16,6 +16,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct drm_i915_gem_object *dst, *src;
 	unsigned long start, diff, msec;
+	bool blt_completed = false;
 	int err = -EINVAL;
 
 	GEM_BUG_ON(obj->swapto);
@@ -54,8 +55,11 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	__i915_gem_object_pin_pages(src);
 
 	/* copying the pages */
-	if (i915->params.enable_eviction >= 2)
+	if (i915->params.enable_eviction >= 2) {
 		err = i915_window_blt_copy(dst, src);
+		if (!err)
+			blt_completed = true;
+	}
 	if (err && i915->params.enable_eviction != 2)
 		err = i915_gem_object_memcpy(dst, src);
 
@@ -72,8 +76,14 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	if (!err) {
 		diff = jiffies - start;
 		msec = diff * 1000 / HZ;
-		atomic_long_add(msec, &i915->time_swap_out_ms);
-		atomic_long_add(sizes, &i915->num_bytes_swapped_out);
+		if (blt_completed) {
+			atomic_long_add(sizes, &i915->num_bytes_swapped_out);
+			atomic_long_add(msec, &i915->time_swap_out_ms);
+		} else {
+			atomic_long_add(sizes,
+					&i915->num_bytes_swapped_out_memcpy);
+			atomic_long_add(msec, &i915->time_swap_out_ms_memcpy);
+		}
 	}
 
 	return err;
@@ -86,6 +96,7 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct drm_i915_gem_object *dst, *src;
 	unsigned long start, diff, msec;
+	bool blt_completed = false;
 	int err = -EINVAL;
 
 	GEM_BUG_ON(!obj->swapto);
@@ -120,8 +131,11 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 	__i915_gem_object_pin_pages(dst);
 
 	/* copying the pages */
-	if (i915->params.enable_eviction >= 2)
+	if (i915->params.enable_eviction >= 2) {
 		err = i915_window_blt_copy(dst, src);
+		if (!err)
+			blt_completed = true;
+	}
 	if (err && i915->params.enable_eviction != 2)
 		err = i915_gem_object_memcpy(dst, src);
 
@@ -138,8 +152,14 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 	if (!err) {
 		diff = jiffies - start;
 		msec = diff * 1000 / HZ;
-		atomic_long_add(msec, &i915->time_swap_in_ms);
-		atomic_long_add(sizes, &i915->num_bytes_swapped_in);
+		if (blt_completed) {
+			atomic_long_add(sizes, &i915->num_bytes_swapped_in);
+			atomic_long_add(msec, &i915->time_swap_in_ms);
+		} else {
+			atomic_long_add(sizes,
+					&i915->num_bytes_swapped_in_memcpy);
+			atomic_long_add(msec, &i915->time_swap_in_ms_memcpy);
+		}
 	}
 
 	return err;
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 2bf51dd9de7c..983030ac39e1 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -364,6 +364,7 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
 	struct drm_i915_private *i915 = node_to_i915(m->private);
 	struct intel_memory_region *mr;
 	enum intel_region_id id;
+	u64 time, bytes, rate;
 
 	seq_printf(m, "%u shrinkable [%u free] objects, %llu bytes\n",
 		   i915->mm.shrink_count,
@@ -372,12 +373,42 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
 	for_each_memory_region(mr, i915, id)
 		seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
 			   mr->name, &mr->total, &mr->avail);
-	seq_printf(m, "num_bytes_swapped_out %ld num_bytes_swapped_in %ld\n",
-		   atomic_long_read(&i915->num_bytes_swapped_out),
-		   atomic_long_read(&i915->num_bytes_swapped_in));
-	seq_printf(m, "time_swap_out_msec %ld time_swap_in_msec %ld\n",
-		   atomic_long_read(&i915->time_swap_out_ms),
-		   atomic_long_read(&i915->time_swap_in_ms));
+
+	time = atomic_long_read(&i915->time_swap_out_ms);
+	bytes = atomic_long_read(&i915->num_bytes_swapped_out);
+	if (time)
+		rate = div64_u64(bytes * 1000, time * 1024 * 1024);
+	else
+		rate = 0;
+	seq_printf(m, "BLT: swapout %llu Bytes in %llu mSec(%llu MB/Sec)\n",
+		   bytes, time, rate);
+
+	time = atomic_long_read(&i915->time_swap_in_ms);
+	bytes = atomic_long_read(&i915->num_bytes_swapped_in);
+	if (time)
+		rate = div64_u64(bytes * 1000, time * 1024 * 1024);
+	else
+		rate = 0;
+	seq_printf(m, "BLT: swapin %llu Bytes in %llu mSec(%llu MB/Sec)\n",
+		   bytes, time, rate);
+
+	time = atomic_long_read(&i915->time_swap_out_ms_memcpy);
+	bytes = atomic_long_read(&i915->num_bytes_swapped_out_memcpy);
+	if (time)
+		rate = div64_u64(bytes * 1000, time * 1024 * 1024);
+	else
+		rate = 0;
+	seq_printf(m, "Memcpy: swapout %llu Bytes in %llu mSec(%llu MB/Sec)\n",
+		   bytes, time, rate);
+
+	time = atomic_long_read(&i915->time_swap_in_ms_memcpy);
+	bytes = atomic_long_read(&i915->num_bytes_swapped_in_memcpy);
+	if (time)
+		rate = div64_u64(bytes * 1000, time * 1024 * 1024);
+	else
+		rate = 0;
+	seq_printf(m, "Memcpy: swapin %llu Bytes in %llu mSec(%llu MB/Sec)\n",
+		   bytes, time, rate);
 	seq_putc(m, '\n');
 
 	print_context_stats(m, i915);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 82f431cc38cd..6f0ab363bdee 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1225,6 +1225,11 @@ struct drm_i915_private {
 	atomic_long_t num_bytes_swapped_in;
 	atomic_long_t time_swap_out_ms;
 	atomic_long_t time_swap_in_ms;
+
+	atomic_long_t num_bytes_swapped_out_memcpy;
+	atomic_long_t num_bytes_swapped_in_memcpy;
+	atomic_long_t time_swap_out_ms_memcpy;
+	atomic_long_t time_swap_in_ms_memcpy;
 };
 
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
