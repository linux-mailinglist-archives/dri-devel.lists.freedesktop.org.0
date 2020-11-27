Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F902C6565
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71156ED24;
	Fri, 27 Nov 2020 12:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DE06ECA6;
 Fri, 27 Nov 2020 12:11:48 +0000 (UTC)
IronPort-SDR: NBvGIC5c1dKNbisTCB4tTAvZqvoklWw9QxkNOHfU2oRbLSG+Hc4iZ6OVEx14f5fMll+e/Kx1eG
 aVyC3HR/PUFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092950"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092950"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:48 -0800
IronPort-SDR: CzcoyKBsEIMeP68WLO8F3YwiiCpTV99bWmBFX8mKgtIGrS7lEE9hpIV2jJF0Z9si+Gxpi5ek0L
 LCuPnGKZ5wtg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029886"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:46 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 134/162] drm/i915/dg1: Measure swap in/out timing stats
Date: Fri, 27 Nov 2020 12:06:50 +0000
Message-Id: <20201127120718.454037-135-matthew.auld@intel.com>
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
Cc: Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sudeep Dutt <sudeep.dutt@intel.com>

Signed-off-by: Sudeep Dutt <sudeep.dutt@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 16 ++++++++++++++--
 drivers/gpu/drm/i915/i915_debugfs.c        |  3 +++
 drivers/gpu/drm/i915/i915_drv.h            |  2 ++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index ed108dbcb34e..4fab9f6b4bee 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -15,6 +15,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct drm_i915_gem_object *dst, *src;
+	unsigned long start, diff, msec;
 	int err;
 
 	GEM_BUG_ON(obj->swapto);
@@ -24,6 +25,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	GEM_BUG_ON(!i915->params.enable_eviction);
 
 	assert_object_held(obj);
+	start = jiffies;
 
 	/* create a shadow object on smem region */
 	dst = i915_gem_object_create_shmem(i915, obj->base.size);
@@ -64,8 +66,12 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	else
 		i915_gem_object_put(dst);
 
-	if (!err)
+	if (!err) {
+		diff = jiffies - start;
+		msec = diff * 1000 / HZ;
+		atomic_long_add(msec, &i915->time_swap_out_ms);
 		atomic_long_add(sizes, &i915->num_bytes_swapped_out);
+	}
 
 	return err;
 }
@@ -76,6 +82,7 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct drm_i915_gem_object *dst, *src;
+	unsigned long start, diff, msec;
 	int err;
 
 	GEM_BUG_ON(!obj->swapto);
@@ -85,6 +92,7 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 	GEM_BUG_ON(!i915->params.enable_eviction);
 
 	assert_object_held(obj);
+	start = jiffies;
 
 	src = obj->swapto;
 
@@ -121,8 +129,12 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 		i915_gem_object_put(src);
 	}
 
-	if (!err)
+	if (!err) {
+		diff = jiffies - start;
+		msec = diff * 1000 / HZ;
+		atomic_long_add(msec, &i915->time_swap_in_ms);
 		atomic_long_add(sizes, &i915->num_bytes_swapped_in);
+	}
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 1b7e9b6ab660..2bf51dd9de7c 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -375,6 +375,9 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
 	seq_printf(m, "num_bytes_swapped_out %ld num_bytes_swapped_in %ld\n",
 		   atomic_long_read(&i915->num_bytes_swapped_out),
 		   atomic_long_read(&i915->num_bytes_swapped_in));
+	seq_printf(m, "time_swap_out_msec %ld time_swap_in_msec %ld\n",
+		   atomic_long_read(&i915->time_swap_out_ms),
+		   atomic_long_read(&i915->time_swap_in_ms));
 	seq_putc(m, '\n');
 
 	print_context_stats(m, i915);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 7b1e95d494e6..10823abab224 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1217,6 +1217,8 @@ struct drm_i915_private {
 
 	atomic_long_t num_bytes_swapped_out;
 	atomic_long_t num_bytes_swapped_in;
+	atomic_long_t time_swap_out_ms;
+	atomic_long_t time_swap_in_ms;
 };
 
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
