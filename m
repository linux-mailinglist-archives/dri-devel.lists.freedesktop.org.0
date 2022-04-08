Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E04F910C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB7B10F0FE;
	Fri,  8 Apr 2022 08:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4339510F0FF;
 Fri,  8 Apr 2022 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649407337; x=1680943337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OTVM6Bojv4kN2ha86FdF8E3Yz8txIb/uB18QKIQz0B8=;
 b=gm2tHtKS/SbGvDZzA0MdLQ69uJMpwmSFh+m/s8KKw8YBxWTj/fdby8hi
 4OLrq2lQQHyi1VuKrxfggrLbhQPopTZZ+rq/41TNeJeq9B7pxQkNa5wkG
 eUnKaTU9gwMDaM+2TYGAT1YjpfFYgxdelEh1DTBO1ZCcFeNMDtynJUQoK
 EhmXLbQWXhkPSVGX5zb9XDRjtxB0NZUJoYEIgVBoAHEk7iI2mMWCGtCx3
 oyH8PZlWdBtHUDQcI9IVnDb18u+tW5vkQ5xNd2EC4j9swUIrRmcekzbJy
 aubSyXrszj9pAe0OgFlQZl8LZtyKBtr6yxWo5QhTiIWPGWM8O1q71ejt+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="242141748"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="242141748"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:42:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="621562859"
Received: from ajomalle-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.141])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 01:42:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: fix i915_gem_object_wait_moving_fence
Date: Fri,  8 Apr 2022 09:42:05 +0100
Message-Id: <20220408084205.1353427-1-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
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

v2(Lucas): handle ret == 0

Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Christian König <christian.koenig@amd.com> #v1
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 2998d895a6b3..747ac65e060f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -772,9 +772,16 @@ int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
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
+	if (!ret)
+		ret = -ETIME;
+
+	return ret < 0 ? ret : 0;
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-- 
2.34.1

