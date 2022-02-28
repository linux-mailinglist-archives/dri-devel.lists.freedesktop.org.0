Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA654C77C3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB34410E172;
	Mon, 28 Feb 2022 18:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AF510E172
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:29:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so84259wmj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuAEmRESdE1T8c0q/a9AI7lflQyuoHxCApNPqjz7qjk=;
 b=HPyz6eOXC+4y8YUbQRLNrR4LMh1Kv+NGGJVFmbMdT1VyiOBRoQE0YGm3MQ8olw0sns
 7Gg0e5hQzA6WKacJkM01pFfLEDxHQOjyK5mPoE8U11EJdH4GVT51dCGcPNG/6zPbRa3p
 dG8ZAstyvEf0wU/qi4n/PsrN1l4m/XC3ygvgQ3cLLVgBuTSSePwUJD7vJTgO0Ceqexug
 yYs1/ulY9Q6iWA5XG36iHDETUfI+Zwu20e8amUFEcEfhsrowd0RT6UbJXIQtVHUYkrDp
 /N/L3PqBqM4TnL1Vd+FtA/1Y51I2y1tjKeczypvLJarcrDIpBXqZmxZBlQM5Xnonfa+d
 ExLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VuAEmRESdE1T8c0q/a9AI7lflQyuoHxCApNPqjz7qjk=;
 b=a5DshnXePXITBmfy9k8kO8s7e/5B5evjxCxHDD8UZ7pYLYbttvApWxlQgDdglb2wrT
 62gv2E7ZKEGv18WHi8GiR5kRcX9cIhH3l+fh+BhTfuGhsO0JqsMWzUuYjaD0hR+MTJoh
 RCnfqUklGLSkbV9IYaK0ZHh7kZcmfus2vdY5o0Uynx1QY4QX318flBhjKoVbh7al7BSb
 OkmwOxl/zsjtxfr9C6+B3HW19/JJZIwEhLo3Ig0n0DTD8UCYaXLMYlkzFPGlZhFDVEOV
 mPSXBfsa4XEeGahjB++W9xObuQW7bJDZ91FlOEbalVSukZUBEkDw6cuW1fyo4X8B+6T9
 eMhw==
X-Gm-Message-State: AOAM530BMbPRjtAnXoRUXITWcPLERX0sySnfHKr3N9CFRKds3NObTWJj
 XMfXlJICgL/OnBzVqUrX7FQ=
X-Google-Smtp-Source: ABdhPJyJp3llhyLATodOqljj1tta971rpXwYbhIWthcZ7mXCvjqXpybAWh5xhub+FMGzliloP4Bh4g==
X-Received: by 2002:a7b:c383:0:b0:381:1b50:a9d with SMTP id
 s3-20020a7bc383000000b003811b500a9dmr14436066wmj.90.1646072953239; 
 Mon, 28 Feb 2022 10:29:13 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 p190-20020a1c29c7000000b00381227166b2sm175538wmp.41.2022.02.28.10.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:29:12 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: parade-ps8622: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:29:04 +0100
Message-Id: <20220228182904.22982-1-jose.exposito89@gmail.com>
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
 Laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/bridge/parade-ps8622.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 614b19f0f1b7..37b308850b4e 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -452,18 +452,13 @@ static int ps8622_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ps8622_bridge *ps8622;
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
 	if (!ps8622)
 		return -ENOMEM;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
-- 
2.25.1

