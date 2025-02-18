Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E45A3980E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C9810E2B3;
	Tue, 18 Feb 2025 10:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZZqVQkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D7810E2B3;
 Tue, 18 Feb 2025 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739873040; x=1771409040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pbjfnE9HZCkMOLVmjETIUig4+GqCqmpYo/9Mb0qYsbA=;
 b=RZZqVQkV/BxAgsOshJH+AtPb/EJLarQGz4dty61Wz+fTmk+RZRnG8NBk
 MKyyOBZpgxJfHu2fny+oGiOeQxt458qjn0EzVdW/qfKtBUOwF4rg8rBcJ
 OJRRUA+OhkXeNJXlaL1TX6laHIHKP1LkyOV5t6hiuJTLuMtqiaD6d/KJJ
 EljDuDN4rSO5ebJOu547ASyswFhpAhPhGEE08VAYht46exUyL1pmClgz/
 X9Gd9uSceybO9hcZyYLNJwAVq/3xvXiYGiJPiPcFn+ubs0ykqIB2pQQpO
 O8efQd3H4hMLoKQcTkDAXW+6BF81rDOlgATXLqkm31oAMSJnZprAxuktX A==;
X-CSE-ConnectionGUID: 2RXrxznoRCKzOdoZb5mH+A==
X-CSE-MsgGUID: vSH1jhSIRo2nepSIx+8IuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43392538"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="43392538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 02:04:00 -0800
X-CSE-ConnectionGUID: lVCtNglrTji1fTt9b5jeTA==
X-CSE-MsgGUID: MYQ9djApRZGgCYSc+/APpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="145201549"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 02:03:56 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] drm/xe: Fix exporting xe buffers multiple times
Date: Tue, 18 Feb 2025 11:03:53 +0100
Message-ID: <20250218100353.2137964-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

The `struct ttm_resource->placement` contains TTM_PL_FLAG_* flags, but
it was incorrectly tested for XE_PL_* flags.
This caused xe_dma_buf_pin() to always fail when invoked for
the second time. Fix this by checking the `mem_type` field instead.

Fixes: 7764222d54b7 ("drm/xe: Disallow pinning dma-bufs in VRAM")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h      | 2 --
 drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index d9386ab031404..43bf6f140d40d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -341,7 +341,6 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 	return round_down(max / 2, PAGE_SIZE);
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
  * TTM memory type
@@ -356,4 +355,3 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
 	return bo->ttm.resource->mem_type == mem_type;
 }
 #endif
-#endif
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index c5b95470fa324..f67803e15a0e6 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -58,7 +58,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 	 * 1) Avoid pinning in a placement not accessible to some importers.
 	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
 	 */
-	if (xe_bo_is_pinned(bo) && bo->ttm.resource->placement != XE_PL_TT) {
+	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT)) {
 		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
 		return -EINVAL;
 	}
-- 
2.45.1

