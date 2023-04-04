Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801DC6D655D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7393610E6C7;
	Tue,  4 Apr 2023 14:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BEB10E6BE;
 Tue,  4 Apr 2023 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680618726; x=1712154726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a//1S81/q+X7NlwK7SEM4aSn96CLgI73qyYNqhZurqI=;
 b=el4ACQYt7OhKU+runvMvdB8QdZyMZR603U3J5MaONBNO0Z5AQ+oXndT5
 7XYrs3tYBpO1ypXHXEO5kNiSaENuHub6m616c6hE7Nox9hMC6+1/2MhPw
 jmrbwb1RU726ixnV02NKPYJ73QZn6RaDD4HKThgRDdkAB3Ci8UgYsQW0w
 U9P87k/Sr4OQbuXwrTXFRR6kGaPLCVpHjxlOE4jZ+eQzOBnkoh1s8tvek
 1koDtXvyTKvViZQ6nSNJ4Ig2s8RKK8rqY0JWq9mdTKSthNNj0SI9UGFyv
 8fwojIchwXfDuBq3Tm/vvUCxRMGNwCK1mOa7OzyCPELOMfe2/Jf4AXpJB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="404960788"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="404960788"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="688918124"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="688918124"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 07:31:10 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/display: Set I915_BO_ALLOC_USER for fb
Date: Tue,  4 Apr 2023 16:30:57 +0200
Message-Id: <20230404143100.10452-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230404143100.10452-1-nirmoy.das@intel.com>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Framebuffer is exposed to userspace so make sure we set
proper flags for it. Set I915_BO_PREALLOC for prealloced
fb so that ttm won't clear existing data.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c         | 3 ++-
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 673bcdfb7ff6..f7d48d00ae4b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -163,7 +163,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	obj = ERR_PTR(-ENODEV);
 	if (HAS_LMEM(dev_priv)) {
 		obj = i915_gem_object_create_lmem(dev_priv, size,
-						  I915_BO_ALLOC_CONTIGUOUS);
+						  I915_BO_ALLOC_CONTIGUOUS |
+						  I915_BO_ALLOC_USER);
 	} else {
 		/*
 		 * If the FB is too big, just don't use it since fbdev is not very
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index bb6ea7de5c61..736072a8b2b0 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -110,7 +110,9 @@ initial_plane_vma(struct drm_i915_private *i915,
 	    size * 2 > i915->dsm.usable_size)
 		return NULL;
 
-	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
+	obj = i915_gem_object_create_region_at(mem, phys_base, size,
+					       I915_BO_ALLOC_USER |
+					       I915_BO_PREALLOC);
 	if (IS_ERR(obj))
 		return NULL;
 
-- 
2.39.0

