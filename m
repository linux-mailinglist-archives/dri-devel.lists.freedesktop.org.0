Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39257891969
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4C51126C5;
	Fri, 29 Mar 2024 12:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UUQ7IkyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA81126D9;
 Fri, 29 Mar 2024 12:40:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 356C9CE2F80;
 Fri, 29 Mar 2024 12:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A00EC433F1;
 Fri, 29 Mar 2024 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711716041;
 bh=wezMdMVsg0c5lGGsH+bSRvYDmZOD2+E4d+LTpbyaKf0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UUQ7IkyHKg8Ia6K4Bp2Oqos2yi0MnJJo5fb87cNABMyoIeewkdg/4Hj5LQ7dbdCmR
 p9PY4l5qJqQYBgx5BO0PwqRqFXdUBGiFTXfDFGztcnEPOu3gwlh4i3ozmytWyP/X2i
 yANaIgJGpXExWRxMni4Kme+DRjg/I6EjQ5hZTlovhqU1Mn7EanX3aCPtMLqm9oYpvW
 IG+pp8EhlQom6EFz0mHFbgsHU9957/BPq5x18YSVtqn7LXHQvLA11hTZBqvOsgzLBt
 3UhQWCBgtcyxHvwCo2B4jhlBNKjfDqKh4Xd/g/npGSD6LlUZh2IatI/R5BrAlJPQ8R
 CVz6GtkHOzagQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Ovidiu Bunea <ovidiu.bunea@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, aric.cyr@amd.com, jun.lei@amd.com, alvin.lee2@amd.com,
 Qingqing.Zhuo@amd.com, chiahsuan.chung@amd.com, george.shen@amd.com,
 dillon.varone@amd.com, wayne.lin@amd.com, duncan.ma@amd.com,
 samson.tam@amd.com, srinivasan.shanmugam@amd.com, jinze.xu@amd.com,
 Josip.Pavic@amd.com, cruise.hung@amd.com, charlene.liu@amd.com,
 ahmed.ahmed@amd.com, wenjing.liu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 24/98] drm/amd/display: Disable idle reallow as
 part of command/gpint execution
Date: Fri, 29 Mar 2024 08:36:55 -0400
Message-ID: <20240329123919.3087149-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123919.3087149-1-sashal@kernel.org>
References: <20240329123919.3087149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
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

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 6226a5aa77370329e01ee8abe50a95e60618ce97 ]

[Why]
Workaroud for a race condition where DMCUB is in the process of
committing to IPS1 during the handshake causing us to miss the
transition into IPS2 and touch the INBOX1 RPTR causing a HW hang.

[How]
Disable the reallow to ensure that we have enough of a gap between entry
and exit and we're not seeing back-to-back wake_and_executes.

Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc.h                           | 1 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c                  | 4 ++--
 .../gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c    | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index c9317ea0258ea..b46c894672b60 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -987,6 +987,7 @@ struct dc_debug_options {
 	bool psp_disabled_wa;
 	unsigned int ips2_eval_delay_us;
 	unsigned int ips2_entry_delay_us;
+	bool disable_dmub_reallow_idle;
 	bool disable_timeout;
 	bool disable_extblankadj;
 	unsigned int static_screen_wait_frames;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 363d522603a21..9084b320849a6 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -1364,7 +1364,7 @@ bool dc_wake_and_execute_dmub_cmd_list(const struct dc_context *ctx, unsigned in
 	else
 		result = dm_execute_dmub_cmd(ctx, cmd, wait_type);
 
-	if (result && reallow_idle)
+	if (result && reallow_idle && !ctx->dc->debug.disable_dmub_reallow_idle)
 		dc_dmub_srv_apply_idle_power_optimizations(ctx->dc, true);
 
 	return result;
@@ -1413,7 +1413,7 @@ bool dc_wake_and_execute_gpint(const struct dc_context *ctx, enum dmub_gpint_com
 
 	result = dc_dmub_execute_gpint(ctx, command_code, param, response, wait_type);
 
-	if (result && reallow_idle)
+	if (result && reallow_idle && !ctx->dc->debug.disable_dmub_reallow_idle)
 		dc_dmub_srv_apply_idle_power_optimizations(ctx->dc, true);
 
 	return result;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 5fdcda8f86026..ff17fce44eb1d 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -782,6 +782,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.psp_disabled_wa = true,
 	.ips2_eval_delay_us = 2000,
 	.ips2_entry_delay_us = 800,
+	.disable_dmub_reallow_idle = true,
 	.static_screen_wait_frames = 2,
 };
 
-- 
2.43.0

