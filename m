Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954F82FC673
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 02:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1953C89EA3;
	Wed, 20 Jan 2021 01:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23AE89BBD;
 Wed, 20 Jan 2021 01:26:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F7E222472;
 Wed, 20 Jan 2021 01:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106006;
 bh=9SutWEmC6H5K10bDfM/3ZW3pS0nEj9/MpovzFvWZN8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sjpBpIKd5jnquEarxu/SLI84s01APmGU/UQYUj9s7aJ660wbuD8tJEjCVQ8ErnjND
 Tguz6uMb2H9lSizaOX4GF+oUA4u/zrffP76HwQWrfnuPgHe1r4W6JE3kFi+9rw/bJp
 3Zvw5pv5MhqtI7hDmsD1ERn9z57UdOQMT91ZK9BWH/7JVN2Dniy1ULMCmxEpHitOKX
 03kaqBLmqvy5Pbg3onOhdfnwA73mxv4TpQ4te2rI4DtXWHHPjsJuRX0H330Nbbi1mg
 U1HSDo+5SyYU2zOsfYfMPcp7+Fn47VJUbWf/pRVSylizU4ti/XD3Q+LK2XWMrGUz/Z
 82mpYSH6UYEjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 33/45] drm/amd/display: disable dcn10 pipe split
 by default
Date: Tue, 19 Jan 2021 20:25:50 -0500
Message-Id: <20210120012602.769683-33-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, "Li, Roman" <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Li, Roman" <Roman.Li@amd.com>

[ Upstream commit 9d03bb102028b4a3f4a64d6069b219e2e1c1f306 ]

[Why]
The initial purpose of dcn10 pipe split is to support some high
bandwidth mode which requires dispclk greater than max dispclk. By
initial bring up power measurement data, it showed power consumption is
less with pipe split for dcn block. This could be reason for enable pipe
split by default. By battery life measurement of some Chromebooks,
result shows battery life is longer with pipe split disabled.

[How]
Disable pipe split by default. Pipe split could be still enabled when
required dispclk is greater than max dispclk.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Signed-off-by: Roman Li <Roman.Li@amd.com>
Reviewed-by: Roman Li <Roman.Li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index a78712caf1244..0524d6f1adba6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -608,8 +608,8 @@ static const struct dc_debug_options debug_defaults_drv = {
 		.disable_pplib_clock_request = false,
 		.disable_pplib_wm_range = false,
 		.pplib_wm_report_mode = WM_REPORT_DEFAULT,
-		.pipe_split_policy = MPC_SPLIT_DYNAMIC,
-		.force_single_disp_pipe_split = true,
+		.pipe_split_policy = MPC_SPLIT_AVOID,
+		.force_single_disp_pipe_split = false,
 		.disable_dcc = DCC_ENABLE,
 		.voltage_align_fclk = true,
 		.disable_stereo_support = true,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
