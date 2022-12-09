Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21169648501
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8050C10E540;
	Fri,  9 Dec 2022 15:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E47F10E540
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:25:04 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id t2so2220231ply.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0bkfE/NcofHpZ784ykKYOCGEROmx5jroWhn+xMWIFY=;
 b=eJ9/BncMiZUP6tyio2c5dxhR4akKO8sbrLzdigRs0sWHSF2tDdt8HHFUTamDhZqS1y
 Se98Nh1glWWeK0/aPQmisXFcUNTIT5gVajJadORR47SozG+o8lKQerc4DDjfQYFYv0zJ
 nwp4DnvtDf3SdjXO8RYhMVPN01NIU24glAQ1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0bkfE/NcofHpZ784ykKYOCGEROmx5jroWhn+xMWIFY=;
 b=dwJQZ+gJQpMCyZhZBDMjq/q0oSo4S85qkDgXPaenj9GQhaQarpC3sJfR7J8sFnJJzA
 ZPh1K1edjuJ7ET03zubAiRIxp+R0E+C4KgVy4I20VFzfa6xTurX9IiYyerF42o5wa01h
 s5kXOzjAZ42jNfoXeIcjG67imx1MORqvnUxGx+YqMQXchtnuNXIhgWhrvftN80pjGKlr
 4waEQ4MfofPw1B+PBhlL+Aq8VnKlUDBZeK1yexGrOLFkqshOnoXDNkvUjNA2qcf2LzPI
 wWOz9RgW9sCSURvMhP4AzaBkdyYeKqAIsqn6AkKCnMRdworA+XT6ySwnhSMo5lPOjkzi
 dD0Q==
X-Gm-Message-State: ANoB5pk05A9FfK0VB+4XJW09CIBWLPE1KT6HDR4FNnRMoRbw7lPmcZfS
 SE7kdjFPR9DR4WI9BXikfiH+nA==
X-Google-Smtp-Source: AA0mqf7FzJBBotDaa2r+o1ZDMAzGBSGDePLkRq8t9eln0607UPuyfEwdDluW2xioJrmKEHZSLoHHkA==
X-Received: by 2002:a17:902:6bcc:b0:186:d89d:f0c1 with SMTP id
 m12-20020a1709026bcc00b00186d89df0c1mr5247211plt.42.1670599503903; 
 Fri, 09 Dec 2022 07:25:03 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:25:03 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v9 02/18] drm/bridge: tc358764: Enable pre_enable_prev_first
 flag
Date: Fri,  9 Dec 2022 20:53:27 +0530
Message-Id: <20221209152343.180139-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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

From: Marek Szyprowski <m.szyprowski@samsung.com>

Enable the drm bridge pre_enable_prev_first flag so that the
previous bridge pre_enable should be called first before the
pre_enable for the tc358764 bridge is called.

This makes sure that the previous bridge should be initialized
properly before the tc358764 bridge is powered up.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v9:
- new patch

 drivers/gpu/drm/bridge/tc358764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 53259c12d777..f85654f1b104 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -369,6 +369,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.25.1

