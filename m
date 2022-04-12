Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE104FE48D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86CD10E5B8;
	Tue, 12 Apr 2022 15:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B2910E1FA;
 Tue, 12 Apr 2022 15:19:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 136471F4490B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649776740;
 bh=W1xeNHFFi2xCQW+DSKNFK1fRoffazm4NeTwtpFvqJkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X03m9d2Sp82m013ENOFCLFQ9Tp7SBFVel+ym0BVJ9cugTl+tH77FALhp1/yDdb90i
 +xAiBa++y1r1LOZOszpwFGjeOI/FSlJPNCELVfTfrMJtYs0K/gDenxNfC/VMsZL14q
 I6JF8wtDuwFrlfN8bdOKKUoPO8ZgNyN/8a2cfzBxPjsk6KOQO3mJE/MKWq8npRM4lk
 SD6E771QA7gNLYQFvnAocxjqtiZqXud5xwclTYkc+xh/89qmxPTQNf2wEEddYYoefv
 smmuW3CWDnqBxLvLcgcG9sYX3heTP/+HTbxofeMRrXnuID2R4DD9efFW4Dw7Wk97lp
 RfT85FUnrfP3g==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/5] drm/i915: ttm move/clear logic fix
Date: Tue, 12 Apr 2022 15:18:36 +0000
Message-Id: <20220412151838.1298956-4-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412151838.1298956-1-bob.beckett@collabora.com>
References: <20220412151838.1298956-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm managed buffers start off with system resource definitions and ttm_tt
tracking structures allocated (though unpopulated).
currently this prevents clearing of buffers on first move to desired
placements.

The desired behaviour is to clear user allocated buffers and any kernel
buffers that specifically requests it only.
Make the logic match the desired behaviour.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 22 +++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 9fe8132de3b2..9cf85f91edb5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -3,6 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include "drm/ttm/ttm_tt.h"
 #include <drm/ttm/ttm_bo_driver.h>
 
 #include "i915_deps.h"
@@ -470,6 +471,25 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
 	return fence;
 }
 
+static bool
+allow_clear(struct drm_i915_gem_object *obj, struct ttm_tt *ttm, struct ttm_resource *dst_mem)
+{
+	/* never clear stolen */
+	if (dst_mem->mem_type == I915_PL_STOLEN)
+		return false;
+	/*
+	 * we want to clear user buffers and any kernel buffers
+	 * that specifically request clearing.
+	 */
+	if (obj->flags & I915_BO_ALLOC_USER)
+		return true;
+
+	if (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
+		return true;
+
+	return false;
+}
+
 /**
  * i915_ttm_move - The TTM move callback used by i915.
  * @bo: The buffer object.
@@ -520,7 +540,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 		return PTR_ERR(dst_rsgt);
 
 	clear = !i915_ttm_cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_populated(ttm));
-	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC))) {
+	if (!clear || allow_clear(obj, ttm, dst_mem)) {
 		struct i915_deps deps;
 
 		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
-- 
2.25.1

