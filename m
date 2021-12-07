Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04246AF2A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 01:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CDA6E937;
	Tue,  7 Dec 2021 00:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07B46F3CE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 00:29:38 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id k4so8199647plx.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 16:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KwSNWNmS5A3o/1YUiJZz0ef7pg3vZf37AUR9Jx7txiA=;
 b=j5TPG5D6iGGlUhUGkz7lWoOFUl5Zcy1I25YFqtVQzQMd9hRvxHo1g8FJghAKUzJwyn
 qQ9W1va6XU4ulE3fo6MjQcXlsVdrZfbY24YqeqzgelWwCLDS2lLgtFm4n4T/Rv3efjcO
 TgoCHgwehFBceoxjK1ztr3yugEkMOttl+KZIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KwSNWNmS5A3o/1YUiJZz0ef7pg3vZf37AUR9Jx7txiA=;
 b=LtCIh5MO5lWWnC62r+m0g2q7g+D+5AwxN0v+HeltYpAenrhHukP6ydlLGcSAKii7Ao
 Pxx8sWWyoCvq/m2SSBpHBLy5HAAmNIgfgRwbgu5BnarUv4jZ5eYXmVwIak0kxRGvORYE
 M7EbEfWTdMztH1TGYcLWiMhNwgIQhq5ZFm59wycwoJZ9lYZPUx25JppabzkynV8vNgzm
 quh7p0OoHpQvK9CZgJDS9eQFbzELaVY3PxOF6NEL8JuvJmXzSEJqBJHuj8Wh74LQwIqA
 VuYsFHzRC1d7l1QUp1U+hMTKW5njZELOB6ECOBjdc1xku7YDpwBnEJ6YYPGFjCdWj5K5
 WP5w==
X-Gm-Message-State: AOAM53180gBNbKu0nWb3m66MQS1ntuYUv3JiuXY2eo1lR98JRUkWnAE8
 o8P0c9DYwcVqasyyAiEcfptyj3A87R7Q9Q==
X-Google-Smtp-Source: ABdhPJy4GyDRBHTZ2ZmWGQRiCTI+9pVPBVlT1KvfSYKm8ucP4rQoWfP/6Hqa+/0WzTjprT3f1yzInQ==
X-Received: by 2002:a17:902:bb97:b0:144:d5cb:969f with SMTP id
 m23-20020a170902bb9700b00144d5cb969fmr47338882pls.36.1638836978293; 
 Mon, 06 Dec 2021 16:29:38 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:a783:e7e8:acf6:96a5])
 by smtp.gmail.com with ESMTPSA id b8sm13141154pfr.213.2021.12.06.16.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 16:29:38 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: parade-ps8640: Add backpointer to drm_device in
 drm_dp_aux
Date: Mon,  6 Dec 2021 16:29:16 -0800
Message-Id: <20211206162907.1.I1f5d1eba741e4663050ec1b8e39a753f6e42e38b@changeid>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
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
Cc: Philip Chen <philipchen@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we added the support for the AUX channel in commit 13afcdd7277e
("drm/bridge: parade-ps8640: Add support for AUX channel") we forgot
to set "drm_dev" to avoid the warning splat at the beginning of
drm_dp_aux_register(). Since everything was working I guess I never
noticed the splat when testing against mainline. In any case, it's
easy to fix. This is basically just like commit 6cba3fe43341 ("drm/dp:
Add backpointer to drm_device in drm_dp_aux") but just for the
parade-ps8640.

Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX channel")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 26898042ba3d..818704bf5e86 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -449,6 +449,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
+	ps_bridge->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&ps_bridge->aux);
 	if (ret) {
 		dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
-- 
2.34.1.400.ga245620fadb-goog

