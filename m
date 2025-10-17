Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7CBEAB21
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F5810EC90;
	Fri, 17 Oct 2025 16:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="EFplJfyJ";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="U5669QGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D3410EC7E;
 Fri, 17 Oct 2025 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718490; bh=i9hlKm1uSeiiZmxzIePKHJs
 FghgJVFB5WZw8+mDTUPw=; b=EFplJfyJJoitcPwcsbwdy5k+puBP4RaTYvZTqH9xG370gTOVM7
 XtE8rWdlfVFMjmFRtdOsP/VLtK66hH9TnLelszHq2b/+CT+8h0QZ/ONMvu5rpfYscdYeIigU9lu
 1MBXlw5nsHTjjbpr+v6RoZddAkCvP8gZN9Z41Rc4y/kjvS9Plzi8v+k5TfjEgCt2Wg3c6e872wh
 HnIHrCdnUv2mdd+9Bo2uG21vDYxnRsbM2qgNXWTYFfaHeWNitMSDU3VM5JziYPnxVNLp3TFXIKI
 jLxh28X/CsPgY/RS6d+PiKNGplYVecmPZWjVIZsrX0V+/iR6shghgbvHRmGGniXSaDQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718490; bh=i9hlKm1uSeiiZmxzIePKHJs
 FghgJVFB5WZw8+mDTUPw=; b=U5669QGmRWqlZWa8ap/q7ljLN8cyBMgPlOdCAOoNMt4IoTM9TD
 6K8Lm8Rqi+8ozJiDsbA0M3nmpAFHyPl2q3Dg==;
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
Subject: [PATCH v5 7/7] drm/amd: use fixed dsc bits-per-pixel from edid
Date: Fri, 17 Oct 2025 18:27:36 +0200
Message-ID: <20251017162736.45368-8-iam@lach.pw>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017162736.45368-1-iam@lach.pw>
References: <20251017162736.45368-1-iam@lach.pw>
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

It is however unclear how to deal with the modes created from userspace.
Current implementation assumes that fixed bits per pixel value should
always be used if the preferred display mode has this flag set, which is
the case for all the known hardware.

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0d03e324d5b9..739d5dabcf41 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6521,6 +6521,11 @@ static void fill_stream_properties_from_drm_display_mode(
 
 	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 	stream->content_type = get_output_content_type(connector_state);
+
+	/* DisplayID Type VII pass-through timings. */
+	if (mode_in->dsc_passthrough_timings_support && info->dp_dsc_bpp_x16 != 0) {
+		stream->timing.dsc_fixed_bits_per_pixel_x16 = info->dp_dsc_bpp_x16;
+	}
 }
 
 static void fill_audio_info(struct audio_info *audio_info,
@@ -7067,6 +7072,13 @@ create_stream_for_sink(struct drm_connector *connector,
 					&mode, preferred_mode, scale);
 
 			preferred_refresh = drm_mode_vrefresh(preferred_mode);
+
+			/*
+			 * HACK: In case of multiple supported modes, we should look at the matching mode to decide this flag.
+			 * But what is matching mode, how should it be decided?
+			 * Assuming that only preferred mode would have this flag.
+			 */
+			mode.dsc_passthrough_timings_support = preferred_mode->dsc_passthrough_timings_support;
 		}
 	}
 
-- 
2.51.0
