Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C33471C14
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 19:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DC210EE8D;
	Sun, 12 Dec 2021 18:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F90D10EE23
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 18:14:56 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id u11so9679755plf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZnu0zKaPclw3wwWZgzYVVA3tXdVJCczsVmIaW/074w=;
 b=kXX2vyw6LO6d3BkBokxSp+Zvx3ONJ0uJf4bZvPVnS3klFjtnimsd0RZv+h64BlQoQJ
 NhWf8TeiFsYge1iikCZnFDGGz7uaGoXNq2DBPLXHJgqO9FnbaEoXIlaMKcDfXYhG5WKw
 ac6HQJm7xP23J6PJq+Nc4vjkSWAgWLz7upIlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZnu0zKaPclw3wwWZgzYVVA3tXdVJCczsVmIaW/074w=;
 b=v561ktPHLxoP2hfjHV3mFUcGnJ0+tl5vf7DjmVUCBWk/ZpU5Rsf06LmLhv5YH41XyU
 ffCCkvQnlcAYkL9DWYCJ16ib8rgyiwc12cTwgCIdcxRSwnVnHtUq9T96UhKg7irOG3DB
 e5Fs2lUCuRZZx1+J3ziKiqI37OVqhVEqfcrFIVzxMkWQn1IU46Xk+yXLG0EXmM90+YBB
 x7H2uVYYTYaNERw3CZogvwE9xhSy7n4kjENchGkkrOCMHcqQntJ/Ad3K2xAmXYWraYNZ
 HlhVKUyVTCI0Z11TrfrgFDlHiWVUeevomoXEMLL8jBm+U3fnJhNZsM+dZ/Tj3Z5BN0FC
 +3JA==
X-Gm-Message-State: AOAM532Sc76N0RZ4FmfDmj2UmkgaFaiz91RhzWWZLgRqe2Xsj7/++ACa
 dYhRAK/3P9hEL13ozc/69knlbQ==
X-Google-Smtp-Source: ABdhPJzySeFHnv/U+xB2o0nxo/Iw7YJDe7BDLsqpqRarg6I2lmKaKGhLpNxZZAO2ZJBFxoC3oMGQaQ==
X-Received: by 2002:a17:902:ab47:b0:141:95b2:7eaf with SMTP id
 ij7-20020a170902ab4700b0014195b27eafmr89136606plb.40.1639332895973; 
 Sun, 12 Dec 2021 10:14:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:264b:de7a:bc69:cfbd])
 by smtp.gmail.com with ESMTPSA id bt2sm4567904pjb.33.2021.12.12.10.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 10:14:55 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 4/7] drm: exynos: dsi: Separate pre_enable,
 post_disable code
Date: Sun, 12 Dec 2021 23:44:13 +0530
Message-Id: <20211212181416.3312656-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211212181416.3312656-1-jagan@amarulasolutions.com>
References: <20211212181416.3312656-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Existing driver is calling manual bridge pre_enable, enable,
disable and post_disable helpers with their enable and
disable functions.

Separate the enable code with pre_enable and enable helpers
like enable the DSI in pre_enable and set the display in enable.

Separate the disable code with disable and post_disable helpers
like disable the DSI in disable and reset the display in
post_disable.

This way the bridge functions are compatible with respective
downstream bridge and panel_bridge drivers.

Example of enable bridge function calls with panel_bridge is,

[ 2.079030] panel_bridge_pre_enable: start
[ 2.079043] panel_bridge_pre_enable: end!
[ 2.079045] exynos_dsi_atomic_pre_enable: start
[ 2.079723] exynos_dsi_atomic_pre_enable: end!
[ 2.079728] exynos_dsi_atomic_enable: start
[ 2.102500] exynos_dsi_atomic_enable: end
[ 2.146505] panel_bridge_enable: start
[ 2.148547] panel_bridge_enable: enable

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 1450187c1edc..07083a545948 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1377,10 +1377,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_enable(struct drm_bridge *bridge)
+static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
-	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
@@ -1393,38 +1392,36 @@ static void exynos_dsi_enable(struct drm_bridge *bridge)
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+}
 
-	if (dsi->out_bridge)
-		funcs->pre_enable(dsi->out_bridge);
+static void exynos_dsi_enable(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
 	exynos_dsi_set_display_mode(bridge);
 	exynos_dsi_set_display_enable(dsi, true);
 
-	if (dsi->out_bridge)
-		funcs->enable(dsi->out_bridge);
-
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
+
 	return;
 }
 
 static void exynos_dsi_disable(struct drm_bridge *bridge)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
-	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
+}
 
-	if (dsi->out_bridge)
-		funcs->disable(dsi->out_bridge);
+static void exynos_dsi_post_disable(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
 	exynos_dsi_set_display_enable(dsi, false);
 
-	if (dsi->out_bridge)
-		funcs->post_disable(dsi->out_bridge);
-
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
 }
@@ -1438,8 +1435,10 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
+	.pre_enable			= exynos_dsi_pre_enable,
 	.enable				= exynos_dsi_enable,
 	.disable			= exynos_dsi_disable,
+	.post_disable			= exynos_dsi_post_disable,
 	.attach				= exynos_dsi_attach,
 };
 
-- 
2.25.1

