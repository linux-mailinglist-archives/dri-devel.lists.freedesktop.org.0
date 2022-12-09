Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60D64852D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABA610E549;
	Fri,  9 Dec 2022 15:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9110E549
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:27:05 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id fy4so4862754pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8mPqEQPN2em8iTEeAt5Sl90+CybIe48O5qmPtt0W8M=;
 b=XmeybZQm3pTPGYPcvjrGnRGTBkdUVOxBTsXvAOMWMkQQYxNdVwo6zPcoIDahOR0ZlG
 yqqRApqHHwoyxylzsm08kWfQybEcjDK7/Oj/ETS2GFORmd8IDGwqozEmTz8mRKqO11gN
 neLl4HdiTexT9aYZ+6Dm0SjpblU7xCEbWjVs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8mPqEQPN2em8iTEeAt5Sl90+CybIe48O5qmPtt0W8M=;
 b=aU6eyi2YvOZbbBQg3o/B3IPpEyULBxeH3dQB2cAvWSweyMcwd8af8zKEfCIMf6ybsK
 BgAzPExjw3mP7wGNhZCMxNTYCNTNpnUX/+D5KIktbeWvUyzG02mlw4ebmxCeNOmT5nPT
 Exu+nufv9pOH44MkkEYVnTKHnQDmYOqBcCSYKdSMPEezCR3sRN71Owq0sVpp2mgwUqgy
 jK/dUsECyNr/k49pH4q+XTwCTV3kggZW9yrWHiLgVvMDR/jHZZn8o5bgG7LXm+uXRC0U
 6DNjdKK888lZxmhzJej8X+GYKSzhQRE+eHZlCQ3zcYh65SGBDLYmFlSrhsd1N5s2FBOz
 mYlQ==
X-Gm-Message-State: ANoB5pmv56I77ohXkFdBVFsZXdQIErS3o3Cy+4mGqPTdG+6A7MhRyrDl
 SrcObJTIg9bqqti4WrB8mS5Ysw==
X-Google-Smtp-Source: AA0mqf76JqBQs9d553vjd8kdTr5hxdTfGn7UBuUCvJ9UY3SyZ6glN8E/72q9iSEsQt37yAV6zCDUug==
X-Received: by 2002:a17:902:8c8d:b0:187:262a:7955 with SMTP id
 t13-20020a1709028c8d00b00187262a7955mr5610383plo.9.1670599625243; 
 Fri, 09 Dec 2022 07:27:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:27:04 -0800 (PST)
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
Subject: [PATCH v9 09/18] drm: bridge: samsung-dsim: Add host init in
 pre_enable
Date: Fri,  9 Dec 2022 20:53:34 +0530
Message-Id: <20221209152343.180139-10-jagan@amarulasolutions.com>
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

Host transfer() in DSI master will invoke only when the DSI commands
are sent from DSI devices like DSI Panel or DSI bridges and this host
transfer wouldn't invoke for I2C-based-DSI bridge drivers.

Handling DSI host initialization in transfer calls misses the controller
setup for I2C configured DSI bridges.

This patch adds the DSI initialization from transfer to bridge pre_enable
as the bridge pre_enable API is invoked by core as it is common across
all classes of DSI device drivers.

v9:
* added the patch again

v3:
* none

v2:
* check initialized state in samsung_dsim_init

v1:
* keep DSI init in host transfer

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9adab5d372cc..2e15d753fdd0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1250,10 +1250,13 @@ static void samsung_dsim_disable_irq(struct samsung_dsim *dsi)
 	disable_irq(dsi->irq);
 }
 
-static int samsung_dsim_init(struct samsung_dsim *dsi)
+static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int flag)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & flag)
+		return 0;
+
 	samsung_dsim_reset(dsi);
 	samsung_dsim_enable_irq(dsi);
 
@@ -1266,6 +1269,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 	samsung_dsim_set_phy_ctrl(dsi);
 	samsung_dsim_init_link(dsi);
 
+	dsi->state |= flag;
+
 	return 0;
 }
 
@@ -1285,6 +1290,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
+	if (ret)
+		return;
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
@@ -1458,12 +1467,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = samsung_dsim_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
+	ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
-- 
2.25.1

