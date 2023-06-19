Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C78F735B07
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 17:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0435910E222;
	Mon, 19 Jun 2023 15:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D2F10E21F;
 Mon, 19 Jun 2023 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687188165; x=1718724165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GCMyK+xJ6tV0MhOJSpsZLG7SrNrk3ubg6srKYqjeUnI=;
 b=eHtMqQsJbrZQJZYAjxynVHHrhFLd9+3B/5PDUi7zmnzvji/syG6bV/gN
 MmMHJ8kwbFZL8UAOHVQ5Njz1OWF8ne8nkg6KUFuPl6ob/bx3jVERgxIGd
 OUwvgxodAqEg/BbV/XVAt1gYML29hGwXJftQsMO67ye7t0whySTvaVf4C
 xwt1Q+NvfFb/zwMamQIxQF5tcUkxtw6lk78PRf5rsZyQKoiU9BBTrwMjg
 psP5pgspEeMX9f+6nk1Kf2WBf+k62DeynlJrvOL7seRapJGtTvq6KSVRT
 pGgIXWLl/hsuD+/CnRi6BsCaEuHrbVJazvksApCYJXYDMmvYevO0+YG52 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349381565"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349381565"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858250611"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="858250611"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/ttm: Don't shadow the operation context
Date: Mon, 19 Jun 2023 17:22:22 +0200
Message-Id: <20230619152222.11733-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_bo_swapout() shadows the ttm operation context which may cause
major confusion in driver callbacks when swapping out !TTM_PL_SYSTEM
memory. Fix this by reusing the operation context argument to
ttm_bo_swapout().

Cc: "Christian König" <christian.koenig@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <intel-gfx@lists.freedesktop.org>
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

