Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899D6B46DB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64D010E8D5;
	Fri, 10 Mar 2023 14:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC04610E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:47:28 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 n27-20020a4ad63b000000b005252709efdbso814566oon.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 06:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678459648;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hwy37whypJJxvCg5xXOf1fAsBsyJNE4bTOGuf7mwrkI=;
 b=Q/SvqnEjWQFoknispr7hEPAf3XOMwR77gjoCDu5iPDFKhfHwDXrz66ixoxinlIVG0s
 QQbWvTvfdpT9U+H/V2p630BYO3qVxJL20tIDBvjxQ+Xn67/myGNmrzF2U9QA5rtvZOum
 +8IKAwUt8xLt6W0SBNpd6ZOxa9R+BmvudVhOKY2oI+GdCjSeY5EYzLGa4d4QVn+I1HDj
 rrc1QChESlLvhkOZY1kCEu+cYqmTgyeEam8ebbX3NqkaFdMiBNaAgInQi0wSp8ELEX6m
 Vj4j856oTjCexLir4UNMblh6TEuRdgg5XH8p5lL7BQt7avyoGIELkzWLKJit3pyP1zR4
 6aLQ==
X-Gm-Message-State: AO0yUKUO4g0cMQYwh0fogRu/Q3hY13Ns9XTQBSdEv6zvZhE2D55OVWFX
 GipfaSCjJXKAlojkcIuwTg==
X-Google-Smtp-Source: AK7set9UyS6Pa/vr1iG/QWJLY79BI/y2Y2ahlCo8e8H/dL1H6Q3t+yK0hLAnsjyOAfPJQVp7v8Q5Zg==
X-Received: by 2002:a4a:d498:0:b0:51a:48f4:75de with SMTP id
 o24-20020a4ad498000000b0051a48f475demr1425202oos.0.1678459648090; 
 Fri, 10 Mar 2023 06:47:28 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s25-20020a4adb99000000b00525240c6149sm837812oou.31.2023.03.10.06.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:47:27 -0800 (PST)
Received: (nullmailer pid 1542322 invoked by uid 1000);
 Fri, 10 Mar 2023 14:47:06 -0000
From: Rob Herring <robh@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drm: Use of_property_read_bool() for boolean properties
Date: Fri, 10 Mar 2023 08:47:05 -0600
Message-Id: <20230310144706.1542295-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/bridge/parade-ps8622.c | 2 +-
 drivers/gpu/drm/tiny/ofdrm.c           | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 530ee6a19e7e..efa80e309b98 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -496,7 +496,7 @@ static int ps8622_probe(struct i2c_client *client)
 		ps8622->lane_count = ps8622->max_lane_count;
 	}
 
-	if (!of_find_property(dev->of_node, "use-external-pwm", NULL)) {
+	if (!of_property_read_bool(dev->of_node, "use-external-pwm")) {
 		ps8622->bl = backlight_device_register("ps8622-backlight",
 				dev, ps8622, &ps8622_backlight_ops,
 				NULL);
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 6e349ca42485..76cd7f515bab 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -162,13 +162,9 @@ static bool display_get_big_endian_of(struct drm_device *dev, struct device_node
 	bool big_endian;
 
 #ifdef __BIG_ENDIAN
-	big_endian = true;
-	if (of_get_property(of_node, "little-endian", NULL))
-		big_endian = false;
+	big_endian = !of_property_read_bool(of_node, "little-endian");
 #else
-	big_endian = false;
-	if (of_get_property(of_node, "big-endian", NULL))
-		big_endian = true;
+	big_endian = of_property_read_bool(of_node, "big-endian");
 #endif
 
 	return big_endian;
-- 
2.39.2

