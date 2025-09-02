Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF95B47827
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235D810E424;
	Sat,  6 Sep 2025 22:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RACEwRDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4DB10E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 23:18:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-55f6186cc17so4887367e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 16:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756855127; x=1757459927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KIjMpHwYzE4g/6WKCNgfagxf+5dKQ2N0eUW6mQ6xm8U=;
 b=RACEwRDuH3W26L01qcj0Dyf2j+27r5NlAXROV47kF9QwgKahft68Qhl2U6rch9OwYX
 cP9Ecx0b7Y7KETIeJhfiBEVQI36SMRbEQ4AglqDsUAGXZjVlbUk21Yc4Hgul3YWWn7m3
 Fwrc7qKsWtsg3I6FlO1f/i62YK/e+z1t7RPs0Qh/s+5nlIw1UqNo9PWx7YSUnzjQEl6p
 kTXbj7L2QYIblsUrKQ++EKMS10iA5RDyYLKzt4Ifl6c4ActRBPxWtk+9re0ZGcU5LxEf
 ZgQDwnjxoApYDHZXo4ljZIPihr4MPDBHnl1oPi7IcYghIr7EK61BojZoTTrFZMpVn60f
 glFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756855127; x=1757459927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KIjMpHwYzE4g/6WKCNgfagxf+5dKQ2N0eUW6mQ6xm8U=;
 b=awzFLwWI8I/Ne8BN6IdwwPgrJ7REUXkwt15zrKTTi/hP895w9e/DG1OT1+qGk6q7GT
 /F7HNb5JNIDC2W9mi9TNHLnUW5FNXJz53lS8raI0ChdoLmrq8Dgi1TICf5XEG/Zs8cs7
 skpK1CweDBVTo7271dY4fiyvsa2HpN8GRPDhlFo8zCSFkSFoVkBqwFm3pvczXZKvD0aw
 PwTwyF6KsHO0ZI+IgCNKYL6GYCoEAjgXJKjAz+RLpL8pTeMic4+yWxTJuzN+k5qQuXT2
 7nx7MFVK7Cbv7jZa3kPjjvbbMrFkCYcUVkiy3NGMT0D2fflOsfLV1t9gVOZJVlJLzaK7
 +vOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgRrbtgw7H/9dLQw7G3nSVbslmyCZYbJbh/Fez+c6avBKDrHqbLvKcbPEu22FJ76f67VUaN42xXj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCx0KZbRZ12VrTvlk67Le9RUoGWiSz7QDBzP9/p8/U8oevDUID
 kz6lR0Vu819y8t5IHLr9LN9ZAaqWQHbSj2bd8CyB84Yp2S340tvtbeUP
X-Gm-Gg: ASbGncvOKeG6ceZJrDYyzW23oLLBmgXFVbGWG8RKiiE7FxM+rW3F4nlgUCx0piSh9Bt
 0yzgaTHyBTSCmJ1Je5ZFDEeQ5M2L7yAVHExYnDfLIEXEb2qa11tiZ9ex9xytmHEgK9gIU+bcSgg
 YH8Tnr6qoXiTxWoogzpzfJCTU/zdBmM6zEM3POB4sGiCM5/mT62PEX+7GijLGDPG9SsZOEKywcb
 AZODNP3th9ZsF++A9Kw1huMCDUE7hedN/egf0g9i8ZD3Mgvbd9p8kcXny6Z0YwblOLfWdt7zUBG
 nPqDPiR5HefTG/HekswVA20KTsi1Tc/zGUekkVqTls9O3kSE+8SF+v4XOVJgNjSjTGWyDAD1KIS
 dNZNWEAwe04tYbuKlQG5bIVF7PPh6Logp
X-Google-Smtp-Source: AGHT+IHBkhypX8PliyvBm2EDGnps/SdjWMK/oXTi9pJ/ZhI9sUg+t+MQviVvBQtxBckq0XKyo0yLkA==
X-Received: by 2002:a05:651c:238:b0:333:bf9e:d6e1 with SMTP id
 38308e7fff4ca-336cb0b0958mr34920641fa.32.1756855127305; 
 Tue, 02 Sep 2025 16:18:47 -0700 (PDT)
Received: from vovchkir.localdomain ([95.161.221.106])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5608ab5e281sm105674e87.18.2025.09.02.16.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 16:18:46 -0700 (PDT)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: vovchkir@gmail.com
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: use irq as optional parameter
Date: Wed,  3 Sep 2025 02:18:20 +0300
Message-Id: <20250902231821.2943-3-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902231821.2943-1-vovchkir@gmail.com>
References: <20250902231821.2943-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

On some systems the interrupt pin may not be used.
In this case we exclude DRM_BRIDGE_OP_HPD from supported operations,
after which a polling thread is started to detect the connection.
(the default polling period for DRM is 10 seconds)

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 25 ++++++++++++++--------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 1aeb5b29704b..b17483f1550c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -854,12 +854,17 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	init_waitqueue_head(&lt9611uxc->wq);
 	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
 
-	ret = request_threaded_irq(client->irq, NULL,
-				   lt9611uxc_irq_thread_handler,
-				   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
-	if (ret) {
-		dev_err(dev, "failed to request irq\n");
-		goto err_disable_regulators;
+	if (client->irq) {
+		ret = request_threaded_irq(client->irq, NULL,
+					   lt9611uxc_irq_thread_handler,
+					   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
+		if (ret) {
+			dev_err(dev, "failed to request irq\n");
+			goto err_disable_regulators;
+		}
+		dev_dbg(dev, "Uses IRQ\n");
+	} else {
+		dev_warn(dev, "Irq isn't present. Check Irq or use the polling!!\n");
 	}
 
 	i2c_set_clientdata(client, lt9611uxc);
@@ -867,7 +872,7 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	lt9611uxc->bridge.funcs = &lt9611uxc_bridge_funcs;
 	lt9611uxc->bridge.of_node = client->dev.of_node;
 	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
-	if (lt9611uxc->hpd_supported)
+	if (lt9611uxc->hpd_supported && client->irq)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
@@ -896,7 +901,8 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	return 0;
 
 err_remove_bridge:
-	free_irq(client->irq, lt9611uxc);
+	if (client->irq)
+		free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
@@ -914,7 +920,8 @@ static void lt9611uxc_remove(struct i2c_client *client)
 {
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
-	free_irq(client->irq, lt9611uxc);
+	if (client->irq)
+		free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
-- 
2.34.1

