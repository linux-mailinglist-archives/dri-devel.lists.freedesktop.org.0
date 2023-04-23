Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97F6EBF39
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 14:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764A610E3B8;
	Sun, 23 Apr 2023 12:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5448710E3A7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 12:12:58 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7606d443bb2so106168039f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682251977; x=1684843977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8jgcM/QeE+Y8+Tr1jy98fVl4Bmm9q0XNJC4VTJTM+4=;
 b=JLzNHOnxE/Vlwa1HzZoN9UvluDSoAkJFGjmilwdrZTHODn/B7WZdQo7WJVxGLOdN7P
 41iUIe9L5ctu6NXqWhWF/1BN6smV+7uv+21u4sE/cuNMlSTkM/7HegdzxECGDsXkwpqf
 3UZiJe9PYRE7ni885DRXTw9Y7+unExr9OxeBkQ3V8RiTgFTtRHKVLzfLsZLFWYUpOR4Y
 jz+GeF5+kA/+aBsfgbJLeN6tCtFltbkAsZAtSWChw2el75ZYa0P2JtRGNvw8bPlQtO4Y
 ZEwyr3AgNLNfZrvwn97aAw/SQs/eXhWhuI4J14L30r1VywENs6jB2cczfwXedgy5Pneh
 11Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682251977; x=1684843977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8jgcM/QeE+Y8+Tr1jy98fVl4Bmm9q0XNJC4VTJTM+4=;
 b=APgtSbrTp+wP8DwIbo/N0LL8xVFSkbZrG6iPHRduZPsnYi5Al1kfE+ePyYam/VW+jL
 8o1V8UPRGeB+ZD6Nldsv4hLtypjSoNeOpYzPobBqcvJ9Obc/d2SCBRt8/19jAHIF3k86
 0eptxg7YsiQQq6QMm+Hc/NwLbSUDE26MfOJkD+2l4LzZ20g2onupAdw0nDy50Uf7cmSb
 QE2cwmrn7YtwmGcQpSVoCkAig9sDzxRDeUIBmvTsN9btAJ1Oh9HGNiB0AY3wjTWWlfzr
 ZZI4V71qnyJId5JXbGrRhwcVARY3xENyzs5qHmxrQ4z8Hj0iGNzvadVq0jCZ14mXfBYf
 X7Sw==
X-Gm-Message-State: AAQBX9d2PeSz5IUjHTTqfucaufgK5foYHA0dj2nrKiDhyeysYaFZgabK
 ns7i3f2LSvVTQvb1hBV+ziuB4WmOZrw=
X-Google-Smtp-Source: AKy350ajJ9p8UuNCdHf/nb41YNZSCy7QL46641e67mbV4AIeXZePMPVquMYo6Rj4SZM0+ArxtubmcQ==
X-Received: by 2002:a92:cd4f:0:b0:329:bba2:781e with SMTP id
 v15-20020a92cd4f000000b00329bba2781emr3531026ilq.17.1682251977351; 
 Sun, 23 Apr 2023 05:12:57 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:b473:5d7c:4c2:75d7])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a02230b000000b00411a1373aa5sm1612155jau.155.2023.04.23.05.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 05:12:56 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
Date: Sun, 23 Apr 2023 07:12:29 -0500
Message-Id: <20230423121232.1345909-4-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423121232.1345909-1-aford173@gmail.com>
References: <20230423121232.1345909-1-aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 dario.binacchi@amarulasolutions.com, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the pll-clock-frequency optional.  If it's present, use it
to maintain backwards compatibility with existing hardware.  If it
is absent, read clock rate of "sclk_mipi" to determine the rate.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index adb9c13c5f7f..5b6e7825b92f 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 {
 	struct device *dev = dsi->dev;
 	struct device_node *node = dev->of_node;
+	struct clk *pll_clk;
 	int ret;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
 				       &dsi->pll_clk_rate);
-	if (ret < 0)
-		return ret;
+
+	/* If it doesn't exist, read it from the clock instead of failing */
+	if (ret < 0) {
+		pll_clk = devm_clk_get(dev, "sclk_mipi");
+		if (!IS_ERR(pll_clk))
+			dsi->pll_clk_rate = clk_get_rate(pll_clk);
+		else
+			return PTR_ERR(pll_clk);
+	}
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
 				       &dsi->burst_clk_rate);
-- 
2.39.2

