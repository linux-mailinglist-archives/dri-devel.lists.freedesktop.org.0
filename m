Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615EB61E3C7
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 18:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A71010E1B0;
	Sun,  6 Nov 2022 17:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B7910E1AF;
 Sun,  6 Nov 2022 17:04:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 062D360CF7;
 Sun,  6 Nov 2022 17:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3769C433D6;
 Sun,  6 Nov 2022 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754297;
 bh=A2xAvQbnLCqr8nWJbVANHA9l03LHWAGNYIoynTr8tk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Eo8GDCy0FJX8SLwDPdVy0V2mH5tOSxTlrm9YtD6WcaKfgvTG3B8co3NcCR1A+WyTQ
 5oI4HUsndoXnHfj+zJJ6a9jNQasLkeyXi6ibhIOkcwD60RO79kkQ6xWTZUHM9w0xa1
 HCjBT9jOCeiRH3+lh5K9Ns/20smOyirb0bAcJw/t0QwP0wFtt76017yVhstm1df4qB
 XE2czbhUAUA4ha763dITSUqkkaeud4j5QhC8D5tuzeO9uqFvgmUYqaromVOtGKTv6x
 xTT4eP1rWvxvzkWnSRAECoJHj46fc/NZpdu2tqK0ddexs+6VWc+xaZfr/DFUGn8bGC
 Bs4HmWgb3Ymww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 27/30] drm/amd/display: Remove wrong pipe control
 lock
Date: Sun,  6 Nov 2022 12:03:39 -0500
Message-Id: <20221106170345.1579893-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170345.1579893-1-sashal@kernel.org>
References: <20221106170345.1579893-1-sashal@kernel.org>
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
Cc: wenjing.liu@amd.com, dri-devel@lists.freedesktop.org, Yi-Ling.Chen2@amd.com,
 Jun.Lei@amd.com, Sasha Levin <sashal@kernel.org>,
 jiapeng.chong@linux.alibaba.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, Alvin.Lee2@amd.com,
 sunpeng.li@amd.com, duncan.ma@amd.com, mwen@igalia.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Sungjoon.Kim@amd.com,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

[ Upstream commit ca08a1725d0d78efca8d2dbdbce5ea70355da0f2 ]

When using a device based on DCN32/321,
we have an issue where a second
4k@60Hz display does not light up,
and the system becomes unresponsive
for a few minutes. In the debug process,
it was possible to see a hang
in the function dcn20_post_unlock_program_front_end
in this part:

for (j = 0; j < TIMEOUT_FOR_PIPE_ENABLE_MS*1000
	&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
	mdelay(1);
}

The hubp_is_flip_pending always returns positive
for waiting pending flips which is a symptom of
pipe hang. Additionally, the dmesg log shows
this message after a few minutes:

  BUG: soft lockup - CPU#4 stuck for 26s!
  ...
  [  +0.000003]  dcn20_post_unlock_program_front_end+0x112/0x340 [amdgpu]
  [  +0.000171]  dc_commit_state_no_check+0x63d/0xbf0 [amdgpu]
  [  +0.000155]  ? dc_validate_global_state+0x358/0x3d0 [amdgpu]
  [  +0.000154]  dc_commit_state+0xe2/0xf0 [amdgpu]

This confirmed the hypothesis that we had a pipe
hanging somewhere. Next, after checking the
ftrace entries, we have the below weird
sequence:

 [..]
  2)               |        dcn10_lock_all_pipes [amdgpu]() {
  2)   0.120 us    |          optc1_is_tg_enabled [amdgpu]();
  2)               |          dcn20_pipe_control_lock [amdgpu]() {
  2)               |            dc_dmub_srv_clear_inbox0_ack [amdgpu]() {
  2)   0.121 us    |              amdgpu_dm_dmub_reg_write [amdgpu]();
  2)   0.551 us    |            }
  2)               |            dc_dmub_srv_send_inbox0_cmd [amdgpu]() {
  2)   0.110 us    |              amdgpu_dm_dmub_reg_write [amdgpu]();
  2)   0.511 us    |            }
  2)               |            dc_dmub_srv_wait_for_inbox0_ack [amdgpu]() {
  2)   0.110 us    |              amdgpu_dm_dmub_reg_read [amdgpu]();
  2)   0.110 us    |              amdgpu_dm_dmub_reg_read [amdgpu]();
  2)   0.110 us    |              amdgpu_dm_dmub_reg_read [amdgpu]();
  2)   0.110 us    |              amdgpu_dm_dmub_reg_read [amdgpu]();
  2)   0.110 us    |              amdgpu_dm_dmub_reg_read [amdgpu]();
  2)   0.110 us    |              amdgpu_dm_dmub_reg_read [amdgpu]();
  2)   0.110 us    |              amdgpu_dm_dmub_reg_read [amdgpu]();
 [..]

We are not expected to read from dmub register
so many times and for so long. From the trace log,
it was possible to identify that the function
dcn20_pipe_control_lock was triggering the dmub
operation when it was unnecessary and causing
the hang issue. This commit drops the unnecessary
dmub code and, consequently, fixes the second display not
lighting up the issue.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 598ce872a8d7..0f30df523fdf 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1262,16 +1262,6 @@ void dcn20_pipe_control_lock(
 					lock,
 					&hw_locks,
 					&inst_flags);
-	} else if (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
-		union dmub_inbox0_cmd_lock_hw hw_lock_cmd = { 0 };
-		hw_lock_cmd.bits.command_code = DMUB_INBOX0_CMD__HW_LOCK;
-		hw_lock_cmd.bits.hw_lock_client = HW_LOCK_CLIENT_DRIVER;
-		hw_lock_cmd.bits.lock_pipe = 1;
-		hw_lock_cmd.bits.otg_inst = pipe->stream_res.tg->inst;
-		hw_lock_cmd.bits.lock = lock;
-		if (!lock)
-			hw_lock_cmd.bits.should_release = 1;
-		dmub_hw_lock_mgr_inbox0_cmd(dc->ctx->dmub_srv, hw_lock_cmd);
 	} else if (pipe->plane_state != NULL && pipe->plane_state->triplebuffer_flips) {
 		if (lock)
 			pipe->stream_res.tg->funcs->triplebuffer_lock(pipe->stream_res.tg);
@@ -1848,7 +1838,7 @@ void dcn20_post_unlock_program_front_end(
 
 			for (j = 0; j < TIMEOUT_FOR_PIPE_ENABLE_MS*1000
 					&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
-				mdelay(1);
+				udelay(1);
 		}
 	}
 
-- 
2.35.1

