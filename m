Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7577A886
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 18:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3084A10E0AC;
	Sun, 13 Aug 2023 16:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889D910E0AA;
 Sun, 13 Aug 2023 16:03:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05F5C62548;
 Sun, 13 Aug 2023 16:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E57EC433C7;
 Sun, 13 Aug 2023 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691942616;
 bh=Bfwab8q+XLexBBEYsH7/gnGoEE6MOrki01bthbpbRbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ti72JHN8//RP2Sw3zT93oznIKnMCcZ9X8kiuoEl6UZita7vwzGB7MT8loLQ2VUTbS
 oF5LQIaTomm3yyjS5u0sSJtcOWq2nScXMmA8NVUXnV8G/win6IpATGzTIRcwewu7xG
 yw7cnY+gh1vRv2KIW5B4SLWVFW4Kh5QUeVawEUUG8UKbGA9GjxiAR5aZZGR+zbM/De
 3cg1lXIp0UlFxa1qhgGjow3iftuYxG4kuQ3t211pDbWF9AXKD3PWgX/+DBJDhpgsbl
 KfTCNtaCTJmNhvawlTYMe2c86hQTQ2W0rYdUwAxR1j5Ijs+8GYoKl50G6j0uex9aVe
 lFEwPgHW1k5oQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 38/47] drm/amd/display: Guard DCN31 PHYD32CLK
 logic against chip family
Date: Sun, 13 Aug 2023 11:59:33 -0400
Message-Id: <20230813160006.1073695-38-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160006.1073695-1-sashal@kernel.org>
References: <20230813160006.1073695-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.45
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
 Hansen Dsouza <hansen.dsouza@amd.com>, Charlene.Liu@amd.com,
 Alex Hung <alex.hung@amd.com>, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 jun.lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: George Shen <george.shen@amd.com>

[ Upstream commit 25b054c3c89cb6a7106a7982f0f70e83d0797dab ]

[Why]
Current yellow carp B0 PHYD32CLK logic is incorrectly applied to other
ASICs.

[How]
Add guard to check chip family is yellow carp before applying logic.

Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: George Shen <george.shen@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
index 7d2b982506fd7..0cc510e16d9d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
@@ -76,7 +76,8 @@ static enum phyd32clk_clock_source get_phy_mux_symclk(
 		struct dcn_dccg *dccg_dcn,
 		enum phyd32clk_clock_source src)
 {
-	if (dccg_dcn->base.ctx->asic_id.hw_internal_rev == YELLOW_CARP_B0) {
+	if (dccg_dcn->base.ctx->asic_id.chip_family == FAMILY_YELLOW_CARP &&
+			dccg_dcn->base.ctx->asic_id.hw_internal_rev == YELLOW_CARP_B0) {
 		if (src == PHYD32CLKC)
 			src = PHYD32CLKF;
 		if (src == PHYD32CLKD)
-- 
2.40.1

