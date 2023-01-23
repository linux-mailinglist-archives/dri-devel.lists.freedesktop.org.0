Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A779677EE0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970EB10E4B3;
	Mon, 23 Jan 2023 15:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E6C10E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:12:59 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9so11662039pll.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGTDxW/0FHkTpFMtVsyR5B6P9WvJldck4Y7e8f4Ze3U=;
 b=UwPu6XfWXFSIuiiGfsHeV0NSIGbeIFJmjzP2t9BTNEk9wj1Jw1u9G6Zi9Xwf3duzuG
 4hwS1uxyftTr6K4PEWoJOzJLZJ85LyLQmt8Vxj7s9MtBJ9MOZvbAS918jDEKzK2Sjr9Y
 FNTJBx+Kumpc78uvJ6LtGa4Nfy2cbUwe/u67E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGTDxW/0FHkTpFMtVsyR5B6P9WvJldck4Y7e8f4Ze3U=;
 b=ezwAU+mGzDeYzgqDNBfzGMPodQ1hd5JYj0euhkzSjz2zhKk64tNyksrG2ZwBOSNm1j
 FVyEeqUq1BMSz37tNunFl075lqIgzKX4KKsoZgM5fq8wEsMqdLp/W6bvx6Q9ymq4P6ME
 sY/rb76WAm0Y8tjkZboS5I/l0PbYFWuOaKi14Ni9CBbQpuscNWAhzGjVRrEvfKk1/DQd
 iHZ78fncUmqovf+/o4a4bJ/eTWedp4qnStzB3GgpjbAzRDhptXXT/8QIKgH+Hre4LpPQ
 E4lXwCtUjafWu5GIzktwziVC2zj2p20kO+6fyU3pf/cM0bYOBuwnjElT7GA/b2lfPeix
 Nn+A==
X-Gm-Message-State: AFqh2kriTwahLRHnKkCzCyPj8T4sSahXSyKSbCguCwKenKcyLDoi57sh
 VCBLkRMJ33fuLsfONSif71N2og==
X-Google-Smtp-Source: AMrXdXuZigy/zru/JPuBsdufFzgVanTwnd5MnjJMthqYgQ2QWWfto7oDWypUHFrwOhAtKrANIAUG4w==
X-Received: by 2002:a17:902:8493:b0:194:3dce:deb5 with SMTP id
 c19-20020a170902849300b001943dcedeb5mr26778292plo.27.1674486779349; 
 Mon, 23 Jan 2023 07:12:59 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:12:58 -0800 (PST)
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
Subject: [RESEND PATCH v11 04/18] drm: exynos: dsi: Switch to
 devm_drm_of_dsi_get_bridge
Date: Mon, 23 Jan 2023 20:41:58 +0530
Message-Id: <20230123151212.269082-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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

devm_drm_of_dsi_get_bridge is capable of looking up the downstream
DSI bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_dsi_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index df15501b1075..4a165764121d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1470,18 +1470,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
-	struct drm_panel *panel;
 	int ret;
 
-	panel = of_drm_find_panel(device->dev.of_node);
-	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
-	} else {
-		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
-	}
-
+	dsi->out_bridge = devm_drm_of_dsi_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
@@ -1531,8 +1522,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	dsi->out_bridge = NULL;
-
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
-- 
2.25.1

