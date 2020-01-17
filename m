Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B16D1404FC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5996F416;
	Fri, 17 Jan 2020 08:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AB06F3EF;
 Fri, 17 Jan 2020 07:35:40 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F2D9E22C9DC8FC8FC8CA;
 Fri, 17 Jan 2020 15:35:36 +0800 (CST)
Received: from localhost.localdomain (10.175.124.28) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Fri, 17 Jan 2020 15:35:25 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <chris@chris-wilson.co.uk>, <andi.shyti@intel.com>,
 <zhangxiaoxu5@huawei.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/i915: Fix i915_error_state_store error defination
Date: Fri, 17 Jan 2020 15:34:36 +0800
Message-ID: <20200117073436.6507-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 742379c0c4001 ("drm/i915: Start chopping up the GPU error
capture"), function 'i915_error_state_store' was defined and used with
only one parameter.

But if no 'CONFIG_DRM_I915_CAPTURE_ERROR', this function was defined
with two parameter.

This may lead compile error. This patch fix it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 9109004956bd..41c1475e1500 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -314,8 +314,7 @@ i915_vma_capture_finish(struct intel_gt_coredump *gt,
 }
 
 static inline void
-i915_error_state_store(struct drm_i915_private *i915,
-		       struct i915_gpu_coredump *error)
+i915_error_state_store(struct i915_gpu_coredump *error)
 {
 }
 
-- 
2.17.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
