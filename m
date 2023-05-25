Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FF5710EF3
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEA310E182;
	Thu, 25 May 2023 15:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480C610E17E;
 Thu, 25 May 2023 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685026971; x=1716562971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+dRMW3y1EC3kkLp5yP0/dv5WVxqjT4HNUkRZWHd6AY=;
 b=Q221ARor6SuZJ6IgOOIuxyYtEDPfAn2GRr9PNTryr+skwgBJZEYJguu+
 j1bU2OivOzcCtus8um2epTr+cI53HA9kEdw8ptVZJc+IxUDkhTJ75Z05a
 PkRmp7VqAK/TwQYL0bhf/RFf6T/7lV0Lh9YKnraprNUGLIiV7Kx0snfF5
 9XjXL7MmMPXhH1Ob8Ecs5ZpRgSOE+YP91U7CQtoJrFL47GWsNvAsj6UuD
 HoSz9295FjEgSarEzwrbGyAF8JiKj1wasVFWVQ+hHrASo7dgdemIDZnfN
 KlOBXyURt4HV1Ytj7Rj5vbniGm+eVkFw0vrJJ63RgsCjCkXDBKiwSpDBD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357156444"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="357156444"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774696485"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="774696485"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.226])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:02:42 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ttm: Use a define for the resv wait timeout
Date: Thu, 25 May 2023 17:02:05 +0200
Message-Id: <20230525150205.194098-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525150205.194098-1-thomas.hellstrom@linux.intel.com>
References: <20230525150205.194098-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than coding different delays here and there, use a define for the
resv timeout delay.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 84a512538e45..bacaed78ae55 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,9 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+/* The "Reasonable fence signal time" used by TTM. */
+#define TTM_RESV_TIMEOUT (30 * HZ)
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -197,7 +200,7 @@ static void ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 		/* Last resort if memory allocation failed for fence copying */
 		dma_resv_wait_timeout(bo->base.resv,
 				      DMA_RESV_USAGE_BOOKKEEP, false,
-				      30 * HZ);
+				      TTM_RESV_TIMEOUT);
 		if (locked)
 			dma_resv_unlock(bo->base.resv);
 	}
@@ -276,7 +279,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 
 		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
 					     interruptible,
-					     30 * HZ);
+					     TTM_RESV_TIMEOUT);
 
 		if (lret < 0)
 			return lret;
@@ -1113,7 +1116,7 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
 	}
 
 	ret = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
-				    ctx->interruptible, 15 * HZ);
+				    ctx->interruptible, TTM_RESV_TIMEOUT);
 	if (unlikely(ret < 0))
 		return ret;
 	if (unlikely(ret == 0))
-- 
2.39.2

