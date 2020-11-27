Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E62C6524
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CC56ECDD;
	Fri, 27 Nov 2020 12:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5356ECCB;
 Fri, 27 Nov 2020 12:10:48 +0000 (UTC)
IronPort-SDR: VHP4oREb8cROl9w3BoNniwDViB+qWIyGadw3Wr1k25ZbNAn8+wgqNAVToxuXcXhJkE0GbmB73/
 cJdIW6/AeekA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092794"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092794"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:37 -0800
IronPort-SDR: 17BvF+lfeO/72SQibg5iCM3DpJNMO9UnKTwHGZ+i/N1d+gMfUCpIqCx3UZwZz49cYlmrJNiRuq
 3TLcmfnOXrqQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029458"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:36 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 103/162] drm/i915: allocate context from LMEM
Date: Fri, 27 Nov 2020 12:06:19 +0000
Message-Id: <20201127120718.454037-104-matthew.auld@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on a patch from Michel Thierry.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 582a9044727e..c640b90711fd 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -108,6 +108,8 @@
  */
 #include <linux/interrupt.h>
 
+#include "gem/i915_gem_lmem.h"
+
 #include "i915_drv.h"
 #include "i915_perf.h"
 #include "i915_trace.h"
@@ -4660,6 +4662,21 @@ static struct intel_timeline *pinned_timeline(struct intel_context *ce)
 						 page_unmask_bits(tl));
 }
 
+static int context_clear_lmem(struct drm_i915_gem_object *ctx_obj)
+{
+	void *vaddr;
+
+	vaddr = i915_gem_object_pin_map(ctx_obj, I915_MAP_WC);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
+
+	memset64(vaddr, 0, ctx_obj->base.size / sizeof(u64));
+
+	i915_gem_object_unpin_map(ctx_obj);
+
+	return 0;
+}
+
 static int __execlists_context_alloc(struct intel_context *ce,
 				     struct intel_engine_cs *engine)
 {
@@ -4680,10 +4697,22 @@ static int __execlists_context_alloc(struct intel_context *ce,
 		context_size += PAGE_SIZE;
 	}
 
-	ctx_obj = i915_gem_object_create_shmem(engine->i915, context_size);
+	if (HAS_LMEM(engine->i915)) {
+		ctx_obj = i915_gem_object_create_lmem(engine->i915,
+						      context_size,
+						      I915_BO_ALLOC_CONTIGUOUS);
+	} else {
+		ctx_obj = i915_gem_object_create_shmem(engine->i915, context_size);
+	}
 	if (IS_ERR(ctx_obj))
 		return PTR_ERR(ctx_obj);
 
+	if (HAS_LMEM(engine->i915)) {
+		ret = context_clear_lmem(ctx_obj);
+		if (ret)
+			goto error_deref_obj;
+	}
+
 	vma = i915_vma_instance(ctx_obj, &engine->gt->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
