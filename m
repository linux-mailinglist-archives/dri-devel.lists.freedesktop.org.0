Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207D58AB99
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4298DB1D00;
	Fri,  5 Aug 2022 13:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E90B0759;
 Fri,  5 Aug 2022 13:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659705831; x=1691241831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8Xlc0juAwGuI6eFKNzmyh10cOrkYBzLlOnGwbrJtzk=;
 b=j3CYHgI4lpJRrb2VDQtSW+d4GaXKxFjTRH3P+tLUcFoeQgH1gFQxa5+G
 LUeGLmVxg11UVQtmZWCN2eR+u0PDS8FjRNB9EM3rs83TCiFC11u2SW15Y
 b7PVbr3Nf8AK8EAR18zQ7qy6/dU2Y8cLBaAFhVi4d7aS0whSmdRDmb069
 jpIm/trYe/b75lD0Y3Z783i/GBvmY7AjZGtwI+S3xLY35PGuHHJP9GION
 savMYdwDjYNiQTA7EU72FBPS3iqgLz4JLqB7r0JSzi0duoTezEm5J8trQ
 nWdqYNJog6WCW3q9Qdhw7lgo9EVYeTe50IxnTt7sZ2k0oskfGy+lOD5zU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="316089237"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="316089237"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 06:23:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="579497677"
Received: from namitaga-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.224.55])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 06:23:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/ttm: fix CCS handling
Date: Fri,  5 Aug 2022 14:22:40 +0100
Message-Id: <20220805132240.442747-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805132240.442747-1-matthew.auld@intel.com>
References: <20220805132240.442747-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Crucible + recent Mesa seems to sometimes hit:

GEM_BUG_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER)

And it looks like we can also trigger this with gem_lmem_swapping, if we
modify the test to use slightly larger object sizes.

Looking closer it looks like we have the following issues in
migrate_copy():

  - We are using plain integer in various places, which we can easily overflow
    with a large object.

  - We pass the entire object size (when the src is lmem) into
    emit_pte() and then try to copy it, which doesn't work, since we
    only have a few fixed sized windows in which to map the pages and
    perform the copy. With an object > 8M we therefore aren't properly
    copying the pages. And then with an object > 64M we trigger the
    GEM_BUG_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER).

So it looks like our copy handling for any object > 8M (which is our
CHUNK_SZ) is currently broken on DG2.

Fixes: da0595ae91da ("drm/i915/migrate: Evict and restore the flatccs capable lmem obj")
Testcase: igt@gem_lmem_swapping@basic-big
Testcase: igt@gem_lmem_swapping@verify-ccs-big
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 44 ++++++++++++-------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 1bbed7aa436a..aaaf1906026c 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -609,9 +609,9 @@ static int emit_copy(struct i915_request *rq,
 	return 0;
 }
 
-static int scatter_list_length(struct scatterlist *sg)
+static u64 scatter_list_length(struct scatterlist *sg)
 {
-	int len = 0;
+	u64 len = 0;
 
 	while (sg && sg_dma_len(sg)) {
 		len += sg_dma_len(sg);
@@ -621,28 +621,26 @@ static int scatter_list_length(struct scatterlist *sg)
 	return len;
 }
 
-static void
+static int
 calculate_chunk_sz(struct drm_i915_private *i915, bool src_is_lmem,
-		   int *src_sz, u32 bytes_to_cpy, u32 ccs_bytes_to_cpy)
+		   u64 bytes_to_cpy, u64 ccs_bytes_to_cpy)
 {
-	if (ccs_bytes_to_cpy) {
-		if (!src_is_lmem)
-			/*
-			 * When CHUNK_SZ is passed all the pages upto CHUNK_SZ
-			 * will be taken for the blt. in Flat-ccs supported
-			 * platform Smem obj will have more pages than required
-			 * for main meory hence limit it to the required size
-			 * for main memory
-			 */
-			*src_sz = min_t(int, bytes_to_cpy, CHUNK_SZ);
-	} else { /* ccs handling is not required */
-		*src_sz = CHUNK_SZ;
-	}
+	if (ccs_bytes_to_cpy && !src_is_lmem)
+		/*
+		 * When CHUNK_SZ is passed all the pages upto CHUNK_SZ
+		 * will be taken for the blt. in Flat-ccs supported
+		 * platform Smem obj will have more pages than required
+		 * for main meory hence limit it to the required size
+		 * for main memory
+		 */
+		return min_t(u64, bytes_to_cpy, CHUNK_SZ);
+	else
+		return CHUNK_SZ;
 }
 
-static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
+static void get_ccs_sg_sgt(struct sgt_dma *it, u64 bytes_to_cpy)
 {
-	u32 len;
+	u64 len;
 
 	do {
 		GEM_BUG_ON(!it->sg || !sg_dma_len(it->sg));
@@ -673,12 +671,12 @@ intel_context_migrate_copy(struct intel_context *ce,
 {
 	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst), it_ccs;
 	struct drm_i915_private *i915 = ce->engine->i915;
-	u32 ccs_bytes_to_cpy = 0, bytes_to_cpy;
+	u64 ccs_bytes_to_cpy = 0, bytes_to_cpy;
 	enum i915_cache_level ccs_cache_level;
 	u32 src_offset, dst_offset;
 	u8 src_access, dst_access;
 	struct i915_request *rq;
-	int src_sz, dst_sz;
+	u64 src_sz, dst_sz;
 	bool ccs_is_src, overwrite_ccs;
 	int err;
 
@@ -761,8 +759,8 @@ intel_context_migrate_copy(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		calculate_chunk_sz(i915, src_is_lmem, &src_sz,
-				   bytes_to_cpy, ccs_bytes_to_cpy);
+		src_sz = calculate_chunk_sz(i915, src_is_lmem,
+					    bytes_to_cpy, ccs_bytes_to_cpy);
 
 		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
 			       src_offset, src_sz);
-- 
2.37.1

