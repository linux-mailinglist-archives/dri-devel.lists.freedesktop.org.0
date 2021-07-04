Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB73BAC60
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4421A89DB7;
	Sun,  4 Jul 2021 09:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853B189DB7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:05:42 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id m15so3708490plx.7
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5qWzL2bKwutF1snBeXJY/GnIGl0Ar3EOZLIKhQCIAh4=;
 b=Oo3Nk58YdvdURePtE0A7QW6obKZfXKex7+wBc9i8v5TQENN/LUYRIJUSlbNHgEnkON
 abd5uo+wxuBwtinmgxUVoLRV0Ho70wBjkOtlvN+rYI/1SGCkcEZcqR3J3Rr1QWXSdjJI
 n/0NwutFDWwsnfswCl28VErN0Y6ONWtmdprzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qWzL2bKwutF1snBeXJY/GnIGl0Ar3EOZLIKhQCIAh4=;
 b=Bu87suFCKtjxVvnFvme8mfmneCFJ/Hy9S1aUv3C6plSQKfk9T9jws4XpdUNGfXMtDz
 I+4/D0nH1/ck5ipL84xzlz+eKIzHwh9uoztKmwri1AUkrNWxBfYWrcE7VopfAwtEt0k/
 vLFe27p0TH/ZzIdkVcE9p3vM9W9uaFd+XGmNl9jztMim1elbQhmNspB+iZlKtBV6QsMP
 4Evkdx12RM8ZjbPW922IYbGe4VHb7j/IY0w1RMBkLjkCAeGbYNL3hvpglHB5LhGlm599
 az6uGiL0ky8nIcbIDaGCOq0Pzedzlj8PIIyEf1YnFEzzCqTltYugE/9RcyhbJnNr7M1m
 tueg==
X-Gm-Message-State: AOAM5323+GAh/0NN0augw1LR5rkmh0oP4VNKOl2tTX7nvPbcuVj0WDQB
 ogc3m0Ps0Q69Ox9HUOrCRpT3zw==
X-Google-Smtp-Source: ABdhPJwrr2bLufFMR1N9V6dDMRURHUV45B3uXg9T7mcdXyFKlOG+lid6Z/lIEpZKE9V5Cq0fISQDEw==
X-Received: by 2002:a17:902:b210:b029:11a:bf7b:1a83 with SMTP id
 t16-20020a170902b210b029011abf7b1a83mr7353036plr.84.1625389542152; 
 Sun, 04 Jul 2021 02:05:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:05:41 -0700 (PDT)
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
Subject: [RFC PATCH 15/17] drm: bridge: samsung-dsim: Move DSI init in bridge
 enable
Date: Sun,  4 Jul 2021 14:32:28 +0530
Message-Id: <20210704090230.26489-16-jagan@amarulasolutions.com>
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

Host transfer in DSI master will invoke only when the DSI
commands sent from DSI devices like DSI Panel or DSI bridges
and this host transfer wouldn't invoke I2C based DSI
bridge drivers.

Handling DSI host initialization in transfer calls might miss
the controller setup for I2C based DSI bridges.

So, move the DSI initialization from transfer to bridge enable
as the bridge enable API as it is common across all classes
of DSI device drivers.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bc845ae100d4..54767cbf231c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1437,6 +1437,13 @@ static void samsung_dsim_bridge_enable(struct drm_bridge *bridge)
 
 	dsi->state |= DSIM_STATE_ENABLED;
 
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = samsung_dsim_init(dsi);
+		if (ret)
+			return;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
+
 	samsung_dsim_set_display_mode(dsi);
 	samsung_dsim_set_display_enable(dsi, true);
 
@@ -1602,13 +1609,6 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = samsung_dsim_init(dsi);
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

