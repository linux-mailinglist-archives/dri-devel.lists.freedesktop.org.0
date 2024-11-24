Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1829D708E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCFE10E4E6;
	Sun, 24 Nov 2024 13:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fOOkvGCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389E010E4DB;
 Sun, 24 Nov 2024 13:36:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 442B5A40A3B;
 Sun, 24 Nov 2024 13:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCBAC4CECC;
 Sun, 24 Nov 2024 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455374;
 bh=ABW8IDQzptZt8hgjem9Zz0lXmf5YPyWvyj+fMjBrMEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fOOkvGCw6sOq9okQa/GpTAB4s3sPHuECjbEUw2ysEy8qGe6pkmgQdxJRLeG7ctm5t
 M94VR44e+hp3pXmRI3mx3bwwXuzyL+vM6SCbs8wN2xqK3fyZvvN9UHHplrqyIhJZFU
 hrehCCPd4GmgkJRHzMMvdoJXfwxzjOlDGpKLDBpu8CEBfoxlgH+Y58fV2geW5807GQ
 4qbEzghOU+mzsTwR/cgZA21+CPrUSwi60u6dwn6ruwlAppffuWU1O6o1Zmn5+TUtlt
 BXsClB1B3GzikD29FBJG53ovLiZbrdKwigTM5i9FrNbFJprbbx5ya4P7C6YKexPuPL
 bqbm6ZmYnyiBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leo Chen <leo.chen@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
 hamza.mahfooz@amd.com, Nicholas.Susanto@amd.com, sungjoon.kim@amd.com,
 roman.li@amd.com, zhongwei.zhang@amd.com, michael.strauss@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 059/107] drm/amd/display: Adding array index
 check to prevent memory corruption
Date: Sun, 24 Nov 2024 08:29:19 -0500
Message-ID: <20241124133301.3341829-59-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

[ Upstream commit 2c437d9a0b496168e1a1defd17b531f0a526dbe9 ]

[Why & How]
Array indices out of bound caused memory corruption. Adding checks to
ensure that array index stays in bound.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Leo Chen <leo.chen@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index b46a3afe48ca7..7d68006137a97 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -257,11 +257,11 @@ static void dcn35_notify_host_router_bw(struct clk_mgr *clk_mgr_base, struct dc_
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	uint32_t host_router_bw_kbps[MAX_HOST_ROUTERS_NUM] = { 0 };
 	int i;
-
 	for (i = 0; i < context->stream_count; ++i) {
 		const struct dc_stream_state *stream = context->streams[i];
 		const struct dc_link *link = stream->link;
-		uint8_t lowest_dpia_index = 0, hr_index = 0;
+		uint8_t lowest_dpia_index = 0;
+		unsigned int hr_index = 0;
 
 		if (!link)
 			continue;
@@ -271,6 +271,8 @@ static void dcn35_notify_host_router_bw(struct clk_mgr *clk_mgr_base, struct dc_
 			continue;
 
 		hr_index = (link->link_index - lowest_dpia_index) / 2;
+		if (hr_index >= MAX_HOST_ROUTERS_NUM)
+			continue;
 		host_router_bw_kbps[hr_index] += dc_bandwidth_in_kbps_from_timing(
 			&stream->timing, dc_link_get_highest_encoding_format(link));
 	}
-- 
2.43.0

