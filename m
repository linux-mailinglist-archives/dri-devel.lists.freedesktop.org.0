Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D79A91E8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 23:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6B810E0B4;
	Mon, 21 Oct 2024 21:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgexrK55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B9410E0B4;
 Mon, 21 Oct 2024 21:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729545492; x=1761081492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IF3szAzYLAmUMg1AdI9+r6nlyZGZlqpJGjOyeoigxZo=;
 b=lgexrK55lX33avPfH9h3OxGl+3KpN9PZeebGlHf1rre0gqUOvHRIhZ8O
 Vq1niTTzjpMXLTi9Tw57wvyT+3t2gk2MSzduj5qIugS1CTEtc1e2qcqdh
 ydw6FrZE8tI3tTcWiEWcc8VEfLqpHnJqVrskV4oGLQ/Jseg6KXX4L+1MC
 bbtnvGbpooWAdCm0F6onu9IwmIvf5jboGHHhUcR8bdomkpHZ4doDxFIom
 0d5YQaIMITMJVDDmGV+X8eJ1c7DRf1RWFDC7u62ky3N87hL+BwiToxSDq
 Sg2qBjxd2Skf3BQ6BKYktne80V7Q893/Cl+wHFcjAS279S03RTfsvCF5A g==;
X-CSE-ConnectionGUID: HMVNmVvhTjuI3Xj/hjNbGw==
X-CSE-MsgGUID: oDW/cQCgQTiih5hh/iIvLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29257678"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="29257678"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:18:10 -0700
X-CSE-ConnectionGUID: t8rhjofMSYauXbjBhDmysQ==
X-CSE-MsgGUID: ULHYPp3fQi2KaO7nOSYnVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="80469579"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 14:18:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 1/9] drm/xe: Add xe_bo_vm_access
Date: Mon, 21 Oct 2024 14:18:27 -0700
Message-Id: <20241021211835.1675640-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021211835.1675640-1-matthew.brost@intel.com>
References: <20241021211835.1675640-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add xe_bo_vm_access which is wrapper around ttm_bo_vm_access which takes
rpm refs for device access.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..0261a8b29351 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1236,11 +1236,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
+			   void *buf, int len, int write)
+{
+	struct ttm_buffer_object *ttm_bo = vma->vm_private_data;
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+	struct xe_device *xe = xe_bo_device(bo);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 static const struct vm_operations_struct xe_gem_vm_ops = {
 	.fault = xe_gem_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
+	.access = xe_bo_vm_access,
 };
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
-- 
2.34.1

