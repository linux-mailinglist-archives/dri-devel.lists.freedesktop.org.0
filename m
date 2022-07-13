Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E15737A0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 15:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB28112088;
	Wed, 13 Jul 2022 13:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC8010E95B;
 Wed, 13 Jul 2022 13:38:43 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2532366019C5;
 Wed, 13 Jul 2022 14:38:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657719521;
 bh=5MPDE6PLauo4xeTXuzQqjxRuaatIiJJgaRF7Azzw0o0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEmBV92DTmAxhUcy73wR4rSi/rg1nPCZyXUE5o2+TmN6KaxS3kIYj/e5XIFnAyBOx
 oHVxY/754MrEjw2nIL7q/tTM/kAeMYYJzJYms7z7gzcTBucVvH4zzOULDbG3tb/Ngr
 +bOKljnG97lDg+SE8kMn51Olj0rNBz0E/HXiVnecfa9W7REPoRoarOrMFNRW7//xKJ
 ArURia99XXqHlb41YhvOTSewyF8HPXzBblL9FcYr8nLRJcuVssiwo6jbSd6Y+DrHTp
 2SDmbWfVTghCEBC3lAwk+0ya7UX0MJGQmWx7xON9KK3oReRXUrh1fWVpTSexM2fq6B
 7SwKcm1H1eP/A==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 4/8] drm/i915: add gen6 ppgtt dummy creation function
Date: Wed, 13 Jul 2022 14:38:14 +0100
Message-Id: <20220713133818.3699604-5-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713133818.3699604-1-bob.beckett@collabora.com>
References: <20220713133818.3699604-1-bob.beckett@collabora.com>
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

