Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20976F84B7
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 16:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C6E10E616;
	Fri,  5 May 2023 14:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022BD10E60C;
 Fri,  5 May 2023 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683296269; x=1714832269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tik+/MGeY+k7fnXBlxw+EROZZhXhsx1fEEPOpvY3Fb4=;
 b=SCVMTIZoztwZIh5QdTOVJjfOeOrKusMXKdAfgUQEdFEbCCRZGwJCK9G/
 lqqNjKdjMAhIF0i4wcTHJyYmgllemX7di1awIl2WJbpx578HkHd/wFtvE
 6FfkqoV5byLljCZaRUPBE6bVJc92hcUFvzCDvRUsmk9etbZBGRHmN5iWs
 DD/db9g3+CtScnh9y+MosV61VtJdQqRXO5rIZLEYi9MvGdzgOYAxUPnwj
 NBcLaw5HTzDqVjJwhFK+/bpUWJQL9gMluocZDgF6AYOc8IVuIEJeTlXqj
 /gSdLe1v5wS7tw+1Sbd9JhHrw4HeiJp5EDzIOwCPJlc02H8SVvCzuJKnC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="338407421"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="338407421"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 07:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="767113079"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="767113079"
Received: from skofoed-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.230])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 07:17:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/ttm: Allow the driver to resolve a WW transaction
 rollback
Date: Fri,  5 May 2023 16:17:19 +0200
Message-Id: <20230505141719.332109-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
 intel-gfx@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow drivers to resolve a WW transaction rollback. This allows for
1) Putting a lower-priority transaction to sleep allowing another to
succeed instead both fighting using trylocks.
2) Letting the driver know whether a received -ENOMEM is the result of
competition with another WW transaction, which can be resolved using
rollback and retry or a real -ENOMEM which should be propagated back
to user-space as a failure.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 17 +++++++++++++++--
 include/drm/ttm/ttm_bo.h     |  2 ++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bd5dae4d1624..c3ccbea2be3e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -561,6 +561,10 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
 	if (!busy_bo || !ticket)
 		return -EBUSY;
 
+	/* We want to resolve contention before trying to lock again. */
+	if (ctx->propagate_edeadlk && ctx->contended_bo)
+		return  -EDEADLK;
+
 	if (ctx->interruptible)
 		r = dma_resv_lock_interruptible(busy_bo->base.resv,
 							  ticket);
@@ -575,7 +579,15 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
 	if (!r)
 		dma_resv_unlock(busy_bo->base.resv);
 
-	return r == -EDEADLK ? -EBUSY : r;
+	if (r == -EDEADLK) {
+		if (ctx->propagate_edeadlk) {
+			ttm_bo_get(busy_bo);
+			ctx->contended_bo = busy_bo;
+		}
+		r = -EBUSY;
+	}
+
+	return r;
 }
 
 int ttm_mem_evict_first(struct ttm_device *bdev,
@@ -816,7 +828,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			goto error;
 	}
 
-	ret = -ENOMEM;
+	ret = (ctx->propagate_edeadlk && ctx->contended_bo) ? -EDEADLK : -ENOMEM;
 	if (!type_found) {
 		pr_err(TTM_PFX "No compatible memory type found\n");
 		ret = -EINVAL;
@@ -913,6 +925,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		if (ret)
 			return ret;
 	}
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_validate);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8b113c384236..d8e35a794ce5 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -181,8 +181,10 @@ struct ttm_operation_ctx {
 	bool gfp_retry_mayfail;
 	bool allow_res_evict;
 	bool force_alloc;
+	bool propagate_edeadlk;
 	struct dma_resv *resv;
 	uint64_t bytes_moved;
+	struct ttm_buffer_object *contended_bo;
 };
 
 /**
-- 
2.39.2

