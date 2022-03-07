Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F44D004B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F109E10F0DB;
	Mon,  7 Mar 2022 13:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E17F10F0DB;
 Mon,  7 Mar 2022 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646660427; x=1678196427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+H3Rmg1u066jNbQDih/my7Ss2/5LSH9ef3Aex8DDijo=;
 b=CdBBF84MSQG2o/dOEOsthCtOu3e0ahPj6yQu1DemQ+H7OXq5Hvg40zj2
 7m4uvLMBO0fP0fQKmSYIPFmJCMd3/lYsbm98+d0IZcRystWeGvypE9qUU
 kh1Xkt9SDCSmWt4ZBKI1N56F0PrGCLzdEDDshjuAd/GxciWryj8LR4p8y
 KHgsr7NgAu8/8uoi++LmjYUY1AFyasr4pfrI/4JTenYH+L+4nITku2MX9
 BwmBX1LBjXlorzZ5v/vn2EA0895OSfAjhhW3PeqE4I5AMMeQEoY/MbLZ/
 FbrRjKxYScSFN3tKWL44AQTHblSJY+aTui5JwAa7PVZfZkV0H68wR5Q2Z g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="251963974"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="251963974"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 05:40:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="643248154"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 05:40:24 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 5/6] drm/i915/gt: Optimize the migration loop
Date: Mon,  7 Mar 2022 19:10:37 +0530
Message-Id: <20220307134038.30525-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220307134038.30525-1-ramalingam.c@intel.com>
References: <20220307134038.30525-1-ramalingam.c@intel.com>
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
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the static calculations out of the loop.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 34 ++++++++++++-------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 05262f1b438e..24e0e73e4a90 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -556,6 +556,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 			   struct i915_request **out)
 {
 	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
+	u32 src_offset, dst_offset;
 	struct i915_request *rq;
 	int err;
 
@@ -564,8 +565,20 @@ intel_context_migrate_copy(struct intel_context *ce,
 
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
@@ -593,19 +606,6 @@ intel_context_migrate_copy(struct intel_context *ce,
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
@@ -615,12 +615,10 @@ intel_context_migrate_copy(struct intel_context *ce,
 
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
-- 
2.20.1

