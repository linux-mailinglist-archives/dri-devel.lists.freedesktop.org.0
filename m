Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1591E2E11AA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724BB6E891;
	Wed, 23 Dec 2020 02:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A11B6E88D;
 Wed, 23 Dec 2020 02:16:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2222A22A99;
 Wed, 23 Dec 2020 02:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689813;
 bh=o1W8LOPS4OuZ3xtMvSdO+5taIu+dtTEHp7Kb5wKltVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lfvP4XM/bkUvftHWk++rn+FXexds8C/mITGJKh8raULlO4Njm5upqdiVED7EW65Ri
 WTq+NxXGPqEStDPdW3PWknFj9D8OJGlMubxDOJELIl+kAxCRkNwcbZLPK+VOkmOIlV
 7cSYesyyukuEyKMkjp2hxyEbV5dEQ2wJ4waiWbTqniR680l7gE47QkQqaqqNAqLAH5
 ZqGDBCrKz2SRcnW2SV7wB2LyuC299rDJupjFUfTJhtt6jS8hGdvbKJUp3rmSLC14Va
 lStq/7GB27T8H8ODDg5wULkb3kcB25M1TDkj66Cbr/aftxbGW4B7YEVEDRFHsWVzDh
 wE+ZDH7qeTqng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 020/217] drm/amd/display: Keep GSL for full
 updates with planes that flip VSYNC
Date: Tue, 22 Dec 2020 21:13:09 -0500
Message-Id: <20201223021626.2790791-20-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, amd-gfx@lists.freedesktop.org,
 Alvin Lee <alvin.lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit 6f2239ccdfc04938dc35e67dd60191b2c05dfb63 ]

[Why]
When enabling PIP in Heaven, the PIP planes are VSYNC
flip and is also the top-most pipe. In this case GSL
will be disabled because we only check immediate flip
for the top pipe. However, the desktop planes are still
flip immediate so we should at least keep GSL on until
the full update.

[How]
Check each pipe in the tree to see if any planes
are flip immediate. Maintain the GSL lock if yes,
and take it down after when unlocking if any planes
are flipping VSYNC. Keeping GSL on with VSYNC +
flip immediate planes causes corruption.

Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 01530e686f437..0f67e94653e40 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1158,6 +1158,7 @@ void dcn20_pipe_control_lock(
 	struct pipe_ctx *pipe,
 	bool lock)
 {
+	struct pipe_ctx *temp_pipe;
 	bool flip_immediate = false;
 
 	/* use TG master update lock to lock everything on the TG
@@ -1169,6 +1170,13 @@ void dcn20_pipe_control_lock(
 	if (pipe->plane_state != NULL)
 		flip_immediate = pipe->plane_state->flip_immediate;
 
+	temp_pipe = pipe->bottom_pipe;
+	while (!flip_immediate && temp_pipe) {
+	    if (temp_pipe->plane_state != NULL)
+		flip_immediate = temp_pipe->plane_state->flip_immediate;
+	    temp_pipe = temp_pipe->bottom_pipe;
+	}
+
 	if (flip_immediate && lock) {
 		const int TIMEOUT_FOR_FLIP_PENDING = 100000;
 		int i;
@@ -1196,6 +1204,17 @@ void dcn20_pipe_control_lock(
 		    (!flip_immediate && pipe->stream_res.gsl_group > 0))
 			dcn20_setup_gsl_group_as_lock(dc, pipe, flip_immediate);
 
+	temp_pipe = pipe->bottom_pipe;
+	while (flip_immediate && temp_pipe) {
+	    if (temp_pipe->plane_state != NULL)
+		flip_immediate = temp_pipe->plane_state->flip_immediate;
+	    temp_pipe = temp_pipe->bottom_pipe;
+	}
+
+	if (!lock && pipe->stream_res.gsl_group > 0 && pipe->plane_state &&
+		!flip_immediate)
+	    dcn20_setup_gsl_group_as_lock(dc, pipe, false);
+
 	if (pipe->stream && should_use_dmub_lock(pipe->stream->link)) {
 		union dmub_hw_lock_flags hw_locks = { 0 };
 		struct dmub_hw_lock_inst_flags inst_flags = { 0 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
