Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544DB85636D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C44810E74E;
	Thu, 15 Feb 2024 12:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="DgPcLvTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551A210E782
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:41:24 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 7D68660333;
 Thu, 15 Feb 2024 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708000883;
 bh=VERCIMMDwj5lwKKcADSnyxcjQigwJ3k/cdfbfunsFPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DgPcLvTjJGxq+IXNCQCYs1LxVECVbuw4ttf0+ed72NdtX7wL4fBM7rZ7jmbqTv/gP
 dVW+vPUJ4Ld2L3NyEZ2Hivro3JoHmdQrYuFQrx0ziR8Qmxfiygun2UMoMiorY42w1i
 5xBwWsRBCVwzTFKMf/UbGCa79vwwh18+c3Tj2JglTeLMUdnYrv+qiMAQAAW9EPFt8p
 d8ks5hpHfSLtrmYAum+tL7yZ4vnsWesKW1R09vnzmGkiLXQutvVY/T8XpzuqLbyhbO
 wwim89SzZSlKU5QQoDwJDKYLPoWA8cBnXw3T7/GdTBvfyAz29KqvjPuLtsVd2hRbi9
 sYMalts6I4vcQ==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 10/10] drm/bridge: tc358775: Configure hs_rate and lp_rate
Date: Thu, 15 Feb 2024 14:31:53 +0200
Message-ID: <20240215123222.42609-11-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215123222.42609-1-tony@atomide.com>
References: <20240215123222.42609-1-tony@atomide.com>
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

The hs_rate and lp_rate may be used by the dsi host for timing
calculations. The tc358775 has a maximum bit rate of 1 Gbps/lane,
tc358765 has maximurate of 800 Mbps per lane.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -637,6 +637,19 @@ static int tc_attach_host(struct tc_data *tc)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM;
 
+	/*
+	 * The hs_rate and lp_rate are data rate values. The HS mode is
+	 * differential, while the LP mode is single ended. As the HS mode
+	 * uses DDR, the DSI clock frequency is half the hs_rate. The 10 Mbs
+	 * data rate for LP mode is not specified in the bridge data sheet,
+	 * but seems to be part of the MIPI DSI spec.
+	 */
+	if (tc->type == TC358765)
+		dsi->hs_rate = 800000000;
+	else
+		dsi->hs_rate = 1000000000;
+	dsi->lp_rate = 10000000;
+
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host\n");
-- 
2.43.1
