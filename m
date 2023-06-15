Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B07320C6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FA810E537;
	Thu, 15 Jun 2023 20:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AA510E537
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:16:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5401286167;
 Thu, 15 Jun 2023 22:16:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686860203;
 bh=7hrO0z1E/CAmSMrAvtK/IC1PU3S+iboA0UljwlV4pfc=;
 h=From:To:Cc:Subject:Date:From;
 b=AhQHsarl9zu0dN1r7VRZVuVxUkSUzM39sRHSxCCZzEdDcECtMy6nO2JnxCMH+PrFY
 H8zNcPiYPu2N4jkkk5FangM6yAmjZkFkcblRSWZSqqeUFn01Af9n8p7j4AYCMYAiNx
 o8Rt1s1J0woNW2g+5KJ3cUSudLCCeyHkOPfd4RwWsO+gNzSrww+zHTV1+e3YGud3ZC
 EW4i+y5V2cAT5upFSd/OiK3wnzWT7oSR6lkhEmkE4R8vLhdBvlCt4xKSaNdlrxn0JS
 FYv6p1T7kIPHFdf0+k5QoCa5RuvIAFXJ4pdMUhaESBpHWGMAoBrSAIYg7pCy0P9DX/
 vDqdOxyGXQBZQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: tc358764: Use BIT() macro for actual bits
Date: Thu, 15 Jun 2023 22:16:35 +0200
Message-Id: <20230615201635.565973-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
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

None of these four bits are bitfields, use BIT() macro and treat
them as bits. No functional change.

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
 drivers/gpu/drm/bridge/tc358764.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index f85654f1b1045..6a4cd313f5281 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -42,10 +42,10 @@
 
 /* Video path registers */
 #define VP_CTRL			0x0450 /* Video Path Control */
-#define VP_CTRL_MSF(v)		FLD_VAL(v, 0, 0) /* Magic square in RGB666 */
-#define VP_CTRL_VTGEN(v)	FLD_VAL(v, 4, 4) /* Use chip clock for timing */
-#define VP_CTRL_EVTMODE(v)	FLD_VAL(v, 5, 5) /* Event mode */
-#define VP_CTRL_RGB888(v)	FLD_VAL(v, 8, 8) /* RGB888 mode */
+#define VP_CTRL_MSF		BIT(0) /* Magic square in RGB666 */
+#define VP_CTRL_VTGEN		BIT(4) /* Use chip clock for timing */
+#define VP_CTRL_EVTMODE		BIT(5) /* Event mode */
+#define VP_CTRL_RGB888		BIT(8) /* RGB888 mode */
 #define VP_CTRL_VSDELAY(v)	FLD_VAL(v, 31, 20) /* VSYNC delay */
 #define VP_CTRL_HSPOL		BIT(17) /* Polarity of HSYNC signal */
 #define VP_CTRL_DEPOL		BIT(18) /* Polarity of DE signal */
@@ -233,8 +233,8 @@ static int tc358764_init(struct tc358764 *ctx)
 	tc358764_write(ctx, DSI_STARTDSI, DSI_RX_START);
 
 	/* configure video path */
-	tc358764_write(ctx, VP_CTRL, VP_CTRL_VSDELAY(15) | VP_CTRL_RGB888(1) |
-		       VP_CTRL_EVTMODE(1) | VP_CTRL_HSPOL | VP_CTRL_VSPOL);
+	tc358764_write(ctx, VP_CTRL, VP_CTRL_VSDELAY(15) | VP_CTRL_RGB888 |
+		       VP_CTRL_EVTMODE | VP_CTRL_HSPOL | VP_CTRL_VSPOL);
 
 	/* reset PHY */
 	tc358764_write(ctx, LV_PHY0, LV_PHY0_RST(1) |
-- 
2.39.2

