Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57742470A42
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0279110EC90;
	Fri, 10 Dec 2021 19:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D65D10EC90
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 19:20:46 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id f125so8920560pgc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LJL7M/YkR4k8VZB5K5AMyhwtJ9pwnvBOZ1XLM0mNSl0=;
 b=Y+rDwOdMkIKVZHlOc0oabo2HQ1KoEFMMnhdgJ6y4FwoME1K9vbyDUP8ljbTzLirHwY
 Vz/Xs1j+pwB3ZOzCOWlQDDblmjlO/fsihecLgMRoHvqh5TKrDacfFI9WV9M1Wp01ltAI
 2lfddpokK7KlRszjKcEDCke0uf8IEhi9rjWtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LJL7M/YkR4k8VZB5K5AMyhwtJ9pwnvBOZ1XLM0mNSl0=;
 b=AdnRoeaxMz/a9VnlDqhHRJnADNP3KlyALaHfaAZGcYZFdsHDuklmRFUss1oOyIdOyM
 RMU1I1RUzn/hIvuclhgQasCaPHnLSw8nGle5LFj7u4xY0CEPPr0liy4qTMqodFvqxHWX
 Vi/NXQJ2KtgK60yWmqUko1MSOrtvkLcjkDYCaqaLK/lU4vbu5POgAshVmxB/iU/Uo+Iv
 c3e7e2FuUkrAXsrzzxOJEK90djxpxWRadO3ggzFtLP/YW8xF+csTTiCi7QZNgwFjuxaV
 3F6eUaExq2VzoC+jPuPzHyrAEamGs24VQoXPst/cLIEYUwyOS0Y8LEq5qUfnethdudi5
 p/VQ==
X-Gm-Message-State: AOAM5324TaYEBohbq5ZVWZQH8KrVwrnoWnKQ4V6ZjwgqxKlPpjgXlcfE
 TADAH0Vd52VoHJ4hY0ICXd1KKN31wbpV6cjx
X-Google-Smtp-Source: ABdhPJwAkCsiYeobS7ekhkjzLm34JPfTh+rXROd2+Lzo6YxPBFLp7P7MD/M6OnDGCrO3x9E0FgTojg==
X-Received: by 2002:a63:4f42:: with SMTP id p2mr41362855pgl.381.1639164045711; 
 Fri, 10 Dec 2021 11:20:45 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id o62sm3493022pfb.211.2021.12.10.11.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 11:20:45 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 4/4] drm: exynos: dsi: Switch to atomic funcs
Date: Sat, 11 Dec 2021 00:49:22 +0530
Message-Id: <20211210191922.2367979-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210191922.2367979-1-jagan@amarulasolutions.com>
References: <20211210191922.2367979-1-jagan@amarulasolutions.com>
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
Changes for v2:
- new patch 

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 37ad94b563c4..f2c12a356952 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1372,7 +1372,8 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_enable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
@@ -1390,19 +1391,20 @@ static void exynos_dsi_enable(struct drm_bridge *bridge)
 	dsi->state |= DSIM_STATE_ENABLED;
 
 	if (dsi->out_bridge)
-		funcs->pre_enable(dsi->out_bridge);
+		funcs->atomic_pre_enable(dsi->out_bridge, old_bridge_state);
 
 	exynos_dsi_set_display_mode(bridge);
 	exynos_dsi_set_display_enable(dsi, true);
 
 	if (dsi->out_bridge)
-		funcs->enable(dsi->out_bridge);
+		funcs->atomic_enable(dsi->out_bridge, old_bridge_state);
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 	return;
 }
 
-static void exynos_dsi_disable(struct drm_bridge *bridge)
+static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
@@ -1413,12 +1415,12 @@ static void exynos_dsi_disable(struct drm_bridge *bridge)
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
 	if (dsi->out_bridge)
-		funcs->disable(dsi->out_bridge);
+		funcs->atomic_disable(dsi->out_bridge, old_bridge_state);
 
 	exynos_dsi_set_display_enable(dsi, false);
 
 	if (dsi->out_bridge)
-		funcs->post_disable(dsi->out_bridge);
+		funcs->atomic_post_disable(dsi->out_bridge, old_bridge_state);
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
@@ -1433,8 +1435,11 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
-	.enable			= exynos_dsi_enable,
-	.disable		= exynos_dsi_disable,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_enable		= exynos_dsi_atomic_enable,
+	.atomic_disable		= exynos_dsi_atomic_disable,
 	.attach			= exynos_dsi_attach,
 };
 
@@ -1605,7 +1610,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 
-	exynos_dsi_disable(&dsi->bridge);
+	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
-- 
2.25.1

