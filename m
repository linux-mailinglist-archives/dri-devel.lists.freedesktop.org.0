Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF975553B0F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 22:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EB310FF8A;
	Tue, 21 Jun 2022 20:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B5A10FE97;
 Tue, 21 Jun 2022 20:01:17 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EFB416601853;
 Tue, 21 Jun 2022 21:01:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655841676;
 bh=AgP5Riz/FHb587iBL1vYiW/g4qmDc92BtRCaR0jjFGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YwkkW2szc59ejHUw0SzvioMn6cHxM/hnFosRAIAUxdZBqOaZ5xFK4f3bghAYG5Cv5
 /oZz66OmyTyDo6OAkMSPwMvRPFDdCcW/hmMmwU5c/VoOOkWZm55tErEdl6qyKIV8Es
 x57ImaiXaBZVEOm9X9PTspSFweFIct4AOtr5+TJKEaongclhvzebIA3wmP7EbNxWyO
 TPvLRj4tAsTIatSZgI5Gt0RmnMNHVy26p7n/szHR3uG1DN3UNu+AQCwS59i92Gt4c3
 kTfkkxtNMjNSxhGHl42M1zKfI+Mka6UW8xXGRMHLexACEGZVX1G/vc+G8h1TjGlUiL
 VHlAYhHxMBIVw==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v8 06/10] drm/i915: sanitize mem_flags for stolen buffers
Date: Tue, 21 Jun 2022 20:00:54 +0000
Message-Id: <20220621200058.3536182-7-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220621200058.3536182-1-bob.beckett@collabora.com>
References: <20220621200058.3536182-1-bob.beckett@collabora.com>
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
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stolen regions are not page backed or considered iomem.
Prevent flags indicating such.
This correctly prevents stolen buffers from attempting to directly map
them.

See i915_gem_object_has_struct_page() and i915_gem_object_has_iomem()
usage for where it would break otherwise.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 675e9ab30396..81c67ca9edda 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -14,6 +14,7 @@
 #include "gem/i915_gem_region.h"
 #include "gem/i915_gem_ttm.h"
 #include "gem/i915_gem_ttm_move.h"
+#include "gem/i915_gem_stolen.h"
 
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_gt.h"
@@ -124,8 +125,9 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 
 	obj->mem_flags &= ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOMEM);
 
-	obj->mem_flags |= i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
-		I915_BO_FLAG_STRUCT_PAGE;
+	if (!i915_gem_object_is_stolen(obj))
+		obj->mem_flags |= i915_ttm_cpu_maps_iomem(bo->resource) ? I915_BO_FLAG_IOMEM :
+			I915_BO_FLAG_STRUCT_PAGE;
 
 	if (!obj->ttm.cache_level_override) {
 		cache_level = i915_ttm_cache_level(to_i915(bo->base.dev),
-- 
2.25.1

