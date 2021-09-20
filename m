Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006A412915
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 00:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4B56E89E;
	Mon, 20 Sep 2021 22:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75D66E89E;
 Mon, 20 Sep 2021 22:53:34 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id m26so17659626pff.3;
 Mon, 20 Sep 2021 15:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vCz18209aZjxX68VY6I5xMHLRD2Ccy0UqHFvYku0NNA=;
 b=H5WoUKZoRCGn0F5IG7ChSePrGH/W1GoC/gJahDMQdRC6+76rieWJbM2hgS8eb1nehK
 SDoiUiq9YPC32FhftznNSOvLcmT5v3qY2/i/80Xe1fi/aul4Dx1Zz2mcd1JKPQXESRj+
 qCklL2OzveRCh/yRG/O6jLy1du5vRP8w5gzVe/PXYbkj6I/BxiV3Q/6D8s3+yAxyTAuc
 AjKRFBuZDOHB1KO5NZd+YsRKx6aIr2cEGsLeXNkmHYx2plJY5jkKzNIl8/MFDJ7XYAL8
 /lu32PG1iKZxpFu/AuEn8PQdylwGUKwKuLgTllWkje0lvnly7aqqo4qngLTmt8MTHTPi
 TcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vCz18209aZjxX68VY6I5xMHLRD2Ccy0UqHFvYku0NNA=;
 b=pNfgKvCVdnOFdsv0Tv0Q/UuZ6J35OVyMDx3B0JESAX9aLGj6QT/aCix+T4DEG+xaq/
 ctoFPfpA4vMPl7QaBLQLE/xgVi3Ag3+8ZLr5dOBWEZFI9dszdlUd2GJmUSlzxm8WiEgM
 1ouL12XZ8lnPWkte0P3W93FehR4ohkLr6sObFGQiZ8VpDNvgP3/5RaHHu0Fut1ynTWo8
 Z+v5tc0kORF9m+gE8fNhrNaNdOR2gc+bHQLafSvpQuVKf6FZcxNaoiDrJlFyAJ/ZzfoK
 Y6SU8r+58v/sJ5VwhPdMuWLP9GE7MaphREWKMZK2UU/XCCELILZ/2UGK3+UfxSUbXHgp
 sXAw==
X-Gm-Message-State: AOAM530n7SXcgQfq0x8r9esmUWhunoLz59xky5ch7GKhU2jAoi4Tb/64
 knGzYcZx9P5YcVzQCP3JovpnROq2dU4=
X-Google-Smtp-Source: ABdhPJwXFcgNrdtg16son2IIazSXF5if2APFcLfqLr521yNXaCWlsxFiRpyVfsBLXE5Z+Vj3v8hfBQ==
X-Received: by 2002:a62:19d4:0:b0:43d:1bb7:13ae with SMTP id
 203-20020a6219d4000000b0043d1bb713aemr27253731pfz.63.1632178413677; 
 Mon, 20 Sep 2021 15:53:33 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k22sm15495282pfi.149.2021.09.20.15.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 15:53:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Date: Mon, 20 Sep 2021 15:58:00 -0700
Message-Id: <20210920225801.227211-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920225801.227211-1-robdclark@gmail.com>
References: <20210920225801.227211-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Slightly awkward to fish out the display_info when we aren't creating
own connector.  But I don't see an obvious better way.

v2: Remove error return with NO_CONNECTOR flag

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 ++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6154bed0af5b..94c94cc8a4d8 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -667,11 +667,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 						   .node = NULL,
 						 };
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	pdata->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&pdata->aux);
 	if (ret < 0) {
@@ -679,9 +674,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	ret = ti_sn_bridge_connector_init(pdata);
-	if (ret < 0)
-		goto err_conn_init;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		ret = ti_sn_bridge_connector_init(pdata);
+		if (ret < 0)
+			goto err_conn_init;
+	}
 
 	/*
 	 * TODO: ideally finding host resource and dsi dev registration needs
@@ -743,7 +740,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 err_dsi_attach:
 	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
-	drm_connector_cleanup(&pdata->connector);
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		drm_connector_cleanup(&pdata->connector);
 err_conn_init:
 	drm_dp_aux_unregister(&pdata->aux);
 	return ret;
@@ -792,9 +790,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 }
 
+/*
+ * Find the connector and fish out the bpc from display_info.  It would
+ * be nice if we could get this instead from drm_bridge_state, but that
+ * doesn't yet appear to be the case.
+ */
 static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
 {
-	if (pdata->connector.display_info.bpc <= 6)
+	struct drm_bridge *bridge = &pdata->bridge;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	unsigned bpc = 0;
+
+	drm_connector_list_iter_begin(bridge->dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
+			bpc = connector->display_info.bpc;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	WARN_ON(bpc == 0);
+
+	if (bpc <= 6)
 		return 18;
 	else
 		return 24;
-- 
2.31.1

