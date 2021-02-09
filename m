Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8897A314F04
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04E6E051;
	Tue,  9 Feb 2021 12:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7C36E051
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:37:49 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id q20so11813270pfu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 04:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEWcLvUvYkWYLO51rzp4RR+x1aKBWP/abPyEZI4rYFM=;
 b=UA7qw6pCaOdf/yqq69etxef0untkhUFXSI+O9aCuyR/lOYzzPCRtWaHB6KbMDFaObh
 maH0YiX2IcjeEONLLi2m+Sk+3PTzs33BzrB2mJ0HcLcjRk2r9l8yFR3/KfrkL6EkdZzb
 i8Cave62QyllrlcUMYo1mEwijF+bfDhpgxDWkcnziTD6OcT6DxjwzJyWMEFdZWboC3uY
 cbIO+ZB5NSD6J70UHw1gRakG/afPMQiZ5Hd6tPMcqAv+xikSyDJDq/u4w5z8EMpDP8T2
 Lg8Z3VO2gx3ssY95EEyC5FYR7D6991/PEqnpomJXo/ZUGeBHxea1UuMcYEtJj3Cc0wko
 9Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HEWcLvUvYkWYLO51rzp4RR+x1aKBWP/abPyEZI4rYFM=;
 b=rncD5jG05DWQGnIC0Uq0g1WaB54BlyAdSHXol11jbuggFjR/bPVZb9t5ZkGPYnl2qN
 Uu21HvtLOJd3+kNlGLaK6VsIhs6UmJm+GvFc71KhXyXnnAiSjgeeK5ipNSNWAp7ctG7c
 PKlF43HU0gUMrcTRiNyE5f/Xbyc10/zNpw4o0a5PggHFdDAyeOawPJojdmVi0M5ZlvJG
 R7HX76iEqYPaYYcC/kxg7sDX/iJFFXturXh4R+fj7NBgxJajelb5Sb+fzOW+8Ve76e0j
 OUqo1XQVV+2lRkoQW+FXGjOZwx+FqLvPIQMZAWCdEz6lJ8yibxiPv+LBWtXYu33WO5+W
 wjbA==
X-Gm-Message-State: AOAM53078jfk0cftALHtqUQYmgv8otro9tQ89peh87XKp+t9grOQ76wz
 HVEekvTx5pr0thPbFGrtD0THHJbaKOqzvA==
X-Google-Smtp-Source: ABdhPJyzzNoV3ORY6H1uJ0CJ3FGX0Y0Hbb6/83hFpXTlUvZfQQ4ZzNnS2ckv5IYMwgAECs49OLy6zg==
X-Received: by 2002:a63:c70c:: with SMTP id n12mr22157570pgg.347.1612874269194; 
 Tue, 09 Feb 2021 04:37:49 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i7sm22584395pfc.50.2021.02.09.04.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 04:37:48 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v3 1/2] drm/aspeed: Look up syscon by phandle
Date: Tue,  9 Feb 2021 23:07:33 +1030
Message-Id: <20210209123734.130483-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209123734.130483-1-joel@jms.id.au>
References: <20210209123734.130483-1-joel@jms.id.au>
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
