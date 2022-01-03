Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC74835B5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90489F4A;
	Mon,  3 Jan 2022 17:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BFB89F47;
 Mon,  3 Jan 2022 17:29:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B918D6112B;
 Mon,  3 Jan 2022 17:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AC4C36AEB;
 Mon,  3 Jan 2022 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641230997;
 bh=07fpd9qQveFV1Lmm83Cgg0edgmEp9l85kmfyM91O9HQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jaokPyIyNgUuPbmPsL/s3zCWYvABs3fMQHcn3COkmxSrCI/IsrH9BAG94EgjBc6mX
 BQrQpMTn/mUwhkDjMvW8NOINu9SsRAmC3KaN9y6uylVh6qgkKGGzH0pu+BxEOFl3pz
 cLblZMARHwwkLx4mw1DecFlhQ0GoEig3oGmT5ZxlSXhVIGyNuMw5J1ObsOdsM96mHC
 WJJ1F4VaYpXt2tyklWfwdVCGOlh46bjLFCKmmnfByS2oB1friIiey8CA/DAT3TkyrH
 hTNJ4F3JY2kRis/z2cOEt8jNWXAe0k4xv9oM6oupUtLKfybOfeTwGsjHCUSf5cOz4C
 C5tFGXafVS7+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 14/16] drm/amd/display: Added power down for DCN10
Date: Mon,  3 Jan 2022 12:28:47 -0500
Message-Id: <20220103172849.1612731-14-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103172849.1612731-1-sashal@kernel.org>
References: <20220103172849.1612731-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com,
 Wesley.Chalmers@amd.com, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, victorchengchi.lu@amd.com, airlied@linux.ie,
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
index 34001a30d449a..10e613ec7d24f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
@@ -78,6 +78,7 @@ static const struct hw_sequencer_funcs dcn10_funcs = {
 	.get_clock = dcn10_get_clock,
 	.get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
 	.calc_vupdate_position = dcn10_calc_vupdate_position,
+	.power_down = dce110_power_down,
 	.set_backlight_level = dce110_set_backlight_level,
 	.set_abm_immediate_disable = dce110_set_abm_immediate_disable,
 	.set_pipe = dce110_set_pipe,
-- 
2.34.1

