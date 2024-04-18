Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1909D8A9511
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 10:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E0410FE89;
	Thu, 18 Apr 2024 08:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gpk2Fa2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E71810FE89;
 Thu, 18 Apr 2024 08:34:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1965DCE16A8;
 Thu, 18 Apr 2024 08:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198FBC113CC;
 Thu, 18 Apr 2024 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713429269;
 bh=foTuupios4Tf2RFReAr+18DI+jVKcX1qxJXzRW7VmzA=;
 h=From:To:Cc:Subject:Date:From;
 b=gpk2Fa2WhrJS/XHTk0xJX4e/AB2edk0Rev0P8fLFaA07EOUUxNIIjgW5mw4ucF0kA
 2mA7wog3Kwh07RqwUso84ur5Gv48FRy/bF0IjyeAXRExODqVr3R3mRynqaIPdDLWNZ
 0BsgEl751JT5/QTDC8to6OoPMP824P57Cwq4dX6dygrmTSpaeeOxZ0oSQ2pmph3So+
 heG2eWv6stEPXU0R/FCmgazYyiYBVWqjH9VS7jravHSHk5vn2Otf2r5reUshF/DyQc
 9FyNMhjP/NbVg1uck/EMbRbAkPo4ZDLJ5CPg8+OvhmZe9wAmGcs08lRnSfSI7uiVwr
 ftAlhjyLpR8hg==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wenjing Liu <wenjing.liu@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Jun Lei <jun.lei@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Samson Tam <samson.tam@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Roman Li <roman.li@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Joshua Aberback <joshua.aberback@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/amd/display: dynamically allocate
 dml2_configuration_options structures
Date: Thu, 18 Apr 2024 10:34:02 +0200
Message-Id: <20240418083421.3956461-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

This structure is too large to fit on a stack, as shown by the
newly introduced warnings from a recent code change:

drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource.c: In function 'dcn32_update_bw_bounding_box':
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource.c:2019:1: error: the frame size of 1180 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn321/dcn321_resource.c: In function 'dcn321_update_bw_bounding_box':
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn321/dcn321_resource.c:1597:1: error: the frame size of 1180 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c: In function 'dc_state_create':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.c:219:1: error: the frame size of 1184 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

Instead of open-coding the assignment of a large structure to a stack
variable, use an explicit kmemdup() in each case to move it off the stack.

Fixes: e779f4587f61 ("drm/amd/display: Add handling for DC power mode")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../display/dc/resource/dcn32/dcn32_resource.c   | 16 +++++++++++-----
 .../display/dc/resource/dcn321/dcn321_resource.c | 16 +++++++++++-----
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index c16e915686fc..b2b95f5abb09 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -2001,21 +2001,27 @@ void dcn32_calculate_wm_and_dlg(struct dc *dc, struct dc_state *context,
 
 static void dcn32_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
-	struct dml2_configuration_options dml2_opt = dc->dml2_options;
+	struct dml2_configuration_options *dml2_opt;
+
+	dml2_opt = kmemdup(&dc->dml2_options, sizeof(dc->dml2_options), GFP_KERNEL);
+	if (!dml2_opt)
+		return;
 
 	DC_FP_START();
 
 	dcn32_update_bw_bounding_box_fpu(dc, bw_params);
 
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
 
 static struct resource_funcs dcn32_res_pool_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 3816678b044f..ea5768f57138 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1579,21 +1579,27 @@ static struct dc_cap_funcs cap_funcs = {
 
 static void dcn321_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
-	struct dml2_configuration_options dml2_opt = dc->dml2_options;
+	struct dml2_configuration_options *dml2_opt;
+
+	dml2_opt = kmemdup(&dc->dml2_options, sizeof(dc->dml2_options), GFP_KERNEL);
+	if (!dml2_opt)
+		return;
 
 	DC_FP_START();
 
 	dcn321_update_bw_bounding_box_fpu(dc, bw_params);
 
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
 
 static struct resource_funcs dcn321_res_pool_funcs = {
-- 
2.39.2

