Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E2C189B4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAC010E6FA;
	Wed, 29 Oct 2025 07:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7LhJq6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DAF10E6FA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761722102; x=1793258102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XTQ1F1Z8EQ1aGbv8hUed4njho7DCbtmerRuxluRCZTU=;
 b=h7LhJq6vBOXMJP7BzMmf/IhHjXyiDKBkSlP0iuAhseE2q/ao19hp0Wck
 GIsMtVPFAOZvvKrHVNIgRJ4F9sHOSAXFpNcAlXGh/tfzJZNvPhCS+EwQ6
 tjYzO98O0ZTxY28Vf5vaj1o153OUicmXDUc2rnZ/mcfB+l2aQu1/Zyldc
 Nd4dLnbhUEnxTctpJPJPDzA7las5RKGFgldOjtj4u6IauOT4hQtxBNEno
 TWg9GOtBFWco40AoK0VXPWjAFx89YAGfRTX0pN/IKT183uZfpODwy/2Lo
 w+i4mj2Ygs3ToQc8V6c7iBkN32l5Ax/DuGdfGX75JsKFvSkv3eKvKe1Is w==;
X-CSE-ConnectionGUID: OpqPMz3sSMeaG0lJCOwgow==
X-CSE-MsgGUID: l2y5inpzSY+LrH7r4eXPrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66449931"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="66449931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:15:02 -0700
X-CSE-ConnectionGUID: LzOcbOwCTUK5JuvshFRQUA==
X-CSE-MsgGUID: mnDgUhv3SpWlyyKYCoLSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185210920"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:15:00 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH v2] accel/ivpu: Fix race condition when unbinding BOs
Date: Wed, 29 Oct 2025 08:14:51 +0100
Message-ID: <20251029071451.184243-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

Fix 'Memory manager not clean during takedown' warning that occurs
when ivpu_gem_bo_free() removes the BO from the BOs list before it
gets unmapped. Then file_priv_unbind() triggers a warning in
drm_mm_takedown() during context teardown.

Protect the unmapping sequence with bo_list_lock to ensure the BO is
always fully unmapped when removed from the list. This ensures the BO
is either fully unmapped at context teardown time or present on the
list and unmapped by file_priv_unbind().

Fixes: 48aea7f2a2ef ("accel/ivpu: Fix locking in ivpu_bo_remove_all_bos_from_context()")
Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
Changes in v2:
 - Added Fixes tag.
---
 drivers/accel/ivpu/ivpu_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 9e58522840ae..b00af1ce11aa 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -318,7 +318,6 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 
 	mutex_lock(&vdev->bo_list_lock);
 	list_del(&bo->bo_list_node);
-	mutex_unlock(&vdev->bo_list_lock);
 
 	drm_WARN_ON(&vdev->drm, !drm_gem_is_imported(&bo->base.base) &&
 		    !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
@@ -329,6 +328,8 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 	ivpu_bo_unbind_locked(bo);
 	ivpu_bo_unlock(bo);
 
+	mutex_unlock(&vdev->bo_list_lock);
+
 	drm_WARN_ON(&vdev->drm, bo->mmu_mapped);
 	drm_WARN_ON(&vdev->drm, bo->ctx);
 
-- 
2.43.0

