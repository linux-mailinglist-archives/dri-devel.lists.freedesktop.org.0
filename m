Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C6AA9F55
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DDF10E459;
	Mon,  5 May 2025 22:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nu+wlemy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DC010E459;
 Mon,  5 May 2025 22:22:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D747B61F1F;
 Mon,  5 May 2025 22:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77D1C4CEE4;
 Mon,  5 May 2025 22:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483747;
 bh=1JONFQvlJ4ztdQKRMCgvxbAm0vyafQXEy0jtAPYXM0Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nu+wlemyQUehfNW8rGM5zNmvfGNPaWQiJtf8vqW5VQluBIMjAC3aqt015dlzUi90L
 uIxZb0BC1D+lYa0+1Bf0Y0vIVOBTMcQG6D1IGxUdCBfN51CsDh0Ugzrxa0RhN3H9WJ
 h3+6i2/A265710AWVJro+Fr/7fheJ3Zm2505CUTYQzNG10Jt/aZvOPF97D1fc2LRGg
 8FskH9ny7HWPKrXp/v2u2Vp4JaFHEwz8mJK4w+9x69To9fXRIpEFJwZMf4AqfsrLXw
 JVqaag0bTvWxgkPtD8hWFPuxeD1xxAGVa1rfdKxDpP7zQJs+WGFbkwdpFxhfHWbH/l
 8bPMvu3p2gv4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leon Huang <Leon.Huang1@amd.com>, Robin Chen <robin.chen@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, wenjing.liu@amd.com,
 zaeem.mohamed@amd.com, anthony.koo@amd.com, Kaitlyn.Tse@amd.com,
 joshua.aberback@amd.com, alex.hung@amd.com, Sungjoon.Kim@amd.com,
 muyuan.yang@amd.com, michael.strauss@amd.com, xi.liu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 198/642] drm/amd/display: Fix incorrect DPCD
 configs while Replay/PSR switch
Date: Mon,  5 May 2025 18:06:54 -0400
Message-Id: <20250505221419.2672473-198-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Leon Huang <Leon.Huang1@amd.com>

[ Upstream commit 0d9cabc8f591ea1cd97c071b853b75b155c13259 ]

[Why]
When switching between PSR/Replay,
the DPCD config of previous mode is not cleared,
resulting in unexpected behavior in TCON.

[How]
Initialize the DPCD in setup function

Reviewed-by: Robin Chen <robin.chen@amd.com>
Signed-off-by: Leon Huang <Leon.Huang1@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../link/protocols/link_edp_panel_control.c   | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
index e0e3bb8653595..1e4adbc764ea6 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
@@ -675,6 +675,18 @@ bool edp_setup_psr(struct dc_link *link,
 	if (!link)
 		return false;
 
+	//Clear PSR cfg
+	memset(&psr_configuration, 0, sizeof(psr_configuration));
+	dm_helpers_dp_write_dpcd(
+		link->ctx,
+		link,
+		DP_PSR_EN_CFG,
+		&psr_configuration.raw,
+		sizeof(psr_configuration.raw));
+
+	if (link->psr_settings.psr_version == DC_PSR_VERSION_UNSUPPORTED)
+		return false;
+
 	dc = link->ctx->dc;
 	dmcu = dc->res_pool->dmcu;
 	psr = dc->res_pool->psr;
@@ -685,9 +697,6 @@ bool edp_setup_psr(struct dc_link *link,
 	if (!dc_get_edp_link_panel_inst(dc, link, &panel_inst))
 		return false;
 
-
-	memset(&psr_configuration, 0, sizeof(psr_configuration));
-
 	psr_configuration.bits.ENABLE                    = 1;
 	psr_configuration.bits.CRC_VERIFICATION          = 1;
 	psr_configuration.bits.FRAME_CAPTURE_INDICATION  =
@@ -950,6 +959,16 @@ bool edp_setup_replay(struct dc_link *link, const struct dc_stream_state *stream
 	if (!link)
 		return false;
 
+	//Clear Replay config
+	dm_helpers_dp_write_dpcd(link->ctx, link,
+		DP_SINK_PR_ENABLE_AND_CONFIGURATION,
+		(uint8_t *)&(replay_config.raw), sizeof(uint8_t));
+
+	if (!(link->replay_settings.config.replay_supported))
+		return false;
+
+	link->replay_settings.config.replay_error_status.raw = 0;
+
 	dc = link->ctx->dc;
 
 	replay = dc->res_pool->replay;
-- 
2.39.5

