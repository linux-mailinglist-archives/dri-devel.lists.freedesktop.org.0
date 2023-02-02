Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160A06885FF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 19:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60C310E5BA;
	Thu,  2 Feb 2023 18:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB6E10E5BA;
 Thu,  2 Feb 2023 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675361079; x=1706897079;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mBed7KUN+saK6kQDRbOoIJRTGfHfpduE/04Zc48PNlM=;
 b=QI4GtemdRUwu/r9MDcDRsCvT/iIJXdO3WWi+KtNu+bBZOdC3UtXwZFyM
 KKp9r6VxYFQE0I9GGXVxDdt12HAbuRkdo/kMj0CONTMXheV4sBtxsd3Ml
 y5md9/9/jkqoBf9YudNVKTGF0FO1UJwGFGDIVfIpmaHR7oshGTM0WQXt2
 sZ8Uusz0343qyNzkj5nRwvs9W0WN7faN+W7FDp1323x1rqTVXnn8UhD8C
 yO5GaejuU40QabwXzkILoPoFne9ms79EaTObmB5zG9YrLY5Qz5+GdDYlu
 7kNuxm/L1P/SEGsKrkr2qQX68R8ZYnGIp3d3B8A+zGrU8aMUHUBN7+6Qe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330648357"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="330648357"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 10:03:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="734025470"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="734025470"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 10:02:58 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Make sure dsm_size has correct granularity
Date: Thu,  2 Feb 2023 19:02:43 +0100
Message-Id: <20230202180243.23637-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSM granularity is 1MB so make sure we stick to that.

v2: replace "1 * SZ_1M" with SZ_1M (Andrzej).

Cc: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 90a967374b1a..d8e06e783e30 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -909,7 +909,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
 		if (WARN_ON(lmem_size < dsm_base))
 			return ERR_PTR(-ENODEV);
-		dsm_size = lmem_size - dsm_base;
+		dsm_size = ALIGN_DOWN(lmem_size - dsm_base, SZ_1M);
 	}
 
 	io_size = dsm_size;
-- 
2.39.0

