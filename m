Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D696471C15
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 19:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1411810EE23;
	Sun, 12 Dec 2021 18:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD0D10EE23
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 18:15:00 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id gt5so10362561pjb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1uoqDXeyfdCAC0lQdnBUabP+VrBthgp4IIjRoUqZK8=;
 b=q9mnqUDFxeqH9Ya4oU2VQ1uN9bM6gIWwCLeRLoUe00cxHUNwEuOBylNBddDbCVvpGC
 MKH4DWo36XG3mPB2cTVidM2+6ST+oMjp3+GV+XRvF6yNm74fPZIePEK1pUTG9OYCMJrU
 OZt9+p7uV90jkJIT9/koAYMP6PB6lGLdodlds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1uoqDXeyfdCAC0lQdnBUabP+VrBthgp4IIjRoUqZK8=;
 b=PKe2nar4PaA6DlYiqVNCb5TKTJwk8+dW8JPTmvAdEvaH8I5tQHPRRMaC7YSWZUflPZ
 J+mZQyOFmaWFuPlJepLn8XV3Evs1agW8DZH6yuD9rJZPO6xGHamTNJUVoxdPrQ/6LTKd
 yt/7AIYUCW9KD38Ny6NjwXU2mA2kscnwFLnH9wp9X9sAQlJELWeRgSXqAFISzXF0PuPH
 G5oRo4yddgrI4qVDHexwrylqbcdZCEpgIGldJQkxoJ3fpHktsWtCZ9aRvxlycpHMSneD
 jlaDGIL83LfGU6eIiWqVmZdb6NKf3Ko7QsmSB7VeaUdaaP8IIOP5Mrv6ULT7tHmg37P4
 scqA==
X-Gm-Message-State: AOAM530ArtIt1Br4mynkV5QnnX2HmOJ/ax3SE7/RKruvZgl2FMlOpTHt
 n9Ktz08mVMpqukuYPSsKZ6EHKTCqWVUvUQ==
X-Google-Smtp-Source: ABdhPJwWOTfM0SpKcJEg2HNFrGXXO01q5g1c/NFp+aFnauNIwCbM8sLKq54g98y2MkIuWGi90+j+Cg==
X-Received: by 2002:a17:90a:9a8e:: with SMTP id
 e14mr38986185pjp.231.1639332900479; 
 Sun, 12 Dec 2021 10:15:00 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:264b:de7a:bc69:cfbd])
 by smtp.gmail.com with ESMTPSA id bt2sm4567904pjb.33.2021.12.12.10.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 10:15:00 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 5/7] drm: exynos: dsi: Switch to atomic funcs
Date: Sun, 12 Dec 2021 23:44:14 +0530
Message-Id: <20211212181416.3312656-6-jagan@amarulasolutions.com>
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

The new support drm bridges are moving towards atomic functions.

Replace atomic version of functions to continue the transition
to the atomic API.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 07083a545948..feb36a5dc646 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1377,7 +1377,8 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
@@ -1394,7 +1395,8 @@ static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
 	dsi->state |= DSIM_STATE_ENABLED;
 }
 
-static void exynos_dsi_enable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1406,7 +1408,8 @@ static void exynos_dsi_enable(struct drm_bridge *bridge)
 	return;
 }
 
-static void exynos_dsi_disable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1416,7 +1419,8 @@ static void exynos_dsi_disable(struct drm_bridge *bridge)
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
-static void exynos_dsi_post_disable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1435,10 +1439,13 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
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

