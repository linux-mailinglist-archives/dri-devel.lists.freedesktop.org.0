Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A27320CD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2AE10E53B;
	Thu, 15 Jun 2023 20:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2787610E536
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:19:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 38F6D8617C;
 Thu, 15 Jun 2023 22:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686860357;
 bh=rVNlQczB4mYuhQJvhfBiAZ3UIaUkZrJMurNSkAapFw0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yD2+QLMyUsvu2ux0R2cDaG7ffmDqZdA/ziS0D9DcTNlNcm7xcUXiTcKcrLPya0IFL
 HRkfcuvq1CXAqpist3JvID0EPLjXNebJAi0npacucR/ssE6MLUtyWtAdtfiABb3lzl
 yx8U30/deVajqRocTfGKSKiezn3blHWeLB2jze7qENgP29j4LRcufZkd+F9/mo3awi
 WJ88FLNS/+p4tvyoWbl/fp33/wRyXXcLh9n/aGlnogRfj9VjzQErmJfykZIT4J7nFL
 +KxAmLmy8bi5TDQqlmw5sDR647WUZnTnaMi7J/tqTmRf/Qq6qPrXl4jCIrWB16zVBq
 u+lN7q2N/patQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/bridge: tc358762: Guess the meaning of LCDCTRL bits
Date: Thu, 15 Jun 2023 22:19:01 +0200
Message-Id: <20230615201902.566182-4-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615201902.566182-1-marex@denx.de>
References: <20230615201902.566182-1-marex@denx.de>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The register content and behavior is very similar to TC358764 VP_CTRL.
All the bits except for unknown bit 6 also seem to match, even though
the datasheet is just not available. Add a comment and reuse the bit
definitions.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358762.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 77f2ec9de9e59..a092e2096074f 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -41,8 +41,17 @@
 #define DSI_LANEENABLE		0x0210 /* Enables each lane */
 #define DSI_RX_START		1
 
-/* LCDC/DPI Host Registers */
-#define LCDCTRL			0x0420
+/* LCDC/DPI Host Registers, based on guesswork that this matches TC358764 */
+#define LCDCTRL			0x0420 /* Video Path Control */
+#define LCDCTRL_MSF		BIT(0) /* Magic square in RGB666 */
+#define LCDCTRL_VTGEN		BIT(4)/* Use chip clock for timing */
+#define LCDCTRL_UNK6		BIT(6) /* Unknown */
+#define LCDCTRL_EVTMODE		BIT(5) /* Event mode */
+#define LCDCTRL_RGB888		BIT(8) /* RGB888 mode */
+#define LCDCTRL_HSPOL		BIT(17) /* Polarity of HSYNC signal */
+#define LCDCTRL_DEPOL		BIT(18) /* Polarity of DE signal */
+#define LCDCTRL_VSPOL		BIT(19) /* Polarity of VSYNC signal */
+#define LCDCTRL_VSDELAY(v)	(((v) & 0xfff) << 20) /* VSYNC delay */
 
 /* SPI Master Registers */
 #define SPICMR			0x0450
@@ -114,7 +123,8 @@ static int tc358762_init(struct tc358762 *ctx)
 	tc358762_write(ctx, PPI_LPTXTIMECNT, LPX_PERIOD);
 
 	tc358762_write(ctx, SPICMR, 0x00);
-	tc358762_write(ctx, LCDCTRL, 0x00100150);
+	tc358762_write(ctx, LCDCTRL, LCDCTRL_VSDELAY(1) | LCDCTRL_RGB888 |
+				     LCDCTRL_UNK6 | LCDCTRL_VTGEN);
 	tc358762_write(ctx, SYSCTRL, 0x040f);
 	msleep(100);
 
-- 
2.39.2

