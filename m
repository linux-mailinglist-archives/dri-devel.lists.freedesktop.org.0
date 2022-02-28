Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F814C77CD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033FF10E52A;
	Mon, 28 Feb 2022 18:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48F410E52A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:31:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id n14so16837962wrq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80IauG/d1J+24O+js6o66KmrN0KsXMCLre6trIg99LQ=;
 b=iMrbNpsj+1cEzLoigb874QD2f9x0Svo32wxz2+LBSGHl8vwNV4yGlBiP1HGdQV3PoX
 NPIKH4eQeFuWAL9MxTvrJKJneoatmzeWN1WDnolpHqwf0/yhsSaxaAp74JvBOgBXcoQ7
 1IndfORgIfOq46dOCBD19cAY2y5JKz4/iN1u2qCa4ViyvDy6APu1HmZ8aqbx2YRuAywQ
 L1nQvDE9IqctLNIv8YIqQtWJIgIVA5EY8dP3em70i96qa3GOtsS96UCC7WZStxyRv6au
 wBV2IgmC+M7ED202x7xe7+iyYG6zcEAeyP1uROqu5yC3yssHk793OaI2207EGEpuZuW3
 ehJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80IauG/d1J+24O+js6o66KmrN0KsXMCLre6trIg99LQ=;
 b=KuaSOt9U77OCbpxMQU/fhdERYE5T3HXfnboddef059VP3cZRU6llxfVPkgIWq5Dcw6
 bqXNd3Cd7tp2dIzqu5p6rrnyUMM9/8GHfUILerWq2bHr0Lgy4mbVLUKl8G1Lsk3rK7hD
 9tv8SNN1H2uX2C0ES7WHKTr7R4uODJ+Cv2xIGJxi4Y2c+3XD+Ssw+leQf0fpp/GGL+h2
 1Tr1rzoqJpZ3wc5meTSePQl2a6dF+SkFmuC1EgP2ZMK06z4O3FVTkPeurgSwtpiMA+7a
 8A7Y3MvHqjHjy6xycpei23UwolX8qIZOivxomk7fyuU9LQqijjMyIJwBOawm0WxGIVtM
 AzOA==
X-Gm-Message-State: AOAM532nQZl76swsh/XUb3zmivp+r0PdNhab2KdLDJGNa94PIOOnWj3t
 Dg9KWrx7UhXNm+IbqgVBfoI=
X-Google-Smtp-Source: ABdhPJyPAH/7Ee3C7zgL5tsV5rMzbtFf4QKcHZbN52HkzSCV9cCbcgECaNTt8rOXdUCTC9tDW5e9KA==
X-Received: by 2002:a5d:59a6:0:b0:1f0:150:4bad with SMTP id
 p6-20020a5d59a6000000b001f001504badmr445442wrr.581.1646073099334; 
 Mon, 28 Feb 2022 10:31:39 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b001edc38024c9sm12670725wra.65.2022.02.28.10.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:31:39 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: parade-ps8640: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:31:31 +0100
Message-Id: <20220228183131.23494-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 linux-mediatek@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 matthias.bgg@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 linux-arm-kernel@lists.infradead.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 818704bf5e86..1c2c4dd50ce0 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -566,7 +566,6 @@ static int ps8640_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct device_node *np = dev->of_node;
 	struct ps8640 *ps_bridge;
-	struct drm_panel *panel;
 	int ret;
 	u32 i;
 
@@ -651,13 +650,7 @@ static int ps8640_probe(struct i2c_client *client)
 	devm_of_dp_aux_populate_ep_devices(&ps_bridge->aux);
 
 	/* port@1 is ps8640 output port */
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
-	if (ret < 0)
-		return ret;
-	if (!panel)
-		return -ENODEV;
-
-	ps_bridge->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	ps_bridge->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (IS_ERR(ps_bridge->panel_bridge))
 		return PTR_ERR(ps_bridge->panel_bridge);
 
-- 
2.25.1

