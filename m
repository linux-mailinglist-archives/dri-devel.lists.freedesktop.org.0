Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E14968B32
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 17:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4798210E33A;
	Mon,  2 Sep 2024 15:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eT72b67U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39B310E335;
 Mon,  2 Sep 2024 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725291750; x=1756827750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UzUCiwr3w10mNuGMcT3IQf/fvShn72MkbQO0KNGEnVU=;
 b=eT72b67U1G+D25C7L+bnLgWbNOGtO5hR8YxEkC5TS70ctPszNIkHEhxJ
 WL+3WYgQ/L8alM9gso+gEQHDPd9vxUQmQhfCW14Xr87xdUs4ZjxN2XFoO
 XvhIxMo82B/g4DHzIshcWxv9N9BpvYtL9atzvhA5yazu1o0TmfLvLuyIn
 biLHWs4aCNtW8YRZGeS4CPibu0OMITRl9ox9Np1EvBAZaaHsyTAMh+HW6
 iOvcbwuCFBR7ZWVU/KYdVulmCBk2VQBglXe7tzufhx64IdT5oGn9Z/ud7
 uUzNsLRJG6G7cB+uXaX1B0GchxD7km0kDdk0ZzxLTciqkokZLRXZk2lhW w==;
X-CSE-ConnectionGUID: WJDvKOHXTZ2LWC7fgF10ag==
X-CSE-MsgGUID: PJVn1GOiTnKY+eHh/1Pd8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41352843"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41352843"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:42:30 -0700
X-CSE-ConnectionGUID: UW1rTbroRuuwMD4fb+4Phw==
X-CSE-MsgGUID: +1A7V6p6Q42onSncNKspWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65370619"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.77])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:42:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: Move pinned objects off LRU lists when pinning
Date: Mon,  2 Sep 2024 17:41:59 +0200
Message-ID: <20240902154159.78871-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
References: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
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

The ttm_bo_pin() and ttm_bo_unpin() functions weren't moving their
resources off the LRU list to the unevictable list.

Make sure that happens so that pinned objects don't accidently linger
on the LRU lists, and also make sure to move them back once they
are unpinned.

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d244566a7e48..057a65f51969 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -592,9 +592,10 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 	dma_resv_assert_held(bo->base.resv);
 	WARN_ON_ONCE(!kref_read(&bo->kref));
 	spin_lock(&bo->bdev->lru_lock);
-	if (bo->resource)
+	if (!bo->pin_count++ && bo->resource) {
 		ttm_resource_del_bulk_move(bo->resource, bo);
-	++bo->pin_count;
+		ttm_resource_move_to_lru_tail(bo->resource);
+	}
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_pin);
@@ -613,9 +614,10 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
 		return;
 
 	spin_lock(&bo->bdev->lru_lock);
-	--bo->pin_count;
-	if (bo->resource)
+	if (!--bo->pin_count && bo->resource) {
 		ttm_resource_add_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+	}
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_unpin);
-- 
2.46.0

