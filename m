Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433A543DE2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435311A0AA;
	Wed,  8 Jun 2022 20:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5712611A08C;
 Wed,  8 Jun 2022 20:52:56 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D0F276601801;
 Wed,  8 Jun 2022 21:52:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654721575;
 bh=fNrnNmjm8O3impsJ3FwNrPFJIw42pnJblFgr2kI6zEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X1jsSDV9qIkW0k9U0wTK98H2ECth5LgLSSwPXgE1gQmREyqzW39tKU/XzXHXuT5Hs
 QXji+EM4q9zv5jgMedjv4I3DR+DcC7pHZGZlve4cVqqEAJL6rvBF3qe1B52PMGpiBz
 dOxQ4mN7VuvWCcqkhzxpmF34dPpxf/oyLUsVa9DglQXVxmSdphL+uC18TRoCoc68CF
 7wI9IV6iwpRNlSAZhG/6Z/nUMSpy27towMbvA5J0T2kPMVvim49B/RBgluej92WKmS
 MxUgyVAyNle+H56W3h0R0/j3a7nWZ3bscibDXsSl7V7b3Hw0kitVI7/JrcEkraORok
 pRc3BwpRgyZ8Q==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/8] drm/i915: allow volatile buffers to use ttm pool
 allocator
Date: Wed,  8 Jun 2022 20:51:27 +0000
Message-Id: <20220608205132.438596-5-bob.beckett@collabora.com>
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

Internal/volatile buffers should not be shmem backed.
If a volatile buffer is requested, allow ttm to use the pool allocator
to provide volatile pages as backing.
Fix i915_ttm_shrink to handle !is_shmem volatile buffers by purging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 27d59639177f..8edce04a0509 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -309,7 +309,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
 	caching = i915_ttm_select_tt_caching(obj);
-	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached) {
+	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached &&
+	    !i915_gem_object_is_volatile(obj)) {
 		page_flags |= TTM_TT_FLAG_EXTERNAL |
 			      TTM_TT_FLAG_EXTERNAL_MAPPABLE;
 		i915_tt->is_shmem = true;
@@ -531,9 +532,9 @@ static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
 	if (!bo->ttm || bo->resource->mem_type != TTM_PL_SYSTEM)
 		return 0;
 
-	GEM_BUG_ON(!i915_tt->is_shmem);
+	GEM_BUG_ON(!i915_tt->is_shmem && obj->mm.madv != I915_MADV_DONTNEED);
 
-	if (!i915_tt->filp)
+	if (i915_tt->is_shmem && !i915_tt->filp)
 		return 0;
 
 	ret = ttm_bo_wait_ctx(bo, &ctx);
-- 
2.25.1

