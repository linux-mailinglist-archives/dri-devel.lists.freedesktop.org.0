Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267F57379C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 15:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800B61121B4;
	Wed, 13 Jul 2022 13:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67B810EF2E;
 Wed, 13 Jul 2022 13:38:44 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 132556601A3F;
 Wed, 13 Jul 2022 14:38:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657719523;
 bh=MjcvOf0vDzQBv8L9PWE+EuweTtTAL68jhBOjMGIS5/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NBxa3dKzpn0swOp/aq/dWp6Jm6MmA6wiKmCmGAIwRdhIwGbv3Y6OIi4grMy4i+YEs
 Ot66paKWdZYRIjPbryo7xwOYBT+OWWRfF5qYmFizAcYkXI4P4jEG8B9tW99FLviNAT
 CAlDIJ7CfDRaOxfgzkDUSs5K9AHDtJNfVazUCJ+cpsfYSMFG9A7QweMW3EfDqPOxFw
 zYHgskI1+3KPAdnD7Hv+UpIXz//vdPAOHeg71nL0zfeMnVoFR7OYT2hg2IgWl0GEi1
 xC6ea30gY1s8itAmjAr2tZxNWAZxXjgFevBEKRdgUHYrNkO7LWxZHTian+6bl82bwW
 RbaMqt3LkkAyA==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 6/8] drm/i915: allow volatile buffers to use ttm pool
 allocator
Date: Wed, 13 Jul 2022 14:38:16 +0100
Message-Id: <20220713133818.3699604-7-bob.beckett@collabora.com>
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

Internal/volatile buffers should not be shmem backed.
If a volatile buffer is requested, allow ttm to use the pool allocator
to provide volatile pages as backing.
Fix i915_ttm_shrink to handle !is_shmem volatile buffers by purging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index b6c3fc25d9d1..599ed2713359 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -291,7 +291,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
 	caching = i915_ttm_select_tt_caching(obj);
-	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached) {
+	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached &&
+	    !i915_gem_object_is_volatile(obj)) {
 		page_flags |= TTM_TT_FLAG_EXTERNAL |
 			      TTM_TT_FLAG_EXTERNAL_MAPPABLE;
 		i915_tt->is_shmem = true;
@@ -513,9 +514,9 @@ static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
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

