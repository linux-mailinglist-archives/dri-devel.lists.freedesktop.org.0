Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCE0C69C75
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C340E10E4C4;
	Tue, 18 Nov 2025 14:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOP+LX3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8171210E4C3;
 Tue, 18 Nov 2025 14:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763474492; x=1795010492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sGJPEzQFfkUfeQnrM++fCGVijQBvElIUruQL/5czQW8=;
 b=jOP+LX3bKXtSk0rOSOEoCIp3qnuxOw+P2WqiKvcQK/7oNHVMRXLikDdO
 rqLkshsZ4+kvp/Uav3q+2eHFUjCcsJT1l6lUw+qggYkuAQjPAGOxY0Jw7
 2jKZwXCo2kkBArAPGo3VFNS/wK0EtMg5wbaHv3wRhtqjIY9Cj8MC8ZGCA
 v3lgWJ7hBuA7GcqGk2ZBPCAMZvHlMIElFKjhhJ53sfRH3f15IqfCjs9Re
 KVJ2l1uDXsvtXVNCrq1CF8OjApgKyU/p8q/CsiJ5Ag7p9sX34cZ0roQ+4
 dORgfyBoO6UiTICsjG+Q0Xs00SeZNUQ4ZN9XJDkIeB3MD1xgkaWJJGjNG A==;
X-CSE-ConnectionGUID: j7SoZdtnTIegeJjBjHVeEw==
X-CSE-MsgGUID: LPGXDigbTXCvlYfUiXhuKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76847372"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76847372"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:01:31 -0800
X-CSE-ConnectionGUID: gk4DKiHITDekbligu8KImQ==
X-CSE-MsgGUID: 6Qcu3rnlRV2o4JV7BKlXBw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.123])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:01:29 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Zilin Guan <zilin@seu.edu.cn>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3] drm/i915: Use symmetric free for vma resources
Date: Tue, 18 Nov 2025 15:01:18 +0100
Message-ID: <20251118140118.220339-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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

From: Zilin Guan <zilin@seu.edu.cn>

The error paths in reserve_gtt_with_resource() and
insert_gtt_with_resource() use kfree() to release a vma_res object
that was allocated with i915_vma_resource_alloc().

While kfree() can handle slab-allocated objects, it is better practice
to use the symmetric free function.

Replace kfree() with the specific i915_vma_resource_free() helper to
improve readability and ensure the alloc/free pairing is explicit.

Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Link: https://lore.kernel.org/r/20251113063405.116845-1-zilin@seu.edu.cn
---
Hi,

I'm resending this patch so that CI takes it and tests it

Changes in v3 (from Andi):
- Added my SoB and r-b tag.

Changes in v2 (from Zilin):
- Reword commit message to describe this as a readability change.
- Drop the Fixes tag.

 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 0a86e4857539..e9df4b9f5ebe 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1528,7 +1528,7 @@ static int reserve_gtt_with_resource(struct i915_vma *vma, u64 offset)
 		i915_vma_resource_init_from_vma(vma_res, vma);
 		vma->resource = vma_res;
 	} else {
-		kfree(vma_res);
+		i915_vma_resource_free(vma_res);
 	}
 	mutex_unlock(&vm->mutex);
 
@@ -1708,7 +1708,7 @@ static int insert_gtt_with_resource(struct i915_vma *vma)
 		i915_vma_resource_init_from_vma(vma_res, vma);
 		vma->resource = vma_res;
 	} else {
-		kfree(vma_res);
+		i915_vma_resource_free(vma_res);
 	}
 	mutex_unlock(&vm->mutex);
 
-- 
2.51.0

