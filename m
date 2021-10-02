Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8941FEBB
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 01:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F48A6F51F;
	Sat,  2 Oct 2021 23:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC3C6F51F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 23:35:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id j27so10054479wms.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 16:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MztqkJ6kEnYY3QY22MZAhVkiyYz8DlYPtSLS1AAw8jM=;
 b=GPP3XEmUpER7Jifk5aXhGuB2IdZ9dYWM7+4gi3WqJEH0myRrgZSbhORhiJGETOErNO
 mqiKtnBml/30gMd08kYdCh1ITAopXUgMmrNU05m0QyrMaQawNbEULfg78peHFVn7jZOE
 subtmm/xR+gUDM9TvJt/cLXR23UM/l6oBT+Q3i28zmodk0PSrFdwMRxnhxBYfbckoRV8
 1JRgVdlAyt0u24m0dyghSDKj45c8fODPcR4oDTawtLgetjbncU/z2BJuRKG3ruXEENmW
 UslJfT8iZPJR3mAbdDEOLZxPU4x5NG/awjGmjVwyn0eOOu4fqpNWm5fhcONrIMwlvJ63
 i8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MztqkJ6kEnYY3QY22MZAhVkiyYz8DlYPtSLS1AAw8jM=;
 b=hQ1GgUPFCP4xY/Z+g28tAi+SE6WD2ksTzKgMcMlc+xhRoNIRyGyUfVZs3ZMPMUhCLc
 xMN6vZShbxXXMy9AhKQbVBCppyZ6XIl1kHRcreTMr7dVxfNVXHOf+UGqLO9MbMGULSyq
 GHosjoYCLsIgzgLXydOnBEnIOWCm/tERqhN6u8t6taA9DgurZstiijIpxTPQGi3RYT3N
 Mz9vUPnIJ5oI+hdAAIH6gNuoU8N8sVIY3id7HwZEtOEQ26jtMZZWS5oZ2AV6/pFjJWhe
 yIm3+939JqxJYCr/cZg8ylKJgL6NtzZE3Fk1ATiPKZRDRqtscjYfhKBym6dO3bNjDdky
 YctA==
X-Gm-Message-State: AOAM532IB3d/VernIXHB39ZhIYBmbxrjZDNpT9anXo3XMt9PizIYLtt1
 UoMi+OXIozMY+0TO7jFX8Zc=
X-Google-Smtp-Source: ABdhPJzXoDtZo5DdB8DYLuVGO2v//b+Wp15T0u3Fxi7NnZxoVEihQFQ01yI49bal4m2C9c/LPmWnuw==
X-Received: by 2002:a05:600c:1d0b:: with SMTP id
 l11mr11350453wms.46.1633217752661; 
 Sat, 02 Oct 2021 16:35:52 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru.
 [94.29.54.195])
 by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:35:52 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] drm/bridge: tc358768: Correct BTACNTRL1 programming
Date: Sun,  3 Oct 2021 02:34:47 +0300
Message-Id: <20211002233447.1105-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
References: <20211002233447.1105-1-digetx@gmail.com>
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

TXTAGOCNT and RXTASURECNT bitfields of BTACNTRL1 register are swapped in
the code, correct them. Driver doesn't implement low power mode for now,
so this change doesn't make a practical difference yet.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index cfceba5ef3b8..fd585bf925fe 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -790,7 +790,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	val = tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
 	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk),
 				  dsibclk_nsk) - 2;
-	val |= val2 << 16;
+	val = val << 16 | val2;
 	dev_dbg(priv->dev, "BTACNTRL1: 0x%x\n", val);
 	tc358768_write(priv, TC358768_BTACNTRL1, val);
 
-- 
2.32.0

