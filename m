Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55AD475608
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFFF10E467;
	Wed, 15 Dec 2021 10:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690FA10E467
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:16:02 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id g19so20300189pfb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUe7iWsFUanDnWU/hqGWtr7c387T6EcARkQ4NxMuaBw=;
 b=qOZAhpjKUojTrw7Mp6hk86Dut3qnZ+vwYEiNUZRCNp5koR3yknOQVLMiS5qS7gavfg
 K1r+urPleVnz74S943d7yhDnRa3+EU2qiX2uhq4/MQio1QYoM/rjepZj2bf4MRZy0k/R
 YYrC6TrhzQncz1oFPG+AsZFPs4eK40PGJXm1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUe7iWsFUanDnWU/hqGWtr7c387T6EcARkQ4NxMuaBw=;
 b=zO1iuXXnL6mQGqgTVbb6LEaPhBWcJB9ntoMYOp2wlOUMdGTOgc1Mz1qMz6ZYlwR7pG
 vDgRuBEXj4pCmqHPxXG49EpdsXXYVDLhFw/+ym7WD/XSz2bBHCKhMHw8xgIwZlLzDTKG
 QDXc9ri1ECfteiWtIkAZDoyUX5SDFEFo5u/IpEA87qT2OCCNiQBlovOEJcgAhaOL90r1
 ZcNRwLo+5mL22/LyfBWbKkh4OyPB7qK53JwsoxwjdUFN1N42Quf4b+oYBqj+1LWdJl+8
 1+njObIPlRrDjZxeg8Fr/LIcxV2sPcSogYAOnAYzy3pAFGtiSmy4nTCzXjfrhV3cMh3H
 qWPQ==
X-Gm-Message-State: AOAM531U6X0ucUJMqT1R3f57JEgCPLg5SY4j8NoPgfbBuDXCNvZrzdlz
 FOZnl/ddiASR6UQaGhIVpeTGuw==
X-Google-Smtp-Source: ABdhPJzvr75GqA0vspIVHArvX8FJPznf4y4JKEy9+S9GVbtl3I6PkfRrfgeC22EcyUJCJclkeLbsew==
X-Received: by 2002:a65:6a45:: with SMTP id o5mr7516185pgu.273.1639563362025; 
 Wed, 15 Dec 2021 02:16:02 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:a7:8328:d9c4:5bc9])
 by smtp.gmail.com with ESMTPSA id
 v11sm2408149pfu.184.2021.12.15.02.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:16:01 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v4 5/6] drm: exynos: dsi: Get the mode from bridge
Date: Wed, 15 Dec 2021 15:45:33 +0530
Message-Id: <20211215101534.45003-6-jagan@amarulasolutions.com>
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

Now the exynos dsi driver is fully aware of bridge handling,
so get the display mode from bridge, mode_set API instead of
legacy encoder crtc.

This makes bridge usage more efficient instead of relying on
encoder stack.

Add mode_set in drm_bridge_funcs.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4, v3:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 983e7cb65e2a..774ca265ed3b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -276,6 +276,7 @@ struct exynos_dsi {
 	u32 format;
 
 	int state;
+	struct drm_display_mode mode;
 	struct drm_property *brightness;
 	struct completion completed;
 
@@ -880,10 +881,9 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static void exynos_dsi_set_display_mode(struct drm_bridge *bridge)
+static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
-	struct drm_display_mode *m = &bridge->encoder->crtc->state->adjusted_mode;
+	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
 	u32 reg;
 
@@ -1398,7 +1398,7 @@ static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
-	exynos_dsi_set_display_mode(bridge);
+	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
@@ -1428,6 +1428,15 @@ static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static void exynos_dsi_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+
+	drm_mode_copy(&dsi->mode, adjusted_mode);
+}
+
 static int exynos_dsi_attach(struct drm_bridge *bridge,
 			     enum drm_bridge_attach_flags flags)
 {
@@ -1444,6 +1453,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_enable			= exynos_dsi_atomic_enable,
 	.atomic_disable			= exynos_dsi_atomic_disable,
 	.atomic_post_disable		= exynos_dsi_atomic_post_disable,
+	.mode_set			= exynos_dsi_mode_set,
 	.attach				= exynos_dsi_attach,
 };
 
-- 
2.25.1

