Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E878C4E9F7C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 21:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFE110ED1B;
	Mon, 28 Mar 2022 19:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E41A10EC71;
 Mon, 28 Mar 2022 19:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648494425; x=1680030425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5v6ZFKKS4WlAXROLFguq5zDCVNsABFwrBMmSBfhivr0=;
 b=NWJIDujMy/lYe1TnSvJKzED822VN9JPFXGiSkIz8yNdg1JFhRS3BirN8
 wMgkSjCeLwh9OxqTRzPwxhVQGA99rgUsYs2rQxkbz3Y7ZGAmIceXwpQ71
 D5aePPa8dc7EuHYFkQW7OU5qIndgsSwM//1QaQFozLehNS0WiLiIrapU5
 TJXoGc3WPF4KkWKNaLEvM1KitJoL7vsIt2jqoFNaoU62tksMhPj6GFlqX
 rH3ONYMq+ZqwJxTDZJIKFIRnCdltTv/S6J4Xf8KowzVl9kGpcvXb9W9d3
 xPD8WfDPdSzU1kcmTwWI2LPpVRcG4TRrXOOwuTzi7AzAhJIJVUKHxVbWC w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239678681"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="239678681"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563920959"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:02 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 3/9] drm/i915/gt: Optimize the migration and clear loop
Date: Tue, 29 Mar 2022 00:37:30 +0530
Message-Id: <20220328190736.19697-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220328190736.19697-1-ramalingam.c@intel.com>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the static calculations out of the loops for copy and clear.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 44 ++++++++++++-------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 17dd372a47d1..ec9a9e7cb388 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -526,6 +526,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 			   struct i915_request **out)
 {
 	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
+	u32 src_offset, dst_offset;
 	struct i915_request *rq;
 	int err;
 
@@ -534,8 +535,20 @@ intel_context_migrate_copy(struct intel_context *ce,
 
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
+	src_offset = 0;
+	dst_offset = CHUNK_SZ;
+	if (HAS_64K_PAGES(ce->engine->i915)) {
+		GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
+
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
@@ -563,19 +576,6 @@ intel_context_migrate_copy(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		src_offset = 0;
-		dst_offset = CHUNK_SZ;
-		if (HAS_64K_PAGES(ce->engine->i915)) {
-			GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
-
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
@@ -585,12 +585,10 @@ intel_context_migrate_copy(struct intel_context *ce,
 
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
@@ -691,6 +689,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 {
 	struct sgt_dma it = sg_sgt(sg);
 	struct i915_request *rq;
+	u32 offset;
 	int err;
 
 	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
@@ -698,8 +697,11 @@ intel_context_migrate_clear(struct intel_context *ce,
 
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
+	offset = 0;
+	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
+		offset = CHUNK_SZ;
+
 	do {
-		u32 offset;
 		int len;
 
 		rq = i915_request_create(ce);
@@ -727,10 +729,6 @@ intel_context_migrate_clear(struct intel_context *ce,
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

