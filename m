Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DAFA7468A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0194210E9CD;
	Fri, 28 Mar 2025 09:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8J2p9Wf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA6210E9CA;
 Fri, 28 Mar 2025 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743155048; x=1774691048;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mc4LRLnpMqJCpbV7gLhxhisPvfGRLgUB6sii+d8kVcg=;
 b=Y8J2p9WfZjJvBw6wliyHLNTs2PdHh+sS8FoTUJCvaqJ5+JaGDeRKZ2Q+
 gIKFJDPue+Z9sjX+Jp/4nmbU1Va6oETns+wUwaZpdkxit1bqXebbtDXZR
 zAvtDZoVyAFMPewBiJkQA/u65Yj4I/zPcG9M3JpnMgZP7prh3S9VrQlfE
 hU0y1mQ5uzLjHK2syBsKImrGp/NSZF4XDlbjiSY1FasTNyzih9qxpKPSB
 QnTjENz2zVcLUwYoVEB26Qpij1RYPSzjzQkWYsbZwdwTJlH+3esN5f/BZ
 uBMwJuEYzqK4ZAhBf/sqjsAbFC9oMdN3uXkN9IJhPwQwceTUZiU7wuJEY g==;
X-CSE-ConnectionGUID: KqM9jDLVQu275z+PEyvZig==
X-CSE-MsgGUID: RjZPo4gyQJKLd8gR+eJppQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48170277"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="48170277"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 02:44:08 -0700
X-CSE-ConnectionGUID: 8bKKYMXURUqsXCdsjad8WA==
X-CSE-MsgGUID: tuQEDshiS0SXAOthJcZRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="129547533"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2025 02:44:05 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 28 Mar 2025 14:59:16 +0530
Subject: [PATCH v10 4/4] drm/i915/display: Add i915 hook for
 format_mod_supported_async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-asyn-v10-4-8b8ad12cfc97@intel.com>
References: <20250328-asyn-v10-0-8b8ad12cfc97@intel.com>
In-Reply-To: <20250328-asyn-v10-0-8b8ad12cfc97@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
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
index 5260b9e723af3f654cb36512fe0b5368523082e6..a260dd44af1b40d4b475b87a55ff85e0572f62bf 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -188,6 +188,17 @@ bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
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

