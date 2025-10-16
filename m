Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BABBE1162
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 02:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE67910E904;
	Thu, 16 Oct 2025 00:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="V4y7BwB9";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="P3fIws/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065FC10E904;
 Thu, 16 Oct 2025 00:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760573500; bh=89tz8HOxoS8Ul81Dor63mIb
 eoHc7opGGFVAFrfMdieA=; b=V4y7BwB95WUiWAy2EKRRjQ3HGDsAqCmfV2b9hPwk/FYf+/K5zX
 qy+p/tbfUmi3CjTxdcj0u7Yb8+zaHgozPVQy1fcYnCL87EZcwePmxuNXuBzr/WmZgr84uLIjotc
 nrYPH3UXwrTz5RrZsTeTZXL8mJGtSmnQyHrKHkKJRjU3A7bNIQMI6GutRdvXDrX5gFcaWrACDja
 g5YudvcqYhm0AidM5ANDZUKhfSGAZ8QRJprMPEkm7Ja+ukm1Pfq9eFAzsOp2igJkx4JHDQjPhwG
 jkCEMtmv5j9T0lpq7iHpke3zgkINTs9Qh2aVsDaeyfc8p21TyIt4jYvK8LSm9t7OZNQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760573500; bh=89tz8HOxoS8Ul81Dor63mIb
 eoHc7opGGFVAFrfMdieA=; b=P3fIws/qQFT2boo0kZuHGd32xA/PGpsCKzMAqKuyXBgCkQlEFt
 F3+OP/rNONLl5TViA3ktIl/TMDBmgdSXLCAg==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Subject: [PATCH v4 2/2] drm/amd: use fixed dsc bits-per-pixel from edid
Date: Thu, 16 Oct 2025 02:10:41 +0200
Message-ID: <20251016001038.13611-6-iam@lach.pw>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016001038.13611-2-iam@lach.pw>
References: <20251016001038.13611-2-iam@lach.pw>
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
rate, it should be respected by drm driver

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0d03e324d5b9..ebe5bb4eecf8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6521,6 +6521,11 @@ static void fill_stream_properties_from_drm_display_mode(
 
 	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 	stream->content_type = get_output_content_type(connector_state);
+
+	/* DisplayID Type VII pass-through timings. */
+	if (mode_in->dsc_passthrough_timings_support && info->dp_dsc_bpp != 0) {
+		stream->timing.dsc_fixed_bits_per_pixel_x16 = info->dp_dsc_bpp;
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
 
@@ -7756,7 +7768,7 @@ create_validate_stream_for_sink(struct drm_connector *connector,
 			drm_dbg_kms(connector->dev, "%s:%d Validation failed with %d, retrying w/ YUV420\n",
 				    __func__, __LINE__, dc_result);
 			aconnector->force_yuv420_output = true;
-		}
+}
 		stream = create_validate_stream_for_sink(connector, drm_mode,
 							 dm_state, old_stream);
 		aconnector->force_yuv422_output = false;
-- 
2.51.0
