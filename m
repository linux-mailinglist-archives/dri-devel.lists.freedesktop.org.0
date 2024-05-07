Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C88BF0E7
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D26112720;
	Tue,  7 May 2024 23:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p1JC6BWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF621112720;
 Tue,  7 May 2024 23:13:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C4B7BCE1693;
 Tue,  7 May 2024 23:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2745DC4AF17;
 Tue,  7 May 2024 23:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715123589;
 bh=pNnuUOsxyqGucRjDj9C25E3421Gt4U79Bk4JI7dQS8o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p1JC6BWaheyMMLNSGhWpKZb8iOA1sWG4qdxEWjiPs7ILACcC5/ODiDzR+LeOarcw0
 2V91AdLu7WGE2kwO2wJPrr2eTnFnrqmO1ucSnp52hOcM1k8XiZ1FAs5XVFGqW4Ohqa
 5vb0aD90mp8PTTelyF3SRd6gpPCIWngepZxgudi1KXZjn0lWlO30su2vYJN+Rsk4lB
 +roEDvT3BNg/C2xqWDvsYpACPKrxCQ74NJDw9C4voOTKBp1d1k4iOZDLtOxgxEDf5Z
 7h/fk3t58uXgWaprV7J9uq3J2CAzjfc4qtUbSH9otmB56AxC4i8xgpRNgOvQDawCuS
 On4s7WRNX3G6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 chiahsuan.chung@amd.com, eric.bernstein@amd.com, qingqing.zhuo@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 17/25] drm/amd/display: Add VCO speed parameter
 for DCN31 FPU
Date: Tue,  7 May 2024 19:12:04 -0400
Message-ID: <20240507231231.394219-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231231.394219-1-sashal@kernel.org>
References: <20240507231231.394219-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.90
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

From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

[ Upstream commit 0e62103bdcbc88281e16add299a946fb3bd02fbe ]

Add VCO speed parameters in the bounding box array.

Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index 19d034341e640..cb2f6cd73af54 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -291,6 +291,7 @@ static struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc = {
 	.do_urgent_latency_adjustment = false,
 	.urgent_latency_adjustment_fabric_clock_component_us = 0,
 	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
+	.dispclk_dppclk_vco_speed_mhz = 2400.0,
 	.num_chans = 4,
 	.dummy_pstate_latency_us = 10.0
 };
@@ -438,6 +439,7 @@ static struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc = {
 	.do_urgent_latency_adjustment = false,
 	.urgent_latency_adjustment_fabric_clock_component_us = 0,
 	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
+	.dispclk_dppclk_vco_speed_mhz = 2500.0,
 };
 
 void dcn31_zero_pipe_dcc_fraction(display_e2e_pipe_params_st *pipes,
-- 
2.43.0

