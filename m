Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED761C54CE9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 00:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344D610E7C0;
	Wed, 12 Nov 2025 23:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMnCUjX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1268910E7C1;
 Wed, 12 Nov 2025 23:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762990244; x=1794526244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=edJmDqQQXilarpllUjWfPI/ey0Q1ah0VnfxcikD8i9U=;
 b=BMnCUjX6ry/qn9QLvytPcKGES3gEe6PzYGVlzOaZ4Dc2VkpoYw9haD5c
 jrau72ZWCK0IHomuycZ/JjSoJ9cL5xBh7VZaq15ouVgW0/auTHtkatg/a
 3viTuPXS4/pSCsaeQcRpMtsWtxklAkm/CahQdGmkc0/EPhB3gYUXHGrdk
 7bENfHiWdI3VGaxU1cbQlMKbNyAYcQbp9f/HcgphxS2gUlD/Sy1hziO1V
 y1w7km0h8aEhizKeZ1F9l5Tc3IgyNcsbp0TTGWM53JSKDPGylBWXNqS0c
 lKWKJL073BRPsl7UrUtVCt9MQCmNhwy1UN2WfuKpAMj0GcJ/U2Q9pcJW9 w==;
X-CSE-ConnectionGUID: E+4IJ0dDR3u+P3ynIGRmQw==
X-CSE-MsgGUID: MsPalFn/QtGt4tHdOS7ytA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82697818"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="82697818"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:30:43 -0800
X-CSE-ConnectionGUID: lgIzDzMzSTSjXrD6cE5EhA==
X-CSE-MsgGUID: xkRVRVz4Saq9MweBsFm80w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="194330576"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:30:42 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Expose the IN_FORMATS_ASYNC blob for all planes
Date: Thu, 13 Nov 2025 01:30:29 +0200
Message-ID: <20251112233030.24117-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251112233030.24117-1-ville.syrjala@linux.intel.com>
References: <20251112233030.24117-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Since old kernel versions wouldn't expose the IN_FORMATS_ASYNC blob,
userspace can't really use the absence of the blob to determine
that async flips aren't supported. Thus it seems better to always
expose the blob on all planes, whether they support async flips
or not. The blob will simply not indicate any format+modifier
combinations as supported on planes that aren't async flip capable.

Currently we expose the blob for all skl+ universal planes (even
though we implement async flips only for the first plane on each
pipe), and i9xx primary planes (for ilk+ we have async flips support,
for pre-ilk we do not). Complete the full set by also expsosing
the blob on pre-skl sprite planes, and cursors.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 1 +
 drivers/gpu/drm/i915/display/intel_sprite.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index a10b2425b94d..63e6a4767aa9 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -974,6 +974,7 @@ static const struct drm_plane_funcs intel_cursor_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = intel_cursor_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static void intel_cursor_add_size_hints_property(struct intel_plane *plane)
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 69b6873a6044..9888a2a43fc5 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1567,6 +1567,7 @@ static const struct drm_plane_funcs g4x_sprite_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = g4x_sprite_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static const struct drm_plane_funcs snb_sprite_funcs = {
@@ -1576,6 +1577,7 @@ static const struct drm_plane_funcs snb_sprite_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = snb_sprite_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 static const struct drm_plane_funcs vlv_sprite_funcs = {
@@ -1585,6 +1587,7 @@ static const struct drm_plane_funcs vlv_sprite_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = vlv_sprite_format_mod_supported,
+	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
 struct intel_plane *
-- 
2.49.1

