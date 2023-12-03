Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A5802419
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 14:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FF510E2BE;
	Sun,  3 Dec 2023 13:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FC710E2AC;
 Sun,  3 Dec 2023 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701609485; x=1733145485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=09wp7qEie3hPA9tmFNTCYBM6WHJ7/7jxnVGZAD5l5W4=;
 b=lrm/hR5hpRqpudchOcSjnmPOSqPJ9eDK84FNkZwpWkb9TiIL1Yxvlgys
 J5q6HcYOovnWgAD90CGrS2Ihi9VGVTaAqFpv+KCpeYKh2v7xPRDbg5lbR
 MNulsPjgTgxwA0U7PpL3OgCXIiuChfcdxvgu0lyRk0m0LpdN8P8oZtHXq
 98Igxy1jvu+n8CXWhRZSzHbufpqZjKOxalKxyn1+NeER/Tob8sKhFdS4J
 sDABQMSBjOVhH7pZyrIoQ5ixuRFSvWsSFX042+p/dCGiltcgRoBYvFff1
 uHockDwE27s0g1+J6swPCgvhYPDaeVnc4uLAoHtqHI7XUiqkiCX4kWBbE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="498239"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="498239"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 05:18:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770262426"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="770262426"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 03 Dec 2023 05:18:00 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ira Weiny <ira.weiny@intel.com>,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] drm/i915: Use kmap_local_page() in
 gem/selftests/i915_gem_coherency.c
Date: Sun,  3 Dec 2023 21:29:43 +0800
Message-Id: <20231203132947.2328805-6-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
References: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
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
Cc: Dave Hansen <dave.hansen@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhao Liu <zhao1.liu@intel.com>

The use of kmap_atomic() is being deprecated in favor of
kmap_local_page()[1], and this patch converts the call from
kmap_atomic() to kmap_local_page().

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption (the preemption is
disabled for !PREEMPT_RT case, otherwise it only disables migration)..

With kmap_local_page(), we can avoid the often unwanted side effect of
unnecessary page faults or preemption disables.

In drm/i915/gem/selftests/i915_gem_coherency.c, functions cpu_set()
and cpu_get() mainly uses mapping to flush cache and assign the value.
There're 2 reasons why cpu_set() and cpu_get() don't need to disable
pagefaults and preemption for mapping:

1. The flush operation is safe. cpu_set() and cpu_get() call
drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush. Since
CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
drm_clflush_virt_range(), the flush operation is global.

2. Any context switch caused by preemption or page faults (page fault
may cause sleep) doesn't affect the validity of local mapping.

Therefore, cpu_set() and cpu_get() are functions where the use of
kmap_local_page() in place of kmap_atomic() is correctly suited.

Convert the calls of kmap_atomic() / kunmap_atomic() to
kmap_local_page() / kunmap_local().

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
Suggested by credits:
  Dave: Referred to his explanation about cache flush.
  Ira: Referred to his task document, review comments and explanation
       about cache flush.
  Fabio: Referred to his boiler plate commit message and his description
         about why kmap_local_page() should be preferred.
---
 .../gpu/drm/i915/gem/selftests/i915_gem_coherency.c  | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
index 3bef1beec7cb..beeb3e12eccc 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
@@ -24,7 +24,6 @@ static int cpu_set(struct context *ctx, unsigned long offset, u32 v)
 {
 	unsigned int needs_clflush;
 	struct page *page;
-	void *map;
 	u32 *cpu;
 	int err;
 
@@ -34,8 +33,7 @@ static int cpu_set(struct context *ctx, unsigned long offset, u32 v)
 		goto out;
 
 	page = i915_gem_object_get_page(ctx->obj, offset >> PAGE_SHIFT);
-	map = kmap_atomic(page);
-	cpu = map + offset_in_page(offset);
+	cpu = kmap_local_page(page) + offset_in_page(offset);
 
 	if (needs_clflush & CLFLUSH_BEFORE)
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
@@ -45,7 +43,7 @@ static int cpu_set(struct context *ctx, unsigned long offset, u32 v)
 	if (needs_clflush & CLFLUSH_AFTER)
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
 
-	kunmap_atomic(map);
+	kunmap_local(cpu);
 	i915_gem_object_finish_access(ctx->obj);
 
 out:
@@ -57,7 +55,6 @@ static int cpu_get(struct context *ctx, unsigned long offset, u32 *v)
 {
 	unsigned int needs_clflush;
 	struct page *page;
-	void *map;
 	u32 *cpu;
 	int err;
 
@@ -67,15 +64,14 @@ static int cpu_get(struct context *ctx, unsigned long offset, u32 *v)
 		goto out;
 
 	page = i915_gem_object_get_page(ctx->obj, offset >> PAGE_SHIFT);
-	map = kmap_atomic(page);
-	cpu = map + offset_in_page(offset);
+	cpu = kmap_local_page(page) + offset_in_page(offset);
 
 	if (needs_clflush & CLFLUSH_BEFORE)
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
 
 	*v = *cpu;
 
-	kunmap_atomic(map);
+	kunmap_local(cpu);
 	i915_gem_object_finish_access(ctx->obj);
 
 out:
-- 
2.34.1

