Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A43E22E28E
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4D56E05C;
	Sun, 26 Jul 2020 20:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FD689C25
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:37 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f5so15001583ljj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9+yqYON3+B159uDVRHmWDcBoh5JBmCFpO42dqnb8M8=;
 b=HVRVrE1mlzC5UYwx4evJD5nJcyDMvu812kCzJBtU618ymD4f8gL9c4+7mMVMChJDoZ
 fgVKSV22y/e7rFdnPrZIvMV0V/i6qj6eIbPiv9hqWgVrYf/pADjI9BHAaVdPDeUF+gxr
 nq7lqMiv97gtXrjtYRathyyp7FBYW+BuCydviXU82DHmSrupOqpTyLJxszeJKDv6dsO+
 pbDiUsKlS9Qll0isUNskUmRHptk1rnwQd97lGQUvpdXnrhIVVbgXLcQsa3+DHe/p84VY
 T9hEv1PJUX2rDFWDzT0WBvqqpmKFcdYPXotC7vWyrugDTfJdzDLZsC8EXEQzLz8yHahM
 PudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s9+yqYON3+B159uDVRHmWDcBoh5JBmCFpO42dqnb8M8=;
 b=hYsldoTmGmCvU53nOS5N3kYVMDnC7/oNEShz8oPCeQYbwoy6UOMIUkib/icOt0JW9t
 VA39Z7t11jj8wRlFHuOpBdp7xbvsGqoEKGSi7OPCFVA+hjnRpKDVyLS2t9BaDr1D05tF
 0V6agVLDXP6KIEVplYe50uNLK5h62gigvT5fmtpP32K83zqchncpVUsn/MguvtowPsug
 Wq/QAkuj263U7ryX+euDAR66lMDczFoPknnqSkV6NUQP9Y1otBEzaytDUX3W5PLsAzT/
 l7XEc5Lux0wuJjoY0X2bMhtOGkQYe1Za97Pto/9rQtfUCZRDjj0OvgLzjUp9/pYKfaYk
 S1cg==
X-Gm-Message-State: AOAM533U8LPJ2ZtzfncroV9BcWPNGAHyUWR1949QKONdYGRFG2cx8Tqq
 iOURgQzNnML/rR2uxwkYZdo0HMIflPo=
X-Google-Smtp-Source: ABdhPJzEn5r7V8JvS5BxU8nUEPAnXYkMGb8oKPcYulh4iiumfIlrUbvz+kgWIvj5i4wZxYDMOoTxcw==
X-Received: by 2002:a2e:5c5:: with SMTP id 188mr413169ljf.466.1595795615842;
 Sun, 26 Jul 2020 13:33:35 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:35 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 03/15] drm/bridge: tc358764: drop drm_connector_(un)register
Date: Sun, 26 Jul 2020 22:33:12 +0200
Message-Id: <20200726203324.3722593-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726203324.3722593-1-sam@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kbuild test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Martin Donnelly <martin.donnelly@ge.com>
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
