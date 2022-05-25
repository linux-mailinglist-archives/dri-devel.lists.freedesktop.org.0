Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA26534344
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B514410ECEB;
	Wed, 25 May 2022 18:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EADC10ECEB;
 Wed, 25 May 2022 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653504247; x=1685040247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D09mR+wZFInv3gEWT/8S/2+jgYhx7pq5hCOJqCfkCcI=;
 b=VfRcMrpdsAGTjp9GCsSP43QPHvyDdMnUROGzAfUDdiM4Wjs9TT+0catZ
 TWT6xIwIAE+V80yCOmAaL/vXULjP00uBXKYT4KDY2bN+In3E0vdOeGHhU
 +i9wI6rB1/KVshLhVioPH12842/EjNhM0arzIPYr9uKcfbj1f3hvwACPO
 quQu1WjBgDFY4FdzFGp5CrgxQHClffspW9XT92Jb7tEw6FdU59YUsdm5L
 xSSFxa098CbGp8VajXp0wbBZm+t5fBykB6ueQnvZURJT/vmkcsgHyC3O2
 oUn/hS/ISFBswGVjN7jv/zWJs/zHTGrsaBH3n2luOUvdUFNaPv/oPhxa5 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274013452"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="274013452"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:44:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="578465258"
Received: from daithiby-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:44:04 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/10] drm/i915/uapi: apply ALLOC_GPU_ONLY by default
Date: Wed, 25 May 2022 19:43:32 +0100
Message-Id: <20220525184337.491763-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220525184337.491763-1-matthew.auld@intel.com>
References: <20220525184337.491763-1-matthew.auld@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On small BAR configurations, when dealing with I915_MEMORY_CLASS_DEVICE
allocations, we assume that by default, all userspace allocations should
be placed in the non-CPU visible portion.  Note that dumb buffers are
not included here, since these are not "GPU accelerated" and likely need
CPU access. We choose to just always set GPU_ONLY, and let the backend
figure out if that should be ignored or not, for example on full BAR
systems.

In a later patch userspace will be able to provide a hint if CPU access
to the buffer is needed.

v2(Thomas)
 - Apply GPU_ONLY on all discrete devices, but only if the BO can be
   placed in LMEM. Down in the depths this should be turned into a noop,
   where required, and as an annotation it still make some sense. If we
   apply it regardless of the placements then we end up needing to check
   the placements during exec capture. Also it's slightly inconsistent
   since the NEEDS_CPU_ACCESS can only be applied on objects that can be
   placed in LMEM. The other annoyance would be gem_create_ext vs plain
   gem_create, if we were to always apply GPU_ONLY.

Testcase: igt@gem-create@create-ext-cpu-access-sanity-check
Testcase: igt@gem-create@create-ext-cpu-access-big
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 5802692ea604..d094cae0ddf1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -427,6 +427,14 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 		ext_data.n_placements = 1;
 	}
 
+	/*
+	 * TODO: add a userspace hint to force CPU_ACCESS for the object, which
+	 * can override this.
+	 */
+	if (ext_data.n_placements > 1 ||
+	    ext_data.placements[0]->type != INTEL_MEMORY_SYSTEM)
+		ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
+
 	obj = __i915_gem_object_create_user_ext(i915, args->size,
 						ext_data.placements,
 						ext_data.n_placements,
-- 
2.34.3

