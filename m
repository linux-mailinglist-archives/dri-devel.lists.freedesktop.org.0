Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C964F8527
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF6E10EBB8;
	Thu,  7 Apr 2022 16:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310C810EBB8;
 Thu,  7 Apr 2022 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649349995; x=1680885995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxnLBsZkLxM5FIR2EQVi8iRUo6Zc0poGZ/FgPcXoFEs=;
 b=i/1AtBfljBWI3oyJpBh8H6OBNPgKUUWP6PMNG/5/qTXQ5TcorrmLOqyw
 XPBFmN+mHRFuvko6nQKLM94D4eDu/34WdOz1nITMIRljZOFJFAIC2TaUK
 nEYZelwoqLT5LtORc0GNbRNZKh0zrKHNJY9GMxc/Uc/lgwtUxSzMHUxPD
 tSShK8tuae40tC581oYqXIAuyqg+4t8/2WgJcobUZNdV0+33FgBNGjeZT
 crF3VPJMF7H5GVS469G5fOEV35aS3f4+71fXR/6GdOmgReD//xTNimbTV
 8/bDiQXS8wwh9iNq/3RWGX1UD9YfXPlTU/x0AQrhlrpYcGJnhLmfQb9IX A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261072557"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261072557"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 09:46:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="571134198"
Received: from doboyle-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.221])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 09:46:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: fix i915_gem_object_wait_moving_fence
Date: Thu,  7 Apr 2022 17:45:32 +0100
Message-Id: <20220407164532.1242578-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220407164532.1242578-1-matthew.auld@intel.com>
References: <20220407164532.1242578-1-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All of CI is just failing with the following, which prevents loading of
the module:

    i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed

Best guess is that this comes from the pin_map() for the scratch page,
which does an i915_gem_object_wait_moving_fence() somewhere. It looks
like this now calls into dma_resv_wait_timeout() which can return the
remaining timeout, leading to the caller thinking this is an error.

Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 2998d895a6b3..1c88d4121658 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -772,9 +772,14 @@ int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
 int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
 				      bool intr)
 {
+	long ret;
+
 	assert_object_held(obj);
-	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
-				     intr, MAX_SCHEDULE_TIMEOUT);
+
+	ret = dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
+				    intr, MAX_SCHEDULE_TIMEOUT);
+
+	return ret < 0 ? ret : 0;
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-- 
2.34.1

