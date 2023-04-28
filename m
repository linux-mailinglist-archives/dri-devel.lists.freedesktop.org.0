Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240F26F1174
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 07:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CE510EC54;
	Fri, 28 Apr 2023 05:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955E210E390;
 Fri, 28 Apr 2023 05:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682660793; x=1714196793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/brplOcYpiGcgs4imoimenB+rhwhf49u/riD9sLkwJM=;
 b=OBAstO8ELRDP2XFHw81hbg3Y1u4AfrW2iGL+0z82Qb1KfiVVjJ7Kc3kr
 N0rJgVQHQwPM0QELwOpnd+WrPl2bosKR/ltyFRpWo02/2Kwuw+trVxsXY
 sbmGXV7//c3SGvY/06BgY7iq8jlgmfCae0IJsTJCidlWInreJEYcaJNrm
 yqnJZhLxz5cHEvvUjHOYx9RRjDnDcdp6rYh19IR4e5ikH4nAL1qI5rO+x
 ZVRF848h/Wv8irsB+Ps154U6t+FJgn5FqUkD+Nc24NPmWOXD4pbMNthnq
 2gUMfq9vGg3f7Y1+g2QnuwXth1ks0T61LP5T4SZOWwELwT5Ie9kyOAHy1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413040415"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="413040415"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806251817"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="806251817"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:46:32 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/i915/mtl: end support for set caching ioctl
Date: Thu, 27 Apr 2023 22:47:36 -0700
Message-Id: <20230428054737.1765778-5-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428054737.1765778-1-fei.yang@intel.com>
References: <20230428054737.1765778-1-fei.yang@intel.com>
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
index 17375935ce1e..dcd6056ef90d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -336,6 +336,9 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
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

