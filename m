Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3057156D0D6
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 20:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF0118A8EC;
	Sun, 10 Jul 2022 18:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B2B18A8E1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 18:45:44 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id c15so4006437ljr.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVSMnS8t45CZD8juYdlJJPJTb5XNiXWgo6MEV6vD4LI=;
 b=gYLBv2KXlYas4icGyDhTOyDps6lgVFSE1iGw867dEXwyTI07bPLSqt0NARMcx8izZP
 tggJh1oQYqPUCt1znBDXxnKF3VRB8BVCEiSk7JeRhoiDxvukbn1ok30/arV6K3fqUEv2
 WPZID05nhykAs08D0G9eXZgbr1bJUEzkYjOfnpys6AZSxWWKfeBZOT1Fsrz35W6nKIej
 muVA8bdxdbSYhYLrq8NMht5kvZGvaTg0Rb+5L6Jf12xeibYCfoiS+Hep0w6KcqDxPSFy
 q0QgWRkfkZCnBD24XwYul4yODoY3/r1Uqbn/pcT58PF0vHEd0Pay5yr2IPAI3HsGDuM9
 FLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVSMnS8t45CZD8juYdlJJPJTb5XNiXWgo6MEV6vD4LI=;
 b=UMrlr6niiV3esDyQCwOppZJ2h19BDbEZ86qXclVWKLjIGmx7ESncvVay/BV5b3cQ6O
 kzz+HqZ5mf7fRT9EaGIy5nBKEG9BF+EODrp8ZiPSXwXfKqZHLrgzGloG/xOponJ8NuS+
 ROR40Gw+8nTD0zjCIZKtILkHhxszlnzqYfrqfAwC0w8LcIPlL5PN4Gwn/1lA3HjYYm8T
 o28HKS+4FPOqLeppXcWqU3C0CLjsHM9xKBOlsDgJ3qlhIDgXU+91cYzp/7ESXK6zveAc
 q1Xh2sI52hsmlk4kudmaqanJppNC4JIZOL/Uh9jABV5m7T48uFTRj/3fZ5Qax7O7ofk9
 xbtw==
X-Gm-Message-State: AJIora+6Lkn85bUQxMU/dBEL01kptURPQeZj6xA/8Esg24AHfQ2eC1Cq
 u6bITwmF4f7aO+n68JVGlBjfCg==
X-Google-Smtp-Source: AGRyM1tV4KZxmsBcDzaDEkhgLgkD2idVTnQsNeakd0mWVCD3tClU5A2YAoyDh0V+PEo8fOZPZ5K76w==
X-Received: by 2002:a2e:a989:0:b0:25d:5d7c:f3e7 with SMTP id
 x9-20020a2ea989000000b0025d5d7cf3e7mr5811903ljq.392.1657478742554; 
 Sun, 10 Jul 2022 11:45:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 11:45:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 3/3] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Sun, 10 Jul 2022 21:45:36 +0300
Message-Id: <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now as the driver does not depend on pdata->connector, add support for
attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index df08207d6223..9bca4615f71b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -698,11 +698,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	pdata->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&pdata->aux);
 	if (ret < 0) {
@@ -710,15 +705,15 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	/* We never want the next bridge to *also* create a connector: */
-	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
-
-	/* Attach the next bridge */
+	/* Attach the next bridge, We never want the next bridge to *also* create a connector. */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-				&pdata->bridge, flags);
+				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_initted_aux;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
 						     pdata->bridge.encoder);
 	if (IS_ERR(pdata->connector)) {
-- 
2.35.1

