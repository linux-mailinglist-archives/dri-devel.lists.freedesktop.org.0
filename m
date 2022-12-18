Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6D650040
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C215510E24C;
	Sun, 18 Dec 2022 16:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD5310E23D;
 Sun, 18 Dec 2022 16:11:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A135AB80B43;
 Sun, 18 Dec 2022 16:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548D1C433D2;
 Sun, 18 Dec 2022 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379916;
 bh=AmB2MwSLienkqebbxknN/fIW6Ra4Dau+j0MHNDTFaX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k2CFrU27E3R4DW5QN4WUrlUI3gtC0A4IXiDDPZCnwkQtFt4rYver+80KMJvuT95Qh
 KOZrMOcqpn3dhUaP72Gc07bAzjOS2n9gWxBoGOuDFa3ohu88PCRmBYEa685MIt+sW9
 jxbv3sZXRsoGNKuR6BzAb8Rc6gJ1unL2LYVRXMan2BP8kx5rhAKWYhUA37BBYbSFqI
 B11yVJShvj3O5j3zYvY2ZovPXSeiDfq35vlKeANThJhZvQHYEFgkyJ3F3iklyKfSta
 M4MdOc0c8G9T5T8pfIsn18oBFiSmjXPX2oZ6+ktzzfsqSnsoV4ZXL8UWAD2LhrPX04
 fNJzchRq+n3Kw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 56/73] drm/amd/display: Fix DTBCLK disable
 requests and SRC_SEL programming
Date: Sun, 18 Dec 2022 11:07:24 -0500
Message-Id: <20221218160741.927862-56-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160741.927862-1-sashal@kernel.org>
References: <20221218160741.927862-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, jiapeng.chong@linux.alibaba.com,
 Dillon Varone <Dillon.Varone@amd.com>, george.shen@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 Syed.Hassan@amd.com, samson.tam@amd.com, aurabindo.pillai@amd.com,
 eric.bernstein@amd.com, Alvin Lee <Alvin.Lee2@amd.com>,
 Jasdeep Dhillon <jdhillon@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <Alvin.Lee2@amd.com>

[ Upstream commit f6015da7f2410109bd2ccd2e2828f26185aeb81d ]

[Description]
- When transitioning FRL / DP2 is not required, we will always request
  DTBCLK = 0Mhz, but PMFW returns the min freq
- This causes us to make DTBCLK requests every time we call optimize
  after transitioning from FRL to non-FRL
- If DTBCLK is not required, request the min instead (then we only need
  to make 1 extra request at boot time)
- Also when programming PIPE_DTO_SRC_SEL, don't programming for DP
  first, just programming once for the required selection (programming
  DP on an HDMI connection then switching back causes corruption)

Reviewed-by: Dillon Varone <Dillon.Varone@amd.com>
Acked-by: Jasdeep Dhillon <jdhillon@amd.com>
Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c           | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index e7f1d5f8166f..59a29c32f66a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -436,7 +436,7 @@ static void dcn32_update_clocks(struct clk_mgr *clk_mgr_base,
 	}
 
 	if (!new_clocks->dtbclk_en) {
-		new_clocks->ref_dtbclk_khz = 0;
+		new_clocks->ref_dtbclk_khz = clk_mgr_base->bw_params->clk_table.entries[0].dtbclk_mhz * 1000;
 	}
 
 	/* clock limits are received with MHz precision, divide by 1000 to prevent setting clocks at every call */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
index 6dd8dadd68a5..6f160f65c8fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
@@ -225,11 +225,7 @@ void dccg32_set_dtbclk_dto(
 	} else {
 		REG_UPDATE_2(OTG_PIXEL_RATE_CNTL[params->otg_inst],
 				DTBCLK_DTO_ENABLE[params->otg_inst], 0,
-				PIPE_DTO_SRC_SEL[params->otg_inst], 1);
-		if (params->is_hdmi)
-			REG_UPDATE(OTG_PIXEL_RATE_CNTL[params->otg_inst],
-				PIPE_DTO_SRC_SEL[params->otg_inst], 0);
-
+				PIPE_DTO_SRC_SEL[params->otg_inst], params->is_hdmi ? 0 : 1);
 		REG_WRITE(DTBCLK_DTO_MODULO[params->otg_inst], 0);
 		REG_WRITE(DTBCLK_DTO_PHASE[params->otg_inst], 0);
 	}
-- 
2.35.1

