Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9243C54E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3C06E827;
	Wed, 27 Oct 2021 08:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1416E827;
 Wed, 27 Oct 2021 08:36:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290946372"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="290946372"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 01:36:19 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="497766920"
Received: from djustese-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 01:36:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/i915/gem: Remove gpu reloc workaround
Date: Wed, 27 Oct 2021 10:36:08 +0200
Message-Id: <20211027083608.394152-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

GPU relocs are gone. There should be no need for this workaround anymore.
Remove it.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 1231224728e4..04af88e6d453 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1327,7 +1327,6 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 {
 	struct drm_i915_private *i915 = eb->i915;
 	struct eb_vma *target;
-	int err;
 
 	/* we've already hold a reference to all valid objects */
 	target = eb_get_vma(eb, reloc->target_handle);
@@ -1357,25 +1356,9 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 		return -EINVAL;
 	}
 
-	if (reloc->write_domain) {
+	if (reloc->write_domain)
 		target->flags |= EXEC_OBJECT_WRITE;
 
-		/*
-		 * Sandybridge PPGTT errata: We need a global gtt mapping
-		 * for MI and pipe_control writes because the gpu doesn't
-		 * properly redirect them through the ppgtt for non_secure
-		 * batchbuffers.
-		 */
-		if (reloc->write_domain == I915_GEM_DOMAIN_INSTRUCTION &&
-		    GRAPHICS_VER(eb->i915) == 6) {
-			err = i915_vma_bind(target->vma,
-					    target->vma->obj->cache_level,
-					    PIN_GLOBAL, NULL);
-			if (err)
-				return err;
-		}
-	}
-
 	/*
 	 * If the relocation already has the right value in it, no
 	 * more work needs to be done.
-- 
2.31.1

