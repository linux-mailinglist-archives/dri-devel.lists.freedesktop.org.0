Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133EC93E621
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6432E10E215;
	Sun, 28 Jul 2024 15:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N1aRzG4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB810E20D;
 Sun, 28 Jul 2024 15:44:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8C5EACE0917;
 Sun, 28 Jul 2024 15:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3712BC116B1;
 Sun, 28 Jul 2024 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181448;
 bh=//kbkqWOWdabnFabnQMqR01tzonJaYt9e+wxnQ1B8Bg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N1aRzG4m3HmYqDuHHBF8O390u0TUwbquWv9uu9oCCsp8zO9fD3M5uttgt323mhrP4
 5OAZZzbcgxl5QHOVER+8qbt4YopqTPGuBMex1OmzJtmQVK9NwjMw8zlzqgGY+uAccX
 vJZQUlkiCBcdjt1JHafivKQTKD2GMyKnv7z1IO60/bzc44YPdMhkTuLGUT4EbNGDKK
 JCJKAZ9Eu9zy+njEJ1lwv/5GxyLfSVDBnB3Z4prJfZ4gVzU93VBrACJ3vDZ8wdbojl
 QMCMycyvvh3kbMSNh1m9TYLBJwn7XbbYouk4LHEe2VyNOOUlEPYdrUkuTgUlkfPgwl
 l5Vq2J4YfB5gg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, alex.hung@amd.com,
 Bhawanpreet.Lakha@amd.com, rdunlap@infradead.org, chiahsuan.chung@amd.com,
 srinivasan.shanmugam@amd.com, anthony.koo@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 17/34] drm/amd/display: Wake DMCUB before sending
 a command for replay feature
Date: Sun, 28 Jul 2024 11:40:41 -0400
Message-ID: <20240728154230.2046786-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

[ Upstream commit 3601a35a2e9d640233f4bc3496f7603b93f9c143 ]

[Why]
We can hang in place trying to send commands when the DMCUB isn't
powered on.

[How]
For functions that execute within a DC context or DC lock we can wrap
the direct calls to dm_execute_dmub_cmd/list with code that exits idle
power optimizations and reallows once we're done with the command
submission on success.

For DM direct submissions the DM will need to manage the enter/exit
sequencing manually.

We cannot invoke a DMCUB command directly within the DM execution helper
or we can deadlock.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
index 4f559a025cf00..f820647443d16 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
@@ -84,7 +84,7 @@ static void dmub_replay_enable(struct dmub_replay *dmub, bool enable, bool wait,
 
 	cmd.replay_enable.header.payload_bytes = sizeof(struct dmub_rb_cmd_replay_enable_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	/* Below loops 1000 x 500us = 500 ms.
 	 *  Exit REPLAY may need to wait 1-2 frames to power up. Timeout after at
@@ -127,7 +127,7 @@ static void dmub_replay_set_power_opt(struct dmub_replay *dmub, unsigned int pow
 	cmd.replay_set_power_opt.replay_set_power_opt_data.power_opt = power_opt;
 	cmd.replay_set_power_opt.replay_set_power_opt_data.panel_inst = panel_inst;
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
@@ -231,7 +231,7 @@ static void dmub_replay_set_coasting_vtotal(struct dmub_replay *dmub,
 	cmd.replay_set_coasting_vtotal.header.payload_bytes = sizeof(struct dmub_cmd_replay_set_coasting_vtotal_data);
 	cmd.replay_set_coasting_vtotal.replay_set_coasting_vtotal_data.coasting_vtotal = coasting_vtotal;
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
-- 
2.43.0

