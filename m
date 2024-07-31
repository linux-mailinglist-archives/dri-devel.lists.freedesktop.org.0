Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07679943A0A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC2210E6F7;
	Thu,  1 Aug 2024 00:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g+DNoyIB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C8910E6F6;
 Thu,  1 Aug 2024 00:09:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BCA462569;
 Thu,  1 Aug 2024 00:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E16C116B1;
 Thu,  1 Aug 2024 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722470993;
 bh=urbdiKoWp4k0BQdRumoDWifT/RyLXzMSIUSYLtqW5UE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g+DNoyIBXzjWf1vMtqklud+dbk3Wetw9MtjwNhcZKXjBdJzHWyWtKMyAWKUzmSmaX
 Y9xRTRBFBtdDGcVaH/4Z7EeNH5GQdJkr8750ZxJ0QpcAmBxGho0mR0mtCjtBIhdgam
 smTatUZBiss88OMPQoReXPvWeHD5i0Bb8AXDrRXaFPNPFx5bM0enLzlwTYe+SZaIh1
 nQJ227E+PmW2OgFmdMRV8NTLF3p/xE5CDBfE+yd/DlIImE4S1qCQuyncoSKi1v0r2C
 ipWcZPrp7+jYeEUv/AEL4BTQyubZwAvWBjqgqTn6K/MfNee2OPr38hcv7qKX06qMeJ
 FGuf9KzRIYkTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 daniel.miess@amd.com, charlene.liu@amd.com, nicholas.kazlauskas@amd.com,
 wayne.lin@amd.com, yi-lchen@amd.com, harikrishna.revalla@amd.com,
 ahmed.ahmed@amd.com, Qingqing.Zhuo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 014/121] drm/amd/display: Fix incorrect size
 calculation for loop
Date: Wed, 31 Jul 2024 19:59:12 -0400
Message-ID: <20240801000834.3930818-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 3941a3aa4b653b69876d894d08f3fff1cc965267 ]

[WHY]
fe_clk_en has size of 5 but sizeof(fe_clk_en) has byte size 20 which is
lager than the array size.

[HOW]
Divide byte size 20 by its element size.

This fixes 2 OVERRUN issues reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c
index 024dcf3057a05..f2379709dd941 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c
@@ -895,7 +895,7 @@ static uint8_t dccg35_get_other_enabled_symclk_fe(struct dccg *dccg, uint32_t st
 	/* for DPMST, this backend could be used by multiple front end.
 	only disable the backend if this stream_enc_ins is the last active stream enc connected to this back_end*/
 		uint8_t i;
-		for (i = 0; i != link_enc_inst && i < sizeof(fe_clk_en); i++) {
+		for (i = 0; i != link_enc_inst && i < ARRAY_SIZE(fe_clk_en); i++) {
 			if (fe_clk_en[i] && be_clk_sel[i] == link_enc_inst)
 				num_enabled_symclk_fe++;
 		}
-- 
2.43.0

