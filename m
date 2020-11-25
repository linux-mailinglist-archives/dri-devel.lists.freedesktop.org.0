Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2F2C3A92
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059F36E848;
	Wed, 25 Nov 2020 08:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5613F89FD9;
 Wed, 25 Nov 2020 01:26:31 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cgjrt3Jq7zhc3j;
 Wed, 25 Nov 2020 09:26:06 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 09:26:18 +0800
From: Luo Meng <luomeng12@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <chris@chris-wilson.co.uk>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <luomeng12@huawei.com>
Subject: [PATCH] drm/i915: fix error return code in check_partial_mapping()
Date: Wed, 25 Nov 2020 09:29:38 +0800
Message-ID: <20201125012938.2767821-1-luomeng12@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix to return a negative error code from the error handling case
instead of 0 in function check_partial_mapping(), as done elsewhere
in this function.

Fixes: 07e98eb0a174 ("drm/i915/selftests: Tighten the timeout testing for partial mmaps")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Luo Meng <luomeng12@huawei.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index d27d87a678c8..3f5e7d0a3c53 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -137,8 +137,10 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	i915_vma_unpin_iomap(vma);
 
 	offset = tiled_offset(tile, page << PAGE_SHIFT);
-	if (offset >= obj->base.size)
+	if (offset >= obj->base.size) {
+		err = -EINVAL;
 		goto out;
+	}
 
 	intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
 
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
