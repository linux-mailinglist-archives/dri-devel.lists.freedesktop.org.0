Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 241CA6897F0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 12:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314B610E776;
	Fri,  3 Feb 2023 11:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AFC10E772;
 Fri,  3 Feb 2023 11:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675424527; x=1706960527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/TJdfuhHzwwZC8jfNXGomL7lXzwyjjw9qDmY1EfurPI=;
 b=eFwMnrw8Ej+NOrZ55YJgPk1V95nl3uHxQzn+wFR9kj6TYLzbtJoGlZcd
 +5NszqwW7sLrGxfiC0T5yjErg47NIMqd2eALFyIdDJ0mkuoX+73P27Inz
 eII2UNUIOTCI0G0kzGlTuZimc+vBeULGzSEkgZS3Z5LltvfhoVA5drHmP
 epszI0vOHecwCcq6nC5aFMcZxjqlre5UxBDoF5hHgcajatk9iITNDcwRw
 rUgANgdx+pluCnjg0mnANIx/hyYKYwoC1Uq9ui+AAX3LbQ/2tGADOFLD2
 Wto5Vwo8ovNmf2yFUMkRREXsirPhD8sQuhbwL9qYImBRJXJIsfIY9CNDd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330858232"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330858232"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 03:42:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="789664613"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="789664613"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 03:42:05 -0800
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] Initialize the obj flags for shmem objects
Date: Fri,  3 Feb 2023 17:27:13 +0530
Message-Id: <20230203115713.4023991-1-aravind.iddamsetty@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Obj flags for shmem objects is not being set correctly.

Cc: Matthew Auld <matthew.auld@intel.com>
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

