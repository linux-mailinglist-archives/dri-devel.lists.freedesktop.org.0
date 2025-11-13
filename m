Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD9FC55EF2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 07:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0F110E2E2;
	Thu, 13 Nov 2025 06:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="P5ZqKQ9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com
 [45.254.49.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DE410E2E2;
 Thu, 13 Nov 2025 06:34:13 +0000 (UTC)
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
 by smtp.qiye.163.com (Hmail) with ESMTP id 296eb3989;
 Thu, 13 Nov 2025 14:34:08 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: jani.nikula@linux.intel.com
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 andi.shyti@linux.intel.com, mikolaj.wasiak@intel.com,
 krzysztof.karas@intel.com, krzysztof.niemiec@intel.com,
 nitin.r.gote@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH v2] drm/i915: Use symmetric free for vma resources
Date: Thu, 13 Nov 2025 06:34:05 +0000
Message-Id: <20251113063405.116845-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a7bebe2ac03a1kunm32325a7311214d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhlPVhgaTRpOGkpOTU0eGFYeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0xVSktLVUtZBg
 ++
DKIM-Signature: a=rsa-sha256;
 b=P5ZqKQ9rz1kEVvGKZ+XRtsZtVa8yDePzV24qvIJpzzCzY2tYwFUnpaAM6la7IS1Pbx0xVdAmCfnxYuj+wO/3nXAaOGEZkGb80CHraNCB9k1SA0dHixTVkEagfQun0JHpy8c3vF2p7qx2N9ORplOZjrhytdRHQ7vuqql0hnM9t7A=;
 s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1; 
 bh=ZSj4l+iI7JKR3Z396kPA7kl8a4f1l9OPjhSTji8cqHE=;
 h=date:mime-version:subject:message-id:from;
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

The error paths in reserve_gtt_with_resource() and
insert_gtt_with_resource() use kfree() to release a vma_res object
that was allocated with i915_vma_resource_alloc().

While kfree() can handle slab-allocated objects, it is better practice
to use the symmetric free function.

Replace kfree() with the specific i915_vma_resource_free() helper to
improve readability and ensure the alloc/free pairing is explicit.

Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
Changes in v2:
- Reword commit message to describe this as a readability change.
- Drop the Fixes tag.
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

