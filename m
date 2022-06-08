Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5F4543DD3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F0C11A08E;
	Wed,  8 Jun 2022 20:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C467011A087;
 Wed,  8 Jun 2022 20:52:54 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D341660174C;
 Wed,  8 Jun 2022 21:52:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654721572;
 bh=KHg3eOnYqUoUcg57EXhLlpoQHXoJLlQC7w8GyVbN4OU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fTpnDBrRHU2piuEtAyNHVQQKt/cWTdalqnYL10DlHWK0Z1tvCGW7yiSOVJlFklyGV
 Y1e88ZnQanwV/Rq+8iwr7/Am2tzUr/mJL0rrXQ7HUJr1RpkB71bKQPJepWv3gVTT0p
 8gcAnSzTH6+CsflPCLwLAlKAopIlUpCW+MA5Jw4kXQFSIEXOjTuJNQTmLG7oBUH//V
 +8jYex+Ofi06dgNErPXlrU1HjH8bJ3FjRE0tt7OlSehHyABVc8Tj5dnblzUNLaSj9V
 sWwSA0AtMdNlbEydFUT11/rEEnzqASzKaPjPtpngUL3M+WNpC5rZgvdthF+8kF/cC/
 Kl/lPe3l/8OwA==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/8] drm/i915/ttm: dont trample cache_level overrides
 during ttm move
Date: Wed,  8 Jun 2022 20:51:24 +0000
Message-Id: <20220608205132.438596-2-bob.beckett@collabora.com>
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

Various places within the driver override the default chosen cache_level.
Before ttm, these overrides were permanent until explicitly changed again
or for the lifetime of the buffer.

TTM movement code came along and decided that it could make that
decision at that time, which is usually well after object creation, so
overrode the cache_level decision and reverted it back to its default
decision.

Add logic to indicate whether the caching mode has been set by anything
other than the move logic. If so, assume that the code that overrode the
defaults knows best and keep it.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c       | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c          | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c     | 9 ++++++---
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 06b1b188ce5a..519887769c08 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -125,6 +125,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
 	obj->cache_level = cache_level;
+	obj->ttm.cache_level_override = true;
 
 	if (cache_level != I915_CACHE_NONE)
 		obj->cache_coherent = (I915_BO_CACHE_COHERENT_FOR_READ |
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 2c88bdb8ff7c..6632ed52e919 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -605,6 +605,7 @@ struct drm_i915_gem_object {
 		struct i915_gem_object_page_iter get_io_page;
 		struct drm_i915_gem_object *backup;
 		bool created:1;
+		bool cache_level_override:1;
 	} ttm;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 4c25d9b2f138..27d59639177f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1241,6 +1241,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_gem_object_init_memory_region(obj, mem);
 	i915_ttm_adjust_domains_after_move(obj);
 	i915_ttm_adjust_gem_after_move(obj);
+	obj->ttm.cache_level_override = false;
 	i915_gem_object_unlock(obj);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index a10716f4e717..4c1de0b4a10f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -123,9 +123,12 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	obj->mem_flags |= i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
 		I915_BO_FLAG_STRUCT_PAGE;
 
-	cache_level = i915_ttm_cache_level(to_i915(bo->base.dev), bo->resource,
-					   bo->ttm);
-	i915_gem_object_set_cache_coherency(obj, cache_level);
+	if (!obj->ttm.cache_level_override) {
+		cache_level = i915_ttm_cache_level(to_i915(bo->base.dev),
+						   bo->resource, bo->ttm);
+		i915_gem_object_set_cache_coherency(obj, cache_level);
+		obj->ttm.cache_level_override = false;
+	}
 }
 
 /**
-- 
2.25.1

