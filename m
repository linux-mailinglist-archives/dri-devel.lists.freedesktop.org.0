Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B7471C17
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 19:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF9810EED7;
	Sun, 12 Dec 2021 18:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A69E10EED7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 18:15:10 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so11573122pjq.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFCMhVXTF6/uuspSPtdl/2kwHfDa2KBaiMMJzN8Xns8=;
 b=rvx7uEYsWLwr7XSuNRN8WFUCSQSvuKhdIyPDSAsN6HG1b0N9nwMRr9geMUBD9Fh/iz
 Vn61Q43LpmIQTF4xw/TSnkKNzmq3Rdo8ZbcnlMSU/KyyEnt6NijgTkeUKXZtDU1fAbyQ
 RujeeNdUgTBMTcRje/a6O9dp/9N3Ofc4VxAt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFCMhVXTF6/uuspSPtdl/2kwHfDa2KBaiMMJzN8Xns8=;
 b=3+fzRakGDdoASjLsKGDmsCZbvsylk+BySElmsU6G0bgX4yktctWwK6AsOK1g5pvnAD
 TLFaSiwqL7hIHUVOaAavWJEnrTSbf/SUxCDi22NapMpLYMGCJGbKnGx0RkpECUxKouAL
 R+4lQeAUt+hIXGVtzWRoIYwsCJDLa1i8n/sQOKBSmLHDiMHgwFmQZyq66FbwrSna4N6C
 6uWfIOWMRdwNCWcptEYX2KuPZ970gsu1LC9BNPpXqNs6SjaU/XR20i2TrByVuSJoMzpJ
 i2bSl3vaQXKtcBlR9gEWah3X5ws1dfsaI2mjelJe/9htXbgKKwesED3zhGC7QF5PxpAM
 WJ+A==
X-Gm-Message-State: AOAM532RBkg71Y1NQmNob4XLAp8X4gdVDBG4OZRfik65FzR36qjZjJbh
 m34KZX5NS/E7SNUxPjQ21XriNg==
X-Google-Smtp-Source: ABdhPJzeU96sXDeL8kaWuW4KDxH9l0yAba3NYA4BbQ7lLwXWL+kB4voDz2DS6rtMqYs+f20ILS5VUw==
X-Received: by 2002:a17:90b:3848:: with SMTP id
 nl8mr38148602pjb.221.1639332910224; 
 Sun, 12 Dec 2021 10:15:10 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:264b:de7a:bc69:cfbd])
 by smtp.gmail.com with ESMTPSA id bt2sm4567904pjb.33.2021.12.12.10.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 10:15:09 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 7/7] drm: exynos: dsi: Move DSI init in bridge enable
Date: Sun, 12 Dec 2021 23:44:16 +0530
Message-Id: <20211212181416.3312656-8-jagan@amarulasolutions.com>
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

Host transfer in DSI master will invoke only when the DSI commands
sent from DSI devices like DSI Panel or DSI bridges and this host
transfer wouldn't invoke I2C based DSI bridge drivers.

Handling DSI host initialization in transfer calls might miss the
controller setup for I2C configured DSI bridges.

So, move the DSI initialization from transfer to bridge enable as
the bridge enable API as it is common across all classes of DSI
device drivers.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index a2eb82bbb30f..29d4eaaff5e8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1399,6 +1399,14 @@ static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
 				    struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	int ret;
+
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = exynos_dsi_init(dsi);
+		if (ret)
+			return;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
 
 	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
@@ -1539,13 +1547,6 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = exynos_dsi_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
-
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
 		return ret;
-- 
2.25.1

