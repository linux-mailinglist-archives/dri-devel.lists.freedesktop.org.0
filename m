Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86DF6D141B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 02:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50E510F0BE;
	Fri, 31 Mar 2023 00:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18E510F0BE;
 Fri, 31 Mar 2023 00:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680222881; x=1711758881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZQo7yknP25SitbuRWTk343nJSYVGcL363xY0j1/aQPU=;
 b=VLJrFUigcvAMZBE1xX/KaRj0ChJOgF9JV50l4N/AWb45yUaCVtuTijv7
 KrWLOM+tHtWIpkIw9CHvhqQwMdUomS8yrP858QGwyDt3uMdA6JcVG28iV
 f57HDcZdcNLp3jXG4AUxMZRfsLPVWF+uDHAUoL99tWmlvfvW/3mOdmN20
 sRt9mTvjCH/m5+kQdLg5AmWXtdoYlbvCKmgUaDxBbQeeSqEbb5+nPH1i0
 Thbw4oggXJYon+4Gs7RhyTHqrESp1FPxE8f6GLW/7DMx2b+30m3hVkM/f
 b/6VvOGgt1tacLY6vCaLGra9NNe/pPlpoahV4s4wPITJkEtaTNqFnTI8J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329844459"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="329844459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 17:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="715220769"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="715220769"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 17:34:40 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/mtl: end support for set caching ioctl
Date: Thu, 30 Mar 2023 17:36:11 -0700
Message-Id: <20230331003611.107011-3-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331003611.107011-1-fei.yang@intel.com>
References: <20230331003611.107011-1-fei.yang@intel.com>
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
Cc: Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

The design is to keep Buffer Object's caching policy immutable through
out its life cycle. This patch ends the support for set caching ioctl
from MTL onward. While doing that we also set BO's to be 1-way coherent
at creation time because GPU is no longer automatically snooping CPU
cache.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 3 +++
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 497de40b8e68..33b73bea1e08 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -335,6 +335,9 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
 	if (IS_DGFX(i915))
 		return -ENODEV;
 
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		return -EOPNOTSUPP;
+
 	switch (args->caching) {
 	case I915_CACHING_NONE:
 		level = I915_CACHE_NONE;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 37d1efcd3ca6..e602c323896b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -601,7 +601,14 @@ static int shmem_object_init(struct intel_memory_region *mem,
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 
-	if (HAS_LLC(i915))
+	/*
+	 * MTL doesn't snooping CPU cache by default for GPU access (namely
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

