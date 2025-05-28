Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D598AC6ED2
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ECD10E0A3;
	Wed, 28 May 2025 17:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mw6cMTAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890E610E0A3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748452345; x=1779988345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2c7x03kSgZrXkfgGKN8R6F2Vjctj1uciiV21QqHMOS8=;
 b=Mw6cMTAOP57ka9gE+OffsxPwAtcZo99T6+TiJf2uujkV+HbrtgECZbW9
 ogqIluVpjZ7PlOgFC3Ib4dMYlzYHZNYDEwuCweoU3Mx4s184XHyl3K6v0
 FB0oFVp+us7TlDxqWn/JYNm3Jwsa5mtBofW8DX6jJDoewUUSwcWROtjD8
 Qqoijm9nUqax2wKmrNRgrQCYWIfelO/RBuVJqLQOh/LJ+8OSkI95+oDdO
 iyjgTNE67q1NLg00W+INResMsadimISsnsAuaUXpTh6Ij6ViJhplFpiRj
 uFxcKc419fUy7INvkZJBsQCGHctyuLb5+eukQhXZm5sncGgibqm7jjx2i Q==;
X-CSE-ConnectionGUID: 6Dn5EN8ZQriGKtwFJ0ItaA==
X-CSE-MsgGUID: 0tgXLwlLRq+GvsYM0dTvDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50490107"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50490107"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 10:12:24 -0700
X-CSE-ConnectionGUID: gWwUbxDYRNOK/TYtykp2Dw==
X-CSE-MsgGUID: 5GPj5DWzSoeTDRitdy35wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="144274808"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 10:12:22 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] accel/ivpu: Fix warning in ivpu_gem_bo_free()
Date: Wed, 28 May 2025 19:12:20 +0200
Message-ID: <20250528171220.513225-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Don't WARN if imported buffers are in use in ivpu_gem_bo_free() as they
can be indeed used in the original context/driver.

Fixes: 647371a6609d ("accel/ivpu: Add GEM buffer object management")
Cc: stable@vger.kernel.org # v6.3
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
v2: Use drm_gem_is_imported() to check if the buffer is imported.
---
 drivers/accel/ivpu/ivpu_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index c193a80241f5f..5ff0bac739fc9 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -278,7 +278,8 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 	list_del(&bo->bo_list_node);
 	mutex_unlock(&vdev->bo_list_lock);
 
-	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
+	drm_WARN_ON(&vdev->drm, !drm_gem_is_imported(&bo->base.base) &&
+		    !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
 	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
 	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
 
-- 
2.45.1
