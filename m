Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E673D1F227C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123E56E03D;
	Mon,  8 Jun 2020 23:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E136E02A;
 Mon,  8 Jun 2020 23:08:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13A8C2085B;
 Mon,  8 Jun 2020 23:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657725;
 bh=TT+8tMvqgygFxoAAc7BZuKJHREEz6edhkE6V6E4qA9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=af7CblJ72Q4b5/8AjOe6ptfhTA2uhYvi5uJb841LlN4IvzfOkiIRs2LgTOWYYxAhX
 QJW4lms//2dBFCVDEw3ktK1hCYaAGc2pjYIghk9LlbXqp1a+gbWU+e+aimRkmWGL3I
 Fl2yHb0NU0HSPJvJXxZlwJgcRTkVsYCMyN4oNYkY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 117/274] drm/amd/display: dmcu wait loop
 calculation is incorrect in RV
Date: Mon,  8 Jun 2020 19:03:30 -0400
Message-Id: <20200608230607.3361041-117-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Eric Yang <eric.yang2@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Paul Hsieh <paul.hsieh@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Hsieh <paul.hsieh@amd.com>

[ Upstream commit 7fc5c319efceaed1a23b7ef35c333553ce39fecf ]

[Why]
Driver already get display clock from SMU base on MHz, but driver read
again and mutiple 1000 cause wait loop value is overflow.

[How]
remove coding error

Signed-off-by: Paul Hsieh <paul.hsieh@amd.com>
Reviewed-by: Eric Yang <eric.yang2@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c   | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
index 97b7f32294fd..c320b7af7d34 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
@@ -97,9 +97,6 @@ int rv1_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_di
 			VBIOSSMC_MSG_SetDispclkFreq,
 			requested_dispclk_khz / 1000);
 
-	/* Actual dispclk set is returned in the parameter register */
-	actual_dispclk_set_mhz = REG_READ(MP1_SMN_C2PMSG_83) * 1000;
-
 	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
 		if (dmcu && dmcu->funcs->is_dmcu_initialized(dmcu)) {
 			if (clk_mgr->dfs_bypass_disp_clk != actual_dispclk_set_mhz)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
