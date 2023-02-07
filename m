Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0C68D1AC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 09:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF7610E47D;
	Tue,  7 Feb 2023 08:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C7910E477
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 08:45:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pPJbj-0002Pp-5t; Tue, 07 Feb 2023 09:45:43 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1pPJbc-003FF6-UV; Tue, 07 Feb 2023 09:45:38 +0100
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1pPJbd-004UQ6-EF; Tue, 07 Feb 2023 09:45:37 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm/rockchip: dw_hdmi: discard modes with unachievable
 pixelclocks
Date: Tue,  7 Feb 2023 09:44:52 +0100
Message-Id: <20230207084452.1069656-5-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230207084452.1069656-1-s.hauer@pengutronix.de>
References: <20230207084452.1069656-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Dan Johansen <strit@manjaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip PLL drivers are currently table based and support only
the most common pixelclocks. Discard all modes we cannot achieve
at all. Normally the desired pixelclocks have an exact match in the
PLL driver, nevertheless allow for a 0.1% error just in case.

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net>
Tested-by: Dan Johansen <strit@manjaro.org>
Link: https://lore.kernel.org/r/20230118132213.2911418-4-s.hauer@pengutronix.de
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index feba6b9becd6c..725952811752b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -256,10 +256,14 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 {
 	struct rockchip_hdmi *hdmi = data;
 	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
-	int pclk = mode->clock * 1000;
+	int rpclk, pclk = mode->clock * 1000;
 	bool exact_match = hdmi->plat_data->phy_force_vendor;
 	int i;
 
+	rpclk = clk_round_rate(hdmi->ref_clk, pclk);
+	if (abs(rpclk - pclk) > pclk / 1000)
+		return MODE_NOCLOCK;
+
 	for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
 		/*
 		 * For vendor specific phys force an exact match of the pixelclock
-- 
2.30.2

