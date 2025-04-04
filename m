Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED23A7B75D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 07:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777EE10E307;
	Fri,  4 Apr 2025 05:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="al9VkWYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C880510E306;
 Fri,  4 Apr 2025 05:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743744823; x=1775280823;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=BSLvLhJY6SICPjv+DaDTjVQx6LswG0KOcVFUnys4q9k=;
 b=al9VkWYH1E9k7PdU4aTdoDg5N8cPUiiNaIXaSAb5BfASsu3hcHbiTJ7q
 yePOA+ZKTw/e8t4dX3irldV/a3bBB5Nmq13US9U2NAVeytwbHlsgu5iEh
 2h7QCz04JsyAXHn3h6l8BgZtBsKSk9uqLvzy6jRipGUabXXU7y25jdrti
 KE4ImIThfuLasm8rYTKS530kn/2kSvwgW2r9bdggtJS7TTtmeG6PVg2zt
 xKuPdfnvnnh25QOfHR66VGTdeloQzLupiyO0pVNmU417Gv9Nk0exsRq2m
 oz4zP4Q79zMntO8iPrsZ2FoJaheb2QxFI5Jnl09CpXMoCZkPHPlg7DGeo g==;
X-CSE-ConnectionGUID: 0OHDi3jERpqsM2XXD5LpCQ==
X-CSE-MsgGUID: wjlBkfEEQmCvgShqqbv5MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44893410"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="44893410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 22:33:42 -0700
X-CSE-ConnectionGUID: zNoEMqs3S5WM92QA43eNuw==
X-CSE-MsgGUID: x3xn1DXRTvmm2IUbG0dW0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="126992656"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa009.jf.intel.com with ESMTP; 03 Apr 2025 22:33:38 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 04 Apr 2025 10:48:56 +0530
Subject: [PATCH RESEND v12 4/5] drm/i915/display: Add i915 hook for
 format_mod_supported_async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250404-asyn-v12-4-9e2396596036@intel.com>
References: <20250404-asyn-v12-0-9e2396596036@intel.com>
In-Reply-To: <20250404-asyn-v12-0-9e2396596036@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 20250219093211.4059187-1-arun.r.murthy@intel.com, 
 20250311085422.2573860-1-santhosh.reddy.guddati@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.15-dev
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

Hook up the newly added plane function pointer
format_mod_supported_async to populate the modifiers/formats supported
by asynchronous flips.

v5: Correct the if condition for modifier support check (Chaitanya)
v6: Replace uint32_t/uint64_t with u32/u64 (Jani)
v7: Move plannar check from intel_async_flip_check_hw() to
intel_plane_format_mod_supported_async() (Ville)
v8: In case of error print format/modifier (Chaitanya)
v9: Exclude C8 format as its not supported by hardware
v10: filter only planar formats
     move changes in can_async_flip to new patch (Ville)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  2 ++
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  3 +++
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  3 +++
 4 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 20c47de6d8bfd1d8ddafae02ed68370df799e22b..75780fefe0ce98fe79e8bf8e118f5cf0d0b96e55 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -897,6 +897,7 @@ static const struct drm_plane_funcs i965_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = i965_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static const struct drm_plane_funcs i8xx_plane_funcs = {
@@ -906,6 +907,7 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = i8xx_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 struct intel_plane *
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 1ec730047759cb22b3e0fabfd2eaddbc1bc865af..3b9d3e1620cd882b8a7f9b4c96640e42367248bb 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -183,6 +183,17 @@ bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
 	return plane->can_async_flip && plane->can_async_flip(modifier);
 }
 
+bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
+					    u32 format,
+					    u64 modifier)
+{
+	if (!plane->funcs->format_mod_supported(plane, format, modifier))
+		return false;
+
+	return intel_plane_can_async_flip(to_intel_plane(plane),
+					format, modifier);
+}
+
 unsigned int intel_adjusted_rate(const struct drm_rect *src,
 				 const struct drm_rect *dst,
 				 unsigned int rate)
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
index 772a12aa9c6997d77b9393f964e91f3e8747d149..317320c32285db7edf1aaa5eced3cfbad59a37ff 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
@@ -90,5 +90,8 @@ int intel_atomic_add_affected_planes(struct intel_atomic_state *state,
 int intel_atomic_check_planes(struct intel_atomic_state *state);
 
 u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_state);
+bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
+					    u32 format,
+					    u64 modifier);
 
 #endif /* __INTEL_ATOMIC_PLANE_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 8f6170a5c108a000582f3415f78bad279254d8cf..f7c3ee1f8664eea7917a531b108aeac123cb1add 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2666,6 +2666,7 @@ static const struct drm_plane_funcs skl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = skl_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static const struct drm_plane_funcs icl_plane_funcs = {
@@ -2675,6 +2676,7 @@ static const struct drm_plane_funcs icl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = icl_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static const struct drm_plane_funcs tgl_plane_funcs = {
@@ -2684,6 +2686,7 @@ static const struct drm_plane_funcs tgl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = tgl_plane_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static void

-- 
2.25.1

