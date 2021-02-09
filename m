Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2788315576
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 18:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0666EB88;
	Tue,  9 Feb 2021 17:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs7.siol.net [185.57.226.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818B96EB9C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 17:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 1B725522FAE;
 Tue,  9 Feb 2021 18:59:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id pwugU7GkgDO3; Tue,  9 Feb 2021 18:59:15 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id CC3515233C8;
 Tue,  9 Feb 2021 18:59:15 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id 81842522FAE;
 Tue,  9 Feb 2021 18:59:13 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH v3 4/5] drm/sun4i: Fix H6 HDMI PHY configuration
Date: Tue,  9 Feb 2021 18:58:59 +0100
Message-Id: <20210209175900.7092-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209175900.7092-1-jernej.skrabec@siol.net>
References: <20210209175900.7092-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As it turns out, vendor HDMI PHY driver for H6 has a pretty big table
of predefined values for various pixel clocks. However, most of them are
not useful/tested because they come from reference driver code. Vendor
PHY driver is concerned with only few of those, namely 27 MHz, 74.25
MHz, 148.5 MHz, 297 MHz and 594 MHz. These are all frequencies for
standard CEA modes.

Fix sun50i_h6_cur_ctr and sun50i_h6_phy_config with the values only for
aforementioned frequencies.

Table sun50i_h6_mpll_cfg doesn't need to be changed because values are
actually frequency dependant and not so much SoC dependant. See i.MX6
documentation for explanation of those values for similar PHY.

Fixes: c71c9b2fee17 ("drm/sun4i: Add support for Synopsys HDMI PHY")
Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 35c2133724e2..9994edf67509 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -104,29 +104,21 @@ static const struct dw_hdmi_mpll_config sun50i_h6_mpll_cfg[] = {
 
 static const struct dw_hdmi_curr_ctrl sun50i_h6_cur_ctr[] = {
 	/* pixelclk    bpp8    bpp10   bpp12 */
-	{ 25175000,  { 0x0000, 0x0000, 0x0000 }, },
 	{ 27000000,  { 0x0012, 0x0000, 0x0000 }, },
-	{ 59400000,  { 0x0008, 0x0008, 0x0008 }, },
-	{ 72000000,  { 0x0008, 0x0008, 0x001b }, },
-	{ 74250000,  { 0x0013, 0x0013, 0x0013 }, },
-	{ 90000000,  { 0x0008, 0x001a, 0x001b }, },
-	{ 118800000, { 0x001b, 0x001a, 0x001b }, },
-	{ 144000000, { 0x001b, 0x001a, 0x0034 }, },
-	{ 180000000, { 0x001b, 0x0033, 0x0034 }, },
-	{ 216000000, { 0x0036, 0x0033, 0x0034 }, },
-	{ 237600000, { 0x0036, 0x0033, 0x001b }, },
-	{ 288000000, { 0x0036, 0x001b, 0x001b }, },
-	{ 297000000, { 0x0019, 0x001b, 0x0019 }, },
-	{ 330000000, { 0x0036, 0x001b, 0x001b }, },
-	{ 594000000, { 0x003f, 0x001b, 0x001b }, },
+	{ 74250000,  { 0x0013, 0x001a, 0x001b }, },
+	{ 148500000, { 0x0019, 0x0033, 0x0034 }, },
+	{ 297000000, { 0x0019, 0x001b, 0x001b }, },
+	{ 594000000, { 0x0010, 0x001b, 0x001b }, },
 	{ ~0UL,      { 0x0000, 0x0000, 0x0000 }, }
 };
 
 static const struct dw_hdmi_phy_config sun50i_h6_phy_config[] = {
 	/*pixelclk   symbol   term   vlev*/
-	{ 74250000,  0x8009, 0x0004, 0x0232},
-	{ 148500000, 0x8029, 0x0004, 0x0273},
-	{ 594000000, 0x8039, 0x0004, 0x014a},
+	{ 27000000,  0x8009, 0x0007, 0x02b0 },
+	{ 74250000,  0x8009, 0x0006, 0x022d },
+	{ 148500000, 0x8029, 0x0006, 0x0270 },
+	{ 297000000, 0x8039, 0x0005, 0x01ab },
+	{ 594000000, 0x8029, 0x0000, 0x008a },
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
