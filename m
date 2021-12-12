Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE7471C16
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 19:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F8C10EEC4;
	Sun, 12 Dec 2021 18:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBEB10EEC4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 18:15:06 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id z6so13034293pfe.7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcqL/1AAMwG1X29U8NMxgk5ik806Z4Dgf7qHxGXF4Tg=;
 b=CPENh9t1vAP9WmLzqrxhWEKk1mn0vRuQFlMZGpEHC4NNnzY8ORI3QOvUgJzTTX8IHw
 CcyKlsnMWirYiTR4zdzMPbwFvoTI9TxscK9l2eqPzXt94RyY8c6fyhlvKJeIo+3gQagJ
 0AUCGCZbvsZWSo50IDDPVbkhhcw9KyxxDRieY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcqL/1AAMwG1X29U8NMxgk5ik806Z4Dgf7qHxGXF4Tg=;
 b=GeIs291O6+USa+nVn+skmbr6Tz9gOJ3hVG/3aDlrc5Sfeps3001Y14vSkX7GIoOSNS
 T6CQkLZ0YPtZn1QCMq+aXfcC/Zplci1mBY3uVMEOlFsyLRAANLsRUBxOxSCMGTYdvxyW
 69089nDcZd9XZrRtG88LqafONEDuPjX+O4NFg0+5NRtk70qwAaUghRREjAe+Vgg8CimJ
 PWXKNWD9nga62KgCKqieO5twXVlRLDecv8U+L/fPH94WAkKCrWLEgdVY9Zi/KBckF6bY
 MSq3NT3RsUI4iWHBNafKjy1HxTm6LUayfRjSWQ4HzLTDa1JhstdPf/Hu22JwhiMyFQyb
 bXtw==
X-Gm-Message-State: AOAM530X6D41xC0PswOfMbglmHE76QNxuZbqpOrlG35PBl80lqc2Fcfw
 m3HntjQdsT5DE328gU+1HIvixA==
X-Google-Smtp-Source: ABdhPJx6/9AegMK5aFzLbN5WDI5Sb88RRupbYTCCqkgoobqg9Lo1mxjrbNpL5z0ItP3M+AtbiwPqtw==
X-Received: by 2002:a63:fc0a:: with SMTP id j10mr48421414pgi.36.1639332905452; 
 Sun, 12 Dec 2021 10:15:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:264b:de7a:bc69:cfbd])
 by smtp.gmail.com with ESMTPSA id bt2sm4567904pjb.33.2021.12.12.10.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 10:15:05 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 6/7] drm: exynos: dsi: Get the mode from bridge
Date: Sun, 12 Dec 2021 23:44:15 +0530
Message-Id: <20211212181416.3312656-7-jagan@amarulasolutions.com>
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

Now the exynos dsi driver is fully aware of bridge handling,
so get the display mode from bridge, mode_set API instead of
legacy encoder crtc.

This makes bridge usage more efficient instead of relying on
encoder stack.

Add mode_set in drm_bridge_funcs.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index feb36a5dc646..a2eb82bbb30f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -278,6 +278,7 @@ struct exynos_dsi {
 	u32 format;
 
 	int state;
+	struct drm_display_mode mode;
 	struct drm_property *brightness;
 	struct completion completed;
 
@@ -882,10 +883,9 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
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
 
@@ -1400,7 +1400,7 @@ static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
-	exynos_dsi_set_display_mode(bridge);
+	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
@@ -1430,6 +1430,15 @@ static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
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
@@ -1446,6 +1455,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_enable			= exynos_dsi_atomic_enable,
 	.atomic_disable			= exynos_dsi_atomic_disable,
 	.atomic_post_disable		= exynos_dsi_atomic_post_disable,
+	.mode_set			= exynos_dsi_mode_set,
 	.attach				= exynos_dsi_attach,
 };
 
-- 
2.25.1

