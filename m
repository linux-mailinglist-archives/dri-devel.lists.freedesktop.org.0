Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B96EB0A6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37B510EE9A;
	Fri, 21 Apr 2023 17:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0110E274;
 Fri, 21 Apr 2023 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682098611; x=1713634611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIP+5rCCT5iAuuW5/3nOS9hp3Cioudei45sCPogjlow=;
 b=M80es9yEwmdsPbfS+yJiqQ6EdMOh6xKuyzBn/XulD+xuG2s4wAg8DWrn
 dBEgSB2RqSaC/lD188kNezF2BttkFyoz95vNLasetfaA0/EsztqsqKDgd
 iMGhNzkUQ6pwsJ5N/W+wTZJmphGivcJrawWo2/Svqzix57xajbTjFWb8v
 t5VAdXp8n30//BIwIgybW//Rtm+sc4DYJqSxLP5VzMzSW88Nx/8NPxkoA
 /e87gED4pIwgodGzq7V5i39BSMJ1bM93wrD4ApW9eiQ8IrkT9d1yBVERX
 Hh6Yc7/qaiNFlz5ws1aAcdl1adYm2vb5nzs35n5vvnAfMw7OlCq7H8JVq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="347949465"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="347949465"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 10:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="669794809"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="669794809"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 10:36:49 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 7/8] drm/i915/mtl: end support for set caching ioctl
Date: Fri, 21 Apr 2023 10:38:00 -0700
Message-Id: <20230421173801.3369303-8-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230421173801.3369303-1-fei.yang@intel.com>
References: <20230421173801.3369303-1-fei.yang@intel.com>
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
cache. For UMD's need to fine tune the caching policy for BO's, a follow
up patch will extend the GEM_CREATE uAPI to allow UMD's specify caching
mode at BO creation time.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 3 +++
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 89938084af97..d5fd4c9cd9f8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -328,6 +328,9 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
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

