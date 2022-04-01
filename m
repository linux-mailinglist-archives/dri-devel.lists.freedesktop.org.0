Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249DF4EED45
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 14:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC3710E2A8;
	Fri,  1 Apr 2022 12:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D4210E263;
 Fri,  1 Apr 2022 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648816634; x=1680352634;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Hw/NsLGZ1DDjdhafogDxcG/Xpw/oBHD60PP7dNXUblU=;
 b=PzcYn6MWF10AdjxuMB3+Vcl9YweNuH4v7eSU664x88KBUFuepQEYu+BK
 QIZg/Pr3BgZydnfnaRdxKIXnQ5FbNxiKX5AGjf7GnK2FPXGWcD6TjUUD2
 lhqCoHntshSfZANtu3YEAQZvj+oRBpeH+94zVowEl4C4nnmxFUQOIMjBY
 EPRlHGiRySl2/yz53gsGktOdN1WyjeKJcWS2bl6jPPH9lmnWvLagjG0XF
 zLFAbYGdKttvhvxHKN76mHKgf+Kzjf1eukiPEo+3qDTcrLG61taGJGR75
 4sYeew+MPGPoJrVjpj4pUqcITZ9TQ2G7ikN3hGGm6U/sEKk/d14kA/2ah Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="257708061"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="257708061"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:37:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="606725183"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:37:12 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 3/9] drm/i915/gt: Optimize the migration and clear loop
Date: Fri,  1 Apr 2022 18:07:45 +0530
Message-Id: <20220401123751.27771-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220401123751.27771-1-ramalingam.c@intel.com>
References: <20220401123751.27771-1-ramalingam.c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the static calculations out of the loops for copy and clear.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 40 ++++++++++++-------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index e81f20266f62..580b4cf1efa2 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -526,6 +526,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 			   struct i915_request **out)
 {
 	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
+	u32 src_offset, dst_offset;
 	struct i915_request *rq;
 	int err;
 
@@ -535,8 +536,18 @@ intel_context_migrate_copy(struct intel_context *ce,
 
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
+	src_offset = 0;
+	dst_offset = CHUNK_SZ;
+	if (HAS_64K_PAGES(ce->engine->i915)) {
+		src_offset = 0;
+		dst_offset = 0;
+		if (src_is_lmem)
+			src_offset = CHUNK_SZ;
+		if (dst_is_lmem)
+			dst_offset = 2 * CHUNK_SZ;
+	}
+
 	do {
-		u32 src_offset, dst_offset;
 		int len;
 
 		rq = i915_request_create(ce);
@@ -564,17 +575,6 @@ intel_context_migrate_copy(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		src_offset = 0;
-		dst_offset = CHUNK_SZ;
-		if (HAS_64K_PAGES(ce->engine->i915)) {
-			src_offset = 0;
-			dst_offset = 0;
-			if (src_is_lmem)
-				src_offset = CHUNK_SZ;
-			if (dst_is_lmem)
-				dst_offset = 2 * CHUNK_SZ;
-		}
-
 		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
 			       src_offset, CHUNK_SZ);
 		if (len <= 0) {
@@ -584,12 +584,10 @@ intel_context_migrate_copy(struct intel_context *ce,
 
 		err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
 			       dst_offset, len);
-		if (err < 0)
-			goto out_rq;
-		if (err < len) {
+		if (err < len)
 			err = -EINVAL;
+		if (err < 0)
 			goto out_rq;
-		}
 
 		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
 		if (err)
@@ -690,6 +688,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 {
 	struct sgt_dma it = sg_sgt(sg);
 	struct i915_request *rq;
+	u32 offset;
 	int err;
 
 	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
@@ -697,8 +696,11 @@ intel_context_migrate_clear(struct intel_context *ce,
 
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
+	offset = 0;
+	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
+		offset = CHUNK_SZ;
+
 	do {
-		u32 offset;
 		int len;
 
 		rq = i915_request_create(ce);
@@ -726,10 +728,6 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		offset = 0;
-		if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
-			offset = CHUNK_SZ;
-
 		len = emit_pte(rq, &it, cache_level, is_lmem, offset, CHUNK_SZ);
 		if (len <= 0) {
 			err = len;
-- 
2.20.1

