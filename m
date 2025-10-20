Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F65BF0EEF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4791210E421;
	Mon, 20 Oct 2025 11:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LDWcghus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2BE10E427;
 Mon, 20 Oct 2025 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GBzPJmdSuBvDvgcpfPHid7V4T9dYBbIgb1rCCJSQwuo=; b=LDWcghusUXSZU1M14ZVQghkv0F
 hVqoRJ5VVctF0F4WBtlNi8y8plJBtiKt6SF7S66vHnesjX2Une4GSVPLuWFFi/hON0Ozg1/PtPXKw
 njJa9kw2ZSoIp/Ff9o4NG4CyxqOUNNTAoGHiKItWAOGSNYPYeRuNrMSplsNxQicVsRYRCaBfALKRb
 so/HQ8ujgkNv5GnvsWTcoJ4nn1bFOxGS8FFAwXI1BzHaS5qFl2LlY1FaK94zmi+zJWjxNMok1re/F
 JvKkADeotsERTJ5bHGQC5JEF9gpcZut4SIDooyNuw9+cr2DJqxpP/urvbUGKc75D7nx2cMuewCtoA
 RvZogFiw==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vAoSw-00C5bO-OZ; Mon, 20 Oct 2025 13:54:18 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 6/6] drm/ttm: Add an allocation flag to propagate -ENOSPC
 on OOM
Date: Mon, 20 Oct 2025 12:54:11 +0100
Message-ID: <20251020115411.36818-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
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

Some graphics APIs differentiate between out-of-graphics-memory and
out-of-host-memory (system memory). Add a device init flag to have -ENOSPC
propagated from the resource managers instead of being converted to
-ENOMEM, to aid driver stacks in determining what error code to return or
whether corrective action can be taken at the driver level.

Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
Thomas, feel free to take the ownership if you end up liking this version.
As you can see I lifted your commit text as is and the implementation is
the same on the high level.
---
 drivers/gpu/drm/ttm/ttm_bo.c     | 4 +++-
 drivers/gpu/drm/ttm/ttm_device.c | 1 +
 include/drm/ttm/ttm_allocation.h | 1 +
 include/drm/ttm/ttm_device.h     | 5 +++++
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index fba2a68a556e..15b3cb199d45 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,7 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/ttm/ttm_allocation.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -877,7 +878,8 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 
 	/* For backward compatibility with userspace */
 	if (ret == -ENOSPC)
-		return -ENOMEM;
+		return bo->bdev->alloc_flags & TTM_ALLOCATION_PROPAGATE_ENOSPC ?
+		       ret : -ENOMEM;
 
 	/*
 	 * We might need to add a TTM.
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 87c85ccb21ac..5c10e5fbf43b 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -227,6 +227,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 		return -ENOMEM;
 	}
 
+	bdev->alloc_flags = alloc_flags;
 	bdev->funcs = funcs;
 
 	ttm_sys_man_init(bdev);
diff --git a/include/drm/ttm/ttm_allocation.h b/include/drm/ttm/ttm_allocation.h
index 8f8544760306..655d1e44aba7 100644
--- a/include/drm/ttm/ttm_allocation.h
+++ b/include/drm/ttm/ttm_allocation.h
@@ -7,5 +7,6 @@
 #define TTM_ALLOCATION_POOL_BENEFICIAL_ORDER(n)	((n) & 0xff) /* Max order which caller can benefit from */
 #define TTM_ALLOCATION_POOL_USE_DMA_ALLOC 	BIT(8) /* Use coherent DMA allocations. */
 #define TTM_ALLOCATION_POOL_USE_DMA32		BIT(9) /* Use GFP_DMA32 allocations. */
+#define TTM_ALLOCATION_PROPAGATE_ENOSPC		BIT(10) /* Do not convert ENOSPC from resource managers to ENOMEM. */
 
 #endif
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 074b98572275..d016360e5ceb 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -220,6 +220,11 @@ struct ttm_device {
 	 */
 	struct list_head device_list;
 
+	/**
+	 * @alloc_flags: TTM_ALLOCATION_ flags.
+	 */
+	unsigned int alloc_flags;
+
 	/**
 	 * @funcs: Function table for the device.
 	 * Constant after bo device init
-- 
2.48.0

