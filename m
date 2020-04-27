Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96D1B99C7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FE26E0DF;
	Mon, 27 Apr 2020 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C6A6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:17 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h6so13099929lfc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbnoAHGZaTXqPBiG5vvO2Tfv7AKD99Fb4s4aJXa+MvA=;
 b=jsEFbxONISQUV0yZTKa6zckhW+uRy3lhW6a6UJ74lBNlcFJ6vgEjOuP2puIJBkDIhS
 Ti3pftPDRQsUysm3Y2g/R0k6zRPEqiF2i1mjUZo6k/zNwVbAQyHCFjEmGPaVRvec6Zkb
 aU8zfA/S/NsebXqxAtjbp79voBqPliyeVM3fVF49kyOLM1j8kJUU1T0LHLHWJWqo8ZGP
 TrjYA2m2DiDqde8L10Y6OuLq6srfFiqhUirGbcJiHCnXv0XUXOaiopuJxrfcuXLqlZrJ
 h4uotWmzcuJgxc8+fPPhaq/69uuXlV2Oteb1bNPL0xWE7+w9Eoa/ByevMes5izhuCkVh
 0UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JbnoAHGZaTXqPBiG5vvO2Tfv7AKD99Fb4s4aJXa+MvA=;
 b=uoA0LESOQTsA9rIGrrpGDH07RqJMjsforKKLd47DkruDCguHDisazT082yFNe//Vyk
 O+cn0yfaQgsuuJH7b1R0S8dbTxTMuhIC4cFm1YEYEjFTRgVpI0FgnFKTpljZpnwwH8T9
 vxIA7ZvYzICtEK3Pjpi1uMt97iibhV3SSC1zsXCEpE9Z9gJsi/tOzMxs67YRz/NBA07j
 4kNNcseG6Y9nYdgJmKd34NnJvhMriWBr9gnoMZoJRs1Ns737NhiPovER7SCeoQw3nRe9
 JvD83o15krsV/4UUFViixFX6RXvtZQTnUl55EiTo5ET9cCw4HvOgSIvk8IT4SacK+HBW
 zyKA==
X-Gm-Message-State: AGi0PuZF0dWzXQrr0umTDijrvhx/YcxR1DNIfZAgUWARztdWDTZ0kX7I
 GUnkrxp4llciM548eJddTX4gvVyt
X-Google-Smtp-Source: APiQypIYD7kMtP2IMoYmK89KfZ/Fx1Yqv+ir7gglTryc5Cep5qcRhJds2IEuwUJfiB6Ewt1lZBUm3Q==
X-Received: by 2002:a19:f806:: with SMTP id a6mr14846036lff.201.1587975555566; 
 Mon, 27 Apr 2020 01:19:15 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:15 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 12/21] drm/bridge: parade-ps8622: make connector creation
 optional
Date: Mon, 27 Apr 2020 10:18:41 +0200
Message-Id: <20200427081850.17512-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the connector creation optional to enable usage of the
parade-ps8622 bridge with the DRM bridge connector helper.

This change moves drm_helper_hpd_irq_event() call in the attach
function up before the connector creation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/parade-ps8622.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 6ab6f60b9091..54aa5270d2c9 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -459,10 +459,8 @@ static int ps8622_attach(struct drm_bridge *bridge,
 	ret = drm_bridge_attach(ps8622->bridge.encoder, ps8622->panel_bridge,
 				&ps8622->bridge, flags);
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
@@ -482,7 +480,7 @@ static int ps8622_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ps8622->connector,
 							bridge->encoder);
 
-	drm_helper_hpd_irq_event(ps8622->connector.dev);
+	drm_helper_hpd_irq_event(ps8622->bridge.dev);
 
 	return ret;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
