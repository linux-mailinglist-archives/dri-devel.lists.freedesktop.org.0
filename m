Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF8AAA1DD
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D6810E56C;
	Mon,  5 May 2025 22:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PsQoHDRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEB510E573;
 Mon,  5 May 2025 22:52:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 390095C5A99;
 Mon,  5 May 2025 22:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE558C4CEEF;
 Mon,  5 May 2025 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485555;
 bh=ywQc+q+7aIhTjqr3vp96We4Fj/UP2c1vhX0+GicUBbQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PsQoHDRIxlmPpjcAjgM5Zc1XWK/L2AAXfz9DGNz9uym4vYuVKsZr5TMh4JDQWajpy
 j07qElSv1QukkrmX0bFv1LSYtCjyKsiMhu3wgiGpxaEx1mf1ix06Y/ZOYi8FHw3s6f
 PwtMIFhtqIclu56iGwWGsQ7WJqa4izdhQAEBSlxo/gCZmOwMWdYtJvpPHait93D9f0
 ayYLv6h8plZdwWxlaXTSTrTrBotz2brGJnqNPO4Nj4rECqW3x9j52eCubmZAARiy4C
 mzBtf/CXka2mzugfxN0jsXizG98qfThSPIagoBqZNuiBBRmIsx8Bkd6UQgg9a/9Zjk
 Ik+sb0dun73GA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Martin Tsai <Martin.Tsai@amd.com>, Anthony Koo <anthony.koo@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dennis.chan@amd.com, robin.chen@amd.com, mwen@igalia.com,
 Kaitlyn.Tse@amd.com, george.shen@amd.com, Wayne.Lin@amd.com,
 Gabe.Teeger@amd.com, Cruise.Hung@amd.com, Ovidiu.Bunea@amd.com,
 wenjing.liu@amd.com, Zhongwei.Zhang@amd.com, chiahsuan.chung@amd.com,
 duncan.ma@amd.com, jack.chang@amd.com, zaeem.mohamed@amd.com,
 nicholas.kazlauskas@amd.com, Syed.Hassan@amd.com, dillon.varone@amd.com,
 aric.cyr@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 367/486] drm/amd/display: Support multiple
 options during psr entry.
Date: Mon,  5 May 2025 18:37:23 -0400
Message-Id: <20250505223922.2682012-367-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Martin Tsai <Martin.Tsai@amd.com>

[ Upstream commit 3a5fa55455db6a11248a25f24570c365f9246144 ]

[WHY]
Some panels may not handle idle pattern properly during PSR entry.

[HOW]
Add a condition to allow multiple options on power down
sequence during PSR1 entry.

Reviewed-by: Anthony Koo <anthony.koo@amd.com>
Signed-off-by: Martin Tsai <Martin.Tsai@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_types.h       | 7 +++++++
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c   | 4 ++++
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index c8bdbbba44ef9..1aca9e96c474f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -1009,6 +1009,13 @@ struct psr_settings {
 	unsigned int psr_sdp_transmit_line_num_deadline;
 	uint8_t force_ffu_mode;
 	unsigned int psr_power_opt;
+
+	/**
+	 * Some panels cannot handle idle pattern during PSR entry.
+	 * To power down phy before disable stream to avoid sending
+	 * idle pattern.
+	 */
+	uint8_t power_down_phy_before_disable_stream;
 };
 
 enum replay_coasting_vtotal_type {
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index cae18f8c1c9a0..8821153d0ac3b 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -419,6 +419,10 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
 	copy_settings_data->relock_delay_frame_cnt = 0;
 	if (link->dpcd_caps.sink_dev_id == DP_BRANCH_DEVICE_ID_001CF8)
 		copy_settings_data->relock_delay_frame_cnt = 2;
+
+	copy_settings_data->power_down_phy_before_disable_stream =
+		link->psr_settings.power_down_phy_before_disable_stream;
+
 	copy_settings_data->dsc_slice_height = psr_context->dsc_slice_height;
 
 	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 7835100b37c41..d743368303682 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -2869,6 +2869,12 @@ struct dmub_cmd_psr_copy_settings_data {
 	 * Some panels request main link off before xth vertical line
 	 */
 	uint16_t poweroff_before_vertical_line;
+	/**
+	 * Some panels cannot handle idle pattern during PSR entry.
+	 * To power down phy before disable stream to avoid sending
+	 * idle pattern.
+	 */
+	uint8_t power_down_phy_before_disable_stream;
 };
 
 /**
-- 
2.39.5

