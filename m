Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799809EDC65
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 01:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27C210E053;
	Thu, 12 Dec 2024 00:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z1RB0iDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431DC10E053
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 00:19:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A743BA42112;
 Thu, 12 Dec 2024 00:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD65C4CED2;
 Thu, 12 Dec 2024 00:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733962764;
 bh=2BjK7sTMogm7uyjtjoOaPa8oXC0k42R+bEB1rCldpN4=;
 h=From:To:Cc:Subject:Date:From;
 b=Z1RB0iDZYQuyJP67g0uDT1D/JBF1/82IZ6xE2Vap1+rzDkQPNqawERYId1+0YUnk1
 +PSG8uImWBY0qZ9xGXgBPytcTTM+aOF2QgJjs2Rc4yMcYRdTm3m/9OyuQUAkLLk1gr
 l5YC7R5yho33fyUwiESlbzse2GQ5YVIgyzomWtHM1Q2N9RPX+zN0wBCc2zthgYAJ8b
 QITLD7oXSu32cQdNttwe8K/GlILYyuf1eoncMnJmw0zW44qUjZlFeM4CDag2i09UV4
 z0xYquU6lHl6fBKKQcBw1lOBFRa5fyqBpdKKzvxgYHaoSoUCM1V5NFeDTssl/aZk5z
 oz1xere4XjvhA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jens Ziller <zillerbaer@gmx.de>, Shuijing Li <shuijing.li@mediatek.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] Revert "drm/mediatek: dsi: Correct calculation formula of PHY
 Timing"
Date: Thu, 12 Dec 2024 00:19:08 +0000
Message-Id: <20241212001908.6056-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

This reverts commit 417d8c47271d5cf1a705e997065873b2a9a36fd4.

With this patch the panel in the Tentacruel ASUS Chromebook CM14
(CM1402F) flickers. There are 1 or 2 times per second a black panel.
Stable Kernel 6.11.5 and mainline 6.12-rc4 works only when reverse
this patch.

Reported-by: Jens Ziller <zillerbaer@gmx.de>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 31 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 33ceeb8d6925..3907863579b9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -246,23 +246,22 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, HZ_PER_MHZ);
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
-	timing->lpx = (80 * data_rate_mhz / (8 * 1000)) + 1;
-	timing->da_hs_prepare = (59 * data_rate_mhz + 4 * 1000) / 8000 + 1;
-	timing->da_hs_zero = (163 * data_rate_mhz + 11 * 1000) / 8000 + 1 -
+	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
+	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
 			     timing->da_hs_prepare;
-	timing->da_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
-
-	timing->ta_go = 4 * timing->lpx;
-	timing->ta_sure = 3 * timing->lpx / 2;
-	timing->ta_get = 5 * timing->lpx;
-	timing->da_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
-
-	timing->clk_hs_prepare = (57 * data_rate_mhz / (8 * 1000)) + 1;
-	timing->clk_hs_post = (65 * data_rate_mhz + 53 * 1000) / 8000 + 1;
-	timing->clk_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
-	timing->clk_hs_zero = (330 * data_rate_mhz / (8 * 1000)) + 1 -
-			      timing->clk_hs_prepare;
-	timing->clk_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->da_hs_trail = timing->da_hs_prepare + 1;
+
+	timing->ta_go = 4 * timing->lpx - 2;
+	timing->ta_sure = timing->lpx + 2;
+	timing->ta_get = 4 * timing->lpx;
+	timing->da_hs_exit = 2 * timing->lpx + 1;
+
+	timing->clk_hs_prepare = 70 * data_rate_mhz / (8 * 1000);
+	timing->clk_hs_post = timing->clk_hs_prepare + 8;
+	timing->clk_hs_trail = timing->clk_hs_prepare;
+	timing->clk_hs_zero = timing->clk_hs_trail * 4;
+	timing->clk_hs_exit = 2 * timing->clk_hs_trail;
 
 	timcon0 = FIELD_PREP(LPX, timing->lpx) |
 		  FIELD_PREP(HS_PREP, timing->da_hs_prepare) |
-- 
2.34.1

