Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BED6CD2F3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1E110E4F9;
	Wed, 29 Mar 2023 07:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDEB10E4F3;
 Wed, 29 Mar 2023 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680074690; x=1711610690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eFmVjsv1DCN0/J2TIleZPCjZ8XDr2WxmZ0GRJxV4ib4=;
 b=ErV2poLEXN2+dV/dAwSWvWM0oegJ0bof6vraxMM9QyWl3e9QKPE8EncL
 2+d7d6syOxrO8cgEwJWnaox6egOYWLlkWbyTP47jC+EDf1ylreppEHaNX
 w/7UYMjf+HAopb5KlPOjQsGIxMIVOxcrgHvvts546ezCRjsF6V+T51jKU
 pRggXmhB0p+0i21kJdA/ryvop3z6TdHm1Ft4rUYrLxPnWnpkd69YE/ddj
 +WkcAsIbz/wLPBphfXR2sSUpIpVGYBm54bfD8Q27AVM/vwz2q7UMG97JG
 bKMB10VW3mOGkCi0EqMUSPUA9i4LIvObZhF0+rw9Rl5lZAhzZHeQ2YXTI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405746036"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="405746036"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="684160597"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="684160597"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2023 00:24:34 -0700
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] drm/i915: Use kmap_local_page() in
 gem/selftests/i915_gem_coherency.c
Date: Wed, 29 Mar 2023 15:32:16 +0800
Message-Id: <20230329073220.3982460-6-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dave Hansen <dave.hansen@intel.com>
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

v2:
* Dropped hot plug related description since it has nothing to do with
  kmap_local_page().
* No code change since v1, and added description of the motivation of
  using kmap_local_page().

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
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

