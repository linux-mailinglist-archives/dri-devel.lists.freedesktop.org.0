Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F358FFEB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743F68F22D;
	Thu, 11 Aug 2022 15:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B0718B078;
 Thu, 11 Aug 2022 15:36:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2B2C61620;
 Thu, 11 Aug 2022 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3EEC43140;
 Thu, 11 Aug 2022 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232164;
 bh=DuTwacPrQi8SpKVCwo8IL9ID57K2gYT2UIZtXBk5aXU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K+pMtuG/ERjjpovv7xWF0FpXkaUNLHFxHoy8TQeXPLV9khvBUbqMi7S9DVCLMXg93
 hgLwjj40rXqok2CSO8DF7xWXT8ry0sjQyaFFGye+s7NaniUfzruLJ+hJfHY/r1Te2G
 HJQ/6YrZ8DffN6OssK1g9K+gKBwMKtqDXRtFP0XVylZsGhNH0OJUyUSsyGSfMa/dCZ
 1q12LQf6lPHFCNLBlQqZ1tMqPOZpgAYZ8mXCgX9rRsWAxlOvkd5SltHCnXU/CZKmJ2
 pbgLpCmJuV1QnhLJNvNr9N1NOvLhj1s4PHhcY5aoCPsK9YIdBRoKvwHtzO8+vF1P42
 UrS4D8HPSTlyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 060/105] drm/amd/display: disable otg toggle w/a
 on boot
Date: Thu, 11 Aug 2022 11:27:44 -0400
Message-Id: <20220811152851.1520029-60-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 Eric.Yang2@amd.com, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 paul.hsieh@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

[ Upstream commit 8a077d9caa3a274de36ee2fe7b608041f5690343 ]

This w/a has a bad interaction with seamless boot toggling an
active stream. Most panels recover, however some fail leading
to display corruption.

Reviewed-by: Charlene Liu <Charlene.Liu@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index f4381725b210..36b0cd47c1c7 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -173,11 +173,14 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 	}
 
 	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
-		dcn315_disable_otg_wa(clk_mgr_base, true);
+		/* No need to apply the w/a if we haven't taken over from bios yet */
+		if (clk_mgr_base->clks.dispclk_khz)
+			dcn315_disable_otg_wa(clk_mgr_base, true);
 
 		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
 		dcn315_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
-		dcn315_disable_otg_wa(clk_mgr_base, false);
+		if (clk_mgr_base->clks.dispclk_khz)
+			dcn315_disable_otg_wa(clk_mgr_base, false);
 
 		update_dispclk = true;
 	}
-- 
2.35.1

