Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15A9D9CD3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9910E98A;
	Tue, 26 Nov 2024 17:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9J14hZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27D910E96B;
 Tue, 26 Nov 2024 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643140; x=1764179140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ZqNF39QaBs83JHuzqa17bQtGi85tWe8GAWqSC8Hdqs=;
 b=B9J14hZ4yPQNM2QaOI8rREdTy5yZYxlhITwyH0k8A/lowsO+FfNoq8En
 vYVRnrujZ+IBgeCiM3qCeHFb8N0F69EflHnuXTZLX3+gjIuvy07jyx5rr
 Pyxoc9gYletyBdzvquF7pr1c9F1jde0Cp35Fup4GC7uK1savSKlBQtY/X
 uPVNUbrZEJ5sMJlo2x3tvcqBid96JJHKHY4siun75301U04oxsaaoodZa
 Rg3loQPeZEfzqav/tGNNe52qK+qZdbw0HblYyuRL50vFAm0p9i/Hpke/e
 fo/4tLLr0Iu3HrKbGzAPRgYld5czDquZ40uUk7Lc+AuAICxwEMAdnGra3 A==;
X-CSE-ConnectionGUID: vlmZRpc5SZ+FJ9TO0P/dsw==
X-CSE-MsgGUID: WKwc7UjdShSU9I1vdK3Dgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32676909"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32676909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
X-CSE-ConnectionGUID: Q+hpSm2nTaKkBhTq7AvK7Q==
X-CSE-MsgGUID: KwrzFc3kSBy2UVIWNOc8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92152575"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 1/8] drm/xe: Add xe_bo_vm_access
Date: Tue, 26 Nov 2024 09:46:08 -0800
Message-Id: <20241126174615.2665852-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126174615.2665852-1-matthew.brost@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ec070af12662..aaf54131c89e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1249,11 +1249,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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

