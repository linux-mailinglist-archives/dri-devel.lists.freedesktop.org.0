Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C81457C77A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 11:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DB58AF05;
	Thu, 21 Jul 2022 09:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4631F8AF05
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 09:23:03 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 72so1176679pge.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 02:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JXhJu+/MueIaceKE9zlE9eNMDcNYl2V6AU9gu0sBT98=;
 b=OU6v0v68tXMXTraBb7LfYY8ZalqZCegQxnuDPYKkpSjvdldECka1/u8jGOs/4Q6eJa
 n6uBuoJuw9VarLbQ+IumBRQQEyYTddHuQVjSrxexrq6nbL6tQRMGUXHBKpv4hJOD99vE
 m836KBRdlmvWE2UaQs703OsAPAiw6Wjwn7fcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JXhJu+/MueIaceKE9zlE9eNMDcNYl2V6AU9gu0sBT98=;
 b=dgEateYjb9aMZg5uMmHSGKW1NNmBfcdRbeb5SP564yYBKdv4JbF7rvatYNXVDyAQ8p
 5wtoAi+y7J56FRuwQZxQB2dlTwjyJ+5jE19+7Z1spyQUuNijaySagJnY+9v6pXVtJV0R
 oZq4vU330HPQkE9R5bcs77z7Ic+NeZBopD+Pc5OqbCRoXU6py/SMjag+9IIzh1Hm/fvr
 OFcAb5oRplCJvrWYaaYWilRke89/D7ypPlLekMXyV/m88X1e3dOCB/sJnzPB//51Eb+5
 CmL+JZsqzMxRmJpqFL28nbMFG4DlGQ3EROY71ESlg9WsCw7N7mKjUQlq40oFMsfPbyFm
 84Sg==
X-Gm-Message-State: AJIora+/Pdt2CdmPem0aqaKFSgrhgJXFxNMSJ3P9vMI4Do1GHzc0rhaZ
 4UtVMIJBC/GK1vl1hIZah6w0bg==
X-Google-Smtp-Source: AGRyM1vQOY2FuubbKcd0WTJ/HuDX6LcP4YVQRqDw7zE5kHvrW0EnkEm/d2SIEq8t6Ciebyi5snCE9w==
X-Received: by 2002:a05:6a00:1249:b0:52b:3343:3dc7 with SMTP id
 u9-20020a056a00124900b0052b33433dc7mr34046905pfi.72.1658395382812; 
 Thu, 21 Jul 2022 02:23:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:2e44:5f07:939f:5c24])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a17090a290400b001ef3f85d1aasm3182295pjd.9.2022.07.21.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 02:23:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/bridge: parade-ps8640: Fix regulator supply order
Date: Thu, 21 Jul 2022 17:22:58 +0800
Message-Id: <20220721092258.3397461-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
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
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The datasheet says that VDD12 must be enabled and at full voltage before
VDD33 is enabled.

Reorder the bulk regulator supply names so that VDD12 is enabled before
VDD33. Any enable ramp delays should be handled by setting proper
constraints on the regulators.

Fixes: bc1aee7fc8f0 ("drm/bridge: Add I2C based driver for ps8640 bridge")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 31e88cb39f8a..49107a6cdac1 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -631,8 +631,8 @@ static int ps8640_probe(struct i2c_client *client)
 	if (!ps_bridge)
 		return -ENOMEM;
 
-	ps_bridge->supplies[0].supply = "vdd33";
-	ps_bridge->supplies[1].supply = "vdd12";
+	ps_bridge->supplies[0].supply = "vdd12";
+	ps_bridge->supplies[1].supply = "vdd33";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->supplies),
 				      ps_bridge->supplies);
 	if (ret)
-- 
2.37.1.359.gd136c6c3e2-goog

