Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D13509EBB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B5810F377;
	Thu, 21 Apr 2022 11:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C6610E8CB;
 Thu, 21 Apr 2022 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650541044; x=1682077044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MOFaZMKF45fliVv/42ysCZ7rsVWhfjeqfv0vo0/q2pg=;
 b=A1RxOdb5PvEylSDcuN34Oul3mFndWbBUma+9s0ZdnphQKWhBJf+cuhMu
 4XhxvE6N4wQ8oP+vmbFlzl50ruQOlnBsQgGZ1S6t3dYuuAT49TA3OBoMY
 KvAiQBXfAI7OofUNhAwDzEbtEiTKLqCVtxUoqtMW0SNqUzVwkX4catglI
 t2fesKrQAX7rjuQ+dbd+kC8ETTXV99qu2TiWznStzgcbcRLxmHfeNC9wU
 UmkerwR6SThv/MPt9R7YNN5a6jlFlZAo7L0mwU8l6jORVlsoxXB404Qdd
 W2vsYbyezg96LkMTDqapCj9WdzYfWwMu3FQpQHYZ7Ak2EE79AOnPWXJIS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324766830"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324766830"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="727952125"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:21 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/i915/gt: optimize the ccs_sz calculation per chunk
Date: Thu, 21 Apr 2022 17:08:11 +0530
Message-Id: <20220421113813.30796-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421113813.30796-1-ramalingam.c@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate the ccs_sz that needs to be emitted based on the src
and dst pages emitted per chunk. And handle the return value of emit_pte
for the ccs pages.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 36 +++++++++----------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 29d761da02c4..463a6a14b5f9 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -647,17 +647,9 @@ static int scatter_list_length(struct scatterlist *sg)
 
 static void
 calculate_chunk_sz(struct drm_i915_private *i915, bool src_is_lmem,
-		   int *src_sz, int *ccs_sz, u32 bytes_to_cpy,
-		   u32 ccs_bytes_to_cpy)
+		   int *src_sz, u32 bytes_to_cpy, u32 ccs_bytes_to_cpy)
 {
 	if (ccs_bytes_to_cpy) {
-		/*
-		 * We can only copy the ccs data corresponding to
-		 * the CHUNK_SZ of lmem which is
-		 * GET_CCS_BYTES(i915, CHUNK_SZ))
-		 */
-		*ccs_sz = min_t(int, ccs_bytes_to_cpy, GET_CCS_BYTES(i915, CHUNK_SZ));
-
 		if (!src_is_lmem)
 			/*
 			 * When CHUNK_SZ is passed all the pages upto CHUNK_SZ
@@ -713,10 +705,10 @@ intel_context_migrate_copy(struct intel_context *ce,
 	struct drm_i915_private *i915 = ce->engine->i915;
 	u32 ccs_bytes_to_cpy = 0, bytes_to_cpy;
 	enum i915_cache_level ccs_cache_level;
-	int src_sz, dst_sz, ccs_sz;
 	u32 src_offset, dst_offset;
 	u8 src_access, dst_access;
 	struct i915_request *rq;
+	int src_sz, dst_sz;
 	bool ccs_is_src;
 	int err;
 
@@ -770,7 +762,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 	}
 
 	do {
-		int len;
+		int len, ccs_sz;
 
 		rq = i915_request_create(ce);
 		if (IS_ERR(rq)) {
@@ -797,7 +789,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		calculate_chunk_sz(i915, src_is_lmem, &src_sz, &ccs_sz,
+		calculate_chunk_sz(i915, src_is_lmem, &src_sz,
 				   bytes_to_cpy, ccs_bytes_to_cpy);
 
 		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
@@ -835,33 +827,29 @@ intel_context_migrate_copy(struct intel_context *ce,
 			if (err)
 				goto out_rq;
 
+			ccs_sz = GET_CCS_BYTES(i915, len);
 			err = emit_pte(rq, &it_ccs, ccs_cache_level, false,
 				       ccs_is_src ? src_offset : dst_offset,
 				       ccs_sz);
+			if (err < 0)
+				goto out_rq;
+			if (err < ccs_sz) {
+				err = -EINVAL;
+				goto out_rq;
+			}
 
 			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
 			if (err)
 				goto out_rq;
 
-			/*
-			 * Using max of src_sz and dst_sz, as we need to
-			 * pass the lmem size corresponding to the ccs
-			 * blocks we need to handle.
-			 */
-			ccs_sz = max_t(int, ccs_is_src ? ccs_sz : src_sz,
-				       ccs_is_src ? dst_sz : ccs_sz);
-
 			err = emit_copy_ccs(rq, dst_offset, dst_access,
-					    src_offset, src_access, ccs_sz);
+					    src_offset, src_access, len);
 			if (err)
 				goto out_rq;
 
 			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
 			if (err)
 				goto out_rq;
-
-			/* Converting back to ccs bytes */
-			ccs_sz = GET_CCS_BYTES(rq->engine->i915, ccs_sz);
 			ccs_bytes_to_cpy -= ccs_sz;
 		}
 
-- 
2.20.1

