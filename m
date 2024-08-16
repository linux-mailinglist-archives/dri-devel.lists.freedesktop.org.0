Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C853954B38
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 15:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C1E10E77C;
	Fri, 16 Aug 2024 13:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cdo7h7pa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F263910E75F;
 Fri, 16 Aug 2024 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723815472; x=1755351472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ciq5JBHdgU00AQvfhhfnMrRvpz5/+Oj8Ome1GZO1kos=;
 b=Cdo7h7pa+uQ9JVnFtKx7gWQLEwXVFm5595RpfB2h14rnd5+C1fmf+BOg
 Ewh4cCllO0aKEZgpjLJEUPphfFmxpgvdWLEJ0ADfHIr8f2lqxeWtpS7GZ
 NtQMCu8QDYIqF5GPpQryOKPqjY0iVN3c8mIxjTpGGNyfSdVUvx5rBGRvZ
 X7XYkr69hs/OdAcr5cwt1Phxu/Bq/eOruBnW2CZ5y/RFZax2OUGKHP812
 Z9p6myFeZgGkdkGjJsZLa+1/FJrAVlo1vaQmSA9LnZrzBuhUYabv6yThB
 LPHwJZgvW/FttAFKNtbOcNft10JMsw531jawnbxhxSYnPaBOnyw9Yw+eI g==;
X-CSE-ConnectionGUID: LhhdTX23QIe6aRD41hydBw==
X-CSE-MsgGUID: NucDbcdPRMmfTk+jHCiTXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="13053095"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="13053095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:37:52 -0700
X-CSE-ConnectionGUID: GdRph3pnT5y9Z1T4WwLpRA==
X-CSE-MsgGUID: JGEcK744R4SIpaocIDIsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="59639373"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:37:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v8 4/6] drm/ttm: Add a shrinker helper and export the LRU
 walker for driver use
Date: Fri, 16 Aug 2024 15:37:15 +0200
Message-ID: <20240816133717.3102-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240816133717.3102-1-thomas.hellstrom@linux.intel.com>
References: <20240816133717.3102-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the design direction communicated here:

https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9

Export the LRU walker for driver shrinker use and add a bo
shrinker helper for initial use by the xe driver.

v8:
- Split out from another patch.
- Use a struct for bool arguments to increase readability (Matt Brost).
- Unmap user-space cpu-mappings before shrinking pages.
- Explain non-fatal error codes (Matt Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 65 +++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo.h          | 17 ++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3c07f4712d5c..3490e3347de9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -919,3 +919,68 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 	return progress;
 }
+EXPORT_SYMBOL(ttm_lru_walk_for_evict);
+
+/**
+ * ttm_bo_try_shrink - LRU walk helper to shrink a ttm buffer object.
+ * @walk: The struct xe_ttm_lru_walk that describes the walk.
+ * @bo: The buffer object.
+ * @flags: Flags governing the shrinking behaviour.
+ *
+ * The function uses the ttm_tt_back_up functionality to back up or
+ * purge a struct ttm_tt. If the bo is not in system, it's first
+ * moved there, unless @flags.allow_move is false.
+ *
+ * Return: The number of pages shrunken or purged, or
+ * negative error code on failure.
+ */
+long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+		       const struct ttm_bo_shrink_flags flags)
+{
+	static const struct ttm_place sys_placement_flags = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = 0,
+	};
+	static struct ttm_placement sys_placement = {
+		.num_placement = 1,
+		.placement = &sys_placement_flags,
+	};
+	struct ttm_operation_ctx *ctx = walk->ctx;
+	struct ttm_tt *tt = bo->ttm;
+	long lret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (!tt || !ttm_tt_is_populated(tt))
+		return 0;
+
+	if (flags.allow_move && bo->resource->mem_type != TTM_PL_SYSTEM) {
+		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
+
+		/* Consider -ENOMEM and -ENOSPC non-fatal. */
+		if (ret) {
+			if (ret == -ENOMEM || ret == -ENOSPC)
+				ret = -EBUSY;
+			return ret;
+		}
+	}
+
+	ttm_bo_unmap_virtual(bo);
+	lret = ttm_bo_wait_ctx(bo, ctx);
+	if (lret < 0) {
+		if (lret == -ERESTARTSYS)
+			return lret;
+		return 0;
+	}
+
+	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
+			     {.purge = flags.purge,
+			      .writeback = flags.writeback});
+	if (lret < 0 && lret != -EINTR)
+		return 0;
+
+	return lret;
+}
+EXPORT_SYMBOL(ttm_bo_try_shrink);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index d1a732d56259..479ada85cea1 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -229,6 +229,23 @@ struct ttm_lru_walk {
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
+/**
+ * struct ttm_bo_shrink_flags - flags to govern the bo shrinking behaviour
+ * @purge: Purge the content rather than backing it up.
+ * @writeback: Attempt to immediately write content to swap space.
+ * @allow_move: Allow moving to system before shrinking. This is typically
+ * not desired for zombie- or ghost objects (with zombie object meaning
+ * objects with a zero gem object refcount)
+ */
+struct ttm_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+	u32 allow_move : 1;
+};
+
+long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+		       const struct ttm_bo_shrink_flags flags);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
-- 
2.44.0

