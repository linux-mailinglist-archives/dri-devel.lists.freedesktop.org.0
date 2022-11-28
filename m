Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096D363AF43
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 18:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D08710E30E;
	Mon, 28 Nov 2022 17:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CC210E30E;
 Mon, 28 Nov 2022 17:40:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48A0E612E9;
 Mon, 28 Nov 2022 17:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331ABC433D6;
 Mon, 28 Nov 2022 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657212;
 bh=11IYdSDU8ELMrE/5V/1SnEzjOh5sOIs/OJ+i9hIbrMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NRhSYwjGBMFJ2S2/RWCODOnzDvVlbCR9NrMxECHowS2Ax8f/I5zIggxRmU1gStKyE
 6W7oYCSUB72oViGKqIhsD1ekK0w07Jqr3RS5MizfQ63nzxhSVhqikFY/RlU1PufraN
 KtAUrzPDUMtgVHNzg6ah/09r9bt9ZHy4mpkVngFDNds+QojbU4xY3qv4/q6sf9Lye3
 Y4KLuoDpwLEQuNi639G/J3yTQO3pE38KNrk4+cHujnx7XkXSbZv34/lH+yezND54+V
 nEha4BruTEMX49sPucUJ8mjWX6n8JiIBBwrEaLRehHoFJi+Jn5Cy2LWacDr6uf83fS
 FDk2XJ1N2dAdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 37/39] drm/amd/display: Avoid setting pixel rate
 divider to N/A
Date: Mon, 28 Nov 2022 12:36:17 -0500
Message-Id: <20221128173642.1441232-37-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128173642.1441232-1-sashal@kernel.org>
References: <20221128173642.1441232-1-sashal@kernel.org>
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
Cc: Samson.Tam@amd.com, Jun.Lei@amd.com, Sasha Levin <sashal@kernel.org>,
 Brian Chang <Brian.Chang@amd.com>, Rodrigo.Siqueira@amd.com,
 Taimur Hassan <Syed.Hassan@amd.com>, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, michael.strauss@amd.com, Alvin.Lee2@amd.com,
 jdhillon@amd.com, eric.bernstein@amd.com, andrealmeid@igalia.com,
 sunpeng.li@amd.com, george.shen@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Martin.Leung@amd.com, Daniel.Miess@amd.com, chris.park@amd.com,
 chiahsuan.chung@amd.com, Xinhui.Pan@amd.com, roman.li@amd.com,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Taimur Hassan <Syed.Hassan@amd.com>

[ Upstream commit 2a5dd86a69ea5435f1a837bdb7fafcda609a7c91 ]

[Why]
Pixel rate divider values should never be set to N/A (0xF) as the K1/K2
field is only 1/2 bits wide.

[How]
Set valid divider values for virtual and FRL/DP2 cases.

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Brian Chang <Brian.Chang@amd.com>
Signed-off-by: Taimur Hassan <Syed.Hassan@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c  | 7 +++++++
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c | 3 ++-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c    | 4 +++-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c   | 1 +
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
index fb729674953b..de9fa534b77a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
@@ -96,6 +96,13 @@ static void dccg314_set_pixel_rate_div(
 	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
 	enum pixel_rate_div cur_k1 = PIXEL_RATE_DIV_NA, cur_k2 = PIXEL_RATE_DIV_NA;
 
+	// Don't program 0xF into the register field. Not valid since
+	// K1 / K2 field is only 1 / 2 bits wide
+	if (k1 == PIXEL_RATE_DIV_NA || k2 == PIXEL_RATE_DIV_NA) {
+		BREAK_TO_DEBUGGER();
+		return;
+	}
+
 	dccg314_get_pixel_rate_div(dccg, otg_inst, &cur_k1, &cur_k2);
 	if (k1 == PIXEL_RATE_DIV_NA || k2 == PIXEL_RATE_DIV_NA || (k1 == cur_k1 && k2 == cur_k2))
 		return;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
index f4d1b83979fe..a0741794db62 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
@@ -349,6 +349,7 @@ unsigned int dcn314_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsig
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
 
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
+		*k1_div = PIXEL_RATE_DIV_BY_1;
 		*k2_div = PIXEL_RATE_DIV_BY_1;
 	} else if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal) || dc_is_dvi_signal(pipe_ctx->stream->signal)) {
 		*k1_div = PIXEL_RATE_DIV_BY_1;
@@ -356,7 +357,7 @@ unsigned int dcn314_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsig
 			*k2_div = PIXEL_RATE_DIV_BY_2;
 		else
 			*k2_div = PIXEL_RATE_DIV_BY_4;
-	} else if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
+	} else if (dc_is_dp_signal(pipe_ctx->stream->signal) || dc_is_virtual_signal(pipe_ctx->stream->signal)) {
 		if (two_pix_per_container) {
 			*k1_div = PIXEL_RATE_DIV_BY_1;
 			*k2_div = PIXEL_RATE_DIV_BY_2;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
index 6640d0ac4304..6dd8dadd68a5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
@@ -96,8 +96,10 @@ static void dccg32_set_pixel_rate_div(
 
 	// Don't program 0xF into the register field. Not valid since
 	// K1 / K2 field is only 1 / 2 bits wide
-	if (k1 == PIXEL_RATE_DIV_NA || k2 == PIXEL_RATE_DIV_NA)
+	if (k1 == PIXEL_RATE_DIV_NA || k2 == PIXEL_RATE_DIV_NA) {
+		BREAK_TO_DEBUGGER();
 		return;
+	}
 
 	dccg32_get_pixel_rate_div(dccg, otg_inst, &cur_k1, &cur_k2);
 	if (k1 == cur_k1 && k2 == cur_k2)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index c72166e096ba..ecdb730f2e96 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -1186,6 +1186,7 @@ unsigned int dcn32_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsign
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
 
 	if (is_dp_128b_132b_signal(pipe_ctx)) {
+		*k1_div = PIXEL_RATE_DIV_BY_1;
 		*k2_div = PIXEL_RATE_DIV_BY_1;
 	} else if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal) || dc_is_dvi_signal(pipe_ctx->stream->signal)) {
 		*k1_div = PIXEL_RATE_DIV_BY_1;
-- 
2.35.1

