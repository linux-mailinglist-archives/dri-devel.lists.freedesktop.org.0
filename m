Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD3969D5D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7A710E56D;
	Tue,  3 Sep 2024 12:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pptt2Di6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEC110E56B;
 Tue,  3 Sep 2024 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725366022; x=1756902022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FSDjRzlEx0BahIcympCMSzE2CFM3VH+XzIscjyJNlmo=;
 b=Pptt2Di6HvG9Iu69jY2Tp4svfAHNBxE4CcNb/3cHI7DuOBk+UqOvids+
 2mhhKbdv0bLGG2pZKLaiEoFIoDPzeJ1aoK5VxR8KmtYYLdHmbTCSLZdts
 3xoAr28XvOukFyOjV2c3wAmhFCqpu5CyL0zTGc/h5gHX2FMMTX12YXD9Q
 F/k9YvBdYr9IOkVQLX6gtd/XhO3wsPNdd8Wp2GZqxAKKj4Pr9y8D16nbD
 mmVUMl36G5u3ZODFqSSmms4xJaWZO28kiVBIsLDBBLdUybctHhGffWtiN
 9HphTfQb+kcz4RGTVf4SF4dI2UJqEsKkg+gNpYg3wat1xMfqJyE5EaPt1 w==;
X-CSE-ConnectionGUID: tl4BSZRPRRiACAAVRteJkw==
X-CSE-MsgGUID: FRayJjziSj2cbfa6wIMwVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27752861"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="27752861"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:20:22 -0700
X-CSE-ConnectionGUID: ADHLXILORzu+CD4epcHSxw==
X-CSE-MsgGUID: KXEAjzohTmawxBNBHMtNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64569564"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.244.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:20:20 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/ttm: Move pinned objects off LRU lists when pinning
Date: Tue,  3 Sep 2024 14:19:58 +0200
Message-ID: <20240903121958.11078-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903121958.11078-1-thomas.hellstrom@linux.intel.com>
References: <20240903121958.11078-1-thomas.hellstrom@linux.intel.com>
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

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com> #v1
---
 drivers/gpu/drm/ttm/ttm_bo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 311290c0c8d9..dd867b5e744c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -594,7 +594,8 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
-	++bo->pin_count;
+	if (!bo->pin_count++ && bo->resource)
+	        ttm_resource_move_to_lru_tail(bo->resource);
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

