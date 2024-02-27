Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA786A0D4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 21:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C543510E993;
	Tue, 27 Feb 2024 20:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9JVO8zB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E9810E992;
 Tue, 27 Feb 2024 20:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709065612; x=1740601612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rVjiJFnIz9QuGzOYqaIk0B2kID+k1JY0BTBjYB/WLLc=;
 b=V9JVO8zBFS2NRp8b9o3m4Rewumy4kj6QhxBCT+DrVJwcRiHW0FMqwhb3
 lIqGtNxH89BoQWTB1jj7slYCVIcLznot9aO3QLQh40CTo/hlPA2AFGiQK
 rdmo59CViV3trKyXeFPnMh7f5bAvgXiuHTICSVhn2e97gMkbCIXYsxEYK
 SF7QC3WH2RS5UIzQxRxvkdZjjrzcozTFs4tvtHFvviuMIot3cXtnGU/no
 m67bLBCONOBfYlUH3uR41tO2k2IwnHXalp3TjA2Uw5BYbZqsmdLiukUkS
 j0PAn9Hdj5YpoJahOqiBXpRwHoeTEKOc1fGniwnGJzKziEKMOyH7722oC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="20979214"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="20979214"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 12:26:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="827770874"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="827770874"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 27 Feb 2024 12:26:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Feb 2024 22:26:45 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/i915/ttm: Fix TTM_PL_FLAG_DESIRED
Date: Tue, 27 Feb 2024 22:26:45 +0200
Message-ID: <20240227202645.20111-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

inlined from ‘i915_ttm_get_pages’ at ../drivers/gpu/drm/i915/gem/i915_gem_ttm.c:847:2:
../drivers/gpu/drm/i915/gem/i915_gem_ttm.c:165:18: warning: ‘places[0].flags’ is used uninitialized [-Wuninitialized]
  165 |         places[0].flags |= TTM_PL_FLAG_DESIRED;
      |         ~~~~~~~~~^~~~~~
../drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function ‘i915_ttm_get_pages’:
../drivers/gpu/drm/i915/gem/i915_gem_ttm.c:837:26: note: ‘places’ declared here
  837 |         struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
      |                          ^~~~~~

Furhermore we then proceed to call i915_ttm_place_from_region() which
memset()s the whole thing back to zero anyway. So in the end we lose
the TTM_PL_FLAG_DESIRED flag (and fortunately also whatever else stack
garbage happened to be in the flags at this point).

No idea what functional changes this will result in...

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 27dcfd8a34bb..e6f177183c0f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -162,10 +162,10 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 	unsigned int flags = obj->flags;
 	unsigned int i;
 
-	places[0].flags |= TTM_PL_FLAG_DESIRED;
 	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
 				   obj->mm.region, &places[0], obj->bo_offset,
 				   obj->base.size, flags);
+	places[0].flags |= TTM_PL_FLAG_DESIRED;
 
 	/* Cache this on object? */
 	for (i = 0; i < num_allowed; ++i) {
-- 
2.43.0

