Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21EA54084E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E74610F3C6;
	Tue,  7 Jun 2022 17:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0844910F3A2;
 Tue,  7 Jun 2022 17:57:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 50F03CE2422;
 Tue,  7 Jun 2022 17:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127A9C36AFE;
 Tue,  7 Jun 2022 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624662;
 bh=UuT5pcuIYfI0vQXMOvXgNqqRRJ+ochAjLD8cGR0HfcE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YGnNDzbLoGTV7iErQHLL4YA2cw81OPiD3OoAXMbNMoZvzKQHiQszR1VI3fb+nHx+0
 IUXEM91sgcu/N2A7BvbX5uP8reb86T7cZDUTKsdy9ahMOyh8UIbmDwa9lasahW0eMu
 7w+XuhjJjs00FRRzqT7iZYoD3OKO8t8AYXOSmobjx1W2ZXooSfUgu5QpmxNMHDoJ6X
 o0XxwDuahEjNYZoSgy2CnUakM8CGQDspoCWG6HXC+Nw8e87VcHPMLx7TpjJPP8MhW8
 jE2ppP3VExxvNBjm+aNPbBey68CmEyn4h0BfDCDR10PWiUg10NayP1CkSG/pgGocJS
 u8OlVmMsa0fEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 37/51] drm/amd/display: Check if modulo is 0
 before dividing.
Date: Tue,  7 Jun 2022 13:55:36 -0400
Message-Id: <20220607175552.479948-37-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175552.479948-1-sashal@kernel.org>
References: <20220607175552.479948-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>, Charlene.Liu@amd.com, baihaowen@meizu.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, alex.hung@amd.com,
 HaoPing.Liu@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dillon.varone@amd.com,
 Martin Leung <Martin.Leung@amd.com>, Pavle.Kotarac@amd.com,
 Hansen.Dsouza@amd.com, David Galiffi <David.Galiffi@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Galiffi <David.Galiffi@amd.com>

[ Upstream commit 49947b906a6bd9668eaf4f9cf691973c25c26955 ]

[How & Why]
If a value of 0 is read, then this will cause a divide-by-0 panic.

Reviewed-by: Martin Leung <Martin.Leung@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: David Galiffi <David.Galiffi@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index 2c7eb982eabc..054823d12403 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -1013,9 +1013,12 @@ static bool get_pixel_clk_frequency_100hz(
 			 * not be programmed equal to DPREFCLK
 			 */
 			modulo_hz = REG_READ(MODULO[inst]);
-			*pixel_clk_khz = div_u64((uint64_t)clock_hz*
-				clock_source->ctx->dc->clk_mgr->dprefclk_khz*10,
-				modulo_hz);
+			if (modulo_hz)
+				*pixel_clk_khz = div_u64((uint64_t)clock_hz*
+					clock_source->ctx->dc->clk_mgr->dprefclk_khz*10,
+					modulo_hz);
+			else
+				*pixel_clk_khz = 0;
 		} else {
 			/* NOTE: There is agreement with VBIOS here that MODULO is
 			 * programmed equal to DPREFCLK, in which case PHASE will be
-- 
2.35.1

