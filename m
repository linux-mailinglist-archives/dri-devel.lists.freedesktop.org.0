Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815ED582C3C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 18:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFE7B685F;
	Wed, 27 Jul 2022 16:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F029B5B94;
 Wed, 27 Jul 2022 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658940237; x=1690476237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2g7po6ocbadXtIwdXSQssZ2yJ0/Dj5FZEJfmxaCWx2k=;
 b=Ae0hnMJrfiuUKZDI4WtVXx8vPHihs8K2VIvRNToyPgIPCOHo6KjiE2Ly
 A2R+fpDYiFiQ1aY+SR2bR56S4e+xFedAPA2aonskPf5ROmXo1j9ZnCd40
 JlM2/DKpRRVCArG9TkpqqxygHBKdu9VVKaowdMtVlPDY4RRgd/GhWpkXj
 t+2lx9ThaAw08ik94vMTbXhj2JLUQb0LBjW5JseBWc1AOuQjDq3NO3I4z
 kDcrY9MUY+nXmKUjN24sMYpRZxJZOc2dk12UvXeVYvfZxNAeQv+piitDi
 Vj/yyfOAdIsCt4hgGwXmi3d0BL/XZm3okKVLxbVP+OrldggDFGGSYNDWW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="352281867"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="352281867"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 09:43:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="576061740"
Received: from pmcquill-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.217.165])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 09:43:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: don't leak the ccs state
Date: Wed, 27 Jul 2022 17:43:46 +0100
Message-Id: <20220727164346.282407-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.37.1
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

The kernel only manages the ccs state with lmem-only objects, however
the kernel should still take care not to leak the CCS state from the
previous user.

Fixes: 48760ffe923a ("drm/i915/gt: Clear compress metadata for Flat-ccs objects")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index a69b244f14d0..9a0814422ba4 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -708,7 +708,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 	u8 src_access, dst_access;
 	struct i915_request *rq;
 	int src_sz, dst_sz;
-	bool ccs_is_src;
+	bool ccs_is_src, overwrite_ccs;
 	int err;
 
 	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
@@ -749,6 +749,8 @@ intel_context_migrate_copy(struct intel_context *ce,
 			get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
 	}
 
+	overwrite_ccs = HAS_FLAT_CCS(i915) && !ccs_bytes_to_cpy && dst_is_lmem;
+
 	src_offset = 0;
 	dst_offset = CHUNK_SZ;
 	if (HAS_64K_PAGES(ce->engine->i915)) {
@@ -852,6 +854,25 @@ intel_context_migrate_copy(struct intel_context *ce,
 			if (err)
 				goto out_rq;
 			ccs_bytes_to_cpy -= ccs_sz;
+		} else if (overwrite_ccs) {
+			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
+			if (err)
+				goto out_rq;
+
+			/*
+			 * While we can't always restore/manage the CCS state,
+			 * we still need to ensure we don't leak the CCS state
+			 * from the previous user, so make sure we overwrite it
+			 * with something.
+			 */
+			err = emit_copy_ccs(rq, dst_offset, INDIRECT_ACCESS,
+					    dst_offset, DIRECT_ACCESS, len);
+			if (err)
+				goto out_rq;
+
+			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
+			if (err)
+				goto out_rq;
 		}
 
 		/* Arbitration is re-enabled between requests. */
-- 
2.37.1

