Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C34BAAA03C
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDAF10E4C1;
	Mon,  5 May 2025 22:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hIrYgpn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB82B10E4C0;
 Mon,  5 May 2025 22:32:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 146AC5C5529;
 Mon,  5 May 2025 22:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ED2C4CEEE;
 Mon,  5 May 2025 22:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484369;
 bh=WhObNx/UgZPNUHn7lDsfgoqh+dAqU8HeTGp0/MvtNw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hIrYgpn7e2T/pwk5T3pzG4TB/h6Vdd3f/y1XmN38OmFal92vku3kuBjQGb0X8XBnK
 cqmUsqCicouOcVQ0OZrYaWCcZejSNPM6y7HKIvHmWCV4ZRaBtdC2Ctx+TVSwqfcGSU
 5zg4Lx/i36PRBP5UGN1pOxvSvR1R9NzFwPb8yF9usQed4Ash1YWJWA7YfwY1ghNYfh
 4JDUdBEGW+PMn9uvAZZb7ozCyVuGSKI6Nafd+YDMwfl2tjOqgPVngcZ4jW2AGh8jA+
 FH5CJRGOKXNE7YRXXf4XOJ9m+xtc0ZCCpNUMPVlNNqzbybL3VJVbLWL0hIaHIIkLHx
 6Intd4HrAWxXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Martin Tsai <Martin.Tsai@amd.com>, Anthony Koo <anthony.koo@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 aurabindo.pillai@amd.com, dennis.chan@amd.com, mwen@igalia.com,
 Kaitlyn.Tse@amd.com, george.shen@amd.com, Wayne.Lin@amd.com,
 Gabe.Teeger@amd.com, Cruise.Hung@amd.com, jack.chang@amd.com,
 jerry.zuo@amd.com, zaeem.mohamed@amd.com, duncan.ma@amd.com,
 Zhongwei.Zhang@amd.com, chiahsuan.chung@amd.com,
 nicholas.kazlauskas@amd.com, Syed.Hassan@amd.com, dillon.varone@amd.com,
 aric.cyr@amd.com, Ovidiu.Bunea@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 466/642] drm/amd/display: Support multiple
 options during psr entry.
Date: Mon,  5 May 2025 18:11:22 -0400
Message-Id: <20250505221419.2672473-466-sashal@kernel.org>
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
index 0c2aa91f0a111..e60898c2df01a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -1033,6 +1033,13 @@ struct psr_settings {
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
index 88c75c243bf8a..ff3b8244ba3d0 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -418,6 +418,10 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
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
index d0fe324cb5371..8cf89aed024b7 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -3118,6 +3118,12 @@ struct dmub_cmd_psr_copy_settings_data {
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

