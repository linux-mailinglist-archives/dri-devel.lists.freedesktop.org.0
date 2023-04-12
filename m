Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D96DF3CB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021F310E7A6;
	Wed, 12 Apr 2023 11:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544F710E7A7;
 Wed, 12 Apr 2023 11:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681299276; x=1712835276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=puz0lkr0ae7G+kGiGt2AiDRFdSeU49k5Kj6BcTSHsEo=;
 b=YnE0FVy0SUXZPsFmCKUCtSZ47GcDzNcf2I5PXMgGDeyei6ldhiAUuXQo
 qa69SC9SsluefDS4Wqo5Lu8ij0OOlySdxtka30fnTIFSLZTbtRKqpSXzS
 V4pxmMuD2HPxHrjz13c/JOoeFTDKaTUClzSDny/oEMWpLyDmdUfYc+nul
 oy0Vv4nEvrNNiKD0Z1VxsMvyPdWweh49l+O+7FGtXZUcUVSL1jf5mHmLP
 aIcru+FX5jSkXE0rhlhd1z9lf00j9ke5KTMVddVmp2mbbLitcwpccZzlW
 FV3PcwkSLL9/hDyujfRb+a6TTqWK/+3Detq61AiN8xV7yiXw51sujdKB9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="332562327"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332562327"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="758203253"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="758203253"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:34:31 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v5 5/5] drm/i915/gt: Make sure that errors are propagated
 through request chains
Date: Wed, 12 Apr 2023 13:33:08 +0200
Message-Id: <20230412113308.812468-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412113308.812468-1-andi.shyti@linux.intel.com>
References: <20230412113308.812468-1-andi.shyti@linux.intel.com>
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
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, when we perform operations such as clearing or copying
large blocks of memory, we generate multiple requests that are
executed in a chain.

However, if one of these requests fails, we may not realize it
unless it happens to be the last request in the chain. This is
because errors are not properly propagated.

For this we need to keep propagating the chain of fence
notification in order to always reach the final fence associated
to the final request.

To address this issue, we need to ensure that the chain of fence
notifications is always propagated so that we can reach the final
fence associated with the last request. By doing so, we will be
able to detect any memory operation  failures and determine
whether the memory is still invalid.

On copy and clear migration signal fences upon completion.

On copy and clear migration, signal fences upon request
completion to ensure that we have a reliable perpetuation of the
operation outcome.

Fixes: cf586021642d80 ("drm/i915/gt: Pipelined page migration")
Reported-by: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 51 +++++++++++++++++++------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 3f638f1987968..668c95af8cbcf 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -742,13 +742,19 @@ intel_context_migrate_copy(struct intel_context *ce,
 			dst_offset = 2 * CHUNK_SZ;
 	}
 
+	/*
+	 * While building the chain of requests, we need to ensure
+	 * that no one can sneak into the timeline unnoticed.
+	 */
+	mutex_lock(&ce->timeline->mutex);
+
 	do {
 		int len;
 
-		rq = i915_request_create(ce);
+		rq = i915_request_create_locked(ce);
 		if (IS_ERR(rq)) {
 			err = PTR_ERR(rq);
-			goto out_ce;
+			break;
 		}
 
 		if (deps) {
@@ -878,10 +884,14 @@ intel_context_migrate_copy(struct intel_context *ce,
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-		if (*out)
+		i915_sw_fence_await(&rq->submit);
+		i915_request_get(rq);
+		i915_request_add_locked(rq);
+		if (*out) {
+			i915_sw_fence_complete(&(*out)->submit);
 			i915_request_put(*out);
-		*out = i915_request_get(rq);
-		i915_request_add(rq);
+		}
+		*out = rq;
 
 		if (err)
 			break;
@@ -905,7 +915,10 @@ intel_context_migrate_copy(struct intel_context *ce,
 		cond_resched();
 	} while (1);
 
-out_ce:
+	mutex_unlock(&ce->timeline->mutex);
+
+	if (*out)
+		i915_sw_fence_complete(&(*out)->submit);
 	return err;
 }
 
@@ -999,13 +1012,19 @@ intel_context_migrate_clear(struct intel_context *ce,
 	if (HAS_64K_PAGES(i915) && is_lmem)
 		offset = CHUNK_SZ;
 
+	/*
+	 * While building the chain of requests, we need to ensure
+	 * that no one can sneak into the timeline unnoticed.
+	 */
+	mutex_lock(&ce->timeline->mutex);
+
 	do {
 		int len;
 
-		rq = i915_request_create(ce);
+		rq = i915_request_create_locked(ce);
 		if (IS_ERR(rq)) {
 			err = PTR_ERR(rq);
-			goto out_ce;
+			break;
 		}
 
 		if (deps) {
@@ -1056,17 +1075,25 @@ intel_context_migrate_clear(struct intel_context *ce,
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-		if (*out)
+		i915_sw_fence_await(&rq->submit);
+		i915_request_get(rq);
+		i915_request_add_locked(rq);
+		if (*out) {
+			i915_sw_fence_complete(&(*out)->submit);
 			i915_request_put(*out);
-		*out = i915_request_get(rq);
-		i915_request_add(rq);
+		}
+		*out = rq;
+
 		if (err || !it.sg || !sg_dma_len(it.sg))
 			break;
 
 		cond_resched();
 	} while (1);
 
-out_ce:
+	mutex_unlock(&ce->timeline->mutex);
+
+	if (*out)
+		i915_sw_fence_complete(&(*out)->submit);
 	return err;
 }
 
-- 
2.39.2

