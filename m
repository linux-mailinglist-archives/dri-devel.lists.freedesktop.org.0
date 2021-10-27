Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228A143CE99
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744676E8C8;
	Wed, 27 Oct 2021 16:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EE26E7D0;
 Wed, 27 Oct 2021 16:19:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="291038189"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="291038189"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:19:48 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="597417905"
Received: from shetherx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.218.37])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:19:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 2/4] drm/i915/clflush: disallow on discrete
Date: Wed, 27 Oct 2021 17:18:11 +0100
Message-Id: <20211027161813.3094681-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211027161813.3094681-1-matthew.auld@intel.com>
References: <20211027161813.3094681-1-matthew.auld@intel.com>
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

We seem to have an unfortunate issue where we arrive from:

    i915_gem_object_flush_if_display+0x86/0xd0 [i915]
    intel_user_framebuffer_dirty+0x1a/0x50 [i915]
    drm_mode_dirtyfb_ioctl+0xfb/0x1b0

which can be before the pages are populated(and pinned for display), and
so i915_gem_object_has_struct_page() might still return true, as per the
ttm backend. We could re-order the later get_pages() call here, but
since on discrete everything should already be coherent, with the
exception of the display engine, and even there display surfaces must be
allocated in device local-memory anyway, so there should in theory be no
conceivable reason to ever call i915_gem_clflush_object() on discrete.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/4320
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 47586a8a1b73..aa91252c9324 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -69,6 +69,8 @@ static struct clflush *clflush_work_create(struct drm_i915_gem_object *obj)
 bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 			     unsigned int flags)
 {
+
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct clflush *clflush;
 
 	assert_object_held(obj);
@@ -80,7 +82,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 	 * anything not backed by physical memory we consider to be always
 	 * coherent and not need clflushing.
 	 */
-	if (!i915_gem_object_has_struct_page(obj)) {
+	if (!i915_gem_object_has_struct_page(obj) || IS_DGFX(i915)) {
 		obj->cache_dirty = false;
 		return false;
 	}
@@ -105,7 +107,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 	if (clflush) {
 		i915_sw_fence_await_reservation(&clflush->base.chain,
 						obj->base.resv, NULL, true,
-						i915_fence_timeout(to_i915(obj->base.dev)),
+						i915_fence_timeout(i915),
 						I915_FENCE_GFP);
 		dma_resv_add_excl_fence(obj->base.resv, &clflush->base.dma);
 		dma_fence_work_commit(&clflush->base);
-- 
2.26.3

