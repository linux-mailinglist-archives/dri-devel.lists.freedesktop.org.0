Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B1836715
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C00D10E6AE;
	Mon, 22 Jan 2024 15:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2518210F3A5;
 Mon, 22 Jan 2024 15:11:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EABDFCE2B15;
 Mon, 22 Jan 2024 15:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0C3C433C7;
 Mon, 22 Jan 2024 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936233;
 bh=DmGztIB7qtBTmUG9cjOlqGMETbWx9kFVMNSxt6Q37bM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PzM/1r1w662lOIq3z3GtzdJlQHx/OeXP/l8LpWNLr6MV/NO1yo9ucyV52VePPhbBv
 HuKgGIoY2khOpQ8TAna16rBoH+OgX2Mcl+85EDVNliXRZ8A/8nxVsCiy4EZBsBviZk
 bFh08110AvHEl/IFIIdz+ilvXVplHrFJyaqi/tjHjBu+zxYoolG700c43gYhbYzpsA
 FXrtXYJCmvaeHzDJJavx1h7RPrc9kjTO5ORfws3jbTOq3S7eJ+wUF9IID54Lg8TUFS
 XQ244gWeF0dDnFa65QycAaa6Vn+lZea2XN5P2gcGM9PW74g/QGu4oct/+eC3BWeJM4
 86cfY6NVNffYA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 15/53] drm/amd/display: Fix writeback_info is not
 removed
Date: Mon, 22 Jan 2024 10:08:16 -0500
Message-ID: <20240122150949.994249-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150949.994249-1-sashal@kernel.org>
References: <20240122150949.994249-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.74
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
index 12b73b0ff19e..b59db6c95820 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -521,10 +521,11 @@ bool dc_stream_remove_writeback(struct dc *dc,
 			if (stream->writeback_info[i].dwb_pipe_inst == dwb_pipe_inst)
 				stream->writeback_info[i].wb_enabled = false;
 
-			if (j < i)
-				/* trim the array */
+			/* trim the array */
+			if (j < i) {
 				stream->writeback_info[j] = stream->writeback_info[i];
-			j++;
+				j++;
+			}
 		}
 	}
 	stream->num_wb_info = j;
-- 
2.43.0

