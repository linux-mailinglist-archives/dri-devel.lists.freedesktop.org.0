Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E989190C4C4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080C010E5C0;
	Tue, 18 Jun 2024 08:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Cai9OYMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA19B10E5C0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:15:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45I8EM53022994;
 Tue, 18 Jun 2024 03:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718698462;
 bh=InxwNCbAgTFgl5F/JHeHsZPtxbn/61wBZDbAEWeX2GI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Cai9OYMNdHsRnrmZb98cjC2ECjSsSF3xayKgpM3vVwdclvfrk/KoPNvUMe8ZmQ69p
 qL7buI3bzFWtv2rDutPB91tgLKphCPhwB6mgVCkqTItJKkg8xHtgik6Ea6Jy+szfeM
 eq+tgDsyjBSs5/QsRHdG2mNUnvFu2bz4DgdWxkws=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45I8EMIc128612
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Jun 2024 03:14:22 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 03:14:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 03:14:22 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.55])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45I8ELeX116990;
 Tue, 18 Jun 2024 03:14:22 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <j-choudhary@ti.com>
CC: <linux-kernel@vger.kernel.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <spanda@codeaurora.org>, <a-bhatia1@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Fix
 ti_sn_bridge_set_dsi_rate function
Date: Tue, 18 Jun 2024 13:44:18 +0530
Message-ID: <20240618081418.250953-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618081418.250953-1-j-choudhary@ti.com>
References: <20240618081418.250953-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

During code inspection, it was found that due to integer calculations,
the rounding off can cause errors in the final value propagated in the
registers.
Considering the example of 1080p (very common resolution), the mode->clock
is 148500, dsi->lanes = 4, and bpp = 24, with the previous logic, the DSI
clock frequency would come as 444 when we are expecting the value 445.5
which would reflect in SN_DSIA_CLK_FREQ_REG.
So move the division to be the last operation where rounding off will not
impact the register value.

Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index d13b42d7c512..5bf12af6b657 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -111,8 +111,6 @@
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
 #define  AUX_IRQ_STATUS_NAT_I2C_FAIL		BIT(6)
 
-#define MIN_DSI_CLK_FREQ_MHZ	40
-
 /*
  * NOTE: DSI clock frequency range: [40MHz,755MHz)
  * DSI clock frequency range is in 5-MHz increments
@@ -1219,19 +1217,21 @@ static int ti_sn_bridge_atomic_check(struct drm_bridge *bridge,
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	struct drm_display_mode *mode = &crtc_state->mode;
-	unsigned int bit_rate_mhz, clk_freq_mhz;
+	unsigned int bit_rate_khz;
 
 	/* Pixel clock check */
 	if (mode->clock > SN65DSI86_MAX_PIXEL_CLOCK_KHZ)
 		return -EINVAL;
 
-	bit_rate_mhz = (mode->clock / 1000) *
+	bit_rate_khz = mode->clock *
 			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
-	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
 
-	/* for each increment in dsi_clk_range, frequency increases by 5MHz */
-	pdata->dsi_clk_range = (MIN_DSI_CLK_FREQ_MHZ / 5) +
-		(((clk_freq_mhz - MIN_DSI_CLK_FREQ_MHZ) / 5) & 0xFF);
+	/*
+	 * For each increment in dsi_clk_range, frequency increases by 5MHz
+	 * and the factor of 1000 comes from kHz to MHz conversion
+	 */
+	pdata->dsi_clk_range = (bit_rate_khz /
+				(pdata->dsi->lanes * 2 * 1000 * 5)) & 0xFF;
 
 	/* SN_DSIA_CLK_FREQ_REG check */
 	if (pdata->dsi_clk_range > MAX_DSI_CLK_RANGE ||
-- 
2.25.1

