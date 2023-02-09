Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DA69066F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6162910E9A3;
	Thu,  9 Feb 2023 11:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D0010E9A3;
 Thu,  9 Feb 2023 11:17:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7DF1B820F2;
 Thu,  9 Feb 2023 11:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C07C433EF;
 Thu,  9 Feb 2023 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675941426;
 bh=4KLMRmXFwHw9jfP/NyiuIHUrBIS0EUbyrDRrdI25NpA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qiX2/Br5Gi664TmsZ729wF1Dx7Lep8W1k922zPkCIqxkYRJD5dblpNC2uayDRlgiz
 dOUWG1Qp3+B6yPhDL8+VmtPPmkChW6bztz3eFmIEGEGl0r6QTCrcQTJzcBZa8gy/DX
 9a3hFJ2bS5SqraO22TMkMtjpQ/Q0SHkyCKK0LQxkv92TISfWXOBuloL1E08ebM1LgH
 T/2cylpuaZLf7IaNaZ+s3t6m68Vql8GQX5+31/VWt/a4kxxY9pKKtRYh/zTK7TiJm5
 DAD6PK9FJJ+YadzYi0b5pvTiyOsxbMEwA3hY4+yfRl+LlV+mVC2J3jvbWpByKeqt8Z
 NEYEzD4E1Q8Aw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 31/38] drm/amd/display: Unassign
 does_plane_fit_in_mall function from dcn3.2
Date: Thu,  9 Feb 2023 06:14:50 -0500
Message-Id: <20230209111459.1891941-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Dillon.Varone@amd.com,
 Martin.Leung@amd.com, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 Alvin Lee <Alvin.Lee2@amd.com>, George Shen <george.shen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun.Lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: George Shen <george.shen@amd.com>

[ Upstream commit 275d8a1db261a1272a818d40ebc61b3b865b60e5 ]

[Why]
The hwss function does_plane_fit_in_mall not applicable to dcn3.2 asics.
Using it with dcn3.2 can result in undefined behaviour.

[How]
Assign the function pointer to NULL.

Reviewed-by: Alvin Lee <Alvin.Lee2@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: George Shen <george.shen@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
index 45a949ba6f3f3..7b7f0e6b2a2ff 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
@@ -94,7 +94,7 @@ static const struct hw_sequencer_funcs dcn32_funcs = {
 	.get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
 	.calc_vupdate_position = dcn10_calc_vupdate_position,
 	.apply_idle_power_optimizations = dcn32_apply_idle_power_optimizations,
-	.does_plane_fit_in_mall = dcn30_does_plane_fit_in_mall,
+	.does_plane_fit_in_mall = NULL,
 	.set_backlight_level = dcn21_set_backlight_level,
 	.set_abm_immediate_disable = dcn21_set_abm_immediate_disable,
 	.hardware_release = dcn30_hardware_release,
-- 
2.39.0

