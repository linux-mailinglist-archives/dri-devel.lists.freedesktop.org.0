Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD04835C0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B0B89F63;
	Mon,  3 Jan 2022 17:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB1889F5B;
 Mon,  3 Jan 2022 17:30:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 507F86119A;
 Mon,  3 Jan 2022 17:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062B7C36AED;
 Mon,  3 Jan 2022 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641231016;
 bh=XcKRw6VU8Obus4eQJer9KGJAkNtdp7IY/7VWiIpTi1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FZvAExh6WAaU5afxv14EKISZKVNJ5MhA7B5ERY+FLqnTwCv7vsiSVn9pUx2jSzpg5
 Tzac4Kjfy7EQ9Y9G5302Xr0HEKuiTjNOm+IMUVVxkf1Cssl6Bs98+JrpI/GeSJTcD/
 nGGXE09AiLAyjxXOsvAqPNZPVrxyvuI5deE9COcCWSgI2rl8YBqsLY58s4NjGc1zth
 JJxuoxlO4KbzU74vOLDzbLzVnVLhsE4Pc93mDyIWjvDliLXAzx+Wngz8RH5tS4typV
 3/FL0Q9NFpAdOLwVMpEtOXL6QMPef55G5+0NOCn4xgxJe3/dOaa0Q0/H7WYpvVOoV8
 2oW6jzJVw46JQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 7/8] drm/amd/display: Added power down for DCN10
Date: Mon,  3 Jan 2022 12:30:00 -0500
Message-Id: <20220103173001.1613277-7-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103173001.1613277-1-sashal@kernel.org>
References: <20220103173001.1613277-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jun.Lei@amd.com, Wesley.Chalmers@amd.com,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 victorchengchi.lu@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, wyatt.wood@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, paul.hsieh@amd.com, "Lai,
 Derek" <Derek.Lai@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Lai, Derek" <Derek.Lai@amd.com>

[ Upstream commit d97e631af2db84c8c9d63abf68d487d0bb559e4c ]

[Why]
The change of setting a timer callback on boot for 10 seconds is still
working, just lacked power down for DCN10.

[How]
Added power down for DCN10.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Derek Lai <Derek.Lai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
index b24c8ae8b1ece..7e228c181b298 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
@@ -77,6 +77,7 @@ static const struct hw_sequencer_funcs dcn10_funcs = {
 	.get_clock = dcn10_get_clock,
 	.get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
 	.calc_vupdate_position = dcn10_calc_vupdate_position,
+	.power_down = dce110_power_down,
 	.set_backlight_level = dce110_set_backlight_level,
 	.set_abm_immediate_disable = dce110_set_abm_immediate_disable,
 	.set_pipe = dce110_set_pipe,
-- 
2.34.1

