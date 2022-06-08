Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3AB543DDB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5B11A097;
	Wed,  8 Jun 2022 20:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645ED11A08C;
 Wed,  8 Jun 2022 20:52:55 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A6A9D6601753;
 Wed,  8 Jun 2022 21:52:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654721572;
 bh=5MPDE6PLauo4xeTXuzQqjxRuaatIiJJgaRF7Azzw0o0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RgiklC2rhICBDdiymtf1iLzRIQVPyTdJkgxZYmqfMU7E6hz1sPyzO5TQT8YntXzNG
 +2PB79U3lWL1ynzxW+Y7HvFkuEPJTZ07Jrr6pkfJCrFnPNsFF+m8CLHfr4mAkoZ2Ax
 xxWHVkOuRgp70oVU1qfhOFRZueOgUC+gofnLYE5dMvhkBh5bbdV4xWvBPvpltmWu6B
 eem+hjMpegwMAL6+cmdtWAJZUPzBQKYgDr02zqbRSsW7wbzD59dhUkj8UC1saaa1tE
 Pv5QLPxJuuk6ofmI4yOx+EsFb4auYG7M6Iy21gkGO9YZs9aZMRAeLc7AT8RhKt8IC9
 0j5Vyq8eBTpFA==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/8] drm/i915: add gen6 ppgtt dummy creation function
Date: Wed,  8 Jun 2022 20:51:25 +0000
Message-Id: <20220608205132.438596-3-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608205132.438596-1-bob.beckett@collabora.com>
References: <20220608205132.438596-1-bob.beckett@collabora.com>
MIME-Version: 1.0
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Internal gem objects will soon just be volatile system memory region
objects.
To enable this, create a separate dummy object creation function
for gen6 ppgtt. The object only exists as a fake object pointing to ggtt
and gains no benefit in going via the internal backend.
Instead, create a dummy gem object and avoid having to maintain a custom
ops api in the internal backend, which makes later refactoring easier.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 43 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 1bb766c79dcb..f3b660cfeb7f 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -372,6 +372,45 @@ static const struct drm_i915_gem_object_ops pd_dummy_obj_ops = {
 	.put_pages = pd_dummy_obj_put_pages,
 };
 
+static struct drm_i915_gem_object *
+i915_gem_object_create_dummy(struct drm_i915_private *i915, phys_addr_t size)
+{
+	static struct lock_class_key lock_class;
+	struct drm_i915_gem_object *obj;
+	unsigned int cache_level;
+
+	GEM_BUG_ON(!size);
+	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
+
+	if (overflows_type(size, obj->base.size))
+		return ERR_PTR(-E2BIG);
+
+	obj = i915_gem_object_alloc();
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	drm_gem_private_object_init(&i915->drm, &obj->base, size);
+	i915_gem_object_init(obj, &pd_dummy_obj_ops, &lock_class, 0);
+	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
+
+	/*
+	 * Mark the object as volatile, such that the pages are marked as
+	 * dontneed whilst they are still pinned. As soon as they are unpinned
+	 * they are allowed to be reaped by the shrinker, and the caller is
+	 * expected to repopulate - the contents of this object are only valid
+	 * whilst active and pinned.
+	 */
+	i915_gem_object_set_volatile(obj);
+
+	obj->read_domains = I915_GEM_DOMAIN_CPU;
+	obj->write_domain = I915_GEM_DOMAIN_CPU;
+
+	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
+	i915_gem_object_set_cache_coherency(obj, cache_level);
+
+	return obj;
+}
+
 static struct i915_page_directory *
 gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
 {
@@ -383,9 +422,7 @@ gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
 	if (unlikely(!pd))
 		return ERR_PTR(-ENOMEM);
 
-	pd->pt.base = __i915_gem_object_create_internal(ppgtt->base.vm.gt->i915,
-							&pd_dummy_obj_ops,
-							I915_PDES * SZ_4K);
+	pd->pt.base = i915_gem_object_create_dummy(ppgtt->base.vm.gt->i915, I915_PDES * SZ_4K);
 	if (IS_ERR(pd->pt.base)) {
 		err = PTR_ERR(pd->pt.base);
 		pd->pt.base = NULL;
-- 
2.25.1

