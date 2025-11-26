Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDAEC88560
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 07:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E169810E43C;
	Wed, 26 Nov 2025 06:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="PDKZMoa8";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="iP0Uvxxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2B410E0E1;
 Wed, 26 Nov 2025 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764139914; bh=xBHAbfvs3M52TAGHXMuwouD
 KJD5Hy5FqWvdsrTLN97w=; b=PDKZMoa8q/NuKWDviDdRo682mMMyHRWY/WMZVJvoUcsgiBbDmf
 XiR3qt5APE2cAfU/V/tezlVM+VYEBgNRMKvGo0JMyQcF5Mk9dWTaeOkIZ28n0dPnaVTJ4mNQsff
 ZmlYsL4M2BWs8MK5NFYbbxkT7BmOwj17HFNyxWnEukffBL/dRGv3cXTnuHBwo1Z5PLWlLuEtNXb
 qdTUJ0GTR574atCJ87wziLgdCNUbUsAEfnxcV7mLVFKPLRCqIloPixV6pDqF24dOTpwJD6yHBr9
 f5RLf6QvIsBCioYDZo38wx+PXniTuRDwHv2XjClNlOUDcA2+9CuAVU7mtN5gXMwZMTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764139914; bh=xBHAbfvs3M52TAGHXMuwouD
 KJD5Hy5FqWvdsrTLN97w=; b=iP0UvxxyHoAGWMnLEAT4DoO+3yOQ3OEc98OJ39jeXI/cPFpSZv
 +YZab2VhY79iH5MkpRlWYKJuKUd1LCRk57AQ==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yaroslav Bolyukin <iam@lach.pw>
Subject: [PATCH v6 7/7] drm/amd: use fixed dsc bits-per-pixel from edid
Date: Wed, 26 Nov 2025 07:51:26 +0100
Message-ID: <20251126065126.54016-8-iam@lach.pw>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251126065126.54016-1-iam@lach.pw>
References: <20251126065126.54016-1-iam@lach.pw>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VESA vendor header from DisplayID spec may contain fixed bit per pixel
rate, it should be used by drm driver for the modes that declare
they are only supported with the declared fixed bits per pixel value.

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e6728fd12eeb..32370279283f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6613,6 +6613,11 @@ static void fill_stream_properties_from_drm_display_mode(
 
 	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 	stream->content_type = get_output_content_type(connector_state);
+
+	/* DisplayID Type VII pass-through timings. */
+	if (mode_in->dsc_passthrough_timings_support && info->dp_dsc_bpp_x16 != 0) {
+		stream->timing.dsc_fixed_bits_per_pixel_x16 = info->dp_dsc_bpp_x16;
+	}
 }
 
 static void fill_audio_info(struct audio_info *audio_info,
@@ -7071,6 +7076,7 @@ create_stream_for_sink(struct drm_connector *connector,
 	struct drm_display_mode mode;
 	struct drm_display_mode saved_mode;
 	struct drm_display_mode *freesync_mode = NULL;
+	struct drm_display_mode *dsc_passthru_mode = NULL;
 	bool native_mode_found = false;
 	bool recalculate_timing = false;
 	bool scale = dm_state->scaling != RMX_OFF;
@@ -7162,6 +7168,16 @@ create_stream_for_sink(struct drm_connector *connector,
 		}
 	}
 
+	list_for_each_entry(dsc_passthru_mode, &connector->modes, head) {
+		if (dsc_passthru_mode->hdisplay == mode.hdisplay &&
+		    dsc_passthru_mode->vdisplay == mode.vdisplay &&
+		    drm_mode_vrefresh(dsc_passthru_mode) == mode_refresh) {
+			mode.dsc_passthrough_timings_support =
+				dsc_passthru_mode->dsc_passthrough_timings_support;
+			break;
+		}
+	}
+
 	if (recalculate_timing)
 		drm_mode_set_crtcinfo(&saved_mode, 0);
 
-- 
2.51.2
