Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05369066A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C935410E999;
	Thu,  9 Feb 2023 11:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F7810E999;
 Thu,  9 Feb 2023 11:17:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9CE9B82106;
 Thu,  9 Feb 2023 11:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88229C433D2;
 Thu,  9 Feb 2023 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675941419;
 bh=LIeNS+U7qNPIdfoEBkFXTuqkckUAEoi5zbDgutwik40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tVrsxX2uoRs/mh5mmRO5WEgrrJFAJdrQrK5XXabE0OtfPulwR1vfLtr9IXH2aOB+P
 UM+Dqfar98BjKSjDWlOg29JrwCVtzHZjIvrgBUUwYBSSscoNjrThcO/yp4h8LvXY6g
 rxS72V+S5TuDXtYo1KPO97zr0tgogiEC91sCNyprMJMtk/wEBbvYQxutrCIxkkyVX/
 YYQzqhlXYUZQRTI1dsctmZ11Kfd1ob5kxAquPctyS40IKJv0UBMpug6hYWwobLdv15
 HHVVCLYSJ+gH5mpC67Khf+cIF27vZDih7pubn9Bf/NuBCYBp1jbS4UsrxwjkVV8I4G
 +fmO6G5FXhH3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 30/38] drm/amd/display: Adjust downscaling limits
 for dcn314
Date: Thu,  9 Feb 2023 06:14:49 -0500
Message-Id: <20230209111459.1891941-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Miess <Daniel.Miess@amd.com>,
 Charlene.Liu@amd.com, Alex Hung <alex.hung@amd.com>, sancchen@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, mwen@igalia.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Miess <Daniel.Miess@amd.com>

[ Upstream commit dd2db2dc4bd298f33dea50c80c3c11bee4e3b0a4 ]

[Why]
Lower max_downscale_ratio and ARGB888 downscale factor
to prevent cases where underflow may occur on dcn314

[How]
Set max_downscale_ratio to 400 and ARGB downscale factor
to 250 for dcn314

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Daniel Miess <Daniel.Miess@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index 9066c511a0529..c80c8c8f51e97 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -871,8 +871,9 @@ static const struct dc_plane_cap plane_cap = {
 	},
 
 	// 6:1 downscaling ratio: 1000/6 = 166.666
+	// 4:1 downscaling ratio for ARGB888 to prevent underflow during P010 playback: 1000/4 = 250
 	.max_downscale_factor = {
-			.argb8888 = 167,
+			.argb8888 = 250,
 			.nv12 = 167,
 			.fp16 = 167
 	},
@@ -1755,7 +1756,7 @@ static bool dcn314_resource_construct(
 	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
 	pool->base.pipe_count = pool->base.res_cap->num_timing_generator;
 	pool->base.mpcc_count = pool->base.res_cap->num_timing_generator;
-	dc->caps.max_downscale_ratio = 600;
+	dc->caps.max_downscale_ratio = 400;
 	dc->caps.i2c_speed_in_khz = 100;
 	dc->caps.i2c_speed_in_khz_hdcp = 100;
 	dc->caps.max_cursor_size = 256;
-- 
2.39.0

