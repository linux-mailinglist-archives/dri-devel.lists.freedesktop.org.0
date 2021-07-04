Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E83BAC42
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A2789D4D;
	Sun,  4 Jul 2021 09:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD44989D4D
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:04:40 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso9460556pjp.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4/t/yuyJpK03/e85JwmT4sPri76hH2e7sinXKHn6Jm4=;
 b=PBfEFr1BFMVjj3B+E0cmJ2WWmRzElaTVeIW2FUDP67VEsqTV2t4doQ/laPx33w01ZZ
 QLkKZPLV88HMSQWHmWGqufXpWw6dHjL2B6Zf4xwMHSm8DB1Rh0y3enlxGz/w/DcGkIip
 tjR3OU0WtVrMK2ooLVJLQc1P87TGWNHy+uWHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4/t/yuyJpK03/e85JwmT4sPri76hH2e7sinXKHn6Jm4=;
 b=I9LJXb84dxznIOMfbmumfJJnm6pt8gY3ZxfFqm4b7xbei1zGLEOMyczkoyPVPe3t9N
 bBP30MdzhLAXocgNgfdoxDGreLMXBZ2bWteVqE+FDk4pHXSLBs2YzVrFcTIAnt5LQRtU
 fhm1Wym2ER8BkFq3RBvgee6os0RuY5fxde866Of25tjrP1zh5rtgjKvNPVSuz1w7f51N
 ZkxTuenAby/ahPA6K0HqoW8jZdngAnPWSk3BMGnbprdP6nAmvalzxrIw+Wj8cklenjFf
 XYjGgO8f7wCoYhjPrdgZm0tMkkfeGfBsCJ6PSSA+IJMc5SjWdQ7GWWAXfGOJ5WPLMs6R
 rAVw==
X-Gm-Message-State: AOAM531GB9XDjfQ2RPCiZ5YOLmuXWMuKBOXwOXWlsj11N8AS11IMp2OG
 jLVBEz50OSc/83U+9XwIkL9X5A==
X-Google-Smtp-Source: ABdhPJy77aPWv0aLk8PVV9lGvo6WZzNRAOw/jXfAWvLysS/qv7rPpqLNr9aOcMxLgr7szCl4Cxz56A==
X-Received: by 2002:a17:90a:d598:: with SMTP id
 v24mr8316714pju.185.1625389480337; 
 Sun, 04 Jul 2021 02:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:04:39 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 05/17] drm/exynos: dsi: Get the mode from bridge
Date: Sun,  4 Jul 2021 14:32:18 +0530
Message-Id: <20210704090230.26489-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now the exynos dsi driver is fully aware of bridge
handling, so get the display mode from bridge, mode_set
API instead of legacy encoder crtc.

This makes bridge usage more efficient instead of relying
on encoder stack.

Add mode_set in drm_bridge_funcs.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d828be07c325..99a1b8c22313 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -275,6 +275,7 @@ struct exynos_dsi {
 	u32 format;
 
 	int state;
+	struct drm_display_mode mode;
 	struct drm_property *brightness;
 	struct completion completed;
 
@@ -881,7 +882,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 
 static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 {
-	struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
+	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
 	u32 reg;
 
@@ -1411,6 +1412,15 @@ static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static void exynos_dsi_bridge_mode_set(struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       const struct drm_display_mode *adjusted_mode)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+
+	drm_mode_copy(&dsi->mode, adjusted_mode);
+}
+
 static int exynos_dsi_panel_or_bridge(struct exynos_dsi *dsi,
 				      struct device_node *node)
 {
@@ -1451,6 +1461,7 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.enable = exynos_dsi_bridge_enable,
 	.disable = exynos_dsi_bridge_disable,
+	.mode_set = exynos_dsi_bridge_mode_set,
 	.attach = exynos_dsi_bridge_attach,
 };
 
-- 
2.25.1

