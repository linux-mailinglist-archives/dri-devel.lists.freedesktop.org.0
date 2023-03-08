Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEC56B0D0D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EC810E61E;
	Wed,  8 Mar 2023 15:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D30610E61E;
 Wed,  8 Mar 2023 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678289994; x=1709825994;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=W+jwVlTRdjvktA1nEkWNcAT5iygeBJ8dB2aSEBElQ1U=;
 b=csvQDlhokR5QCJmRhryHrkhtbXIO4qAFkofp/Se/T7Nlg+EvA4Y4D9Q7
 p60uC3+U6xnhjnEiqnVBv8DMfcZCSfTwUcUjztb8PobBnWTr9uryONIVE
 Hg0Hc7X97k6hMUnELfHZ0GIwzA2anAisyCYhAw6rcQpkxD7+b+JAJrdNE
 781q6mX05gjQJBIAlf6at6Ae2Ys7f5cXMapOz++L8hS7k3LL4t3rF+8fA
 fW7Kwt2eQteh1Zc6nbEfgGI4fJqqAl+oaaRuin8MY/w+ftf6Hlg2RLOYz
 LCHdSwpTGbKh9cYf9XOYeMg+WFnLEgKYgNAn6OF8XPgZ6qGN+Nr7ol1RR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337703593"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337703593"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787160296"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787160296"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:51 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 08 Mar 2023 16:39:06 +0100
Subject: [PATCH v5 4/4] drm/i915: add guard page to ggtt->error_capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-guard_error_capture-v5-4-6d1410d13540@intel.com>
References: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
In-Reply-To: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
X-Mailer: b4 0.11.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Write-combining memory allows speculative reads by CPU.
ggtt->error_capture is WC mapped to CPU, so CPU/MMU can try
to prefetch memory beyond the error_capture, ie it tries
to read memory pointed by next PTE in GGTT.
If this PTE points to invalid address DMAR errors will occur.
This behaviour was observed on ADL and RPL platforms.
To avoid it, guard scratch page should be added after error_capture.
The patch fixes the most annoying issue with error capture but
since WC reads are used also in other places there is a risk similar
problem can affect them as well.

v2:
  - modified commit message (I hope the diagnosis is correct),
  - added bug checks to ensure scratch is initialized on gen3 platforms.
    CI produces strange stacktrace for it suggesting scratch[0] is NULL,
    to be removed after resolving the issue with gen3 platforms.
v3:
  - removed bug checks, replaced with gen check.
v4:
  - change code for scratch page insertion to support all platforms,
  - add info in commit message there could be more similar issues
v5:
  - check for nop_clear_range instead of gen8 (Tvrtko),
  - re-insert scratch pages on resume (Tvrtko)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index b925da42c7cfc4..8fb700fde85c8f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -502,6 +502,21 @@ static void cleanup_init_ggtt(struct i915_ggtt *ggtt)
 	mutex_destroy(&ggtt->error_mutex);
 }
 
+static void
+ggtt_insert_scratch_pages(struct i915_ggtt *ggtt, u64 offset, u64 length)
+{
+	struct i915_address_space *vm = &ggtt->vm;
+
+	if (vm->clear_range != nop_clear_range)
+		return vm->clear_range(vm, offset, length);
+
+	while (length > 0) {
+		vm->insert_page(vm, px_dma(vm->scratch[0]), offset, I915_CACHE_NONE, 0);
+		offset += I915_GTT_PAGE_SIZE;
+		length -= I915_GTT_PAGE_SIZE;
+	}
+}
+
 static int init_ggtt(struct i915_ggtt *ggtt)
 {
 	/*
@@ -550,8 +565,12 @@ static int init_ggtt(struct i915_ggtt *ggtt)
 		 * paths, and we trust that 0 will remain reserved. However,
 		 * the only likely reason for failure to insert is a driver
 		 * bug, which we expect to cause other failures...
+		 *
+		 * Since CPU can perform speculative reads on error capture
+		 * (write-combining allows it) add scratch page after error
+		 * capture to avoid DMAR errors.
 		 */
-		ggtt->error_capture.size = I915_GTT_PAGE_SIZE;
+		ggtt->error_capture.size = 2 * I915_GTT_PAGE_SIZE;
 		ggtt->error_capture.color = I915_COLOR_UNEVICTABLE;
 		if (drm_mm_reserve_node(&ggtt->vm.mm, &ggtt->error_capture))
 			drm_mm_insert_node_in_range(&ggtt->vm.mm,
@@ -561,11 +580,15 @@ static int init_ggtt(struct i915_ggtt *ggtt)
 						    0, ggtt->mappable_end,
 						    DRM_MM_INSERT_LOW);
 	}
-	if (drm_mm_node_allocated(&ggtt->error_capture))
+	if (drm_mm_node_allocated(&ggtt->error_capture)) {
+		u64 start = ggtt->error_capture.start;
+		u64 size = ggtt->error_capture.size;
+
+		ggtt_insert_scratch_pages(ggtt, start, size);
 		drm_dbg(&ggtt->vm.i915->drm,
 			"Reserved GGTT:[%llx, %llx] for use by error capture\n",
-			ggtt->error_capture.start,
-			ggtt->error_capture.start + ggtt->error_capture.size);
+			start, start + size);
+	}
 
 	/*
 	 * The upper portion of the GuC address space has a sizeable hole
@@ -1256,6 +1279,10 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
 
 	flush = i915_ggtt_resume_vm(&ggtt->vm);
 
+	if (drm_mm_node_allocated(&ggtt->error_capture))
+		ggtt_insert_scratch_pages(ggtt, ggtt->error_capture.start,
+					  ggtt->error_capture.size);
+
 	ggtt->invalidate(ggtt);
 
 	if (flush)

-- 
2.34.1
