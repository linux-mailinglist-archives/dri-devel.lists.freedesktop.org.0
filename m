Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E58A2C657F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426A06ED8E;
	Fri, 27 Nov 2020 12:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180336ED8A;
 Fri, 27 Nov 2020 12:12:12 +0000 (UTC)
IronPort-SDR: mb9+f3i4KHpLsgVnbRHfxH8H9HmQakOpDUCW/0F+y4R7x4kmhG4uksWsT3meTzOO11aVeoANp6
 WK1FrjAxz2sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883839"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:11 -0800
IronPort-SDR: a4RfHzA+C0BQ1qwpe/s/qoZkRxpNDf86C6gxE59ePO1V6MzurNDCxWYecUuvYNMl4devM8TdUn
 UH2kFitFm9OA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030002"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:10 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 147/162] drm/i915/gt: Allocate default ctx objects in SMEM
Date: Fri, 27 Nov 2020 12:07:03 +0000
Message-Id: <20201127120718.454037-148-matthew.auld@intel.com>
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

If record default objects are created in LMEM and in suspend
pin the pages of obj (src) and use blitter for eviction. But
during request creation using blitter context and try to pin the same
default object, to restore the ctx with default HW values, will leads to
the dead lock situation. To avoid this, safe to keep these
objects in SMEM.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 25 +++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index c640b90711fd..ee5732b436e3 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -4697,7 +4697,13 @@ static int __execlists_context_alloc(struct intel_context *ce,
 		context_size += PAGE_SIZE;
 	}
 
-	if (HAS_LMEM(engine->i915)) {
+	/* FIXME: temporary fix for allocating default ctx objects
+	 * in SMEM, to reslove suspend/resume issues while using
+	 * blitter based eviction. Will remove this once the upstream
+	 * changes merged, where default obj's stored using shmemfs file.
+	 */
+	if (HAS_LMEM(engine->i915) &&
+	    (!IS_DG1(engine->i915) || engine->default_state)) {
 		ctx_obj = i915_gem_object_create_lmem(engine->i915,
 						      context_size,
 						      I915_BO_ALLOC_CONTIGUOUS);
@@ -4707,16 +4713,18 @@ static int __execlists_context_alloc(struct intel_context *ce,
 	if (IS_ERR(ctx_obj))
 		return PTR_ERR(ctx_obj);
 
-	if (HAS_LMEM(engine->i915)) {
+	i915_gem_object_lock_isolated(ctx_obj);
+	if (HAS_LMEM(engine->i915) &&
+	    (!IS_DG1(engine->i915) || engine->default_state)) {
 		ret = context_clear_lmem(ctx_obj);
 		if (ret)
-			goto error_deref_obj;
+			goto error_unlock;
 	}
 
 	vma = i915_vma_instance(ctx_obj, &engine->gt->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-		goto error_deref_obj;
+		goto error_unlock;
 	}
 
 	if (!page_mask_bits(ce->timeline)) {
@@ -4732,7 +4740,7 @@ static int __execlists_context_alloc(struct intel_context *ce,
 			tl = intel_timeline_create(engine->gt);
 		if (IS_ERR(tl)) {
 			ret = PTR_ERR(tl);
-			goto error_deref_obj;
+			goto error_unlock;
 		}
 
 		ce->timeline = tl;
@@ -4741,15 +4749,18 @@ static int __execlists_context_alloc(struct intel_context *ce,
 	ring = intel_engine_create_ring(engine, (unsigned long)ce->ring);
 	if (IS_ERR(ring)) {
 		ret = PTR_ERR(ring);
-		goto error_deref_obj;
+		goto error_unlock;
 	}
 
 	ce->ring = ring;
 	ce->state = vma;
 
+	i915_gem_object_unlock(ctx_obj);
+
 	return 0;
 
-error_deref_obj:
+error_unlock:
+	i915_gem_object_unlock(ctx_obj);
 	i915_gem_object_put(ctx_obj);
 	return ret;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
