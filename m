Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7CC55FF5B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4EC112917;
	Wed, 29 Jun 2022 12:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5BB112917;
 Wed, 29 Jun 2022 12:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656504899; x=1688040899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5ckTRTLP9wiuuQK9cU4jhKq2TqebvscpQ2sbm9TNY8=;
 b=fv23NnVdp4AyzJz6WWPyyc2jQXajrC6s3Sa6Pfq1HgK1RSLKGzAXqibd
 rFATqyWqt6/Zkszyl1acuGnNjNGSOMramXtITCDBpTeGfdWqb1sEWvwgK
 r+sdy1Z45v2uxDV6UMUWHdI4LURV8Xl4G90r7tJuOaSTDare+jRF/cffR
 M3vUt4TeKLZWXB2qlRNM3cErO/WfB8/JhcrZIc6vPRV1z5dt2jlJ7vvZ7
 bt7uQX4i+4THCgphadpERmRYn5hsXt+0W5pNecFtXbdHDK4LgRsJqtd+o
 ekIdR5aVa734H4p+28o9Ute0r0XAmu+6HUvhIoTcYPuAM3A5EhCcaaCJC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="262421401"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="262421401"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:14:59 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="595215051"
Received: from nwalsh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.202.136])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:14:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 05/13] drm/i915/uapi: apply ALLOC_GPU_ONLY by default
Date: Wed, 29 Jun 2022 13:14:19 +0100
Message-Id: <20220629121427.353800-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629121427.353800-1-matthew.auld@intel.com>
References: <20220629121427.353800-1-matthew.auld@intel.com>
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

