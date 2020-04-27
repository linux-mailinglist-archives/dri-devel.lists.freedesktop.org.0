Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168581B99D1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBBD6E0F2;
	Mon, 27 Apr 2020 08:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909D889FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:06 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u10so13050068lfo.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xeuu1jYzNEltJPw799kxI/zy0nH1kCXYGlHuMvk52IA=;
 b=TOaqkhECjqNP0HYTmVh5qPkinsK7Kh7goK5K4a31lajwVLZaOuY7cYRG4eUfAJdGw8
 G+Y3yjHYmWTVZ37Ml9DqCGFo0NAF79EHxFCNsvDZOCeaO33W2PMbMcZjenOZQKs3Qy53
 IW2Op/k2B+SxzX7doZljRUhGdxZdb64RdQs1BNV07WBU2haSjM+VVDIR+hr+V9s0zxPw
 tO83d0tVJ6hK53zwQYntbCJuSoEMnqWEfQteJVN//2yiiqPt0fUrRyvRu7iZlbp+/KGh
 jFctrBopCNv6GIIBEI21JUNGBPEcKJkikIKoiOuCQfuBz8recR0U+3oHcCcz/K7+OQ6K
 eCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xeuu1jYzNEltJPw799kxI/zy0nH1kCXYGlHuMvk52IA=;
 b=gm6WH85Me/W0B/GuYqN6qUfZdFYcV235eA0zpVpRnbDnpWO52M4OcF7OQfJEjwNz+F
 ZVbsrTDu07aidkM+flAscZPg7l3gjCdYz9z7jjSQkit5m6hZnbhhio7aV8qLdWf94m5f
 Wop6EzMwFxgU+nxjO9eoS41pC/8era3wQlBGAG13OvKIYNr9+Mah6MoFw8ljJe+hDhxM
 KQoPGaK8ZZiFQLRHd2/uAyKukTse3ChNfiF8W5LhQ1cdvOG5BEJ6boUoWEFD9CFSDcxc
 aWDXfmcTkxVhdHH/7ammF+YvclJbabVvTC1B/pf1YQKDO9pH2QCL4GfS7jXLGKATQ9fG
 NDtg==
X-Gm-Message-State: AGi0PubTnjKxXIf6grB7sNcvdMJMW/5uliHsYAsNh1ak1hLjot0JGMEi
 tKujPC4vDHwZBi34NlK7cHNsYKtr
X-Google-Smtp-Source: APiQypLQS3B064UcugCUIB7QbBxE46ZJ9dqKU3JzxIejrjrupGcnMNlRSbDO/k/u7dR6QBI6xlpgbQ==
X-Received: by 2002:a19:d84:: with SMTP id 126mr14818637lfn.35.1587975544722; 
 Mon, 27 Apr 2020 01:19:04 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:04 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 03/21] drm/bridge: tc358764: drop drm_connector_(un)register
Date: Mon, 27 Apr 2020 10:18:32 +0200
Message-Id: <20200427081850.17512-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop drm_connector handling that is not needed:

- drm_dev_register() in the display controller driver takes
  care of registering connectors.
  So the call to drm_connector_register() call is not needed in the bridge
  driver.

- Use of drm_connector_unregister() is only required for drivers that
  explicit have called drm_dev_register.

- The reference counting using drm_connector_put() is likewise not needed.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 5ac1430fab04..a277739fab58 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -375,7 +375,6 @@ static int tc358764_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
 	drm_panel_attach(ctx->panel, &ctx->connector);
 	ctx->connector.funcs->reset(&ctx->connector);
-	drm_connector_register(&ctx->connector);
 
 	return 0;
 }
@@ -384,10 +383,8 @@ static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 
-	drm_connector_unregister(&ctx->connector);
 	drm_panel_detach(ctx->panel);
 	ctx->panel = NULL;
-	drm_connector_put(&ctx->connector);
 }
 
 static const struct drm_bridge_funcs tc358764_bridge_funcs = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
