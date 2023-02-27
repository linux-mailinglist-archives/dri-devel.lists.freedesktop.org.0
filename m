Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200276A36C3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333D410E2B4;
	Mon, 27 Feb 2023 02:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0761D10E2D3;
 Mon, 27 Feb 2023 02:04:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8292960D39;
 Mon, 27 Feb 2023 02:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF483C4339E;
 Mon, 27 Feb 2023 02:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463472;
 bh=ueJ+nRG4PDKA3zbcPD1cYaqDinX2Y+hIhptCIR1APdA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rRBr3Bkt2nMU9oGNEBXiOPw5Q4rc1IAKdv/m85zOmPBF14pm6I6JCtr2P404k248z
 K0MP2mhJKB8A7kdyai8N2ITwAtpYxSTaeSjN/5gLTRtvfsQ5efaIE4XMlpHO5AkkzZ
 ihQQQYC4Xt5JebaziGapMRj76RYtvE2vwRPHhgJDF5Xhb7SU+bT6sVHwANCtkPDYvn
 sSf7k+A6L6li/0eF0S8h3aPsP51BY6FjREDB9mF6gOZ5TPb3NhIwVHlJV4sqUjB636
 TkOA82NwuOLEXke42i9adKBK2xEtey7f35ZxX7HtFYd7AHZG0trtld9sMKFON5hs7M
 kX4cnuRg0vVlw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 53/60] drm/amd/display: Disable HUBP/DPP PG on
 DCN314 for now
Date: Sun, 26 Feb 2023 21:00:38 -0500
Message-Id: <20230227020045.1045105-53-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com,
 Hansen Dsouza <hansen.dsouza@amd.com>, Daniel.Miess@amd.com,
 sunpeng.li@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, mwen@igalia.com, alex.hung@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 bernard@vivo.com, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sancchen@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit b7c67f72408b11b922f23f06c7df0f6743a2e89d ]

[Why]
The DMCUB implementation required to workaround corruption is
not currently stable and may cause intermittent corruption or hangs.

[How]
Disable PG until the sequence is stable.

Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index bc7f2b735327e..73f519dbdb531 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -892,6 +892,8 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.force_abm_enable = false,
 	.timing_trace = false,
 	.clock_trace = true,
+	.disable_dpp_power_gate = true,
+	.disable_hubp_power_gate = true,
 	.disable_pplib_clock_request = false,
 	.pipe_split_policy = MPC_SPLIT_DYNAMIC,
 	.force_single_disp_pipe_split = false,
-- 
2.39.0

