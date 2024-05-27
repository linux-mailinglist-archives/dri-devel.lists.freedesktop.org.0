Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477ED8D06C6
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5DD10EC67;
	Mon, 27 May 2024 15:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nBkf1ghO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584CB10E6BA;
 Mon, 27 May 2024 15:54:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 12464CE0F95;
 Mon, 27 May 2024 15:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E48C2BBFC;
 Mon, 27 May 2024 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716825237;
 bh=eppQxK4PetzeXvgVooh76qGI6E57PRhm0gp5biWijPo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nBkf1ghOqZNX5M4Km4Ek2VzECU/SDnn/iVUpgFWOQEuEITp5fNZmjSOm2TJSErEbI
 qgIsVcO8xTJw8gb0FBGT1pm+kuJjAHoZKkGp9QEV2U9WiKVdC2xczF5ns+OGoo3C7i
 lCTdR0+4NV4WgOE7fxdFQoq3vdWR3JqLn/GbI5IbkfiwBbXSNVNNeLyWvRxQtxG2VK
 eEwMU+ro66JP5PuNvTvgAq27dPBcSSz60Rpi6YFDCIwf8YqJ6Pmb9pmGTe5FToaK44
 CFlTZw09bcapod4WjG72nqfoq9ghMd9wQbUACp0kYFA8NBxB3u0kHLOjnDAMUlGV+p
 3KftXmATscdnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Duncan Ma <duncan.ma@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alvin.lee2@amd.com, dillon.varone@amd.com,
 samson.tam@amd.com, jinze.xu@amd.com, Qingqing.Zhuo@amd.com,
 cruise.hung@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 02/20] drm/amd/display: Workaround register access
 in idle race with cursor
Date: Mon, 27 May 2024 11:52:45 -0400
Message-ID: <20240527155349.3864778-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155349.3864778-1-sashal@kernel.org>
References: <20240527155349.3864778-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.11
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

[ Upstream commit b5b6d6251579a29dafdad25f4bc7f3ff7bfd2c86 ]

[Why]
Cursor update can be pre-empted by a request for setting target flip
submission.

This causes an issue where we're in the middle of the exit sequence
trying to log to DM, but the pre-emption starts another DMCUB
command submission that requires being out of idle.

The DC lock aqusition can fail, and depending on the DM/OS interface
it's possible that the function inserted into this thread must not fail.

This means that lock aqusition must be skipped and exit *must* occur.

[How]
Modify when we consider idle as active. Consider it exited only once
the exit has fully finished.

Consider it as entered prior to actual notification.

Since we're on the same core/thread the cached values are coherent
and we'll see that we still need to exit. Once the cursor update resumes
it'll continue doing the double exit but this won't cause a functional
issue, just a (potential) redundant operation.

Reviewed-by: Duncan Ma <duncan.ma@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 23 +++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 9084b320849a6..447dab3864019 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -1320,16 +1320,27 @@ void dc_dmub_srv_apply_idle_power_optimizations(const struct dc *dc, bool allow_
 	 * Powering up the hardware requires notifying PMFW and DMCUB.
 	 * Clearing the driver idle allow requires a DMCUB command.
 	 * DMCUB commands requires the DMCUB to be powered up and restored.
-	 *
-	 * Exit out early to prevent an infinite loop of DMCUB commands
-	 * triggering exit low power - use software state to track this.
 	 */
-	dc_dmub_srv->idle_allowed = allow_idle;
 
-	if (!allow_idle)
+	if (!allow_idle) {
 		dc_dmub_srv_exit_low_power_state(dc);
-	else
+		/*
+		 * Idle is considered fully exited only after the sequence above
+		 * fully completes. If we have a race of two threads exiting
+		 * at the same time then it's safe to perform the sequence
+		 * twice as long as we're not re-entering.
+		 *
+		 * Infinite command submission is avoided by using the
+		 * dm_execute_dmub_cmd submission instead of the "wake" helpers.
+		 */
+		dc_dmub_srv->idle_allowed = false;
+	} else {
+		/* Consider idle as notified prior to the actual submission to
+		 * prevent multiple entries. */
+		dc_dmub_srv->idle_allowed = true;
+
 		dc_dmub_srv_notify_idle(dc, allow_idle);
+	}
 }
 
 bool dc_wake_and_execute_dmub_cmd(const struct dc_context *ctx, union dmub_rb_cmd *cmd,
-- 
2.43.0

