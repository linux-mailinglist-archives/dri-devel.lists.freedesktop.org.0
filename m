Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB43B432F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 14:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AD56EDA1;
	Fri, 25 Jun 2021 12:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E386EDA1;
 Fri, 25 Jun 2021 12:29:25 +0000 (UTC)
IronPort-SDR: tinL7PQZOLyqh354YZ8i3BNWfVTGG/RzkSVEx5TMf/c6bwsyCLq/b8yLq0Gw1U5bdFk9jyi3Wr
 dz2I1ewywATA==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="204651944"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="204651944"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 05:29:25 -0700
IronPort-SDR: o9zTTdibYqXD3kj8Pr8r0KqBlid3YrPFhZSa9f05VNMEIGw3Q31wl3UZ6va6iWEgMjISgK9vA9
 g8tijQH8Honw==
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="488165498"
Received: from adalyx-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.15.48])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 05:29:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gem: only allow WB for smem only placements
Date: Fri, 25 Jun 2021 13:27:51 +0100
Message-Id: <20210625122751.590289-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210625122751.590289-1-matthew.auld@intel.com>
References: <20210625122751.590289-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We only support single mode and this should be immutable. For smem only
placements on DGFX this should be WB. On DG1 everything is snooped,
always, and so should be coherent.

I915_GEM_DOMAIN_GTT looks like it's for the aperture which is now gone
for DGFX, so hopefully can also be safely rejected.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c |  7 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index d0c91697bb22..e3459a524e64 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -577,6 +577,13 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 		goto out_unpin;
 	}
 
+	if (IS_DGFX(to_i915(obj->base.dev)) && obj->mm.n_placements == 1 &&
+	    i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_SYSTEM) &&
+	    read_domains != I915_GEM_DOMAIN_CPU) {
+		err = -EINVAL;
+		goto out_unpin;
+	}
+
 	if (read_domains & I915_GEM_DOMAIN_WC)
 		err = i915_gem_object_set_to_wc_domain(obj, write_domain);
 	else if (read_domains & I915_GEM_DOMAIN_GTT)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index f3586b36dd53..afc9f3dc38b9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -673,6 +673,7 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
 		     enum i915_mmap_type mmap_type,
 		     u64 *offset, struct drm_file *file)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_mmap_offset *mmo;
 
 	if (i915_gem_object_never_mmap(obj))
@@ -697,6 +698,15 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
 	    i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_LOCAL))
 		return -ENODEV;
 
+	/*
+	 * For smem only placements on DGFX we need to default to WB. On DG1
+	 * everything is snooped always, so should always be coherent.
+	 */
+	 if (IS_DGFX(i915) &&
+	     mmap_type != I915_MMAP_TYPE_WB && obj->mm.n_placements == 1 &&
+	     i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_SYSTEM))
+		return -ENODEV;
+
 	mmo = mmap_offset_attach(obj, mmap_type, file);
 	if (IS_ERR(mmo))
 		return PTR_ERR(mmo);
-- 
2.26.3

