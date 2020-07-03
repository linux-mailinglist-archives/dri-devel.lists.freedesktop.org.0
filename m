Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D485A213FE5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C6A6EBB0;
	Fri,  3 Jul 2020 19:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1A26EBAE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:30 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id k15so19069005lfc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9+yqYON3+B159uDVRHmWDcBoh5JBmCFpO42dqnb8M8=;
 b=b7XT+/GlretaDw32GHh3aZlCryLC+MRCZ5VzA15iuUpDuxgxvohZAMNbu07LipX3d6
 A8oimpn2jAc535y01xW2el3RkU6pOKs+j4EcgDZ0z9DpxIoOSxznvWkOa9zswQxwTRu7
 9DR80BgEqGqI2i7RrXru3ThE/oybNOKolyzkJO+WOOYCnNlBQOXEnujlUa5vG4H1ojSc
 AKgML7JYW4g4yMJZEnQazLCyeoIStj33dm2X9lQA2REM8kNtH0iW9UgHo94sQc74pKxs
 c02LjPRMkqCutszKW2mWSYRLW3vWU+VrNDnO0LlCSUVu+OnsFtie5lHmxMzxePKmhBl9
 WLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s9+yqYON3+B159uDVRHmWDcBoh5JBmCFpO42dqnb8M8=;
 b=PjnG1BvntRGgHEwSG1c28RxOjlJMgfQ3HogMPAAtzbUQgp73edFItrHkQBeJL/Ypjn
 vUr4efMzvp7ZVqOCKacGYvrYt09/KcjX9/cGUhFDYV6D11VBCPEfWR/ivDVoFORIsXlm
 l0RFTtjT3Q66O5ev6Pjmm3C27ecFyLE0/gxSHRJwZOJ4Ls8bMW6QnmY/KzjKN+7Bhige
 ROAveCrTqAm515dlUizoeGu/PBcurjA1RQ2UsE7dm72lVCSV5TUvGVpHfGjofEYIQ1OU
 PsnHYsDqS42zPU+GkN2GW3FQTL1Xe8aYlO63/L6JkgawnIrjH/HNNbC2JgNZaCBNQ6C0
 5+rA==
X-Gm-Message-State: AOAM533/Z/t0CEbHCuCwcv6Hum5N6yl2Q/f8Cx7sUScn1v12Iz+rPvsI
 ARylyHjyIkr7t8JMBIxtJ8Z4xKLyoUg=
X-Google-Smtp-Source: ABdhPJyrf7VavIu1yA4+atGHqVLD0o2ZQuVoUwaEQ4Jzr+QYenW9EBkhPQBnycNnnoR/MZcFntv06g==
X-Received: by 2002:ac2:544c:: with SMTP id d12mr22683431lfn.97.1593804268422; 
 Fri, 03 Jul 2020 12:24:28 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:28 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 03/21] drm/bridge: tc358764: drop drm_connector_(un)register
Date: Fri,  3 Jul 2020 21:23:59 +0200
Message-Id: <20200703192417.372164-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
