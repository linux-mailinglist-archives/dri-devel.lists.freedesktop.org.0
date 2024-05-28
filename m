Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489038D1A4F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437CD10E496;
	Tue, 28 May 2024 11:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D03AwHuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865D910E5E8;
 Tue, 28 May 2024 11:52:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 88EDDCE11AB;
 Tue, 28 May 2024 11:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F68C32782;
 Tue, 28 May 2024 11:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716897159;
 bh=c6HLmHQgr+K+/opF/OiiYVpCKahYXfgVPr1CgHqBTgk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D03AwHuDsKvcUkDlecqDtEPZZhMjTaMFd/0vPhG4U2wi15wGBBRYxi+a50oIIBAD3
 kKAzYiBT1/iSoy4fgo1HuQYlVrjGJRadJCOGeXHrEpHjmtG5x2+kEt/49Zn++EPv+4
 yeyFdAE0FhAbD49JWO4q62bg33zoI0vP/C8pwYSFZ30Fh2GsOjzJTbRobGkohqR5rr
 +m1pqpaXPIfHzUI95y9nwRik70fTPhQk/0KhuQAFuk92y8DNShIWo2NiRIKgACLAsd
 nq64oSyxXi+S9t5Pd+97UwuemMAMEJYbXLnE1eMhYtqw+0vuS/pjB9/noBCtL5TtS4
 XbAPM52H58fyQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dillon Varone <dillon.varone@amd.com>,
 Alex Hung <alex.hung@amd.com>, Chaitanya Dhere <chaitanya.dhere@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Joshua Aberback <joshua.aberback@amd.com>,
 Charlene Liu <charlene.liu@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/amd/display: avoid large on-stack structures
Date: Tue, 28 May 2024 13:51:20 +0200
Message-Id: <20240528115146.2870032-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528115146.2870032-1-arnd@kernel.org>
References: <20240528115146.2870032-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Putting excessively large objects on a function stack causes
a warning about possibly overflowing the 8KiB of kernel stack:

drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.c: In function 'dcn401_update_bw_bounding_box':
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.c:1599:1: error: the frame size of 1196 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
 1599 | }
      | ^
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c: In function 'dc_state_create':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:221:1: error: the frame size of 1196 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
  221 | }
      | ^

Use dynamic allocation instead.

Fixes: e779f4587f61 ("drm/amd/display: Add handling for DC power mode")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/core/dc_state.c   | 16 +++++++++++-----
 .../display/dc/resource/dcn401/dcn401_resource.c | 16 +++++++++++-----
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index 70928223b642..8ea9391c60b7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -193,7 +193,11 @@ static void init_state(struct dc *dc, struct dc_state *state)
 struct dc_state *dc_state_create(struct dc *dc, struct dc_state_create_params *params)
 {
 #ifdef CONFIG_DRM_AMD_DC_FP
-	struct dml2_configuration_options dml2_opt = dc->dml2_options;
+	struct dml2_configuration_options *dml2_opt;
+
+	dml2_opt = kmemdup(&dc->dml2_options, sizeof(*dml2_opt), GFP_KERNEL);
+	if (!dml2_opt)
+		return NULL;
 #endif
 	struct dc_state *state = kvzalloc(sizeof(struct dc_state),
 			GFP_KERNEL);
@@ -207,12 +211,14 @@ struct dc_state *dc_state_create(struct dc *dc, struct dc_state_create_params *p
 
 #ifdef CONFIG_DRM_AMD_DC_FP
 	if (dc->debug.using_dml2) {
-		dml2_opt.use_clock_dc_limits = false;
-		dml2_create(dc, &dml2_opt, &state->bw_ctx.dml2);
+		dml2_opt->use_clock_dc_limits = false;
+		dml2_create(dc, dml2_opt, &state->bw_ctx.dml2);
 
-		dml2_opt.use_clock_dc_limits = true;
-		dml2_create(dc, &dml2_opt, &state->bw_ctx.dml2_dc_power_source);
+		dml2_opt->use_clock_dc_limits = true;
+		dml2_create(dc, dml2_opt, &state->bw_ctx.dml2_dc_power_source);
 	}
+
+	kfree(dml2_opt);
 #endif
 
 	kref_init(&state->refcount);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 247bac177d1b..8dfb0a3d21cb 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1581,21 +1581,27 @@ static struct dc_cap_funcs cap_funcs = {
 
 static void dcn401_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
-	struct dml2_configuration_options dml2_opt = dc->dml2_options;
+	struct dml2_configuration_options *dml2_opt;
+
+	dml2_opt = kmemdup(&dc->dml2_options, sizeof(*dml2_opt), GFP_KERNEL);
+	if (!dml2_opt)
+		return;
 
 	DC_FP_START();
 
 	dcn401_update_bw_bounding_box_fpu(dc, bw_params);
 
-	dml2_opt.use_clock_dc_limits = false;
+	dml2_opt->use_clock_dc_limits = false;
 	if (dc->debug.using_dml2 && dc->current_state && dc->current_state->bw_ctx.dml2)
-		dml2_reinit(dc, &dml2_opt, &dc->current_state->bw_ctx.dml2);
+		dml2_reinit(dc, dml2_opt, &dc->current_state->bw_ctx.dml2);
 
-	dml2_opt.use_clock_dc_limits = true;
+	dml2_opt->use_clock_dc_limits = true;
 	if (dc->debug.using_dml2 && dc->current_state && dc->current_state->bw_ctx.dml2_dc_power_source)
-		dml2_reinit(dc, &dml2_opt, &dc->current_state->bw_ctx.dml2_dc_power_source);
+		dml2_reinit(dc, dml2_opt, &dc->current_state->bw_ctx.dml2_dc_power_source);
 
 	DC_FP_END();
+
+	kfree(dml2_opt);
 }
 
 enum dc_status dcn401_patch_unknown_plane_state(struct dc_plane_state *plane_state)
-- 
2.39.2

