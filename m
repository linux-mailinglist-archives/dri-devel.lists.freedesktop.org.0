Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15374BB62B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AAA10EB87;
	Fri, 18 Feb 2022 10:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6836A10EB87;
 Fri, 18 Feb 2022 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178675; x=1676714675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ip7yh9TtqNGqyNAUmnumyaTaXv9TKkgX3VCmbjFMhFc=;
 b=GV1lrokZGa3Yvuxx60iyg+ldMrCkBlIlToYtnMTYqQ6pxqNMp4i8VTW5
 1trpWr14dFv3ojNCmcHoj7vobv2YO+2Mi0PbXN9Nc2QMS0wi8379bePuw
 B2ebdoYQwuuB7yd+f4s4HLFHkDh4ZogF7lL4SgoRN2lg86S0t3w/4hDuK
 EMskQgye+1Iq6T61UJKAhgAj6Z5AIbaYvYbM+UgqA0ZpuRKQ/OLq5GZHq
 TaC+KaQNDggtmjIF/DO8rE35QBH+PMvT41sWoofMJbuYQBsZvi1uPHjNR
 /MARanwwjp3I12xCmA7oRZ6/qlgzEAKh/HsXtVFwu7RtSPkkLUOA3CAxX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337541322"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="337541322"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="503950870"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga002.jf.intel.com with SMTP; 18 Feb 2022 02:04:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:31 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/22] drm/radeon: Use drm_mode_copy()
Date: Fri, 18 Feb 2022 12:03:46 +0200
Message-Id: <20220218100403.7028-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

struct drm_display_mode embeds a list head, so overwriting
the full struct with another one will corrupt the list
(if the destination mode is on a list). Use drm_mode_copy()
instead which explicitly preserves the list head of
the destination mode.

Even if we know the destination mode is not on any list
using drm_mode_copy() seems decent as it sets a good
example. Bad examples of not using it might eventually
get copied into code where preserving the list head
actually matters.

Obviously one case not covered here is when the mode
itself is embedded in a larger structure and the whole
structure is copied. But if we are careful when copying
into modes embedded in structures I think we can be a
little more reassured that bogus list heads haven't been
propagated in.

@is_mode_copy@
@@
drm_mode_copy(...)
{
...
}

@depends on !is_mode_copy@
struct drm_display_mode *mode;
expression E, S;
@@
(
- *mode = E
+ drm_mode_copy(mode, &E)
|
- memcpy(mode, E, S)
+ drm_mode_copy(mode, E)
)

@depends on !is_mode_copy@
struct drm_display_mode mode;
expression E;
@@
(
- mode = E
+ drm_mode_copy(&mode, &E)
|
- memcpy(&mode, E, S)
+ drm_mode_copy(&mode, E)
)

@@
struct drm_display_mode *mode;
@@
- &*mode
+ mode

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index a7925a8290b2..0cb1345c6ba4 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -777,7 +777,7 @@ static void radeon_fixup_lvds_native_mode(struct drm_encoder *encoder,
 		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
 			if (mode->hdisplay != native_mode->hdisplay ||
 			    mode->vdisplay != native_mode->vdisplay)
-				memcpy(native_mode, mode, sizeof(*mode));
+				drm_mode_copy(native_mode, mode);
 		}
 	}
 
@@ -786,7 +786,7 @@ static void radeon_fixup_lvds_native_mode(struct drm_encoder *encoder,
 		list_for_each_entry_safe(mode, t, &connector->probed_modes, head) {
 			if (mode->hdisplay == native_mode->hdisplay &&
 			    mode->vdisplay == native_mode->vdisplay) {
-				*native_mode = *mode;
+				drm_mode_copy(native_mode, mode);
 				drm_mode_set_crtcinfo(native_mode, CRTC_INTERLACE_HALVE_V);
 				DRM_DEBUG_KMS("Determined LVDS native mode details from EDID\n");
 				break;
-- 
2.34.1

