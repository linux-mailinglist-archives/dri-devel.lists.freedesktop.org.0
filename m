Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB916FCC16
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFA210E3B6;
	Tue,  9 May 2023 16:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C23910E3A8;
 Tue,  9 May 2023 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683651529; x=1715187529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I8abt+jvYqNL4t3J+Z8Q3gT8GdpwKE9ZXmx8adej0QE=;
 b=XKC7fEGCac9+pdim6y9b7hbhpu8Dxh0VQxAG0SmmuH7wa0F+HeoZEL1b
 S83O6ZyCklyVyJ9efEqBtVRelqc7PM5zqncDVSx1meoKHcBoxhobu3HmY
 lonPfQsdwwi0Cz6UpgHlvCUp+h+98SrZFCfQqNtJuzJpJJHhmw/GVIAtz
 cpEMrUyn9mwPVIkz/02YGJrisJZoDmoe4BldqBNUUA69WRarVqg3TcuhV
 mB+eGYoNhvPSLi9V3vHlu0NZS2Qrv+JxDYvETnrRXu/O/pb5yndD35Jwx
 auRO2ZAG0O8hd1ZyRDdHfkQJRl1j8Dbo6g5LuKzQwgQkbsL8eJLgOjqe5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350021119"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="350021119"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 09:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649408814"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="649408814"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 09:58:47 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 3/4] drm/i915/mtl: end support for set caching ioctl
Date: Tue,  9 May 2023 09:59:41 -0700
Message-Id: <20230509165942.2155-4-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509165942.2155-1-fei.yang@intel.com>
References: <20230509165942.2155-1-fei.yang@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

The design is to keep Buffer Object's caching policy immutable through
out its life cycle. This patch ends the support for set caching ioctl
from MTL onward. While doing that we also set BO's to be 1-way coherent
at creation time because GPU is no longer automatically snooping CPU
cache. For userspace components needing to fine tune the caching policy
for BO's, a follow up patch will extend the GEM_CREATE uAPI to allow
them specify caching mode at BO creation time.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 3 +++
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 05107a6efe45..dfaaa8b66ac3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -350,6 +350,9 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
 	if (IS_DGFX(i915))
 		return -ENODEV;
 
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		return -EOPNOTSUPP;
+
 	switch (args->caching) {
 	case I915_CACHING_NONE:
 		level = I915_CACHE_NONE;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 37d1efcd3ca6..cad4a6017f4b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -601,7 +601,14 @@ static int shmem_object_init(struct intel_memory_region *mem,
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 
-	if (HAS_LLC(i915))
+	/*
+	 * MTL doesn't snoop CPU cache by default for GPU access (namely
+	 * 1-way coherency). However some UMD's are currently depending on
+	 * that. Make 1-way coherent the default setting for MTL. A follow
+	 * up patch will extend the GEM_CREATE uAPI to allow UMD's specify
+	 * caching mode at BO creation time
+	 */
+	if (HAS_LLC(i915) || (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)))
 		/* On some devices, we can have the GPU use the LLC (the CPU
 		 * cache) for about a 10% performance improvement
 		 * compared to uncached.  Graphics requests other than
-- 
2.25.1

