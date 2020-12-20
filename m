Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A46332DF2E6
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 04:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73295898FA;
	Sun, 20 Dec 2020 03:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A7C898FA;
 Sun, 20 Dec 2020 03:35:04 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 05/10] drm/amd/display: Prevent bandwidth overflow
Date: Sat, 19 Dec 2020 22:34:52 -0500
Message-Id: <20201220033457.2728519-5-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201220033457.2728519-1-sashal@kernel.org>
References: <20201220033457.2728519-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Park <Chris.Park@amd.com>

[ Upstream commit 80089dd8410f356d5104496d5ab71a66a4f4646b ]

[Why]
At very high pixel clock, bandwidth calculation exceeds 32 bit size
and overflow value. This causes the resulting selection of link rate
to be inaccurate.

[How]
Change order of operation and use fixed point to deal with integer
accuracy. Also address bug found when forcing link rate.

Signed-off-by: Chris Park <Chris.Park@amd.com>
Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 47cefc05fd3f5..f933791f1fbbb 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -2906,11 +2906,14 @@ uint32_t dc_bandwidth_in_kbps_from_timing(
 {
 	uint32_t bits_per_channel = 0;
 	uint32_t kbps;
+	struct fixed31_32 link_bw_kbps;
 
 #ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT
 	if (timing->flags.DSC) {
-		kbps = (timing->pix_clk_100hz * timing->dsc_cfg.bits_per_pixel);
-		kbps = kbps / 160 + ((kbps % 160) ? 1 : 0);
+		link_bw_kbps = dc_fixpt_from_int(timing->pix_clk_100hz);
+		link_bw_kbps = dc_fixpt_div_int(link_bw_kbps, 160);
+		link_bw_kbps = dc_fixpt_mul_int(link_bw_kbps, timing->dsc_cfg.bits_per_pixel);
+		kbps = dc_fixpt_ceil(link_bw_kbps);
 		return kbps;
 	}
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
