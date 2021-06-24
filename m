Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94C13B2430
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 02:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5410D6E99B;
	Thu, 24 Jun 2021 00:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557156E993
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 00:03:42 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51DBA17BB;
 Thu, 24 Jun 2021 02:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624493020;
 bh=7vpAmbY8TgK2fPF9LkRN+lXfMSXtvodDbFWNWnOBudU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rsaKqxbqIUsfT1Ztf4aORVCJeNBPl9uio/MRYq2iD7tBALYrf9z+5DHE7HPYPc8nC
 KjRUE6YBiOqPsJYFbD930p9Fae9n2ob5o42j9AngJQfS1AmdjoMrLH41nWMdoJO1JM
 hex3/29ynXV6zyVi8O051F+tnIjo0UvbBLDzyK9M=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/bridge: ti-sn65dsi86: Make enable GPIO optional
Date: Thu, 24 Jun 2021 03:03:00 +0300
Message-Id: <20210624000304.16281-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The enable signal may not be controllable by the kernel. Make it
optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5d712c8c3c3b..f0c7c6d4b2c1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1459,7 +1459,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return dev_err_probe(dev, PTR_ERR(pdata->regmap),
 				     "regmap i2c init failed\n");
 
-	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	pdata->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						     GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio))
 		return dev_err_probe(dev, PTR_ERR(pdata->enable_gpio),
 				     "failed to get enable gpio from DT\n");
-- 
Regards,

Laurent Pinchart

