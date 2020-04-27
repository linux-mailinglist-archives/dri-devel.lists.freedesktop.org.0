Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F341B99C3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E420B6E0E4;
	Mon, 27 Apr 2020 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B1B89FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:09 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 198so13088433lfo.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j1wBVGWZBLJGGWmZJQCkiiFA5pJ4Zh7uYCZioqKNsMQ=;
 b=uQYGN/yZ+slEiAp8AXhG6nk6Wy37f6UQ3NfK3AFXAS3QBAL1ZoIlBjS8qybs75MmS4
 2csxIuzMp97bwTFQqyBovljNX2Ii8IwCwtMKFoXhcDwqUrAPwic7w8e72nUtnGiyIi0e
 vi3v1zjVB6FFhNM1CUrfuXd3Bvl8CKd9j6PsDiK9xCneKhbgaj8R/eCVFg9DQR2yB6l8
 XKIHyIc5O4N6ptjj8wPQEm5zBrCJYx1Xz8zXez3TIqRs7JQgmCt6bc92acg7hYS6OG65
 57zTd1XaAbcjJXV1kGyt3FAXsyBMR6a8s6e3UlXf+WnGIYhHHj/nXB0d9nCOUDmooW49
 YBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j1wBVGWZBLJGGWmZJQCkiiFA5pJ4Zh7uYCZioqKNsMQ=;
 b=NkiNqkw6dQ0xSlVlxrYt7i0wdzpfrXT6mCuNMVPzSQ70dCdBPEzXnADHQq1gmAYEt9
 SEB0IIQdwAVgLEfWGjeTOCU32aR7/hJZXwkqbxFWiPmswELIXRJB187fb4W2BNDxh/TR
 mv+08IZlrBxDq4SVXdfTlTTXMjE5OZXpI9j6f6d9LrLI0no8GTRnP3j0n7EF2NmI2+AL
 +0xA1pJH6uo63ygbNpolDCTZzqWcu0022xxy62AeZVqi1GDglUXGYt/Xp2D2NkpNdO34
 LyvFh+n3FneFcGbOC/Y5OAQ0AioV2nhRc/qiI2oysWRXfNhwmU+bSeT56ZO+46mhbqm3
 WySQ==
X-Gm-Message-State: AGi0PubiiF+ihBQtQ/RRdzb4yYTYhFOe3ZwjM4Mot/gmG5IuJ4ZY5Uv+
 2TU+i0N/9g2wqJiBsCEGVUdTzldS
X-Google-Smtp-Source: APiQypJFSsoeMZ4dE5xMtoyir41iPjdtqvWNur4Tex5WqQ1ys1T3i5JdBanYln1R0vA7JYn6D4rNGQ==
X-Received: by 2002:a05:6512:31c1:: with SMTP id
 j1mr14994254lfe.14.1587975547448; 
 Mon, 27 Apr 2020 01:19:07 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:06 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 05/21] drm/bridge: tc358764: make connector creation
 optional
Date: Mon, 27 Apr 2020 10:18:34 +0200
Message-Id: <20200427081850.17512-6-sam@ravnborg.org>
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

Make the connector creation optional to enable usage of the
tc358764 bridge with the DRM bridge connector helper.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 3adb2c191499..4013add64119 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -337,10 +337,8 @@ static int tc358764_attach(struct drm_bridge *bridge,
 	if (ret < 0)
 		return ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	ret = drm_connector_init(drm, &ctx->connector,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
