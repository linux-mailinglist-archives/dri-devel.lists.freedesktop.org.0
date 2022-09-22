Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89655E67E2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304E510E231;
	Thu, 22 Sep 2022 16:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 568 seconds by postgrey-1.36 at gabe;
 Thu, 22 Sep 2022 12:52:46 UTC
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch
 [45.157.188.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625BC10E343
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:52:46 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MYFLs5Y7wzMpp4G;
 Thu, 22 Sep 2022 14:43:17 +0200 (CEST)
Received: from philippe-pc.toradex.int (unknown [31.10.206.125])
 by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4MYFLs37m5z3g;
 Thu, 22 Sep 2022 14:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pschenker.ch;
 s=20220412; t=1663850597;
 bh=txqoeLVu69b7SOW8ljUizaUSKTWyveLWsrFwR5lKTZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gqXxNIlL6AAoK9a3rCfNjZFvJTXM3EeeCKG/LoCE4RdufGOn/vPayg6nQVe49HvJl
 Z/bsE+axEzj4hajsbXbHi6l4pzFUNCxYMfVmP+Tqd62wgbZpybTU/8eEnFPQRibe1x
 yR+jMUzfDnQTgZLF0ESsMRtggq/eurbjkk/cKXxQ=
From: Philippe Schenker <dev@pschenker.ch>
To: dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>
Subject: [PATCH 4/4] drm/bridge: lt8912b: clarify lvds output status
Date: Thu, 22 Sep 2022 14:43:06 +0200
Message-Id: <20220922124306.34729-5-dev@pschenker.ch>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922124306.34729-1-dev@pschenker.ch>
References: <20220922124306.34729-1-dev@pschenker.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Sep 2022 16:00:00 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add comments on the lt8912_write_lvds_config() config to document the
current settings and to make it clear that this is a hardcoded
configuration not relevant for the HDMI output (could be removed without
affecting the HDMI port).

No changes on the actual register writes.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 26 ++++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 5968f4af190b..3e870d45f881 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -165,24 +165,32 @@ static int lt8912_write_rxlogicres_config(struct lt8912 *lt)
 	return ret;
 };
 
+/* enable LVDS output with some hardcoded configuration, not required for the HDMI output */
 static int lt8912_write_lvds_config(struct lt8912 *lt)
 {
 	const struct reg_sequence seq[] = {
+		// lvds power up
 		{0x44, 0x30},
 		{0x51, 0x05},
-		{0x50, 0x24},
-		{0x51, 0x2d},
-		{0x52, 0x04},
-		{0x69, 0x0e},
+
+		// core pll bypass
+		{0x50, 0x24}, // cp=50uA
+		{0x51, 0x2d}, // Pix_clk as reference, second order passive LPF PLL
+		{0x52, 0x04}, // loopdiv=0, use second-order PLL
+		{0x69, 0x0e}, // CP_PRESET_DIV_RATIO
 		{0x69, 0x8e},
 		{0x6a, 0x00},
-		{0x6c, 0xb8},
+		{0x6c, 0xb8}, // RGD_CP_SOFT_K_EN,RGD_CP_SOFT_K[13:8]
 		{0x6b, 0x51},
-		{0x04, 0xfb},
+
+		{0x04, 0xfb}, // core pll reset
 		{0x04, 0xff},
-		{0x7f, 0x00},
-		{0xa8, 0x13},
-		{0x02, 0xf7},
+
+		// scaler bypass
+		{0x7f, 0x00}, // disable scaler
+		{0xa8, 0x13}, // 0x13: JEIDA, 0x33: VESA
+
+		{0x02, 0xf7}, // lvds pll reset
 		{0x02, 0xff},
 		{0x03, 0xcf},
 		{0x03, 0xff},
-- 
2.37.3

