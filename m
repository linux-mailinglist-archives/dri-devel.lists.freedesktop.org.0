Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0E830B751
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 06:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12D86E8BF;
	Tue,  2 Feb 2021 05:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13916E8C7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 05:46:13 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id u15so11852897plf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 21:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEWcLvUvYkWYLO51rzp4RR+x1aKBWP/abPyEZI4rYFM=;
 b=HpuuWareLWeEAeZr0X/SrjJLr0wnhOLwG79M8rRveb8GLZtjklgyYM5/AViq8HXOPV
 r93GdrYThzkoxsupajVRFYMXjF7miGvNdwJk0cbw0V6KJOl9cdm/IKavMiYT/2L1TKhE
 kKQO8V7Orn3mDF43Uv0qmSRcxfrSGGdzeRZf/d8U2aGxP6m8QgqHACDIQ0QtyYr92S/x
 pm2VyY1D+E4Rc+UPJX9HsvIvG1/bDLPxA2Wm2fiRO93ix6mS6Gm8evIniBFlWVk1CHUD
 Wsog2C71CyWnq6cr2IpeJ5JJ319LpKm/6EqO8ZeFM4lVXp1p3qpTFOOK4361R3LB3Ywj
 /vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HEWcLvUvYkWYLO51rzp4RR+x1aKBWP/abPyEZI4rYFM=;
 b=CWYIkBXxdILo5Hmls7EPxOgYKJJqt0XhSfpcAeAmfsexrS57kxunLBYd60pZgdjR3C
 PgBEdJ82mF/9MamtDpxKg1+SSHLRTGtiipbf0kRciZLEeyYo9LP2t5/TFuFGeV6DQZCu
 wUvUMFK4f/fnRy5Q4dEX8OUKd3LQMiyPjOLWDk2AuPJAOxeZIKHhCq9/iE2uwEBzCAqX
 GTnXQ6/lKvQGOqravL6M2E3JpEnZEnsbnpaLI24DBAP6cvsio2I/Rt2Iw3S13y5hZchI
 Yc1jdibdOKCdVdyx907xw6a/y6fhs1cS8x/WZkiTkZB6k1qJaZrci1whBXIF1nRYxo72
 7m5w==
X-Gm-Message-State: AOAM532MOXCU8Bz5QJbgULh8e/8kE7hnoPLNqjjTNaru9Pv0YK9JmWk7
 y2uwwXYOExgDwzSHsUg1J+k=
X-Google-Smtp-Source: ABdhPJxPeeH4oyjGqsX3X7lT6vCX3Rb+QCe2L6JRHf+w/TIboBW6dcl4JXfKpl+jeR3ISoJ1Pgb3sg==
X-Received: by 2002:a17:90a:6342:: with SMTP id
 v2mr2497324pjs.150.1612244773488; 
 Mon, 01 Feb 2021 21:46:13 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id h23sm20707603pgh.64.2021.02.01.21.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 21:46:12 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2 1/2] drm/aspeed: Look up syscon by phandle
Date: Tue,  2 Feb 2021 16:15:57 +1030
Message-Id: <20210202054558.344451-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202054558.344451-1-joel@jms.id.au>
References: <20210202054558.344451-1-joel@jms.id.au>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This scales better to multiple families of SoC. The lookup by compatible
can be removed in a future change.

The fallback path is for the ast2500 platform only. Other platforms will
be added with the new style, so they won't need fallback paths.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix fallback path to still find ast2500-scu. Thanks jk for the
review
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 457ec04950f7..54a6bda03c0e 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -103,6 +103,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
+	struct device_node *np = pdev->dev.of_node;
 	struct resource *res;
 	int ret;
 
@@ -111,10 +112,13 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
+	priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(priv->scu)) {
-		dev_err(&pdev->dev, "failed to find SCU regmap\n");
-		return PTR_ERR(priv->scu);
+		priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
+		if (IS_ERR(priv->scu)) {
+			dev_err(&pdev->dev, "failed to find SCU regmap\n");
+			return PTR_ERR(priv->scu);
+		}
 	}
 
 	ret = of_reserved_mem_device_init(drm->dev);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
