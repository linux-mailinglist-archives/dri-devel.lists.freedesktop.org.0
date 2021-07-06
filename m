Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFA3BCCCB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F5A6E270;
	Tue,  6 Jul 2021 11:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1006F6E25B;
 Tue,  6 Jul 2021 11:18:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAE2F61D03;
 Tue,  6 Jul 2021 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570325;
 bh=0TEEtHfReXo4F18sk6Sba1Yo0FUOojEbgub7tLSmUa8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=anKbKc+742Aeholnx4xqGRip0GWMoaDxdig64/MRhcLINz+aPNliZycBSFUqCFSxQ
 fZxQ1WAwpZKL8Ki7cdE4+whZ7RXAMmYc75bIxjGivRYhchaKHwtIOKY93Sqm9cSK6p
 LdLdqyi1AndAiVDB6u3Y+ko0MVkd+QzmboPJNRRTVHvGmLRFWk9qoLW31mTz+/Ox1H
 R6w+0/Fj2fMPE4OsvWuk/qkSbmji3V6rrwPcxCgJLKQDVANCGamSxTtWVsmd4ZhWLx
 73HFTGtrvl4oTF80pJCIUIJvuKfdx2/0+JzmNj5xbRiEPLTYkGDA3/EuWrraeQO7b2
 +JC3qZYj1Vn4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 013/160] drm/amd/display: fix use_max_lb flag for
 420 pixel formats
Date: Tue,  6 Jul 2021 07:15:59 -0400
Message-Id: <20210706111827.2060499-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

[ Upstream commit 8809a7a4afe90ad9ffb42f72154d27e7c47551ae ]

Right now the flag simply selects memory config 0 when flag is true
however 420 modes benefit more from memory config 3.

Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
index efa86d5c6847..98ab4b776924 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
@@ -496,10 +496,13 @@ static enum lb_memory_config dpp1_dscl_find_lb_memory_config(struct dcn10_dpp *d
 	int vtaps_c = scl_data->taps.v_taps_c;
 	int ceil_vratio = dc_fixpt_ceil(scl_data->ratios.vert);
 	int ceil_vratio_c = dc_fixpt_ceil(scl_data->ratios.vert_c);
-	enum lb_memory_config mem_cfg = LB_MEMORY_CONFIG_0;
 
-	if (dpp->base.ctx->dc->debug.use_max_lb)
-		return mem_cfg;
+	if (dpp->base.ctx->dc->debug.use_max_lb) {
+		if (scl_data->format == PIXEL_FORMAT_420BPP8
+				|| scl_data->format == PIXEL_FORMAT_420BPP10)
+			return LB_MEMORY_CONFIG_3;
+		return LB_MEMORY_CONFIG_0;
+	}
 
 	dpp->base.caps->dscl_calc_lb_num_partitions(
 			scl_data, LB_MEMORY_CONFIG_1, &num_part_y, &num_part_c);
-- 
2.30.2

