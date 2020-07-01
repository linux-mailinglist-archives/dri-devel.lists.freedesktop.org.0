Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD3211CB3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2796EA4B;
	Thu,  2 Jul 2020 07:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73B16E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593599494; bh=3QXBBwf2NX/RkQpQ64nV5k6ulAezZ6ucTw8Gf1SveRQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=LKl1+NVC7OIRwW9kuhH1lYlhx/QATsVz6EqGOZ63DG8aeRkXN0rTIhc9f6UOPJitL
 LVlzEHNsG0HM6IQzDPjrY4TaTuXolUuCrVOQiXCcfz0LpUTXwPe6W5T0YSyIcX7tJm
 peIrF4ciQlz7dO1gjRFVXkIcP1QX6IkkPKaseu+M=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v6 11/13] drm/panel: st7703: Assert reset prior to powering
 down the regulators
Date: Wed,  1 Jul 2020 12:31:24 +0200
Message-Id: <20200701103126.1512615-12-megous@megous.com>
In-Reply-To: <20200701103126.1512615-1-megous@megous.com>
References: <20200701103126.1512615-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reset pin is inverted, so if we don't assert reset, the actual gpio
will be high and may keep driving the IO port of the panel.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 0c4167994d01..e303b7b1a215 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -417,6 +417,7 @@ static int st7703_unprepare(struct drm_panel *panel)
 	if (!ctx->prepared)
 		return 0;
 
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
 	ctx->prepared = false;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
