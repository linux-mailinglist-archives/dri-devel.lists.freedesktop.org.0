Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C09801B61
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 09:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90410E1B4;
	Sat,  2 Dec 2023 08:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABAC10E1B4
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 08:05:17 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id A56CF60406;
 Sat,  2 Dec 2023 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701504317;
 bh=FTgDD2uIRgD8cARl+De2ZS7uFevrbIvFUr7xCEF/4dE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aRisSfgnuG6B1o2tqnryQaDgeaGPk67LTYuiWM9bmX2NIMFwesVGqm6WJBoVMclGO
 uCxmPCVBWwR3gdl1sxgxh8SeNpJzqEnfAMdLNPtgnlV9s4HGiqoxhkowPMOeAdd0q3
 ud2UtxC6WY/ut/2NU0LKJiDQFJI/TC+FPWH/pLiFHLk52meRmiEDhlY9oxr1+KN158
 Nu9Hwruvs09PEbxSpPwk3kvcx6O+bMB4GkqeExao+nepxoFtzwdy2BLLI4gCZV3aSk
 GGECtyWlsmZfX3i7ftCYk8v2m4/zrSYbUHOI7CJWQMIXRf0cxRIARhSbzh8vaRlxZb
 pXY3ACFEm03zw==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 10/10] drm/bridge: tc358775: Configure hs_rate and lp_rate
Date: Sat,  2 Dec 2023 09:54:49 +0200
Message-ID: <20231202075514.44474-11-tony@atomide.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202075514.44474-1-tony@atomide.com>
References: <20231202075514.44474-1-tony@atomide.com>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hs_rate and lp_rate may be used by the dsi host for timing
calculations. The tc358775 has a maximum bit rate of 1 Gbps/lane,
tc358765 has maximurate of 800 Mbps per lane.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -636,6 +636,11 @@ static int tc_attach_host(struct tc_data *tc)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 		MIPI_DSI_MODE_LPM;
+	if (tc->type == TC358765)
+		dsi->hs_rate = 800000000;
+	else
+		dsi->hs_rate = 1000000000;
+	dsi->lp_rate = 10000000;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-- 
2.43.0
