Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C83364C7814
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4035710E120;
	Mon, 28 Feb 2022 18:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3F010E120
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:40:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d17so16851013wrc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6YEE4tA+o8+T1pGK0p5yO3E7r4KEuRuaX2SCJDWnvc=;
 b=UK4OCcoKkVzJD4hyevzvTcvD5hTLJardtwDy3/dx7l/NiGxcmXubRspkglxKSaH6yh
 /nz8d/Hs/N6u1gdxJ4LT8UEF3bXy4tNQn0xQUGLDU56Wi/7YcvqmqL3w0H1+wEy1Hz54
 Av4nS7fn8FhGaOrq98iHrnN0V0pMIIOKfzIYsGxTfyy7ZqH0zEgGn133pkp/Q9lMdtzq
 YzkOQ9OWS1Z3Mt1ZgK/E0EV7DE9luOSiEKMJx470JgQfseYVGcxZRr/ktRD3XqJfTHnC
 3Ymcf/IcTVzVBRnT8hZd2t918UjL6DNajkHkbhpWriA8YzQ7AFmDoIdS+dkeKPuk7bo6
 4aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6YEE4tA+o8+T1pGK0p5yO3E7r4KEuRuaX2SCJDWnvc=;
 b=58Dw7tw5hPH+18Qm4XJKKDwBBvUf5rEKsev5UwO+iNzBS+zjeZKZZV+tmL0nbJl3O7
 Uol9KfjFbfqRVb2enwZ+4Tsu13UokrvGKj8CVYby8tuue/p4ZFp/uNgj5kzyrq36phQl
 wN5sZcbDaf2/D4bau0tC1J0UPCtMpc0DXCGHngFzEn+SMSOpZE3kWO03IixcuJ5x8y7o
 ScA0d0cnhfP7oyvfmqq0O/vTH1RT9N9tX3evKQorAsz1St7gyTGUomQxloaDWqXWu84c
 ohKqIoJz9Ywazv0O2nsSKhZMSPCARoHKJf+jgFwJEc1d7r7n6eJrNvqqnG0UsikCVBMT
 M16A==
X-Gm-Message-State: AOAM533hN1KvBMLgD03nPStWnwIY8f/+fK+rQn0zglcEDioTma5Bf2dA
 APnoS3u95Efn46JW8K8mjKM=
X-Google-Smtp-Source: ABdhPJz0kvHdPe+ajGjHcDebdEWIdgAvL5IiW5tMhv+foN9qIBdzWhBia6PXsLTWZedHHDzLk+o9oQ==
X-Received: by 2002:adf:ea44:0:b0:1ef:6f00:cf47 with SMTP id
 j4-20020adfea44000000b001ef6f00cf47mr12996852wrn.460.1646073609801; 
 Mon, 28 Feb 2022 10:40:09 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c511200b00352ec3b4c5asm297692wms.7.2022.02.28.10.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:40:09 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: ti-sn65dsi86: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:39:54 +0100
Message-Id: <20220228183955.25508-1-jose.exposito89@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com,
 Laurent.pinchart@ideasonboard.com, u.kleine-koenig@pengutronix.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 lee.jones@linaro.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index dab8f76618f3..fb8e16ed7e90 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1232,15 +1232,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 	struct device_node *np = pdata->dev->of_node;
-	struct drm_panel *panel;
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
-	if (ret)
-		return dev_err_probe(&adev->dev, ret,
-				     "could not find any panel node\n");
-
-	pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev, panel);
+	pdata->next_bridge = devm_drm_of_get_bridge(pdata->dev, np, 1, 0);
 	if (IS_ERR(pdata->next_bridge)) {
 		DRM_ERROR("failed to create panel bridge\n");
 		return PTR_ERR(pdata->next_bridge);
-- 
2.25.1

