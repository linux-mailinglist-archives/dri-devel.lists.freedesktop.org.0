Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B609B969978
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D31610E45E;
	Tue,  3 Sep 2024 09:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyJ+s81v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5503F10E45C;
 Tue,  3 Sep 2024 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725356896; x=1756892896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBEA+5Xbs+w9yXVUhN/oHPKwM/zEJa8t1XPXCr+9sZw=;
 b=nyJ+s81vErveF+lKUhv7S3scl7hr1/XyKVNH+8BYbZ7KZn1xgZq19PUx
 P2bB8g6r3xjoQNY8vr2fMOQRUvyrr9V2TmwiTsQtnve5GwaPQN+8luTFi
 HlCvYxXoBvxpa/rou1OSd9B3kp0FATjSxaed6Ar71eyQNfbe3ugbwfBwt
 Kal2iygCMwJXGlIkk+Q3K9NsxuXpPmnE45EbXooIvKPoT/UqqnOvlDwvp
 vdWC96oppzvtD8pRS/itmDjSxUSnXmwa7Go/cz6w8G52ZO0DMhJqui57+
 CwOVEHr9KuwwHJwD5ZW0NPu8S9qWplb7lTtinwKAFiNBiEBFEQ6ABh9hG g==;
X-CSE-ConnectionGUID: ROYv6ZxERtuvXpUyrdiK2A==
X-CSE-MsgGUID: tQ0DSjxVQj6LYyZ+zbpVEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24096947"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="24096947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 02:48:15 -0700
X-CSE-ConnectionGUID: S70p9nmiQBWITSk3Eu7TJA==
X-CSE-MsgGUID: tSMjl+/MRpSmRN3aHpGjDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="88097312"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 02:48:14 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/ttm: Move pinned objects off LRU lists when pinning
Date: Tue,  3 Sep 2024 11:47:53 +0200
Message-ID: <20240903094753.169449-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903094753.169449-1-thomas.hellstrom@linux.intel.com>
References: <20240903094753.169449-1-thomas.hellstrom@linux.intel.com>
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com> #v1
---
 drivers/gpu/drm/ttm/ttm_bo.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ae29915c52c0..38c99acbda76 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -592,8 +592,10 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 	dma_resv_assert_held(bo->base.resv);
 	WARN_ON_ONCE(!kref_read(&bo->kref));
 	spin_lock(&bo->bdev->lru_lock);
-	if (bo->resource)
+	if (bo->resource) {
 		ttm_resource_del_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+	}
 	++bo->pin_count;
 	spin_unlock(&bo->bdev->lru_lock);
 }
@@ -613,9 +615,10 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
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

