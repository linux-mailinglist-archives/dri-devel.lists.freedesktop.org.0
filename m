Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6874174BCD7
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 10:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D17110E0E1;
	Sat,  8 Jul 2023 08:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03E510E0E1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1688805637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhoqtqxyhPtY8CBHiEHyPDLJNhjPqQS0txLNegyEoqo=;
 b=qpGNnr2XiVksOlNWj1Q+pnXybM//PE1W9vZvc0vlTKXAmf9O/Mu6NxHBtJgIsYSOz9hGLo
 z0+Gb7Nmmq6b9V6zv4xDoUIsYoP8GPhZn47yHI6HH4x9Fn8zUaAuYW1WeHx75DTAntw1Zv
 5xnGtBGQtubzsAeJS38w5UhF2BWBUzA=
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/3] drm/panel: ld9040: Use better magic values
Date: Sat,  8 Jul 2023 10:40:25 +0200
Message-Id: <20230708084027.18352-2-paul@crapouillou.net>
In-Reply-To: <20230708084027.18352-1-paul@crapouillou.net>
References: <20230708084027.18352-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have no idea what the prior magic values mean, and I have no idea
what my replacement (extracted from [1]) magic values mean.

What I do know, is that these new values result in a much better
picture, where the blacks are really black (as you would expect on an
AMOLED display) instead of grey-ish.

[1]: https://github.com/dorimanx/Dorimanx-SG2-I9100-Kernel/blob/master-jelly-bean/arch/arm/mach-exynos/u1-panel.h

v2: Remove spurious new line

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index 01eb211f32f7..f39f999c21af 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -180,15 +180,15 @@ static void ld9040_init(struct ld9040 *ctx)
 {
 	ld9040_dcs_write_seq_static(ctx, MCS_USER_SETTING, 0x5a, 0x5a);
 	ld9040_dcs_write_seq_static(ctx, MCS_PANEL_CONDITION,
-		0x05, 0x65, 0x96, 0x71, 0x7d, 0x19, 0x3b, 0x0d,
-		0x19, 0x7e, 0x0d, 0xe2, 0x00, 0x00, 0x7e, 0x7d,
-		0x07, 0x07, 0x20, 0x20, 0x20, 0x02, 0x02);
+		0x05, 0x5e, 0x96, 0x6b, 0x7d, 0x0d, 0x3f, 0x00,
+		0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x07, 0x05, 0x1f, 0x1f, 0x1f, 0x00, 0x00);
 	ld9040_dcs_write_seq_static(ctx, MCS_DISPCTL,
-		0x02, 0x08, 0x08, 0x10, 0x10);
+		0x02, 0x06, 0x0a, 0x10, 0x10);
 	ld9040_dcs_write_seq_static(ctx, MCS_MANPWR, 0x04);
 	ld9040_dcs_write_seq_static(ctx, MCS_POWER_CTRL,
 		0x0a, 0x87, 0x25, 0x6a, 0x44, 0x02, 0x88);
-	ld9040_dcs_write_seq_static(ctx, MCS_ELVSS_ON, 0x0d, 0x00, 0x16);
+	ld9040_dcs_write_seq_static(ctx, MCS_ELVSS_ON, 0x0f, 0x00, 0x16);
 	ld9040_dcs_write_seq_static(ctx, MCS_GTCON, 0x09, 0x00, 0x00);
 	ld9040_brightness_set(ctx);
 	ld9040_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
-- 
2.40.1

