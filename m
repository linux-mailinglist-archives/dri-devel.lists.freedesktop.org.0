Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E91B8A67C5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 12:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F064A10F79B;
	Tue, 16 Apr 2024 10:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mg8bL9Zp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0521810EFC2;
 Tue, 16 Apr 2024 10:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713262122; x=1744798122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcQ4DWII7a5vFVqrDp1AZ/G+iqHwm15Ml6TIhcKLkTk=;
 b=Mg8bL9ZpoZmrd3bcUZ9Qa6F1Ysc3Wlbje1JjLKAZJhVXZ+SlsrZfJZCi
 1+dErW8ElGlZC6er2KX4a9L4+nUqWBnj/yK8kfKNREOx7/qOkb9vyOfIQ
 /DCY8+II+FD+heLEFfp7y7trSkx+Mfvv0w7KHV6/03VSHyuI+GqIjvKpC
 bX3kE9IqJ0C4HkE0rEuscGdUqec/q991EyfrGg89rZk0gAxV4hxm3A1Yh
 9zdfu8LcMJJX/ZjUDgAmpLEaGmuPFfIzp3I9pyCdad+nf7j8F5Bc7+ecl
 w17nSZQ96QcqbrP3MV1YnNWvLo1FzQ3SkuCxQ1oae1L4uOq4J0bkQXI4h g==;
X-CSE-ConnectionGUID: Xs0akOS0SkSoaejyplviBA==
X-CSE-MsgGUID: UPPIQk20SdmelS7ThK0gkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20112376"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="20112376"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:42 -0700
X-CSE-ConnectionGUID: Z6VfA3r2Tn+bk1fS+MFxtw==
X-CSE-MsgGUID: 8oD6neyYQN+TpcWZgT0V9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22620336"
Received: from fcgoea-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/9] drm/ttm: Allow continued swapout after -ENOSPC falure
Date: Tue, 16 Apr 2024 12:07:25 +0200
Message-ID: <20240416100730.6666-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
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

The -ENOSPC failure from ttm_bo_swapout() meant that the lru_lock
was dropped and simply restarting the iteration meant we'd likely
hit the same error again on the same resource. Now that we can
restart the iteration even if the lock was dropped, do that.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e8a6a1dab669..4a030b4bc848 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -168,15 +168,20 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 
 			num_pages = PFN_UP(bo->base.size);
 			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
-			/* ttm_bo_swapout has dropped the lru_lock */
-			if (!ret) {
-				ttm_resource_cursor_fini(&cursor);
-				return num_pages;
-			}
-			if (ret != -EBUSY) {
-				ttm_resource_cursor_fini(&cursor);
-				return ret;
+			/* Couldn't swap out, and retained the lru_lock */
+			if (ret == -EBUSY)
+				continue;
+			/* Couldn't swap out and dropped the lru_lock */
+			if (ret == -ENOSPC) {
+				spin_lock(&bdev->lru_lock);
+				continue;
 			}
+			/*
+			 * Dropped the lock and either succeeded or
+			 * hit an error that forces us to break.
+			 */
+			ttm_resource_cursor_fini(&cursor);
+			return ret ? ret : num_pages;
 		}
 	}
 	ttm_resource_cursor_fini_locked(&cursor);
-- 
2.44.0

