Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0C7EE7E9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B2510E6C2;
	Thu, 16 Nov 2023 19:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F163210E6AB;
 Thu, 16 Nov 2023 19:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rW6e8Wz3hNwNjkrRY9Znuto9unoEv2l3DW4o7bg/gbY=; b=o+eo5Vjn24WaS7hp9PBiliXeRQ
 X8Maw/BURy+keM5N3HYwZ2bTiXo2UmUvQQmlZyLaXeGKGarR9kJrjUpG9mYvcYU3yDTe8cy1Aol/L
 MteqON+i49HHrqzmC2VRmI7LxVlxF+Lt3/EYJuq4L0ko2QqONbTXDSilAR4WQLkD32+LjFmXd6/Kc
 2ZDUzRkWwTenuEIMZa9GViJ4+gS29IVPZQ9cE3RaWIGAirHeF6n94kXtajibXUWBk10v3nWGQ+Ejm
 kJDoVmwVNQA1f8xmJfVDVrhb2VKYjn/LvV1kRMfJl8S/5yw5SGGK9JEIfkqFGz4/7RyrmQMFpRTPa
 hU1+ju2g==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVi-0048Yy-VP; Thu, 16 Nov 2023 20:58:47 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 14/32] drm/amd/display: encapsulate atomic regamma operation
Date: Thu, 16 Nov 2023 18:57:54 -0100
Message-Id: <20231116195812.906115-15-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We will wire up MPC 3D LUT to DM CRTC color pipeline in the next patch,
but so far, only for atomic interface. By checking
set_output_transfer_func in DC drivers with MPC 3D LUT support, we can
verify that regamma is only programmed when 3D LUT programming fails. As
a groundwork to introduce 3D LUT programming and better understand each
step, detach atomic regamma programming from the crtc colocr updating
code.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 55 ++++++++++++-------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 0b92513eab98..dec734f03832 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -525,6 +525,37 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
+					const struct drm_color_lut *regamma_lut,
+					uint32_t regamma_size, bool has_rom)
+{
+	struct dc_transfer_func *out_tf = stream->out_transfer_func;
+	int ret = 0;
+
+	if (regamma_size) {
+		/*
+		 * CRTC RGM goes into RGM LUT.
+		 *
+		 * Note: there is no implicit sRGB regamma here. We are using
+		 * degamma calculation from color module to calculate the curve
+		 * from a linear base.
+		 */
+		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		out_tf->tf = TRANSFER_FUNCTION_LINEAR;
+
+		ret = __set_output_tf(out_tf, regamma_lut, regamma_size, has_rom);
+	} else {
+		/*
+		 * No CRTC RGM means we can just put the block into bypass
+		 * since we don't have any plane level adjustments using it.
+		 */
+		out_tf->type = TF_TYPE_BYPASS;
+		out_tf->tf = TRANSFER_FUNCTION_LINEAR;
+	}
+
+	return ret;
+}
+
 /**
  * __set_input_tf - calculates the input transfer function based on expected
  * input space.
@@ -672,28 +703,12 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 				    regamma_size, has_rom);
 		if (r)
 			return r;
-	} else if (has_regamma) {
-		/*
-		 * CRTC RGM goes into RGM LUT.
-		 *
-		 * Note: there is no implicit sRGB regamma here. We are using
-		 * degamma calculation from color module to calculate the curve
-		 * from a linear base.
-		 */
-		stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
-		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
-
-		r = __set_output_tf(stream->out_transfer_func, regamma_lut,
-				    regamma_size, has_rom);
+	} else {
+		regamma_size = has_regamma ? regamma_size : 0;
+		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
+						 regamma_size, has_rom);
 		if (r)
 			return r;
-	} else {
-		/*
-		 * No CRTC RGM means we can just put the block into bypass
-		 * since we don't have any plane level adjustments using it.
-		 */
-		stream->out_transfer_func->type = TF_TYPE_BYPASS;
-		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
 	}
 
 	/*
-- 
2.40.1

