Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB593C9C88
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 12:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC446E819;
	Thu, 15 Jul 2021 10:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653686E819;
 Thu, 15 Jul 2021 10:16:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="190198927"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="190198927"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 03:16:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="460341223"
Received: from omurra1x-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.240.195])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 03:16:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/uapi: reject set_domain for discrete
Date: Thu, 15 Jul 2021 11:15:36 +0100
Message-Id: <20210715101536.2606307-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210715101536.2606307-1-matthew.auld@intel.com>
References: <20210715101536.2606307-1-matthew.auld@intel.com>
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
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CPU domain should be static for discrete, and on DG1 we don't need
any flushing since everything is already coherent, so really all this
does is an object wait, for which we have an ioctl. Longer term the
desired caching should be an immutable creation time property for the
BO, which can be set with something like gem_create_ext.

One other user is iris + userptr, which uses the set_domain to probe all
the pages to check if the GUP succeeds, however we now have a PROBE
flag for this purpose.

v2: add some more kernel doc, also add the implicit rules with caching

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c |  3 +++
 include/uapi/drm/i915_drm.h                | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 43004bef55cb..b684a62bf3b0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -490,6 +490,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	u32 write_domain = args->write_domain;
 	int err;
 
+	if (IS_DGFX(to_i915(dev)))
+		return -ENODEV;
+
 	/* Only handle setting domains to types used by the CPU. */
 	if ((write_domain | read_domains) & I915_GEM_GPU_DOMAINS)
 		return -EINVAL;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 2e4112bf4d38..04ce310e7ee6 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -901,6 +901,25 @@ struct drm_i915_gem_mmap_offset {
  *	- I915_GEM_DOMAIN_GTT: Mappable aperture domain
  *
  * All other domains are rejected.
+ *
+ * Note that for discrete, starting from DG1, this is no longer supported, and
+ * is instead rejected. On such platforms the CPU domain is effectively static,
+ * where we also only support a single &drm_i915_gem_mmap_offset cache mode,
+ * which can't be set explicitly and instead depends on the object placements,
+ * as per the below.
+ *
+ * Implicit caching rules, starting from DG1:
+ *
+ *	- If any of the object placements (see &drm_i915_gem_create_ext_memory_regions)
+ *	  contain I915_MEMORY_CLASS_DEVICE then the object will be allocated and
+ *	  mapped as write-combined only.
+ *
+ *	- Everything else is always allocated and mapped as write-back, with the
+ *	  guarantee that everything is also coherent with the GPU.
+ *
+ * Note that this is likely to change in the future again, where we might need
+ * more flexibility on future devices, so making this all explicit as part of a
+ * new &drm_i915_gem_create_ext extension is probable.
  */
 struct drm_i915_gem_set_domain {
 	/** @handle: Handle for the object. */
-- 
2.26.3

