Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22BF75E612
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409B010E21D;
	Mon, 24 Jul 2023 01:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B24F10E21D;
 Mon, 24 Jul 2023 01:14:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA6FD60F02;
 Mon, 24 Jul 2023 01:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2D3C433CA;
 Mon, 24 Jul 2023 01:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161263;
 bh=YuokKDlXdvuV5EM7iySVhVFhKWEFLeLpIW9GIrZ1Y0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nC+Y5hS0JHZaYj5cWry4daABywImrh/qiE6GiVRxGY5mpidvfaHDAaQxcv+ch9Sq+
 A/S5h9iBvequDtxWdbcGZ6pyp3Zjhbu7rt1mWi4rKywpjlUPxJRLwd3ryaUxZ0hki4
 nI/fdlXVsNPb3b8ac52xhPX2RQj2CjfTMP54yNaN4GtknZU5eq9YWUJEYU2knbEa2Y
 PoUaVMmauB5bC17jlhrUlVZolc+qDvDzghoIjp6krLMk20/9O5xmx//SvQgE+54C4q
 Wgp3Pa8ni/dRk3j+rEUM43+wjIhLTXspqtVkEkwCwQZYZzAON6WEWqF2BQ/sW/AM6v
 wBJUCfZZM6bgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 08/58] Revert "drm/amd/display: disable SubVP +
 DRR to prevent underflow"
Date: Sun, 23 Jul 2023 21:12:36 -0400
Message-Id: <20230724011338.2298062-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
Cc: rdunlap@infradead.org, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 hamza.mahfooz@amd.com, Jun.Lei@amd.com, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Nevenko.Stupar@amd.com, Alvin.Lee2@amd.com, George.Shen@amd.com,
 stylon.wang@amd.com, srinivasan.shanmugam@amd.com, sunpeng.li@amd.com,
 shiwu.zhang@amd.com, hdegoede@redhat.com, hersenxs.wu@amd.com,
 Dillon.Varone@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 wayne.lin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit f38129bb081758176dd78304faaee95007fb8838 ]

This reverts commit 80c6d6804f31451848a3956a70c2bcb1f07cfcb0.
The orignal commit was intended as a workaround to prevent underflow and
flickering when using one normal monitor and the other high refresh rate
monitor (> 120Hz).

This patch is being reverted in favour of a software solution to enable
SubVP+DRR

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 5 -----
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 4 ----
 drivers/gpu/drm/amd/include/amd_shared.h             | 1 -
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7acd73e5004fb..80756c7b92a54 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1646,11 +1646,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	if (amdgpu_dc_feature_mask & DC_DISABLE_LTTPR_DP2_0)
 		init_data.flags.allow_lttpr_non_transparent_mode.bits.DP2_0 = true;
 
-	/* Disable SubVP + DRR config by default */
-	init_data.flags.disable_subvp_drr = true;
-	if (amdgpu_dc_feature_mask & DC_ENABLE_SUBVP_DRR)
-		init_data.flags.disable_subvp_drr = false;
-
 	init_data.flags.seamless_boot_edp_requested = false;
 
 	if (check_seamless_boot_capability(adev)) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 0c4c3208def17..d7eca24bd09d2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -880,10 +880,6 @@ static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struc
 	int16_t stretched_drr_us = 0;
 	int16_t drr_stretched_vblank_us = 0;
 	int16_t max_vblank_mallregion = 0;
-	const struct dc_config *config = &dc->config;
-
-	if (config->disable_subvp_drr)
-		return false;
 
 	// Find SubVP pipe
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index e4a22c68517d1..f175e65b853a0 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -240,7 +240,6 @@ enum DC_FEATURE_MASK {
 	DC_DISABLE_LTTPR_DP2_0 = (1 << 6), //0x40, disabled by default
 	DC_PSR_ALLOW_SMU_OPT = (1 << 7), //0x80, disabled by default
 	DC_PSR_ALLOW_MULTI_DISP_OPT = (1 << 8), //0x100, disabled by default
-	DC_ENABLE_SUBVP_DRR = (1 << 9), // 0x200, disabled by default
 };
 
 enum DC_DEBUG_MASK {
-- 
2.39.2

