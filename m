Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A175E680
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F0E10E233;
	Mon, 24 Jul 2023 01:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8302410E232;
 Mon, 24 Jul 2023 01:20:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A06D60DFE;
 Mon, 24 Jul 2023 01:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF889C433C7;
 Mon, 24 Jul 2023 01:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161640;
 bh=5gnECKCSDPru2q8MOdfXNsDZ2UETGtzkDcyY78I1eKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Otm3IVIb0E5P2SEC3OcCnXJC2SUyLkZc29oEB58NK554FNrWgvMvhx4QbPb4wYuiF
 0VFyVp/HA1maTpBSnNk6bk/6jXt6vt1qk6+TFuf30pCsSzG6wqbPhzrgUc7yj1rlJJ
 kC6bZCuYaUWIAoCV5h09U94z5+DyuI4byAHdvnDanmTL4XfMMLNxOK8Qy2CgSnVMae
 yihLdydWvVTQ5LDQ0Q39HfkFWyklEwHMsiNoHIYqJldQiXeP9L5Bnhg160WmZWzmCb
 Vu2i6jNCiN8x2GRpIZDomSRCOD3yGw+hu/TxurFJN/WSNCj8c7TViLQRyq6T5fAx7m
 mtB+gRy9N71mA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 48/58] drm/amd/display: Skip DPP DTO update if
 root clock is gated
Date: Sun, 23 Jul 2023 21:13:16 -0400
Message-Id: <20230724011338.2298062-48-sashal@kernel.org>
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
Cc: trix@redhat.com, dri-devel@lists.freedesktop.org, hamza.mahfooz@amd.com,
 syedsaaem.rizvi@amd.com, Jun Lei <jun.lei@amd.com>,
 Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 Rodrigo.Siqueira@amd.com, Syed.Hassan@amd.com, amd-gfx@lists.freedesktop.org,
 alex.hung@amd.com, michael.strauss@amd.com, jdhillon@amd.com,
 Stylon Wang <stylon.wang@amd.com>, jiapeng.chong@linux.alibaba.com,
 sunpeng.li@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 daniel.miess@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 30f90f3c1c2c63c2fa44f61233737d27b72637c2 ]

[Why]
Hardware implements root clock gating by utilizing the DPP DTO registers
with a special case of DTO enabled, phase = 0, modulo = 1. This
conflicts with our policy to always update the DPPDTO for cases where
it's expected to be disabled.

The pipes unexpectedly enter a higher power state than expected because
of this programming flow.

[How]
Guard the upper layers of HWSS against this hardware quirk with
programming the register with an internal state flag in DCCG.

While technically acting as global state for the DCCG, HWSS shouldn't be
expected to understand the hardware quirk for having DTO disabled
causing more power than DTO enabled with this specific setting.

This also prevents sequencing errors from occuring in the future if
we have to program DPP DTO in multiple locations.

Acked-by: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Jun Lei <jun.lei@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c   | 8 ++++++++
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c | 5 +++++
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h        | 1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
index 4c2fdfea162f5..65c1d754e2d6b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
@@ -47,6 +47,14 @@ void dccg31_update_dpp_dto(struct dccg *dccg, int dpp_inst, int req_dppclk)
 {
 	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
 
+	if (dccg->dpp_clock_gated[dpp_inst]) {
+		/*
+		 * Do not update the DPPCLK DTO if the clock is stopped.
+		 * It is treated the same as if the pipe itself were in PG.
+		 */
+		return;
+	}
+
 	if (dccg->ref_dppclk && req_dppclk) {
 		int ref_dppclk = dccg->ref_dppclk;
 		int modulo, phase;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
index e0e7d32bb1a0e..cf23d7bc560a6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
@@ -332,6 +332,9 @@ static void dccg314_dpp_root_clock_control(
 {
 	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
 
+	if (dccg->dpp_clock_gated[dpp_inst] == clock_on)
+		return;
+
 	if (clock_on) {
 		/* turn off the DTO and leave phase/modulo at max */
 		REG_UPDATE(DPPCLK_DTO_CTRL, DPPCLK_DTO_ENABLE[dpp_inst], 0);
@@ -345,6 +348,8 @@ static void dccg314_dpp_root_clock_control(
 			  DPPCLK0_DTO_PHASE, 0,
 			  DPPCLK0_DTO_MODULO, 1);
 	}
+
+	dccg->dpp_clock_gated[dpp_inst] = !clock_on;
 }
 
 static const struct dccg_funcs dccg314_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
index 0b700b3d7d972..8dc804bbe98bd 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
@@ -68,6 +68,7 @@ struct dccg {
 	const struct dccg_funcs *funcs;
 	int pipe_dppclk_khz[MAX_PIPES];
 	int ref_dppclk;
+	bool dpp_clock_gated[MAX_PIPES];
 	//int dtbclk_khz[MAX_PIPES];/* TODO needs to be removed */
 	//int audio_dtbclk_khz;/* TODO needs to be removed */
 	//int ref_dtbclk_khz;/* TODO needs to be removed */
-- 
2.39.2

