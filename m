Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD76A3756
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CE510E323;
	Mon, 27 Feb 2023 02:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53B810E321;
 Mon, 27 Feb 2023 02:08:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C798B80CB3;
 Mon, 27 Feb 2023 02:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E588FC433D2;
 Mon, 27 Feb 2023 02:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463721;
 bh=5+PkTz5bTYiYgMDUzUeJpa2HZx1ob0963tY5ioT566Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IyEslEcyb+mfKAYC98Znc3i08G/ybWR+0Ssf46gqfav+XoYVMbBsAm3RdijO5MVAh
 abJfWsXbJlan+p9aWAEzDoSPDMm/m7N49Y4OFEFl1tR7dWDffRJ+unwEY95LSHIGCl
 E1xcwU/I4PY4yY/gX2wx1eBXJWAkqgMKuzLyQAlgU19ogEAUzvvSIpfSOzebzMnPt4
 Vm5mjkvbCrAg0KffYAiLuZPGIaoGNFYZtltKkFFAcsQgbsiZcilh6pfY1f6u1nJmjE
 Vly2HJ7D8LmWx6hcBUGzmyi/5uhc1v+eB/dZa4rEsLtPbbIzJdIY1W7gKRJdEB0ubI
 D2MDna4RzW3XQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 52/58] drm/amd/display: Disable HUBP/DPP PG on
 DCN314 for now
Date: Sun, 26 Feb 2023 21:04:50 -0500
Message-Id: <20230227020457.1048737-52-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
 Alex Deucher <alexander.deucher@amd.com>, gabe.teeger@amd.com,
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
index 5985ce8df4e08..9918bccd6defb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -888,6 +888,8 @@ static const struct dc_debug_options debug_defaults_drv = {
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

