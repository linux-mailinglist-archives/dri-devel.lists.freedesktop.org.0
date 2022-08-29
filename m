Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD15A5425
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7433410F6E5;
	Mon, 29 Aug 2022 18:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989A410F6CE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:42:04 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id r22so8469643pgm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gg+A4/98sts77T30oMd2QqQaJoBU8yXhs87UapIfZsk=;
 b=aBmth8jStXvVwvHfKY8BHZUhkLqaYnA89PKvSTsQ5vQUqmU8p7UuEb+dB4pvY5Ucvg
 mcC4Z/IvqltQVv5S4Td1q7p61KSYfEIIKFT6SubsfQpghSk1bUw7P3/FJZH1VvqnsSp0
 HlslYcl7fqqa4sx6gIu35LNHnK8wI+DIx1Kr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gg+A4/98sts77T30oMd2QqQaJoBU8yXhs87UapIfZsk=;
 b=2yuY+Rsf4+T+xEt4BGVRiP3RPJlAO+ZYZW/AmZxsHb9AIblZo6fOMfAf7UwGBJDbsi
 dfRP3sxjvLiweW1C6aYqrMMROI5M6s32Fo2cScQfBTBgAOPDhNPDDxAJZqChzSTvIUFw
 t3zgtbHb8sOckrrWTa1FquuTK5nZSEKZRjl5/5RSYYaNnN4El8zsNAV2HJ4txT8lUxvn
 Q8+659bV6a+wnQKozyr3tRuPmrH1df1WnyP42HktzRoHB4cn3a1XWc3a9MxMnjgXfjlB
 ql+8KVKnxSL8PiqN86bXX0aXrE1/BQAP4DG88w0BHXB05SLNKdyIhhJ7nYApISeULig7
 Fnmg==
X-Gm-Message-State: ACgBeo0M6bB5mUTuKdQr5r0mt+0If26CvZyfIGFleWk5hIBJsQjfCyAa
 2tYetEavv5QCZqWAFKKpl/k2Jg==
X-Google-Smtp-Source: AA6agR5I1L27Rd+FZsw1WB+4G0p1imMCRH56Suy/n5wfU/sw+O/azOzB5h8k60Qbi25m+E1df1GA9A==
X-Received: by 2002:a05:6a00:1826:b0:537:b261:3e4d with SMTP id
 y38-20020a056a00182600b00537b2613e4dmr18086398pfa.65.1661798524198; 
 Mon, 29 Aug 2022 11:42:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 11:42:03 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v4 10/12] drm: bridge: samsung-dsim: Add input_bus_flags
Date: Tue, 30 Aug 2022 00:10:29 +0530
Message-Id: <20220829184031.1863663-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v4, v3, v2:
* none

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 871cc8cc5352..f3b5e265b027 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1593,6 +1593,10 @@ __weak void samsung_dsim_plat_remove(struct samsung_dsim *priv)
 {
 }
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1672,6 +1676,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
-- 
2.25.1

