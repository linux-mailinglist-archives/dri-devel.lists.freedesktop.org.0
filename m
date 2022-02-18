Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E924BB634
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F0D10EECD;
	Fri, 18 Feb 2022 10:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD6910ED5F;
 Fri, 18 Feb 2022 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178683; x=1676714683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gnaFiawqbtPeA4zYVazfV1H8TuJOkHMSyuVfRyekoys=;
 b=hCPzQA8EGAKw6el/goGN+iMkaWe50oYrO12kdMK/ebpLWDeM7gobSaM/
 wajKXMtMKiW2OUlft4cqx7l9B8UibSVVbzN35nPuBwD21sATbQzVuztv+
 Kc/5XBi9RG2XS8lO6K2m+gL8x04+3tUqz7iUkXkjnAwaTRcbciklkzuZ7
 VoD+8r1aVDUFN31NS0gB2vlU/uYv0laajWtsIj40WkntBd2qpJHGeVBLY
 3lvqdrZ3AC7178LQq08xiGCsq9osJ24W20tXRv1StL4OV7nNnB5jjvFjF
 hVj7hkGmvbTWJNNzaP8o/ivjfMDr52Zlt8SE+r3p73apX2b4Cyt9ogu+m A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311839771"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="311839771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="572251815"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga001.jf.intel.com with SMTP; 18 Feb 2022 02:04:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:26 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/22] drm/amdgpu: Use drm_mode_copy()
Date: Fri, 18 Feb 2022 12:03:45 +0200
Message-Id: <20220218100403.7028-5-ville.syrjala@linux.intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
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
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 4 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index fa20261aa928..673078faa27a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -626,7 +626,7 @@ amdgpu_connector_fixup_lcd_native_mode(struct drm_encoder *encoder,
 		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
 			if (mode->hdisplay != native_mode->hdisplay ||
 			    mode->vdisplay != native_mode->vdisplay)
-				memcpy(native_mode, mode, sizeof(*mode));
+				drm_mode_copy(native_mode, mode);
 		}
 	}
 
@@ -635,7 +635,7 @@ amdgpu_connector_fixup_lcd_native_mode(struct drm_encoder *encoder,
 		list_for_each_entry_safe(mode, t, &connector->probed_modes, head) {
 			if (mode->hdisplay == native_mode->hdisplay &&
 			    mode->vdisplay == native_mode->vdisplay) {
-				*native_mode = *mode;
+				drm_mode_copy(native_mode, mode);
 				drm_mode_set_crtcinfo(native_mode, CRTC_INTERLACE_HALVE_V);
 				DRM_DEBUG_KMS("Determined LVDS native mode details from EDID\n");
 				break;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bd23c9e481eb..514280699ad5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6318,7 +6318,7 @@ get_highest_refresh_rate_mode(struct amdgpu_dm_connector *aconnector,
 		}
 	}
 
-	aconnector->freesync_vid_base = *m_pref;
+	drm_mode_copy(&aconnector->freesync_vid_base, m_pref);
 	return m_pref;
 }
 
@@ -6432,8 +6432,8 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 		recalculate_timing = is_freesync_video_mode(&mode, aconnector);
 		if (recalculate_timing) {
 			freesync_mode = get_highest_refresh_rate_mode(aconnector, false);
-			saved_mode = mode;
-			mode = *freesync_mode;
+			drm_mode_copy(&saved_mode, &mode);
+			drm_mode_copy(&mode, freesync_mode);
 		} else {
 			decide_crtc_timing_for_drm_display_mode(
 				&mode, preferred_mode, scale);
-- 
2.34.1

