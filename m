Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C193A475607
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7907910E468;
	Wed, 15 Dec 2021 10:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9884B10E466
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:15:58 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id l10so8826217pgm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZAOBOL9rgasMXWW86nZAQEbYkZElrISjQDknTY4WUs=;
 b=HiXQKeySCP4xFs08WXmIGX9WG2sFio34vRXCZN/L+MLgckVf2ft72x+8kH3n0/FmYe
 0mCzHkoJDMHsi7rOCKZWr/E2nMQ5FDN3lqGsvyB7acskK0/oD2N1i0VCOQJJJliiy7RI
 aCXIBu2w5UftouAkAOmE1hHXklhEzpxtL8JBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZAOBOL9rgasMXWW86nZAQEbYkZElrISjQDknTY4WUs=;
 b=dV9rpxeH8qCXsqVnRM5UwLSdRKWGllLagR2moWgvNAcBZiGsRC/nyx2xO8l2T7V7E6
 lc57GulgVir3IsqbSGdxkT4P6Wp6eL01QJdCuzorDEHOI/i5EaRR2x+kMOJEf7iYhpY+
 JJxIx9fMK4vp+hc9ZKj62pxvW2c6FIAZ1hkTII/5c6be4GJcPlMw3rjJO7A4Zh5yeUps
 fivegnWNMaqqVNSHTjTN69D3GfP6oVPbF6A63K2+vDl598eDu5NPt7OxJejSuoDjcMPV
 6nqwpUnNs2SDnqmq4H6tW1uX/sBnsHkuzWROUvcPhHVj3qRWgHCY4bV7Jmy2fSd9DPaw
 9UjQ==
X-Gm-Message-State: AOAM532qfwPVEOjBRc8sNpGisNYCpequBAvVT6FsBo8rpPwM61ge+afg
 eWnMPFIJBwlkUq3BVFpxsWH7Lmlf26ltiuVQ
X-Google-Smtp-Source: ABdhPJybINKS/ME1WXbZYn71YqGLJAYv9NUEhFtYem8rY3Qr9vITGMJawYrz/kdORUOYNdq/Nri9cQ==
X-Received: by 2002:a63:2b88:: with SMTP id r130mr7480830pgr.80.1639563358174; 
 Wed, 15 Dec 2021 02:15:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:a7:8328:d9c4:5bc9])
 by smtp.gmail.com with ESMTPSA id
 v11sm2408149pfu.184.2021.12.15.02.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:15:57 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v4 4/6] drm: exynos: dsi: Switch to atomic funcs
Date: Wed, 15 Dec 2021 15:45:32 +0530
Message-Id: <20211215101534.45003-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215101534.45003-1-jagan@amarulasolutions.com>
References: <20211215101534.45003-1-jagan@amarulasolutions.com>
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

The new support drm bridges are moving towards atomic functions.

Replace atomic version of functions to continue the transition
to the atomic API.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4, v3:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 29c68379e6be..983e7cb65e2a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1375,7 +1375,8 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
@@ -1392,7 +1393,8 @@ static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
 	dsi->state |= DSIM_STATE_ENABLED;
 }
 
-static void exynos_dsi_enable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1404,7 +1406,8 @@ static void exynos_dsi_enable(struct drm_bridge *bridge)
 	return;
 }
 
-static void exynos_dsi_disable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1414,7 +1417,8 @@ static void exynos_dsi_disable(struct drm_bridge *bridge)
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
-static void exynos_dsi_post_disable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1433,10 +1437,13 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
-	.pre_enable			= exynos_dsi_pre_enable,
-	.enable				= exynos_dsi_enable,
-	.disable			= exynos_dsi_disable,
-	.post_disable			= exynos_dsi_post_disable,
+	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable		= exynos_dsi_atomic_pre_enable,
+	.atomic_enable			= exynos_dsi_atomic_enable,
+	.atomic_disable			= exynos_dsi_atomic_disable,
+	.atomic_post_disable		= exynos_dsi_atomic_post_disable,
 	.attach				= exynos_dsi_attach,
 };
 
@@ -1614,7 +1621,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 
-	exynos_dsi_disable(&dsi->bridge);
+	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
-- 
2.25.1

