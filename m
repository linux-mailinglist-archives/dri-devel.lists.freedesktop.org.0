Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE58366A8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9824D10F326;
	Mon, 22 Jan 2024 15:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBD510F318;
 Mon, 22 Jan 2024 15:06:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6B324B80E77;
 Mon, 22 Jan 2024 15:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C17C43394;
 Mon, 22 Jan 2024 15:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935927;
 bh=z9yFUwVMGr6KTvDqeyh995QcZ2urdt0fl6Xd/4eXJmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pABwJY5hfXFkcFFicK9wF1JV5BzUAozzzpoy3KWO34N6b0zdwqfRujsiDTQnH5hCn
 q+vpFB4CmdA4ApjP+WvPef0cFvHXtccIWJLSivpF4rav36i47S/LNbBKZ6x4X7iusd
 FLN7yRQcudz5L7Oo3G7wa2SD2OHtBk0kc8osrqPpY99e3Dh0JBpQMJ0YRzcFW32OVK
 in11jGDXiUhRchhUYBW4tfV9+5tLrITD+WqTZ8l4bdkIoF4EsOFqT778Zoon17QKqT
 8HDO3C8PRxDBT9nfDGTpm5CfCCoFhBMDiK0OFa+dSusgZ9rHmcflvwqhuB4aLaaXhA
 yzcrsIuS5ZK4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 17/73] drm/amd/display: Fix writeback_info is not
 removed
Date: Mon, 22 Jan 2024 10:01:31 -0500
Message-ID: <20240122150432.992458-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
 Alex Deucher <alexander.deucher@amd.com>, jun.lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 5b89d2ccc8466e0445a4994cb288fc009b565de5 ]

[WHY]
Counter j was not updated to present the num of writeback_info when
writeback pipes are removed.

[HOW]
update j (num of writeback info) under the correct condition.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index c232d38e70ae..79f3d7648eb7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -546,11 +546,12 @@ bool dc_stream_remove_writeback(struct dc *dc,
 			if (stream->writeback_info[i].dwb_pipe_inst == dwb_pipe_inst)
 				stream->writeback_info[i].wb_enabled = false;
 
-			if (j < i)
-				/* trim the array */
+			/* trim the array */
+			if (j < i) {
 				memcpy(&stream->writeback_info[j], &stream->writeback_info[i],
 						sizeof(struct dc_writeback_info));
-			j++;
+				j++;
+			}
 		}
 	}
 	stream->num_wb_info = j;
-- 
2.43.0

