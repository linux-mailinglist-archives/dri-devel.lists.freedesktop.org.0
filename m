Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95A9858B0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEBD10E8EE;
	Wed, 25 Sep 2024 11:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fbcXC1Kw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB8410E827;
 Wed, 25 Sep 2024 11:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 144475C5846;
 Wed, 25 Sep 2024 11:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E44FC4CEC3;
 Wed, 25 Sep 2024 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264773;
 bh=hlE0qSYSzfewwyMkimkKOWLgsjezbHjR0is1R05Wqvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fbcXC1Kwd9kN/70/WyUOlM6MxWtp+w8Y/r8knktmO35TiYFg14JsKaUBx59vX025k
 dePjY3vCqvh4Y1knICBtjy/th1mBYQuDcnMFH41uW8W0bB85mX1aZ0n8aIESqjlA6I
 gezDDSHevdyjWrtXuM7QQRhE5eETd0ME7gIUpVWgPnus3zVOc9WTIqeDSHUXGTP7lS
 RIGryMjCDnekr7xtF8fXdKHZX0jseEFHZG38gQbHxjTCLhNUA7UUgVwgWt2y9swyEG
 YGw/PihFR9aHfGnWWF6ya5aMea1TSGOE8bBx5hf6R937jLUZEr+Lth6nDsmZ90iZmD
 a5zYvwlrWL//g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Sa <Daniel.Sa@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, sarvinde@amd.com,
 nevenko.stupar@amd.com, wenjing.liu@amd.com, aurabindo.pillai@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 150/244] drm/amd/display: Underflow Seen on
 DCN401 eGPU
Date: Wed, 25 Sep 2024 07:26:11 -0400
Message-ID: <20240925113641.1297102-150-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Daniel Sa <Daniel.Sa@amd.com>

[ Upstream commit ca0fb243c3bb53dbbd71d16c76f319bf923ee3d4 ]

[WHY]
In dcn401 we read clock values before FW is loaded. These incorrect
values cause the driver to believe that we are running higher clocks
than what we actually have. This then causes corruption/underflow for
the eGPU.

[HOW]
When new values are read from HW, update internal structures to
propagate the new/correct value. Fixes issue

Signed-off-by: Daniel Sa <Daniel.Sa@amd.com>
Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 324e77ceaf1cf..537a24ec74c85 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -221,6 +221,7 @@ void dcn401_init_hw(struct dc *dc)
 	int edp_num;
 	uint32_t backlight = MAX_BACKLIGHT_LEVEL;
 	uint32_t user_level = MAX_BACKLIGHT_LEVEL;
+	int current_dchub_ref_freq = 0;
 
 	if (dc->clk_mgr && dc->clk_mgr->funcs && dc->clk_mgr->funcs->init_clocks) {
 		dc->clk_mgr->funcs->init_clocks(dc->clk_mgr);
@@ -264,6 +265,8 @@ void dcn401_init_hw(struct dc *dc)
 					dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency,
 					&res_pool->ref_clocks.dccg_ref_clock_inKhz);
 
+			current_dchub_ref_freq = res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000;
+
 			(res_pool->hubbub->funcs->get_dchub_ref_freq)(res_pool->hubbub,
 					res_pool->ref_clocks.dccg_ref_clock_inKhz,
 					&res_pool->ref_clocks.dchub_ref_clock_inKhz);
@@ -436,8 +439,9 @@ void dcn401_init_hw(struct dc *dc)
 		dc->caps.dmub_caps.mclk_sw = dc->ctx->dmub_srv->dmub->feature_caps.fw_assisted_mclk_switch_ver > 0;
 		dc->caps.dmub_caps.fams_ver = dc->ctx->dmub_srv->dmub->feature_caps.fw_assisted_mclk_switch_ver;
 		dc->debug.fams2_config.bits.enable &= dc->ctx->dmub_srv->dmub->feature_caps.fw_assisted_mclk_switch_ver == 2;
-		if (!dc->debug.fams2_config.bits.enable && dc->res_pool->funcs->update_bw_bounding_box) {
-			/* update bounding box if FAMS2 disabled */
+		if ((!dc->debug.fams2_config.bits.enable && dc->res_pool->funcs->update_bw_bounding_box)
+			|| res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000 != current_dchub_ref_freq) {
+			/* update bounding box if FAMS2 disabled, or if dchub clk has changed */
 			if (dc->clk_mgr)
 				dc->res_pool->funcs->update_bw_bounding_box(dc,
 									    dc->clk_mgr->bw_params);
-- 
2.43.0

