Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAA94D5D8C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 09:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F16F10E6FA;
	Fri, 11 Mar 2022 08:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C0810E73C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 08:33:51 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nSaiL-0000aS-Cg; Fri, 11 Mar 2022 09:33:33 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nSaiE-0040hF-KQ; Fri, 11 Mar 2022 09:33:26 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 14/24] drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
Date: Fri, 11 Mar 2022 09:33:13 +0100
Message-Id: <20220311083323.887372-15-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220311083323.887372-1-s.hauer@pengutronix.de>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Douglas Anderson <dianders@chromium.org>

Jitter was improved by lowering the MPLL bandwidth to account for high
frequency noise in the rk3288 PLL.  In each case MPLL bandwidth was
lowered only enough to get us a comfortable margin.  We believe that
lowering the bandwidth like this is safe given sufficient testing.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v3:
    - new patch

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 4f912cbea73bb..f56c79c60d149 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -181,20 +181,8 @@ static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
 static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
 	/*      pixelclk    bpp8    bpp10   bpp12 */
 	{
-		40000000,  { 0x0018, 0x0018, 0x0018 },
-	}, {
-		65000000,  { 0x0028, 0x0028, 0x0028 },
-	}, {
-		66000000,  { 0x0038, 0x0038, 0x0038 },
-	}, {
-		74250000,  { 0x0028, 0x0038, 0x0038 },
-	}, {
-		83500000,  { 0x0028, 0x0038, 0x0038 },
-	}, {
-		146250000, { 0x0038, 0x0038, 0x0038 },
-	}, {
-		148500000, { 0x0000, 0x0038, 0x0038 },
-	}, {
+		600000000, { 0x0000, 0x0000, 0x0000 },
+	},  {
 		~0UL,      { 0x0000, 0x0000, 0x0000},
 	}
 };
-- 
2.30.2

