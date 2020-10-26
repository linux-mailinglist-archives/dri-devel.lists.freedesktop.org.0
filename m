Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE22299BCA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 00:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992986EAA3;
	Mon, 26 Oct 2020 23:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F65B6EAA3;
 Mon, 26 Oct 2020 23:53:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 487F42151B;
 Mon, 26 Oct 2020 23:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756403;
 bh=0coM9A8x/YGE0BscLSA59VPascxQ21PgmSXSC7yGRpo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oSvbBZGcmJvAFU9QlL03B+4HgdmHsfJSTIeyfTjp/NP+XGllpslfIQ3PIQ9veBF7D
 OXfaPZqTZbzcyKSZgMkT2QgWCnTIwBBUaP1GxZIZhzPOHiWChHfqQtRJTJLpM0z1zL
 jyAoecTuzJNthbGnnXe7Y6DAhV2XXKjiGw5JFNbQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 062/132] drm/amd/display: Check clock table return
Date: Mon, 26 Oct 2020 19:50:54 -0400
Message-Id: <20201026235205.1023962-62-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

[ Upstream commit 4b4f21ff7f5d11bb77e169b306dcbc5b216f5db5 ]

During the load processes for Renoir, our display code needs to retrieve
the SMU clock and voltage table, however, this operation can fail which
means that we have to check this scenario. Currently, we are not
handling this case properly and as a result, we have seen the following
dmesg log during the boot:

RIP: 0010:rn_clk_mgr_construct+0x129/0x3d0 [amdgpu]
...
Call Trace:
 dc_clk_mgr_create+0x16a/0x1b0 [amdgpu]
 dc_create+0x231/0x760 [amdgpu]

This commit fixes this issue by checking the return status retrieved
from the clock table before try to populate any bandwidth.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index 24c5765890fa7..14f21a7307791 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -699,6 +699,7 @@ void rn_clk_mgr_construct(
 {
 	struct dc_debug_options *debug = &ctx->dc->debug;
 	struct dpm_clocks clock_table = { 0 };
+	enum pp_smu_status status = 0;
 
 	clk_mgr->base.ctx = ctx;
 	clk_mgr->base.funcs = &dcn21_funcs;
@@ -751,8 +752,10 @@ void rn_clk_mgr_construct(
 	clk_mgr->base.bw_params = &rn_bw_params;
 
 	if (pp_smu && pp_smu->rn_funcs.get_dpm_clock_table) {
-		pp_smu->rn_funcs.get_dpm_clock_table(&pp_smu->rn_funcs.pp_smu, &clock_table);
-		if (ctx->dc_bios && ctx->dc_bios->integrated_info) {
+		status = pp_smu->rn_funcs.get_dpm_clock_table(&pp_smu->rn_funcs.pp_smu, &clock_table);
+
+		if (status == PP_SMU_RESULT_OK &&
+		    ctx->dc_bios && ctx->dc_bios->integrated_info) {
 			rn_clk_mgr_helper_populate_bw_params (clk_mgr->base.bw_params, &clock_table, ctx->dc_bios->integrated_info);
 		}
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
