Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3019F4D3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA3D6E373;
	Mon,  6 Apr 2020 11:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99A86E34D;
 Mon,  6 Apr 2020 11:38:42 +0000 (UTC)
IronPort-SDR: bzN5+YXH98eNlztGzPhndc0H9SjpLq45ycfmSkkclqVSV7MJt0zdKlSq/wD/bBoocF1tZ4ZffD
 c0v1sQ6JT0Lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:38:39 -0700
IronPort-SDR: PdWhWsgzOFBN9D1R4VQPzq8VMO0rUy1l50rMBxz86/Nop9A69ZRZJUTwpVTcA3I3ZWIowY5g18
 0kpN6vymuO+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192521"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:38:34 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 14/18] drm/i915/gem: Prefer drm_WARN* over WARN*
Date: Mon,  6 Apr 2020 16:57:56 +0530
Message-Id: <20200406112800.23762-15-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN* over WARN* at places where struct drm_device pointer
can be extracted.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c       | 3 ++-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c    | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9d11bad74e9a..d910eb9b77ef 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1440,7 +1440,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 			err = i915_vma_bind(target->vma,
 					    target->vma->obj->cache_level,
 					    PIN_GLOBAL, NULL);
-			if (WARN_ONCE(err,
+			if (drm_WARN_ONCE(&i915->drm, err,
 				      "Unexpected failure to bind target VMA!"))
 				return err;
 		}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 7fe9831aa9ba..4c1c7232b024 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -27,7 +27,8 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 	void *dst;
 	int i;
 
-	if (WARN_ON(i915_gem_object_needs_bit17_swizzle(obj)))
+	if (drm_WARN_ON(obj->base.dev,
+			i915_gem_object_needs_bit17_swizzle(obj)))
 		return -EINVAL;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 7ffd7afeb7a5..8b0708708671 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -235,7 +235,7 @@ i915_gem_userptr_init__mmu_notifier(struct drm_i915_gem_object *obj,
 	if (flags & I915_USERPTR_UNSYNCHRONIZED)
 		return capable(CAP_SYS_ADMIN) ? 0 : -EPERM;
 
-	if (WARN_ON(obj->userptr.mm == NULL))
+	if (drm_WARN_ON(obj->base.dev, obj->userptr.mm == NULL))
 		return -EINVAL;
 
 	mn = i915_mmu_notifier_find(obj->userptr.mm);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
