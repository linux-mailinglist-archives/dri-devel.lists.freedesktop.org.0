Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E2517176
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1D210EA0D;
	Mon,  2 May 2022 14:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C2310EAE5;
 Mon,  2 May 2022 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651501520; x=1683037520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lmrkCkSOzRx75b/qd0IzsSxfldz6iz4JB2FM6uQB8V0=;
 b=HVAUd7H7NDKm2djUyQkEkbTLKz6UGUFxZZgpFQIfgfB9rh3EeS6HhUdU
 xO6We6nqLCfkedr3Cx+PspM9Mq9mTokk8YQdfYoUK+c4YREE9XT3CgvUV
 Ao8CjiWcW+n6/QG51bIOjACO9ejBBWYkOHVZbxeW0t56foV4DMpNEwsUO
 WiGzlraWwvjjX6L5uQ5FkNtBJnpriL5edeYK+Sco+9oVN+SKyuv1VHAXx
 vnSGBc3DE++dMjqNq8kNNefJyn15N7fvaQX5d4N3ZxcRkfDL7E+pWPCeu
 8LmwYXFHqOQPCllFO0r8aobRneiMUrUblV7vJfWvzq0ajj/gUXF/xxNU8 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292403402"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="292403402"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="516111172"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:25:18 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 2/3] drm/i915/gt: optimize the ccs_sz calculation per chunk
Date: Mon,  2 May 2022 19:56:17 +0530
Message-Id: <20220502142618.2704-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220502142618.2704-1-ramalingam.c@intel.com>
References: <20220502142618.2704-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate the ccs_sz that needs to be emitted based on the src
and dst pages emitted per chunk. And handle the return value of emit_pte
for the ccs pages.

v2:
  ccs_sz moved to the reduced scope [Matt]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 36 +++++++++----------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 168d17b6f48a..fc6975e55fae 100644
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
@@ -717,10 +709,10 @@ intel_context_migrate_copy(struct intel_context *ce,
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
 
@@ -803,7 +795,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		calculate_chunk_sz(i915, src_is_lmem, &src_sz, &ccs_sz,
+		calculate_chunk_sz(i915, src_is_lmem, &src_sz,
 				   bytes_to_cpy, ccs_bytes_to_cpy);
 
 		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
@@ -837,37 +829,35 @@ intel_context_migrate_copy(struct intel_context *ce,
 		bytes_to_cpy -= len;
 
 		if (ccs_bytes_to_cpy) {
+			int ccs_sz;
+
 			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
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

