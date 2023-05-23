Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C3D70E8E7
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3803C10E52F;
	Tue, 23 May 2023 22:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C45C10E517;
 Tue, 23 May 2023 22:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SLJ8Rs+0pWMyDKd2MMqo8ex0DA6Tk2uV/hrFg5B+maE=; b=s0PVmkHVKSq9W1tLVI/RvSoLm3
 ySYEvvRM9GNAa/spl+fh42bpj23AZqCRkbY8fgs4URzx4FbUxrHrr4Djo1hiHckXYYAAPbLfDgfli
 ICTPX5cWAsKB5hlVdgpUetK272Lzqjh+Axl2Ymit5R0Fya0hHl4sFfY+wIC0oD2T5jAutaMeNlugL
 QqDycUOBUX0jCAUbinW+yQsVWqSkhJJA4O6w9acDywM8AJKdzLKYOKZSb8szazCkWsyLmLKLuezar
 TZPxeQ2U9ynXFdgu+yOtn7MkHSS2+jdPjt/dTw96zAixdQfCq5E9sUtsRTMtuq0ii7INcroo4jCJW
 t8ZuxUpA==;
Received: from [38.44.72.37] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q1aIS-00HEOv-5w; Wed, 24 May 2023 00:16:00 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 24/36] drm/amd/display: set sdr_ref_white_level to 80 for
 out_transfer_func
Date: Tue, 23 May 2023 21:15:08 -0100
Message-Id: <20230523221520.3115570-25-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
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

From: Joshua Ashton <joshua@froggi.es>

Otherwise this is just initialized to 0. This needs to actually have a
value so that compute_curve can work for PQ EOTF.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 146363363ef0..7cf35ac3fad3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -72,6 +72,7 @@
  */
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
+#define SDR_WHITE_LEVEL_INIT_VALUE 80
 
 /**
  * amdgpu_dm_init_color_mod - Initialize the color module.
@@ -325,6 +326,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 		 */
 		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
 		out_tf->tf = tf;
+		out_tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
 
 		ret = __set_output_tf(out_tf, regamma_lut, regamma_size, has_rom);
 	} else {
-- 
2.39.2

