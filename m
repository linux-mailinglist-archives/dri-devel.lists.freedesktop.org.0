Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12D4CC2F6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B458110EAB2;
	Thu,  3 Mar 2022 16:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F5B10EA7F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:38:27 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id s11so5094859pfu.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6JVjelDqCtnq6rwBigOzoJDvHv6ras97xpKYaywy2gI=;
 b=RNhMYmsgGESfWIzd4UgXcxT7GqIh+TV5sHhDN0bQcZSK3yDBkzkgfWeUcjFRjbrKHZ
 c/pVpkJwmzj9cexQnClrGaDcluo8q6W6TIlKWuu/YUR1kTPOtU33UVi1xxmHhdIx6k+o
 t0CaY9MCkOvKpuExhZ8o8FA9u3ScSUtVCq82o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6JVjelDqCtnq6rwBigOzoJDvHv6ras97xpKYaywy2gI=;
 b=PtKwuMghHnqIsYr5Y7SzQ01QUlOmUHggM1SNY5jdwUFfNgiCuaVhdZDVr5BXLuMWff
 mxDHRbPLSoZvy4kethw6+zscyx+5xyBVXzl2eaijVuGeLKbgGfvyh2+RJiwmieA3fiRP
 MBQQaCWe2L2RblnZ78c8Tr3yuwxIlAPu+yl4neqzq+qO3uYA3cS+EBRAlRR49PuTjItC
 ih+ZP9iJkyYy1NiUCIDSjgmPNlOCE1gPIwA9ORur1dUG27iqL8EAtEPTxUY5frCvQ1Qq
 xzBK8/KIzK1++p3ZniucamddT66t1Ha+Maf97/ZSQCRvq4l7ldF3yT7yJtKtvLFsAWAY
 Kjgw==
X-Gm-Message-State: AOAM530T6L63LFgv28o1HAMGX/O9XH0b6J4AbTR7fX4kVmx32jv3JvSO
 JMwfvPVrBtPN1uCYvm260Ny+uA==
X-Google-Smtp-Source: ABdhPJyIqRBUAgfDRLoFR4F2KMVGTWTm6KfEtqg0Dsl4wlljmo9/amNwln99BZEayjte0/9O7CXzCg==
X-Received: by 2002:aa7:8432:0:b0:4f6:6dcd:4f19 with SMTP id
 q18-20020aa78432000000b004f66dcd4f19mr4057761pfn.53.1646325507004; 
 Thu, 03 Mar 2022 08:38:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:4526:5253:a010:63f4])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056a00235400b004e192221ec2sm3220983pfj.14.2022.03.03.08.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 08:38:26 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v6 6/6] drm: exynos: dsi: Switch to atomic funcs
Date: Thu,  3 Mar 2022 22:06:54 +0530
Message-Id: <20220303163654.3381470-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303163654.3381470-1-jagan@amarulasolutions.com>
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
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
Changes for v6, v5, v4, v3:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 59a4f7f52180..06130eee8df8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1358,7 +1358,8 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
@@ -1375,7 +1376,8 @@ static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
 	dsi->state |= DSIM_STATE_ENABLED;
 }
 
-static void exynos_dsi_enable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1387,7 +1389,8 @@ static void exynos_dsi_enable(struct drm_bridge *bridge)
 	return;
 }
 
-static void exynos_dsi_disable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1397,7 +1400,8 @@ static void exynos_dsi_disable(struct drm_bridge *bridge)
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
-static void exynos_dsi_post_disable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1425,10 +1429,13 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
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
 	.mode_set			= exynos_dsi_mode_set,
 	.attach				= exynos_dsi_attach,
 };
@@ -1597,7 +1604,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 
-	exynos_dsi_disable(&dsi->bridge);
+	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
-- 
2.25.1

