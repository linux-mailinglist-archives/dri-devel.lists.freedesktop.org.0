Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47021543DDA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820E511A098;
	Wed,  8 Jun 2022 20:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA5E11A08C;
 Wed,  8 Jun 2022 20:52:58 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C81FD660180B;
 Wed,  8 Jun 2022 21:52:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654721577;
 bh=dOKJizqx/fHYXj8qk/D8e8eM9at0JQtCb+3CVcme0hQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YNiGyGCme9YHOMcIev2ZMFL/JVDvALB45ep/pOYrZ6Wn5EduYIRB54eA8O2OH3xOX
 U6ph0YvuKSHWF0FiPjyw14hYeflkzYWIJuyBtiESibJEKMZsloAi9pVQjgDs4Okt+U
 5IYjlMY2DCvTz2O3o4Q7CW3syoipUBPPSTzGf4K93jZtDi1q5xSm1znRS1k2uDeido
 7h1G/jKbEqTXTiiaBCVB+ukzNKCE2Nyp30vF8wErs9P+P3jJXmFw0PauGgJkFhws/S
 5uDTxJsNqGwUiGgU0c+74S9IXIkR8BntmOkc2NGiup0QN4AyKfoARQl2dcsUoMpq8n
 W8RLaLsqdsMNQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 7/8] drm/i915/ttm: trust snooping when gen 6+ when deciding
 default cache_level
Date: Wed,  8 Jun 2022 20:51:30 +0000
Message-Id: <20220608205132.438596-8-bob.beckett@collabora.com>
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

By default i915_ttm_cache_level() decides I915_CACHE_LLC if HAS_SNOOP.
this is divergent from existing backends code which only considers
HAS_LLC.
Testing shows that trusting snooping on gen5- is unreliable, so limit to
gen6+

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 4c1de0b4a10f..e6cce35edb65 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -46,7 +46,9 @@ static enum i915_cache_level
 i915_ttm_cache_level(struct drm_i915_private *i915, struct ttm_resource *res,
 		     struct ttm_tt *ttm)
 {
-	return ((HAS_LLC(i915) || HAS_SNOOP(i915)) &&
+	bool can_snoop = HAS_SNOOP(i915) && (GRAPHICS_VER(i915) > 5);
+
+	return ((HAS_LLC(i915) || can_snoop) &&
 		!i915_ttm_gtt_binds_lmem(res) &&
 		ttm->caching == ttm_cached) ? I915_CACHE_LLC :
 		I915_CACHE_NONE;
-- 
2.25.1

