Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFAC133C4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD6410E591;
	Tue, 28 Oct 2025 07:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R85wpByX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4CF10E591
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761635168; x=1793171168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s+yIBaxq//NJzDGtESEXpnyHPOzzSVH+5S18OraXSeg=;
 b=R85wpByXsaqSWvpJId0cU30+cdSzhM11RG+F0zwVbr0vwE9P68iUtUZQ
 5cI0VjKHOhec0GjB00+GLpZHIGzUUcvwZ6b3iPl1Xbywt+fB/Dvib0WtX
 rURq25fdQglw8AnQS3nwph+2Hd31lfCIRQtcjgjdUC4ISfUM2PAUmSOVt
 CQp1W7OG22vihjakO4E/NAkelo1la7kN8ddAGsmjWGIyCUzRub/upGBre
 fM9AICPNMtDx0x3P7ZYZDXqlYy3IIrR7JhEBu7WqpumH0kpJJVEn0Mn3O
 vQ4pO9YWp7bZilbHu81eTd4mjOmDtz/g0yLPhuLdXJRwQ+HPrgUinhIVh A==;
X-CSE-ConnectionGUID: TB5/edf+SPW2BtvS/bp+SA==
X-CSE-MsgGUID: PlquBva1Rjq67cptWXIEfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75172183"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="75172183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:06:07 -0700
X-CSE-ConnectionGUID: JW/G51PbSomvAhWXLJncYQ==
X-CSE-MsgGUID: lK4sAQYMQ1WJRUUseIK4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="222475873"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:06:05 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix race condition when unbinding BOs
Date: Tue, 28 Oct 2025 08:05:59 +0100
Message-ID: <20251028070559.135097-1-karol.wachowski@linux.intel.com>
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

Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index e7277e02840a..516e2b05c089 100644
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

