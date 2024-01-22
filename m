Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5348367AB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB65910F34E;
	Mon, 22 Jan 2024 15:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2857010F34E;
 Mon, 22 Jan 2024 15:17:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A6F461516;
 Mon, 22 Jan 2024 15:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35290C433F1;
 Mon, 22 Jan 2024 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936635;
 bh=TnjZ7Ng7xYs6ytnJmzByWcNLpqkTm7KKVDdG688zMBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EICQzMWiz0qykBp+byeb6YvmGW0flXhkhjVeDv9pP4Sd+FmrdoK/5qgtUmkbBHk/Q
 /6mKjb73n/evEv2A2MeExoR9C06c1aq9LQ7Oa8KR1LpfoapJrNSnHx5WZqL+tuKbox
 M2zRARAi/w+f2X2OAYOx0BXXivxC4wuUHFq0ORVKBQ5NkWfQaHobNd+pac3IauXwnz
 bTAN/UQQj8jHPbBeJQ23uARF0qrG4p/KKF0HZbXs/ZhllOaNTeacJPloBQzu1dwfyI
 4FaHq5x8ADuwFSBbDWM8D2mVXyxQa3wuAVHsI+XWjh4sMqGKfeKSL4F8feCbwAgD8z
 snHmhqMWoIU3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 06/24] drm/amd/display: Fix writeback_info never
 got updated
Date: Mon, 22 Jan 2024 10:16:20 -0500
Message-ID: <20240122151659.997085-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151659.997085-1-sashal@kernel.org>
References: <20240122151659.997085-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.267
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
Cc: Sasha Levin <sashal@kernel.org>, dillon.varone@amd.com,
 dri-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 airlied@gmail.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 aurabindo.pillai@amd.com, alvin.lee2@amd.com, daniel@ffwll.ch,
 wayne.lin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 8a307777c36e15f38c9f23778babcd368144c7d8 ]

[WHY]
wb_enabled field is set to false before it is used, and the following
code will never be executed.

[HOW]
Setting wb_enable to false after all removal work is completed.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 71b10b45a9b9..6e2b7bb47f38 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -448,18 +448,13 @@ bool dc_stream_remove_writeback(struct dc *dc,
 		return false;
 	}
 
-//	stream->writeback_info[dwb_pipe_inst].wb_enabled = false;
-	for (i = 0; i < stream->num_wb_info; i++) {
-		/*dynamic update*/
-		if (stream->writeback_info[i].wb_enabled &&
-			stream->writeback_info[i].dwb_pipe_inst == dwb_pipe_inst) {
-			stream->writeback_info[i].wb_enabled = false;
-		}
-	}
-
 	/* remove writeback info for disabled writeback pipes from stream */
 	for (i = 0, j = 0; i < stream->num_wb_info; i++) {
 		if (stream->writeback_info[i].wb_enabled) {
+
+			if (stream->writeback_info[i].dwb_pipe_inst == dwb_pipe_inst)
+				stream->writeback_info[i].wb_enabled = false;
+
 			if (i != j)
 				/* trim the array */
 				stream->writeback_info[j] = stream->writeback_info[i];
-- 
2.43.0

