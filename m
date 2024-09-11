Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5E9751D1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 14:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2B510E9D2;
	Wed, 11 Sep 2024 12:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3URSJs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740A10E4A7;
 Wed, 11 Sep 2024 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726057156; x=1757593156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5KobOXhOhC/mIkWteKXZzGJF6DvfPtGBbolRysMK61k=;
 b=S3URSJs7Ct2QhB6oxKrAN8A7ew2lmRc9zW6LHp2ZeFVUU0fDdKnde4Dc
 v+GcGVX+qkeGNc9Xvl1xw3MtqwXXU4nvOLDgNGH0oNZ9b6Vi8d3H7py0d
 y3ZkBV0yWp4ptiPA/v/A5x9mYPM7xPbQZ8uf6owsO6yAMLr4+vuY2GKm/
 F+fd7DsF3RYjthWn1fGwCsbMt4VcnlIzkhnkp/FeLfOg9mc5XATYqc9g2
 EYlmbAuNGeuxNLTHu9sSd+iojEer8eQo4yL1++v3zfL63HGJ11DR5rZZ+
 qTzTzfnsNqYWK1Jvgd3G0nJMu78TODU/ovw8p3cchNY0HQl30phNXreGi Q==;
X-CSE-ConnectionGUID: CC+Q78nWTqSVj3rwbpLjIg==
X-CSE-MsgGUID: M6TrXkbfS0CCvALfvHl/+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27773778"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="27773778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:19:15 -0700
X-CSE-ConnectionGUID: OJrdzBmrTNSEgVmJaajxxg==
X-CSE-MsgGUID: vgKqsx4YQH+Cln7AoG8aBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72121281"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:19:14 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/2] drm/ttm: Move pinned objects off LRU lists when pinning
Date: Wed, 11 Sep 2024 14:18:59 +0200
Message-ID: <20240911121859.85387-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
References: <20240911121859.85387-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Removing from a bulk move must be done with the pin-count still zero.
v3:
- ttm_resource_move_to_lru_tail must be done after pinning with a non-
  NULL resource (Intel CI).
v6:
- Use a TAB instead of space (checkpatch.pl error).

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com> #v1
---
 drivers/gpu/drm/ttm/ttm_bo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 875b024913a0..48c5365efca1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -594,7 +594,8 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
-	++bo->pin_count;
+	if (!bo->pin_count++ && bo->resource)
+		ttm_resource_move_to_lru_tail(bo->resource);
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

