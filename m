Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B77F9500
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 20:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BB310E142;
	Sun, 26 Nov 2023 19:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59E810E142
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 19:16:37 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id BE62960342;
 Sun, 26 Nov 2023 19:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701026197;
 bh=BcTjqWe4uScWhaNbhPONqwVftNfiGtAQS9TIsxqQBR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PPZzIyLRPGvv/xqQ0VhyiPLCAqPrN+lwNamSXl5xslpa1kXkRd5ZbfElk+s1oVhgK
 kNOLfyd+ZINqltUejUdoVzKl0XJDFoCoK8pd+TbD+Kqs7lTT53Y886uUXCatsw9wsX
 aduQj+BC6APTu0Gc7roXsUHDORJYA5Ip9yotJ5iH9SuHLXjQLURKOpScFKJbRp3H1+
 wggJVix7Hg8ijuk2n0nepak09rkn/1abhPIfi1bndDecZeg2W9a6zvvIa0CfbJKQtx
 0p6Ne7gUElgwGD68p6EkB+97P198ihe2F3kORpXX58BVgMUtTds+q1NDQg3lt8djIK
 ItJp+J6nWkBxA==
Date: Sun, 26 Nov 2023 21:15:54 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH 6/6] drm/bridge: tc358775: Configure hs_rate and lp_rate
Message-ID: <20231126191554.GM5169@atomide.com>
References: <20231126163247.10131-1-tony@atomide.com>
 <20231126163247.10131-2-tony@atomide.com>
 <20231126171837.GK5169@atomide.com>
 <20231126172018.GL5169@atomide.com>
 <20231126182135.GA5166@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126182135.GA5166@atomide.com>
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
@@ -653,6 +653,11 @@ static int tc_attach_host(struct tc_data *tc)
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
2.42.1
