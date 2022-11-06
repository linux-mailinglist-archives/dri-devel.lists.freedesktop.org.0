Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 496AD61E404
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 18:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F8610E1BA;
	Sun,  6 Nov 2022 17:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74CE10E1BA;
 Sun,  6 Nov 2022 17:06:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 417A3B802BD;
 Sun,  6 Nov 2022 17:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36936C43142;
 Sun,  6 Nov 2022 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754395;
 bh=Ho1dAhjOTbjMhnAGRIHqcSukLkGM2w9YjMXGNhLKLfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L0JlfaKtmgTXAYNXrgxh9CInXeO84Ual/7J6NZ8rVaKj2rzexYU4G2AGUZu2SC6nQ
 7b+4RsnThzZN92GWqqbWoUu0A9Tq0Jzx2NzbAdPVtyEubsGWisvrDSPRaYKfGUgVlM
 i6EDwWI/cQSP9xe0/uXaZ+kd4E5Al9jSR/YMyh+TQjHhNSvGngfrP3iffrUI61PH1k
 1VRfOLqX0nfzygpF+YeNJCTFUAbLYpEjiPhfnJB4yV9A1uVEXHMjpIFHrO50MrtygY
 9ZAYqsyVRbnaxal6B810mYEUO9JzKbAFdD+HfnwwZILmmjdHq/PMtaW59sPRd+XusK
 HTY+6ndVlgI3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 16/16] drm/amd/display: Remove wrong pipe control
 lock
Date: Sun,  6 Nov 2022 12:05:53 -0500
Message-Id: <20221106170555.1580584-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170555.1580584-1-sashal@kernel.org>
References: <20221106170555.1580584-1-sashal@kernel.org>
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
 christian.koenig@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas.Kazlauskas@amd.com
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
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 8f66eef0c683..c6c4888c6665 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1746,7 +1746,7 @@ void dcn20_post_unlock_program_front_end(
 
 			for (j = 0; j < TIMEOUT_FOR_PIPE_ENABLE_MS*1000
 					&& hubp->funcs->hubp_is_flip_pending(hubp); j++)
-				mdelay(1);
+				udelay(1);
 		}
 	}
 
-- 
2.35.1

