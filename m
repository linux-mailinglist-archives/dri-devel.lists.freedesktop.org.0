Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F370B943A9F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B57A10E766;
	Thu,  1 Aug 2024 00:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bmrhZARn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AEE10E75B;
 Thu,  1 Aug 2024 00:17:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 335B3CE1869;
 Thu,  1 Aug 2024 00:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182C2C32786;
 Thu,  1 Aug 2024 00:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471446;
 bh=H8RbGKnc/apewFn075doefza/w+WhksTdezBBKO8wHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bmrhZARnp7C+2aBZUpgU0FLZPxIuKvK6yCFLyZj0bRfzstW0GOO57BpyKfVMdLPPi
 ySOD2tbhOZAAP1oK6O0dGePtE32ZBmSX29IOcyO3oSBMz0TMeDygCTKZZoWi9S1HoK
 ugJQcHPQED4L55qDgUdi/RHCoKO7RaDcndmHGvYuZ2lgQ8EiqhKonEgAIth1QQ/zBA
 lf+pKSjlf/HLRP/zz2Wh2505eiYTAXXK9oo56P49yg69B9DhmVgGI4rkELYxLBuUW2
 RgfcYUG2NDkub+CnAdtEsOrjxlKqykvHCyehlbayscg/XonSKSKBK/pZJA2IuJT/q6
 Sbr9qle7onx/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, hamza.mahfooz@amd.com, lewis.huang@amd.com,
 mghaddar@amd.com, srinivasan.shanmugam@amd.com, Bhawanpreet.Lakha@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 098/121] drm/amd/display: Run DC_LOG_DC after
 checking link->link_enc
Date: Wed, 31 Jul 2024 20:00:36 -0400
Message-ID: <20240801000834.3930818-98-sashal@kernel.org>
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

[ Upstream commit 3a82f62b0d9d7687eac47603bb6cd14a50fa718b ]

[WHAT]
The DC_LOG_DC should be run after link->link_enc is checked, not before.

This fixes 1 REVERSE_INULL issue reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/link/link_factory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index 2c3f5d6622851..c5486e6d89bd5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -611,14 +611,14 @@ static bool construct_phy(struct dc_link *link,
 	link->link_enc =
 		link->dc->res_pool->funcs->link_enc_create(dc_ctx, &enc_init_data);
 
-	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
-	DC_LOG_DC("BIOS object table - IS_DP2_CAPABLE: %d", link->link_enc->features.flags.bits.IS_DP2_CAPABLE);
-
 	if (!link->link_enc) {
 		DC_ERROR("Failed to create link encoder!\n");
 		goto link_enc_create_fail;
 	}
 
+	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
+	DC_LOG_DC("BIOS object table - IS_DP2_CAPABLE: %d", link->link_enc->features.flags.bits.IS_DP2_CAPABLE);
+
 	/* Update link encoder tracking variables. These are used for the dynamic
 	 * assignment of link encoders to streams.
 	 */
-- 
2.43.0

