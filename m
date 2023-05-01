Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9466F2C08
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 04:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751F10E194;
	Mon,  1 May 2023 02:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339E310E132;
 Mon,  1 May 2023 02:56:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0AC3615AE;
 Mon,  1 May 2023 02:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D503C433EF;
 Mon,  1 May 2023 02:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682909802;
 bh=eDQoBVYoSsBP6p23VcpY+zOVKBPTRBSYB4h1WLwasnQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WSjhzxYCgpQbPNA47XE/j3QSLyqiDDFVFcQXU9VtwTIulBvSmX2CPOARetgrzgijF
 a0gxaPbWWLBBfGX9WZEey/cna/FgUWag8GECDbm8gBWVBJxBN7KIO263XLpPdayBBN
 cqtE8LY4RzjUbU4rE7womO5IZFtihcaeoEjMR1Hnq8hRYVzITMfC85SMT7T0tok++7
 NebUXsewlYvlYcDvRcmHb0zdF4awVHSsdut5XR0vucH01keEcmDHnj9NkkvzV6HWJw
 riZsl0Ba6GLqPOJMu5/UeT4eu/+QgcvaherG1LDJpznZQT78Q1WHc2n4ZCK+AU41kr
 odTldUsj5iw5A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 02/44] drm/amd/display: populate subvp cmd info
 only for the top pipe
Date: Sun, 30 Apr 2023 22:55:50 -0400
Message-Id: <20230501025632.3253067-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025632.3253067-1-sashal@kernel.org>
References: <20230501025632.3253067-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, Max.Tseng@amd.com,
 Ayush Gupta <ayush.gupta@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun.Lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ayush Gupta <ayush.gupta@amd.com>

[ Upstream commit 9bb10b7aaec3b6278f9cc410c17dcaa129bbbbf0 ]

[Why]
System restart observed while changing the display resolution
to 8k with extended mode. Sytem restart was caused by a page fault.

[How]
When the driver populates subvp info it did it for both the pipes using
vblank which caused an outof bounds array access causing the page fault.
added checks to allow the top pipe only to fix this issue.

Co-authored-by: Ayush Gupta <ayush.gupta@amd.com>
Reviewed-by: Alvin Lee <Alvin.Lee2@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Ayush Gupta <ayush.gupta@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index c2092775ca88f..7f27e29fae116 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -750,7 +750,8 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 					!pipe->top_pipe && !pipe->prev_odm_pipe &&
 					pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
 				populate_subvp_cmd_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
-			} else if (pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			} else if (pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_NONE &&
+				    !pipe->top_pipe && !pipe->prev_odm_pipe) {
 				// Don't need to check for ActiveDRAMClockChangeMargin < 0, not valid in cases where
 				// we run through DML without calculating "natural" P-state support
 				populate_subvp_cmd_vblank_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
-- 
2.39.2

