Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A654CDB29
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A48112BAA;
	Fri,  4 Mar 2022 17:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E8F112BB6;
 Fri,  4 Mar 2022 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646415783; x=1677951783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d08DW+F8JKXuLeI8C+hBgN1vFvUfdXj7t4cU+/d/t0I=;
 b=khBUX6Jfr7qipXNdDrLukvMfv/L0YoNPXyPaR0CqvZSPCXSulSaUWZJu
 7vlKFYKzw3Z+AXSZkk+LFXo6xmRA/GZ0FLzIuJ5xRHZhHxoPSpi6UxptM
 wdt74GPQiRtxzlqmF0g+7w8MobKcDDR58dbDGhVGRRheH2yyu1g1/zMAb
 mdLm6oj0NR3ZAQsjiyr2oXfG5XPpLKP5m/i0fgh+mKVfj3wUUig1LcgeT
 3qDU4G66hgWfPM9TEO6uvlMQvcUCzyqdBnN7Aq9FVF7MdLUAFMQ91dQsW
 PkEJ4IRbDLmDwZ0VP+T6D9ghq4v+2vVZ8cXvj+tDeXpBtQHPHX5irhJQC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="253754473"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="253754473"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:43:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="536349414"
Received: from vkats-mobl1.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.8])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:43:01 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: stop checking for NULL vma->obj
Date: Fri,  4 Mar 2022 17:42:52 +0000
Message-Id: <20220304174252.1000238-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is no longer possible since e6e1a304d759 ("drm/i915: vma is always
backed by an object.").

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 94fcdb7bd21d..7acfbbc63d17 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -515,21 +515,18 @@ int i915_vma_bind(struct i915_vma *vma,
 		if (!work->vma_res->bi.pages_rsgt)
 			work->pinned = i915_gem_object_get(vma->obj);
 	} else {
-		if (vma->obj) {
-			ret = i915_gem_object_wait_moving_fence(vma->obj, true);
-			if (ret) {
-				i915_vma_resource_free(vma->resource);
-				vma->resource = NULL;
+		ret = i915_gem_object_wait_moving_fence(vma->obj, true);
+		if (ret) {
+			i915_vma_resource_free(vma->resource);
+			vma->resource = NULL;
 
-				return ret;
-			}
+			return ret;
 		}
 		vma->ops->bind_vma(vma->vm, NULL, vma->resource, cache_level,
 				   bind_flags);
 	}
 
-	if (vma->obj)
-		set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
+	set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
 
 	atomic_or(bind_flags, &vma->flags);
 	return 0;
@@ -1360,7 +1357,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (flags & PIN_GLOBAL)
 		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
 
-	moving = vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NULL;
+	moving = i915_gem_object_get_moving_fence(vma->obj);
 	if (flags & vma->vm->bind_async_flags || moving) {
 		/* lock VM */
 		err = i915_vm_lock_objects(vma->vm, ww);
-- 
2.34.1

