Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF46C4E32C3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055D10E49A;
	Mon, 21 Mar 2022 22:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C6F10E49A;
 Mon, 21 Mar 2022 22:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902670; x=1679438670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HNI4A+hMoumeX/wVU347igJAT8Tf3osK8Mi9jIa5b08=;
 b=c9LsSe6Qzt7naB87WuCAk1fpUEvwpWX2/1qOEVa2vtHigUQWJ4vyNLb8
 loMCNQJAKUcYv8YmIXSO/IUAb/UoTMYCipy8UQyP/RzO8UUvMtNQFi/yZ
 Q/EI6jobSodKMov19AHHivv65QSNc30YjxdPhtt4BLdUgaWCr4ADNoCwJ
 Xva+JZt/I1s6N6MfQP/gLuNuU9oM4UHvrh/9RtDErmeNCptWR0uq3VzV5
 vHrzcbD0iK+10ZUh1xZ3h7d0EbJz5oOAH2YFGu49zblHuet25d7xc/tIp
 Y45JAYUnmOWpp9BSYPl+n/tiUBPPHCWP8fjE/m5B/glnOlPYxLflFsBdL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257613680"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="257613680"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:29 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="543414190"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:27 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 2/9] drm/i915/gt: Optimize the migration and clear loop
Date: Tue, 22 Mar 2022 04:14:52 +0530
Message-Id: <20220321224459.12223-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220321224459.12223-1-ramalingam.c@intel.com>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
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

Move the static calculations out of the loops for copy and clear.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 44 ++++++++++++-------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 73199ebf0671..b656685a486d 100644
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
@@ -694,6 +692,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 {
 	struct sgt_dma it = sg_sgt(sg);
 	struct i915_request *rq;
+	u32 offset;
 	int err;
 
 	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
@@ -701,8 +700,11 @@ intel_context_migrate_clear(struct intel_context *ce,
 
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
+	offset = 0;
+	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
+		offset = CHUNK_SZ;
+
 	do {
-		u32 offset;
 		int len;
 
 		rq = i915_request_create(ce);
@@ -730,10 +732,6 @@ intel_context_migrate_clear(struct intel_context *ce,
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

