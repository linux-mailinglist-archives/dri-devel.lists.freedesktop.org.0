Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855634FF2B7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E0910E0AA;
	Wed, 13 Apr 2022 08:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204010E0AA;
 Wed, 13 Apr 2022 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649839906; x=1681375906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vpiItvpgaFPmgHy1U3lf9GHP58gLjqtFS+hfWWpE+zQ=;
 b=e8fsZJte9V4Xxn1KQ/7+PzMAa+H0rXHuFISxvb6LQuZzzYYx5rQ35xzB
 02t1taVon2OUzA574lfyO21juBanStIOeTTKnLR7gzXEyj5+dIiRe/diI
 D5yqOXb18KmiAp+bVm6i7cBU6qzB883skw6rSvkbjISXQxX5Vz/VLlWEf
 VOFhwXU2AWmqRI3sQWxBcmT+jTMFFhgWdKmX3L0kgiM0HW0iH/989tC6r
 eAnKmDPFkFoLSbNLM5JvSoeqyDFV47vVXwiQuujx3LQVnt2X7/mq3vG2K
 MaFq0fDD/X/nG+g2+E2+gsiSAK92U//n3z4i/Gekl9/sE/k5JjLUbnS7M A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="249900189"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="249900189"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 01:51:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="507899289"
Received: from jomolloy-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 01:51:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/ttm: fixup ttm_bo_add_move_fence
Date: Wed, 13 Apr 2022 09:51:33 +0100
Message-Id: <20220413085133.275290-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like we still need to call dma_fence_put() on the man->move,
otherwise we just end up leaking it, leading to fireworks later.

v2(Daniel):
  - Simplify the function tail

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5689
Fixes: 8bb31587820a ("drm/ttm: remove bo->moving")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 015a94f766de..f7fbf162ce41 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -740,11 +740,9 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
 
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
-	if (unlikely(ret)) {
-		dma_fence_put(fence);
-		return ret;
-	}
-	return 0;
+
+	dma_fence_put(fence);
+	return ret;
 }
 
 /*
-- 
2.34.1

