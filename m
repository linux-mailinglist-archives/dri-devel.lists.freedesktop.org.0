Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290459D70FD
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9327E10E511;
	Sun, 24 Nov 2024 13:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="slA+J4u0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329A10E511;
 Sun, 24 Nov 2024 13:42:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A56945C4AA8;
 Sun, 24 Nov 2024 13:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F23C4CECC;
 Sun, 24 Nov 2024 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455770;
 bh=F+p26doWYpDgZEoHldUcIHGk7EkIGKnXv5DpO/XzrC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=slA+J4u0w2J5tbu4jLYJ4QVAC3FelYgC2PoUS4jYekhdFxeSQnpvd+Sf2ZGad2czX
 NzNTjNGy8I8OUSIYam3ZeLn0o+ds4/n8HjI1nQPGANjQZibbc2DGmBzEtI3TbnVppw
 gP/JFoxWelfe7TTUw2ZVUCxcc3E3ljtviJBVh5B/7f6CePSp7hLUohnkOx7929SWUD
 269QccOwSlrd+yG36X/KRtcr1LfK8z8AO5bIEZLkX/YvtpUeYkNRx+DQ/y8EuaVwC3
 3+tr53ek7RZsRPeuzOa91sAU9A3yNjC4Oe4dB+Wsinyoowu50A7l65iWWuaAEsh6RB
 CiWGrVRS0Hbww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leo Chen <leo.chen@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, wayne.lin@amd.com, alvin.lee2@amd.com,
 dillon.varone@amd.com, srinivasan.shanmugam@amd.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com, Ovidiu.Bunea@amd.com, Roman.Li@amd.com,
 samson.tam@amd.com, anthony.koo@amd.com, zaeem.mohamed@amd.com,
 chiahsuan.chung@amd.com, ChunTao.Tso@amd.com, Syed.Hassan@amd.com,
 aric.cyr@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 28/87] drm/amd/display: Full exit out of IPS2
 when all allow signals have been cleared
Date: Sun, 24 Nov 2024 08:38:06 -0500
Message-ID: <20241124134102.3344326-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Leo Chen <leo.chen@amd.com>

[ Upstream commit 0fe33e115fec305c35c66b78ad26e3755ab54b9c ]

[Why]
A race condition occurs between cursor movement and vertical interrupt control
thread from OS, with both threads trying to exit IPS2.
Vertical interrupt control thread clears the prev driver allow signal while not fully
finishing the IPS2 exit process.

[How]
We want to detect all the allow signals have been cleared before we perform the full exit.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Leo Chen <leo.chen@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c    | 6 ++++--
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index ded13026c8ff7..c46100c83d0a7 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -1291,6 +1291,8 @@ static void dc_dmub_srv_notify_idle(const struct dc *dc, bool allow_idle)
 
 		memset(&new_signals, 0, sizeof(new_signals));
 
+		new_signals.bits.allow_idle = 1; /* always set */
+
 		if (dc->config.disable_ips == DMUB_IPS_ENABLE ||
 		    dc->config.disable_ips == DMUB_IPS_DISABLE_DYNAMIC) {
 			new_signals.bits.allow_pg = 1;
@@ -1386,7 +1388,7 @@ static void dc_dmub_srv_exit_low_power_state(const struct dc *dc)
 		 */
 		dc_dmub_srv->needs_idle_wake = false;
 
-		if (prev_driver_signals.bits.allow_ips2 &&
+		if ((prev_driver_signals.bits.allow_ips2 || prev_driver_signals.all == 0) &&
 		    (!dc->debug.optimize_ips_handshake ||
 		     ips_fw->signals.bits.ips2_commit || !ips_fw->signals.bits.in_idle)) {
 			DC_LOG_IPS(
@@ -1447,7 +1449,7 @@ static void dc_dmub_srv_exit_low_power_state(const struct dc *dc)
 		}
 
 		dc_dmub_srv_notify_idle(dc, false);
-		if (prev_driver_signals.bits.allow_ips1) {
+		if (prev_driver_signals.bits.allow_ips1 || prev_driver_signals.all == 0) {
 			DC_LOG_IPS(
 				"wait for IPS1 commit clear (ips1_commit=%d ips2_commit=%d)",
 				ips_fw->signals.bits.ips1_commit,
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 5ff0a865705f5..a11bfef3ab50d 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -743,7 +743,8 @@ union dmub_shared_state_ips_driver_signals {
 		uint32_t allow_ips1 : 1; /**< 1 is IPS1 is allowed */
 		uint32_t allow_ips2 : 1; /**< 1 is IPS1 is allowed */
 		uint32_t allow_z10 : 1; /**< 1 if Z10 is allowed */
-		uint32_t reserved_bits : 28; /**< Reversed bits */
+		uint32_t allow_idle : 1; /**< 1 if driver is allowing idle */
+		uint32_t reserved_bits : 27; /**< Reversed bits */
 	} bits;
 	uint32_t all;
 };
-- 
2.43.0

