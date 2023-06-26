Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9673DB0A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 11:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA78D10E1D0;
	Mon, 26 Jun 2023 09:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E46A10E1CC;
 Mon, 26 Jun 2023 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687770908; x=1719306908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8NHvqn83ZvFUkevP/WNZb8GNDLDy33tL9NNl4xX0eyI=;
 b=eReJh9QSXmeyxS0FkZ0jKd+wIsCnWGQGk/F0TqNielT2dJnZHxi9y7dV
 HzeB+uBeL3EnROMulhX5gCpzHOJK1O8SE933vLS0FwJsDHf1jDe5NXoDX
 sOfVWRH6iWa8AGmdTSHTlN/caJvm+7cbC3c85RttPeIlMATlaOzxNGn16
 mCb6eMMNZ4VoFjffkHMJ+shgxo1eEx4pSg4wQ3/GJKuAk8l/fBBFbbSP8
 JSd/zNiMzH6O4EIxqS7RdrMH9dcJUjzEXl8ZBUD679/ZwkIcFR6d8Vx4V
 9W36gPJSLSfZ2E2LZlvva9bvZl+y7HFdfPlzaQm2WLaVw1q46IWndT6Dy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="345974098"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="345974098"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 02:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="781357775"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="781357775"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.105])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 02:15:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/ttm: Don't shadow the operation context
Date: Mon, 26 Jun 2023 11:14:48 +0200
Message-Id: <20230626091450.14757-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
References: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Roger He <Hongbo.He@amd.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_bo_swapout() shadows the ttm operation context which may cause
major confusion in driver callbacks when swapping out !TTM_PL_SYSTEM
memory. Fix this by reusing the operation context argument to
ttm_bo_swapout().

Cc: "Christian König" <christian.koenig@amd.com>
Cc: Roger He <Hongbo.He@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <intel-gfx@lists.freedesktop.org>
Cc: <stable@vger.kernel.org> # v4.16+
Fixes: dc947770cf34 ("drm/ttm: enable swapout for reserved BOs during allocation")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bd5dae4d1624..615d30c4262d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1154,7 +1154,6 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * Move to system cached
 	 */
 	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
-		struct ttm_operation_ctx ctx = { false, false };
 		struct ttm_resource *evict_mem;
 		struct ttm_place hop;
 
@@ -1164,7 +1163,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		if (unlikely(ret))
 			goto out;
 
-		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, &ctx, &hop);
+		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
 		if (unlikely(ret != 0)) {
 			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
 			goto out;
-- 
2.40.1

