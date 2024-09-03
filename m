Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D3969F32
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 15:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1F710E5A1;
	Tue,  3 Sep 2024 13:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lALEzFMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9332510E58A;
 Tue,  3 Sep 2024 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725370749; x=1756906749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JmO+/nMdzroK8b2EDBPWVeXIIZQOptsKQkGDXrCeqXU=;
 b=lALEzFMpBlOw4c6lMwcnbnDjjqMNbkV5ach3BzzLDMC8mELs1D+XMWRx
 ukD5iF6L7Kmkw3sShkgQdgQk1V72a6tvH9fHZPUpJPKImNlj5ND+ItzC/
 nUC8bSwNU6o3Wt5rkZu4xaHRhZ+LALkeslwNcrAYH9hco5wKcXJdn5xYT
 S1PyxcOsAJndePvIZtkH6Mdaj0MULN5ECN5wkFpRGbcKJe6X4urDJAj4P
 h1+S7/7CmLND1UFNKLiDDY1+c/SxjcGlbzdKt1WznaZzaATjLIyEytb/K
 xL3+HGOEpGgfTb+HeYlcnwZ8yxUJ1sLL7nD5E+yI9ACzfA4L+C493EVbz g==;
X-CSE-ConnectionGUID: 7wgD/u/qRUigWRIL1x37QA==
X-CSE-MsgGUID: DJ1Da/5YQuWd8l8cH/XfIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24157535"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="24157535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:39:08 -0700
X-CSE-ConnectionGUID: SQvpkcM1RxS5+dcSmxFXpg==
X-CSE-MsgGUID: sKAkSCDZSPqob1cu737/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="88156894"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:39:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/ttm: Forward -ENOSPC to drivers requesting it
Date: Tue,  3 Sep 2024 15:38:49 +0200
Message-ID: <20240903133849.17119-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

Some user-space APIs distinguison between graphics memory OOMs and
system (host) memory OOMs. To aid UMDs in determining the type of
OOM, allow forwarding the ENOSPC from resource managers to drivers
on calls to ttm_bo_validate().

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 include/drm/ttm/ttm_bo.h     | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index dd867b5e744c..d9a320dc8130 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -836,7 +836,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	} while (ret && force_space);
 
 	/* For backward compatibility with userspace */
-	if (ret == -ENOSPC)
+	if (ret == -ENOSPC && !ctx->forward_enospc)
 		return -ENOMEM;
 
 	/*
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 5804408815be..d3e12318d336 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -174,6 +174,8 @@ struct ttm_bo_kmap_obj {
  * BOs share the same reservation object.
  * @force_alloc: Don't check the memory account during suspend or CPU page
  * faults. Should only be used by TTM internally.
+ * @forward_enospc: Don't translate -ENOSPC errors from resource managers to
+ * -ENOMEM, but forward them to the driver.
  * @resv: Reservation object to allow reserved evictions with.
  * @bytes_moved: Statistics on how many bytes have been moved.
  *
@@ -185,6 +187,7 @@ struct ttm_operation_ctx {
 	bool no_wait_gpu;
 	bool gfp_retry_mayfail;
 	bool allow_res_evict;
+	bool forward_enospc;
 	bool force_alloc;
 	struct dma_resv *resv;
 	uint64_t bytes_moved;
-- 
2.46.0

