Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BFF4DEABE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 21:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FB010EE1D;
	Sat, 19 Mar 2022 20:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C5210EE1D;
 Sat, 19 Mar 2022 20:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647722527; x=1679258527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yjj9H77xep5HpSSD2njPHe+M+yyXGg0O//ef+7+NtNs=;
 b=HM4JP4f5yirVUVTPhC/ZzTyKiZk0xoRyDzu14yUfusrARhhBZVhH3mQn
 C9WGBFIU2fJFBxYzTS+JDsC1aNKKlmzF/b1FuQrTi2AbO7tGgKTb38TEx
 ZhLaAgHPYq4fDoojmnjHlKigH7THolopHEdR5+hcidm8z868NmiuDn8qv
 RXwoGzkJuY1Ue84K8DdutmxgazfWz3K3zMt7NWkFGIwZtsynPNGPinGsc
 a/34jOFa5a4uE3/QQjdx2mKUKkQwfnaWGmF8RmPwbmENbRfVnxWHN4Al0
 iC4N3c3q9g1BauDp0i4x6fs1+VzZMWY4/yu0LxfperRSWe/3GVqjRz50+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="237270097"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="237270097"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:42:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="559245069"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 13:42:05 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 5/8] drm/i915/gt: Optimize the migration loop
Date: Sun, 20 Mar 2022 02:12:26 +0530
Message-Id: <20220319204229.9846-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220319204229.9846-1-ramalingam.c@intel.com>
References: <20220319204229.9846-1-ramalingam.c@intel.com>
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

Move the static calculations out of the loop.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 34 ++++++++++++-------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index bbfea570c239..b6c5a0102bc2 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -663,6 +663,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 			   struct i915_request **out)
 {
 	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
+	u32 src_offset, dst_offset;
 	struct i915_request *rq;
 	int err;
 
@@ -671,8 +672,20 @@ intel_context_migrate_copy(struct intel_context *ce,
 
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
@@ -700,19 +713,6 @@ intel_context_migrate_copy(struct intel_context *ce,
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
@@ -722,12 +722,10 @@ intel_context_migrate_copy(struct intel_context *ce,
 
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

