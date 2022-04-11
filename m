Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F54FC50C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 21:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E7410E0EE;
	Mon, 11 Apr 2022 19:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D51610E032;
 Mon, 11 Apr 2022 19:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 026B31F43CB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649705109;
 bh=GrofPaVaAIh/vGpNqrDMDcYhEYMfkIf09BP3sK/sbsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EU6erXzCI7f81sjt6x336MGMJH7FfZKE5CDaUJc6KJCOkGolIQz6CNplo0GKhYZjL
 RE7vc4GNdFKq+A1ITS+boHQvkIkQFwWiVHf1Q9uuRndevGQylJw2FvEyuX/jHCFtgQ
 5uzIuzB4hORtKXz/hNE9npZxQ+qSf0wGumhfOiebrXJj4+XwSbia7+xVCQipARPKBm
 2uSLzI4Kijfqyt4jRBXhfT38X9ZOTd/ueWDy19h7Lx52vT6i5qQ0m9O2Uj13maMk3T
 y/WSvxN/GfoKS+BFCnnWZoIvFwhrhvNBIl2VsB6s3VSlinYIe2ZZXWiRo+YLvpWUPJ
 3s2P/1gq+zlKg==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] drm/i915: sanitize mem_flags for stolen buffers
Date: Mon, 11 Apr 2022 19:24:50 +0000
Message-Id: <20220411192453.1000147-3-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411192453.1000147-1-bob.beckett@collabora.com>
References: <20220411192453.1000147-1-bob.beckett@collabora.com>
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
 Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

stolen regions are not page backed or considered iomem.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 358f8a1a30ce..9fe8132de3b2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -122,8 +122,9 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 
 	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
 
-	obj->mem_flags |= i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
-		I915_BO_FLAG_STRUCT_PAGE;
+	if (obj->mm.region->id != INTEL_REGION_STOLEN_SMEM)
+		obj->mem_flags |= i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
+			I915_BO_FLAG_STRUCT_PAGE;
 
 	cache_level = i915_ttm_cache_level(to_i915(bo->base.dev), bo->resource,
 					   bo->ttm);
-- 
2.25.1

