Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFEF37BA44
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 12:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681C86EB6A;
	Wed, 12 May 2021 10:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BAF6EB6A;
 Wed, 12 May 2021 10:24:10 +0000 (UTC)
IronPort-SDR: TIqK+XzjhcVAcjJwVU8czKbI+K1gvSy4kiQ0tT5fBCooBXqS/MZeFf8wZT+3HOerVY12pw/XHg
 M+2YUvObjd7A==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="263598796"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="263598796"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 03:24:07 -0700
IronPort-SDR: 4kS+h43gLefeeuCxKhS0iLflQfiMF85LROO16E2H0UwBhQxVfHrk6jNYpymPr7h6FeNbp6KiqM
 KuAy/ph0mM1g==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="625260530"
Received: from jpludows-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.209.164])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 03:24:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Pin the L-shape quirked object as unshrinkable
Date: Wed, 12 May 2021 11:24:00 +0100
Message-Id: <20210512102400.513710-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

When instantiating a tiled object on an L-shaped memory machine, we mark
the object as unshrinkable to prevent the shrinker from trying to swap
out the pages. We have to do this as we do not know the swizzling on the
individual pages, and so the data will be scrambled across swap out/in.

Not only do we need to move the object off the shrinker list, we need to
mark the object with shrink_pin so that the counter is consistent across
calls to madvise.

Fixes: 0175969e489a ("drm/i915/gem: Use shrinkable status for unknown swizzle quirks")
References: https://gitlab.freedesktop.org/drm/intel/-/issues/3293
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index aed8a37ccdc9..7361971c177d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -63,6 +63,8 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 	    i915->quirks & QUIRK_PIN_SWIZZLED_PAGES) {
 		GEM_BUG_ON(i915_gem_object_has_tiling_quirk(obj));
 		i915_gem_object_set_tiling_quirk(obj);
+		GEM_BUG_ON(!list_empty(&obj->mm.link));
+		atomic_inc(&obj->mm.shrink_pin);
 		shrinkable = false;
 	}
 
-- 
2.26.3

