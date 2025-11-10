Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA687C46910
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88F310E2C0;
	Mon, 10 Nov 2025 12:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="ZIqpqclA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 10 Nov 2025 08:54:04 UTC
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com
 [45.254.49.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D02210E0F0;
 Mon, 10 Nov 2025 08:54:04 +0000 (UTC)
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
 by smtp.qiye.163.com (Hmail) with ESMTP id 29056fe23;
 Mon, 10 Nov 2025 16:48:58 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: jani.nikula@linux.intel.com
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 andi.shyti@linux.intel.com, mikolaj.wasiak@intel.com,
 krzysztof.karas@intel.com, nitin.r.gote@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
 Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] drm/i915: Fix improper freeing of GTT resources
Date: Mon, 10 Nov 2025 08:48:54 +0000
Message-Id: <20251110084854.750219-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a6cf4407703a1kunm60fb54dea58d19
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCShkaVksZHR8aGh5KSkMeT1YeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
DKIM-Signature: a=rsa-sha256;
 b=ZIqpqclAxMTuBpVxDXAljoWPvTLRG4w9zf+DU7lfiJeSbYcGmcO6BZ+kOJUjmg2tvwpLcfzIEG3AsXjtpDXI50Q8qXN005DeIdmcbXN3ZiWto+BCEXJ8uS2po2ezzV883E9sKJisMQ+GsrcdXR9oq+VPX5GZJfFOXEhjArebiEo=;
 s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1; 
 bh=NNeu8X5AfKIaZAoYrzMFyvH5cUOsd9q1DZT/gH4VelI=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Mon, 10 Nov 2025 12:22:48 +0000
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

In the error paths of reserve_gtt_with_resource() and
insert_gtt_with_resource(), a vma_res object allocated via
i915_vma_resource_alloc() was incorrectly released using kfree().

Since i915_vma_resource_alloc() allocates objects from a dedicated
kmem_cache, using kfree() instead of the corresponding
i915_vma_resource_free() causes a mismatch between allocation and
deallocation routines, potentially leading to memory corruption.

Fix this by calling i915_vma_resource_free() to properly release the
vma_res object in both functions.

Fixes: e1a4bbb6e837d ("drm/i915: Initial introduction of vma resources")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 7ab4c4e60264..16e72ef57bed 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1524,7 +1524,7 @@ static int reserve_gtt_with_resource(struct i915_vma *vma, u64 offset)
 		i915_vma_resource_init_from_vma(vma_res, vma);
 		vma->resource = vma_res;
 	} else {
-		kfree(vma_res);
+		i915_vma_resource_free(vma_res);
 	}
 	mutex_unlock(&vm->mutex);
 
@@ -1704,7 +1704,7 @@ static int insert_gtt_with_resource(struct i915_vma *vma)
 		i915_vma_resource_init_from_vma(vma_res, vma);
 		vma->resource = vma_res;
 	} else {
-		kfree(vma_res);
+		i915_vma_resource_free(vma_res);
 	}
 	mutex_unlock(&vm->mutex);
 
-- 
2.34.1

