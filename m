Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC58B91E754
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 20:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBC110E0B6;
	Mon,  1 Jul 2024 18:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kPzvWUlS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD06910E061
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 18:19:57 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cdb0d816bso3307909e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 11:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719857996; x=1720462796; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9f4mKCaRWs6EL5Tgl8NVvQuffheXHlnyeBx3NKI8np8=;
 b=kPzvWUlSbESNezWcpI+Yfvpiz7XakWC9Vu1g4WGHNZhTMaZt52FehUrd2WuQl+5O94
 OU5hPdZSdLv60nI270TcOkEJ/cC+fJCAPpch7tPqga00+w6p2IdndPJv9J2iZzBRHhXl
 q3E9uhSBuB57vCd7LIVuGAcYzcH4uFcDsOUGzBhu2GEYMPIoK3i3urmDrqitGjNeSD4Y
 H387Bdkk1Th5kEZnSeJeZybfitLOL+7Cs3qTqnUUfdpJy7J7tXv6xrI/V6QBnP5fLFZ8
 HPtZKTzGg0Ce83qGUtNQeMUvxZW1N9BtZ6AlSNMOy/CIJODDq5LJ9LKF3gYwHcDWI1LM
 sDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719857996; x=1720462796;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9f4mKCaRWs6EL5Tgl8NVvQuffheXHlnyeBx3NKI8np8=;
 b=cyAUWsbIQUqQRbG7INAFyZQ2Ar/I1uvgqGYu0vbWX1aJTBUxtXZe13JiVppd+wlLc6
 0Z5ESmm+vNfNVNz76lBDx1ULdLU4UvvMGUiOxlWTq9N1U5aq+50FzqNm+ydwYOYrQCcf
 Qq4arxTtYTk/grXZOpcc/30Pn/kyPduipj7DOupb0NNeR3fB1U2vN4EhpYax2LSEY/yu
 wVuXbHYaWDFX9kH01ocgGsBNx7IxrdEEVfevZN9LiHphlap4sAAdJPadrxEPzl1ZnRMm
 IXrTTuVvFIBqR0+YUs+LrDvyXCLV0fDgUofjgta5Jn9UXVnPARX2eELBptxn2Yz/bggO
 j3fA==
X-Gm-Message-State: AOJu0YyDnk0XSL4iWTQ3PDY9qKB0KmaEr0PbvBxWiH0zrvL+alp9juga
 /5KVGuDA7y9MrLkrE16liaQmHqgJDIZMzHCDlQbzE88I6lHKSF9Acr/aLfsSBJ4=
X-Google-Smtp-Source: AGHT+IHHEZTy14kxUGvJ5gNImCp6TDI/dbrQQgc1/QstVX1/NQsX4jr1qkKXl2r4xuXwszTqwSPmOA==
X-Received: by 2002:a05:6512:10d6:b0:52c:df4c:92d8 with SMTP id
 2adb3069b0e04-52e7b8decfdmr3570098e87.1.1719857995662; 
 Mon, 01 Jul 2024 11:19:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab2f8aasm1516931e87.236.2024.07.01.11.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:19:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Jul 2024 21:19:52 +0300
Subject: [PATCH 1/2] drm/bridge: lt9611uxc: properly attach to a next
 bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-lt9611uxc-next-bridge-v1-1-665bce5fdaaa@linaro.org>
References: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
In-Reply-To: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SKAFSPCa5VrynHGCh1AnVztZXyJngqx/+e1B3wfGBFA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1rTZ0/m8tkTF6eUXTLhCVpzbPpakTsdmmk+dSWFU9WO/
 DtayRDZyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJVN/kYJjf0zprvrSq0IRT
 J2I2hd1O9Vc6KFAj6yx3KGjKgZRp6u92sp+3sSnI5KoJ1dJiWHNhy9fqdreG7I51UucWnH3zre6
 84v3iI/4/hBVSzl93nSRg2tTfHn5jvULRrFOxcZqr3thJmjzZd2eOzInFsZnhS9JT09d+MJmnYN
 l0R2HGRu3MndN86pwtDyspTjOpeuk/29H+p+xrPb9zEcU8TxrmLbxb6+KdocQ069wV2+t5kW5e7
 Lbn9S5Km69uuSvVdZS/UmGx4n2nBx/cZjh91lXWkktmDXi5TEXu4HFHwZtZUlvTSrzdRfxFCk5u
 EHvo3eH0d++xk5LOW5w3/2PfeZBvJyv7lVJvB3+Ve//8AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

If there is a next bridge in the OF graph don't let it be ignored.
Attach the next bridge to the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 4e802b54a1cb..4d379d0d24d9 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -23,6 +23,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -34,6 +35,7 @@
 struct lt9611uxc {
 	struct device *dev;
 	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
 	struct drm_connector connector;
 
 	struct regmap *regmap;
@@ -358,6 +360,11 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 	int ret;
 
+	ret = drm_bridge_attach(bridge->encoder, lt9611uxc->next_bridge,
+				 bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
+
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		ret = lt9611uxc_connector_init(bridge, lt9611uxc);
 		if (ret < 0)
@@ -525,7 +532,7 @@ static int lt9611uxc_parse_dt(struct device *dev,
 
 	lt9611uxc->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
 
-	return 0;
+	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611uxc->next_bridge);
 }
 
 static int lt9611uxc_gpio_init(struct lt9611uxc *lt9611uxc)

-- 
2.39.2

