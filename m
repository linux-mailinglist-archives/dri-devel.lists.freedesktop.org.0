Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A660455C25
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 14:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519486E997;
	Thu, 18 Nov 2021 13:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BE16EB44;
 Thu, 18 Nov 2021 13:03:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="297596142"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="297596142"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 05:02:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="455319621"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.166])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 05:02:47 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/6] drm/i915/ttm: Correctly handle waiting for gpu when
 shrinking
Date: Thu, 18 Nov 2021 14:02:28 +0100
Message-Id: <20211118130230.154988-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118130230.154988-1-thomas.hellstrom@linux.intel.com>
References: <20211118130230.154988-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With async migration, the shrinker may end up wanting to release the
pages of an object while the migration blit is still running, since
the GT migration code doesn't set up VMAs and the shrinker is thus
oblivious to the fact that the GPU is still using the pages.

Add waiting for gpu in the shrinker_release_pages() op and an
argument to that function indicating whether the shrinker expects it
to not wait for gpu. In the latter case the shrinker_release_pages()
op will return -EBUSY if the object is not idle.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c     | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c          | 7 ++++++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 604ed5ad77f5..f9f7e44099fe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -59,6 +59,7 @@ struct drm_i915_gem_object_ops {
 	int (*truncate)(struct drm_i915_gem_object *obj);
 	void (*writeback)(struct drm_i915_gem_object *obj);
 	int (*shrinker_release_pages)(struct drm_i915_gem_object *obj,
+				      bool no_gpu_wait,
 				      bool should_writeback);
 
 	int (*pread)(struct drm_i915_gem_object *obj,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index dde0a5c232f8..8b4b5f3a432a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -60,6 +60,7 @@ static int try_to_writeback(struct drm_i915_gem_object *obj, unsigned int flags)
 {
 	if (obj->ops->shrinker_release_pages)
 		return obj->ops->shrinker_release_pages(obj,
+							!(flags & I915_SHRINK_ACTIVE),
 							flags & I915_SHRINK_WRITEBACK);
 
 	switch (obj->mm.madv) {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 350bf1a23db5..e37157b080e4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -418,6 +418,7 @@ int i915_ttm_purge(struct drm_i915_gem_object *obj)
 }
 
 static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object *obj,
+					   bool no_wait_gpu,
 					   bool should_writeback)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
@@ -425,7 +426,7 @@ static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object *obj,
 		container_of(bo->ttm, typeof(*i915_tt), ttm);
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
-		.no_wait_gpu = false,
+		.no_wait_gpu = no_wait_gpu,
 	};
 	struct ttm_placement place = {};
 	int ret;
@@ -438,6 +439,10 @@ static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object *obj,
 	if (!i915_tt->filp)
 		return 0;
 
+	ret = ttm_bo_wait_ctx(bo, &ctx);
+	if (ret)
+		return ret;
+
 	switch (obj->mm.madv) {
 	case I915_MADV_DONTNEED:
 		return i915_ttm_purge(obj);
-- 
2.31.1

