Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D6C55300D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACA010FB80;
	Tue, 21 Jun 2022 10:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C6710FAF6;
 Tue, 21 Jun 2022 10:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655808404; x=1687344404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5ckTRTLP9wiuuQK9cU4jhKq2TqebvscpQ2sbm9TNY8=;
 b=ON4k2LAnZiTSB+gsgpuk/DBYC4yOHMqcFnOz+IrJG+6xIQms3UqMInNW
 iYdOsqVPN5u3jmFGhqOec8hW81zCL1q7ZokdDHd5GF9yC6HbsgB/pHPBf
 YD/xq9D0oVE/ARufMsQc47D7T/FIcohI/rLud61FmcbvkbXq4B9jshdjl
 GpuPYn+7+0a1ZEHDF97OBl5knCoopDqUHnmxLtM70Y3M41t2IKjlWORBJ
 HUSvwmpuvZwUmq43+e7Tq78R1ed61QRBF4I3xyP6KpMI+XrB20DWYU/6S
 eA+kh12uVjt2g1RwBS3DvcdZKTO1fJssMCpXHgzLOFyrB46/5OanAR/nu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263121939"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263121939"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:44 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562327086"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/12] drm/i915/uapi: apply ALLOC_GPU_ONLY by default
Date: Tue, 21 Jun 2022 11:44:27 +0100
Message-Id: <20220621104434.190962-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621104434.190962-1-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
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
2.36.1

