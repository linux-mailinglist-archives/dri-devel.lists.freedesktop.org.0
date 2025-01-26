Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD687A1C8F7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE28610E3CC;
	Sun, 26 Jan 2025 14:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="koii+LeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65F010E3C4;
 Sun, 26 Jan 2025 14:54:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 35B665C5F2F;
 Sun, 26 Jan 2025 14:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC73AC4CED3;
 Sun, 26 Jan 2025 14:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903286;
 bh=MWX39xwk5ZlSxuwQypBB/AE78hXBvsKPnp1yLzp60AA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=koii+LeHjkneQvCdRUF2aoGQ7VENfF0TBlGlqW5+oLuSck9qGtBgATeNCtUBNdXcj
 DSvoOvVY+F2E+HnlkHD3LdSp98pFpJ6aYQvT85HeTcTSVcLQmFKTiX7rxflAXKK+x/
 0+6CV7oP47oOjjaOw0TNTvyhrA8Y5Ze3pu4NeTms184uauy0mI/wxUW9GdDlC8nH05
 QciVqx0GqmmFOoVHg047j+aWmaZpVEuzjb8AtIyWg93C9q658iORnoNQ63qDnQnmUy
 bEWo8213Hw9zgM+Ms9PTj2vBqgGH/ygXoHE8mCAoVSGzuizH0z6RGoDnFtnPj1iTbN
 vhBS1UAe0iGRw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gabe Teeger <Gabe.Teeger@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, roman.li@amd.com, srinivasan.shanmugam@amd.com,
 wayne.lin@amd.com, linux@treblig.org, rostrows@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 33/34] drm/amd/display: Limit Scaling Ratio on
 DCN3.01
Date: Sun, 26 Jan 2025 09:53:09 -0500
Message-Id: <20250126145310.926311-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145310.926311-1-sashal@kernel.org>
References: <20250126145310.926311-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
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

From: Gabe Teeger <Gabe.Teeger@amd.com>

[ Upstream commit abc0ad6d08440761b199988c329ad7ac83f41c9b ]

[why]
Underflow and flickering was occuring due to high scaling ratios
when resizing videos.

[how]
Limit the scaling ratios by increasing the max scaling factor

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Gabe Teeger <Gabe.Teeger@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/resource/dcn301/dcn301_resource.c  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
index a9816affd312d..0cc8a27be5935 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
@@ -671,9 +671,9 @@ static const struct dc_plane_cap plane_cap = {
 
 	/* 6:1 downscaling ratio: 1000/6 = 166.666 */
 	.max_downscale_factor = {
-			.argb8888 = 167,
-			.nv12 = 167,
-			.fp16 = 167 
+			.argb8888 = 358,
+			.nv12 = 358,
+			.fp16 = 358
 	},
 	64,
 	64
@@ -693,7 +693,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.disable_dcc = DCC_ENABLE,
 	.vsr_support = true,
 	.performance_trace = false,
-	.max_downscale_src_width = 7680,/*upto 8K*/
+	.max_downscale_src_width = 4096,/*upto true 4k*/
 	.scl_reset_length10 = true,
 	.sanity_checks = false,
 	.underflow_assert_delay_us = 0xFFFFFFFF,
-- 
2.39.5

