Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0359010D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3966CB4834;
	Thu, 11 Aug 2022 15:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E950B486E;
 Thu, 11 Aug 2022 15:49:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACD45B82144;
 Thu, 11 Aug 2022 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337B3C433C1;
 Thu, 11 Aug 2022 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232975;
 bh=Yq/qewBsZ9gFTI/TsdmGJcZ2ggd23mO0UuZ99rWL658=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Reut0v67ZfWp5vmVoNG4YU0XNBkGxN8q3gP37s7qsOe4Seui8Lo0sqLP+TwDPtV7U
 f+pRq1/4JgAV3uz2lU17L55DJ/d1zwMVaMT4T3ehVyKzfEsB8BtCkJ+U5+/Ct0iQWa
 gl7Ego8xSozR1ey+/+hjeuumTHb/Q+SGh2v1XrzhL7CYFRveYu11WbGIPXnbBDXrE1
 Y29WbT9FYakzfyFKlB3dMIhpoI10lE99tt1ZcBQ9BlAiKjrrtjwGtqHJU1BsjXtUqZ
 D9S5lsQBJyNXdJe/hvY5CXVavk0pXzHto2sHQGwu/6WFtW6QbU/kuB5cwfetIwG6PT
 qAnRP4lV5omUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 54/93] drm/amd/display: disable otg toggle w/a on
 boot
Date: Thu, 11 Aug 2022 11:41:48 -0400
Message-Id: <20220811154237.1531313-54-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
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
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, michael.strauss@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
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
index 2918ad07d489..8f8680e89a8f 100644
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

