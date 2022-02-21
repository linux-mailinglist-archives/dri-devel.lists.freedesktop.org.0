Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13144BD6D7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 08:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85AE10FA48;
	Mon, 21 Feb 2022 07:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB0110FA48
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 07:42:37 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id i19so8950273wmq.5
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 23:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R9gzKenx+aszBYGgfBSeWmEFs7B/QZ34GNE9lVymcB4=;
 b=YHqLcuZRVcf1bNB/ivMHeUFOdizHM6H7zZ4A0vH3H5/uGh+nDnQ6Z0FRwqxyzn6yps
 XuVAvne2VPbsPFFme5eMfOQ6zvUeB4texlLYP9lPfSdywZeH8fYXMikKi3HNJXZ1Q8aG
 KKEQ2HINoO8DJ4rxybRTu2AGSvIU6APVbIXRMOHLeZ4ycnf+J5UHisYKThrxxuSbn+s7
 /P0Tg2fGNCpUuv7QtWdzw/S1BI8DsRgHXpA7JZLDhkKywoVdIyqJkyedv0xmIJChumyJ
 MaCAj6GSBfvwsAbMPevZ0Vy7bDBSadQaFLMrVuDyiMDuHqR1QSR64L4Fzrp/oQ2tMROh
 6NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R9gzKenx+aszBYGgfBSeWmEFs7B/QZ34GNE9lVymcB4=;
 b=46QxAqqSCMj8JaUl77cz1T1Ef8GNvpZLu/6WPNVKOyCJdnZvTXkVXMVo5K5YnQF6xx
 y1aBdl7j4lqutV+5RgMLEwX1YMXuS3N8m5fR4khthU2XGR4cX+ioep8j0SQoQBLopw9z
 XqOiZfanfCb69P/7Z1hJU8VgUK84g52KjmMfjDV7knJL6c3J4+ptXPY0++Rbns2CSMuK
 D++4nn0+8pwv5rZ0Fz51qxnuQLkzn8zwk0h+7lvArr536yK8uVjIPDz4IZWbD9/Vm1x2
 Lt/QsC+xONs0Ztm2onE0gAJWFv3aih5v1L+j2QMOcmdhxfRirOcb633A+RyHi8xIjhtk
 n24A==
X-Gm-Message-State: AOAM5301KOwZGJOoadWqUJ2biPj6vpWWtLlq5s8dW5qvSPwg/MlMGmAU
 0jFDOfmgPuVDyzRE6DIA43Y=
X-Google-Smtp-Source: ABdhPJwZdJzRu4i7z3qg4jpAoKRVhllG5OYuhM4QqelqutkZmJs34W3J9Om/p4Bz9LrPxDN96mb5fA==
X-Received: by 2002:a1c:a946:0:b0:37d:1e29:5ccb with SMTP id
 s67-20020a1ca946000000b0037d1e295ccbmr16564422wme.8.1645429355803; 
 Sun, 20 Feb 2022 23:42:35 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b0037bf83d99a2sm6828276wmj.1.2022.02.20.23.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:42:35 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jagan@amarulasolutions.com
Subject: [PATCH] drm/bridge: chipone-icn6211: switch to devm_drm_of_get_bridge
Date: Mon, 21 Feb 2022 08:42:24 +0100
Message-Id: <20220221074224.12920-1-jose.exposito89@gmail.com>
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
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com, lgirdwood@gmail.com,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index a6151db95586..23c34039ac48 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -178,7 +178,6 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
 static int chipone_parse_dt(struct chipone *icn)
 {
 	struct device *dev = icn->dev;
-	struct drm_panel *panel;
 	int ret;
 
 	icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
@@ -214,11 +213,7 @@ static int chipone_parse_dt(struct chipone *icn)
 		return PTR_ERR(icn->enable_gpio);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	icn->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	icn->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(icn->panel_bridge))
 		return PTR_ERR(icn->panel_bridge);
 
-- 
2.25.1

