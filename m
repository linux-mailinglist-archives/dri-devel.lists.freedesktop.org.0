Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EB54C77F2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA9B10E538;
	Mon, 28 Feb 2022 18:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483F110E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:35:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id r10so6223320wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XWE8ka0LFITuVWLTsvK0XnLYaX+ahuY1DLqYbhtqPVM=;
 b=fhg7jpYf1EYHHy4sAaAQg8FUpD08rHouaef4QgIbFmDlV/OB0oARBG55IS0Vs6V7RM
 dz1g6KwYdqfXj8/RsQiP30R9Vsy4j0+9+90azseP39z+yyaDaTIR3o0saIcI0j3ONmGp
 /f5z4djXrqFENtGpVcKk6MIwkg81alkL2gPZgrjTjqO6rp0ITjedEQorl6w2nQxqQqia
 7YeF5sP/D2kJomyggm4iB9PAa1WwbwGAKIsgBiJM/WQIg1mPwiUBLbwFKYWz8RORrDrp
 pCQLJArueazRmcCsFyK7FLRFqlLoqTSoPbfR4dL8g6+wY22pXI0ZidCNDoEuP0NpDoga
 rz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XWE8ka0LFITuVWLTsvK0XnLYaX+ahuY1DLqYbhtqPVM=;
 b=Je3bxQxScedxZXT0YZeW+tCZL60zXWK3fiWoW3ZaU1sbROVrG8He5mlGVGlyOcqfZm
 maemKyza5x7w2LACO4x8d6H+bFXPfgVW7TIOVjhyogQUlAgqlezWKLJlFWbGJxpLcw1Q
 MsLOjkZd/S+uK1u5ZjGK9Eyr/CZUc1aRgZ4i5+ApgXuUwjM5wLLctt1mTYwtAO4nIjCf
 16dtNt+aH8Hed1C2sma6VJeDhyuKmMu14HEEpTccMnBv3++tAZAvXadEB0Y5NtWxH+iQ
 XwP0entwbdTCtpyJ10wVk7GUZbo/Ezm6YavoXWGJR7Glzn3TlUqe1iICb6TbX2PA7qr4
 Y1yA==
X-Gm-Message-State: AOAM531j1sGOH7zFYZxyp/Xe10EVgwuclWZ+zxqd9KK+y9aGWVLafzzy
 SiQqJztkS2gSIEwmUlpptms=
X-Google-Smtp-Source: ABdhPJwV3VqdHtOu+yvIpbun8KXIm09AgnYoutTtzWN3kkuBLC0rMsfci3Y49igHiesLNf6e99/m3g==
X-Received: by 2002:a1c:544a:0:b0:37f:a9c8:d598 with SMTP id
 p10-20020a1c544a000000b0037fa9c8d598mr14285948wmi.26.1646073341878; 
 Mon, 28 Feb 2022 10:35:41 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 x5-20020adfec05000000b001e58cc95affsm11351387wrn.38.2022.02.28.10.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:35:41 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: tc358775: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:35:37 +0100
Message-Id: <20220228183537.24600-1-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/bridge/tc358775.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 2c76331b251d..b158e5ad561c 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -649,7 +649,6 @@ static int tc_attach_host(struct tc_data *tc)
 static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
-	struct drm_panel *panel;
 	struct tc_data *tc;
 	int ret;
 
@@ -660,14 +659,8 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	tc->dev = dev;
 	tc->i2c = client;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, TC358775_LVDS_OUT0,
-					  0, &panel, NULL);
-	if (ret < 0)
-		return ret;
-	if (!panel)
-		return -ENODEV;
-
-	tc->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	tc->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						  TC358775_LVDS_OUT0, 0);
 	if (IS_ERR(tc->panel_bridge))
 		return PTR_ERR(tc->panel_bridge);
 
-- 
2.25.1

