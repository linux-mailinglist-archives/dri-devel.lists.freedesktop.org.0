Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F46899DA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 14:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0AE10E79D;
	Fri,  3 Feb 2023 13:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1225410E797;
 Fri,  3 Feb 2023 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675431397; x=1706967397;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r0fcSXW1yrn789f+eFpqI8loCTQYShTr8qGrw89Fl3U=;
 b=hDCNjz/jZGlp5tlCOZY4JpV34UvyMOfWXW499vabq+3jSYVUM0JwHD6U
 TVA+PzKIpbhr/MHKpTGnrHYD55RBaM5THrIo6C3SpHZ6hQlXLGmHO5niH
 BL7DEseSLbbqUprnWIKpEHMhzsEDOvgNZYEDxU8f2m4hnflU4IsstlkSs
 9qMGhBQOtu5zqYkfqVd6RMhuJ69X+uD4EwwNaIWvQPS3XrttJM+K+cS0i
 PdGkQxDD7fZywk6FYGGOejvSfvNPO8iSF7YsYt5Jeos6RA8KKkk7UksNr
 0n4a0mPn11mc0WE9mlOXz7iPTJ1UXGJr7fz5M/l9mZaj3thnz/yOBGMWz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330879187"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330879187"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 05:36:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="839611842"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="839611842"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 05:36:34 -0800
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Initialize the obj flags for shmem objects
Date: Fri,  3 Feb 2023 19:22:05 +0530
Message-Id: <20230203135205.4051149-1-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Obj flags for shmem objects is not being set correctly. Fixes in setting
BO_ALLOC_USER flag which applies to shmem objs as well.

Fixes: 13d29c823738 ("drm/i915/ehl: unconditionally flush the pages on acquire")
Cc: <stable@vger.kernel.org> # v5.15+

v2: Add fixes tag (Tvrtko, Matt A)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 114443096841..37d1efcd3ca6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -596,7 +596,7 @@ static int shmem_object_init(struct intel_memory_region *mem,
 	mapping_set_gfp_mask(mapping, mask);
 	GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
 
-	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, 0);
+	i915_gem_object_init(obj, &i915_gem_shmem_ops, &lock_class, flags);
 	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
-- 
2.25.1

