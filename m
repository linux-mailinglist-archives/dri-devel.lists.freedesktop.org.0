Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFAD832153
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 23:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF4610E910;
	Thu, 18 Jan 2024 22:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC11110E910
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 22:03:34 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B75CC87835;
 Thu, 18 Jan 2024 23:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1705615377;
 bh=G1m6PHzvt/1r5P+ktO+irDL34MiP2jnxjjZenTJ526I=;
 h=From:To:Cc:Subject:Date:From;
 b=YhkBRJJe8iWwb+vxB2WCLZarDUc6BkDWOUJSmlBLT7nZjds3sk/bouGH4p5bS50GN
 ShQIK2xZQo2WIb8QiFFNa+MVLW7Lf92JK9RqF9ubZM0HAT3cklpHutkNhJBFgtmmyR
 zHBMa4RlIabDZIlp3YeGWmKPhKO1CzT7AkrHJdqgJiiaQCv6iLvDdoALHY2R+FGZQl
 DxpOV3x+E+sTmqwAAFyckd8lCpoZ/OYDjN4T8gfNaKX1poyRsjX/wWODhZ+hiDvmMJ
 7H63hB6hpWvs9PAqW0yTrkXbUu7AlOQJgkRod4PGxjyjoJcVKfk1lxTaRcf/90lWUy
 8m8SJn1mgmCGw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: tc358767: Limit the Pixel PLL input range
Date: Thu, 18 Jan 2024 23:02:31 +0100
Message-ID: <20240118220243.203655-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to new configuration spreadsheet from Toshiba for TC9595,
the Pixel PLL input clock have to be in range 6..40 MHz. The sheet
calculates those PLL input clock as reference clock divided by both
pre-dividers. Add the extra limit.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358767.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 615cc8f950d7b..0c29a8f81cc9e 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -546,9 +546,14 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
 			continue;
 		for (i_post = 0; i_post < ARRAY_SIZE(ext_div); i_post++) {
 			for (div = 1; div <= 16; div++) {
-				u32 clk;
+				u32 clk, iclk;
 				u64 tmp;
 
+				/* PCLK PLL input unit clock ... 6..40 MHz */
+				iclk = refclk / (div * ext_div[i_pre]);
+				if (iclk < 6000000 || iclk > 40000000)
+					continue;
+
 				tmp = pixelclock * ext_div[i_pre] *
 				      ext_div[i_post] * div;
 				do_div(tmp, refclk);
-- 
2.43.0

