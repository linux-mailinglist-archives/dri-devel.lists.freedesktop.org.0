Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114FE49041F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5DA10E43C;
	Mon, 17 Jan 2022 08:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED38F10E430
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:42:51 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id s15so3831211pgs.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhmCFvkAszHgt3WyWtiQC+FGRY8uffNwxLOd3YDOkC8=;
 b=Q4hm+8MyyLofzr60UHp+MRyjT/eAZPM5zq5m03vOSW+wzi12BoqhaHRWYLzIX5hZOB
 P7eTaYMcdPU6dwI6vv5eMl5Yl1WzmKT85Gm8y6A7TFzQmtqMT0NmRgvhhv3MU4Rq/zTa
 cRDXbU5Ar+foxProc4ybWBrSZeYbV57OaNPds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhmCFvkAszHgt3WyWtiQC+FGRY8uffNwxLOd3YDOkC8=;
 b=Uyv10iRM/rt4TmT0jGQS9YIOSNZj/bQHtc7AJklelZ2AFp2mhdGlUplX2NLYD4vLvL
 iQiGW7u3xAL/yy05OemywoR2J2+VHe4qG5Fj+N9kxkm+0W74EZjXzCYF8twSofbsYJqJ
 QXiVgCbX19gyl1zYrd+3cGBRA7fwsfBFcY8h96ddNlseY2BqukgJ3wgPc9wwmFBxH4YI
 sIN9IC7Iid4AcsBEoF3x2ytTD61y+vK+HGj5Ax4fgyIaVzFpexrUMA2IuM5St9Ibnb55
 aUKiu7IvNGzcZkPd6AL1+niackU3LUdqnYzHRz599GIZxcIV1QIFEMvVoxrAkU/665/T
 Eg+w==
X-Gm-Message-State: AOAM532FbvXy/GIW0TvNupTyfupQEdJVsgphcds4gXQCvqsLxyNAWjmL
 re4Zhj1mCh1KG0+sYYYY8fpVr8vM1tKnxg==
X-Google-Smtp-Source: ABdhPJyUwCoOg/22/tnYwEJXoQtRj+Iga6a4pauRwjcxB25lBD8I6T0S9YtCX6HDacW5xtYp3uxnPA==
X-Received: by 2002:a63:7543:: with SMTP id f3mr18191438pgn.360.1642408971597; 
 Mon, 17 Jan 2022 00:42:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:955a:760d:bbf3:5d4b])
 by smtp.gmail.com with ESMTPSA id z3sm11763423pjq.32.2022.01.17.00.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:42:51 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v5 4/5] drm: exynos: dsi: Switch to atomic funcs
Date: Mon, 17 Jan 2022 14:12:24 +0530
Message-Id: <20220117084225.125868-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117084225.125868-1-jagan@amarulasolutions.com>
References: <20220117084225.125868-1-jagan@amarulasolutions.com>
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
Changes for v5, v4, v3:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 8ca95c72ef18..891b5c984f0c 100644
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
+				     struct drm_bridge_state *old_bridge_state)
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
 
@@ -1442,10 +1446,13 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
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
@@ -1624,7 +1631,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 
-	exynos_dsi_disable(&dsi->bridge);
+	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
-- 
2.25.1

