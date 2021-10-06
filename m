Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D4424731
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEFD6EE5F;
	Wed,  6 Oct 2021 19:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4F689241
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:51 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id c29so3301119pfp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8fBlAXi6sFYrXtAp7S0GQqlwZRRttRb1KFYpoiMF4WI=;
 b=YLxBqw/K6GYJqDVDGjOe0xLgAuNDXTn+4l+6boKAKuzVsS10fSytwCFxB1h+WlXK6t
 kcvtodC48R6aV8p1X0Y8QU17fBJgjecKFDgN0GKG/9GIf9wgIMaE7FGmZnfw4BHHt3Wn
 tJkv2hhGdpwFSXMlSXBGkUUP1RP5mXSET0SWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8fBlAXi6sFYrXtAp7S0GQqlwZRRttRb1KFYpoiMF4WI=;
 b=IWQ+8JzBosXJ8XGPnw6QGhSxv3OT4bIh058pVI+CXMjZFaJckR4OHqWcVpy1t77VI1
 VQEFPy5B4uUPlHpsYWFU37ctXAWDbOJYsQcLcqOgJgwUir3M0vua60tpU++U9Kw2ykQj
 /DvlIaC/jzjEG1URlFwnF5CEuWOBOb5z3tIrCcYuJlmCE3+N45KzdMsjdhwj6Ax/xo85
 mAj7fFs5pdtH+yXkIfzv8wPlJlBdCU25KW1QvJOHd8svl4J4vjnQImPumdxemMmf5xzo
 7cticXiAKhGdV+Jc77jgZFJjGjCfDVWq5JLpJV9m3oSnSl98gR/Zsvj6Fjuj2wDNlzCi
 vQRg==
X-Gm-Message-State: AOAM530N76UhbPLLkRi9TD/aHFmdrWQ2eAj2lOWNOCalCc12MTECFbfa
 8iXqsVXx11IOZ/jNxozZL1tjdw==
X-Google-Smtp-Source: ABdhPJzAkTtDc2TvdMKSzgurwunQ3xHuNLswxVRqr4heTJ45qdgTz9sSL9xUIdpA4rdD3cWD29xe8Q==
X-Received: by 2002:a05:6a00:138a:b0:44c:b200:38d7 with SMTP id
 t10-20020a056a00138a00b0044cb20038d7mr180948pfg.5.1633549131211; 
 Wed, 06 Oct 2021 12:38:51 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:50 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 24/34] drm/vc4: Migrate to aggregate driver
Date: Wed,  6 Oct 2021 12:38:09 -0700
Message-Id: <20211006193819.2654854-25-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index f6c16c5aee68..bccbde7a2f59 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -214,8 +214,9 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
-static int vc4_drm_bind(struct device *dev)
+static int vc4_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
@@ -286,8 +287,9 @@ static int vc4_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void vc4_drm_unbind(struct device *dev)
+static void vc4_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -295,9 +297,13 @@ static void vc4_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(drm);
 }
 
-static const struct component_master_ops vc4_drm_ops = {
-	.bind = vc4_drm_bind,
-	.unbind = vc4_drm_unbind,
+static struct aggregate_driver vc4_aggregate_driver = {
+	.probe = vc4_drm_bind,
+	.remove = vc4_drm_unbind,
+	.driver = {
+		.name = "vc4_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 /*
@@ -328,12 +334,12 @@ static int vc4_platform_drm_probe(struct platform_device *pdev)
 	vc4_match_add_drivers(dev, &match,
 			      component_drivers, ARRAY_SIZE(component_drivers));
 
-	return component_master_add_with_match(dev, &vc4_drm_ops, match);
+	return component_aggregate_register(dev, &vc4_aggregate_driver, match);
 }
 
 static int vc4_platform_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &vc4_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &vc4_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

