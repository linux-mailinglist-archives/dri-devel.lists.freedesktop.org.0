Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB3B486C55
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C855210EF0B;
	Thu,  6 Jan 2022 21:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A0010EEC9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:16 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 205so3642048pfu.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPtGNMfzlxXubKgayi75A1lRD5p2YHP9GYCHjNIhA04=;
 b=F/n1S4F8s3kPZEe2GW35Eidb0SesLDzR2YqgAQAZIHrdsevP1q9bknfHQTxF6SqGJm
 Nfl9MQ9rGKoXrK+IFOpOOh3SAwv6F1KaWuQD7pffTOrkiJO/cXpEdVGWkZZkJ3dX53Xr
 AdWLpJwFpppBOInDDUOP4omGqDFxmR1REDYFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPtGNMfzlxXubKgayi75A1lRD5p2YHP9GYCHjNIhA04=;
 b=e4Xk5ya+O2RYuaVf5X4qL1z9ztGj7PTVMpT25gsCThEQNqqczYp/NY106Ajl82mNWQ
 Pel+iDR34JAKYoxVFw2SXoXw+zWzAWj6XknFd/FhPB0f0ufRjSXpfVUQ8zAHsUNrNYhX
 pi6fF7BJEqK31QQsuCOZIEM2e+M4GjaiJ21Ct3RjtfO8eA3hKHD68qMgbleMFuCh9Epv
 4nnWCYLJRdOGn+w37D2owwZLIzbMpxwvul0ZL2lvyRBHkUMR5VJ1UOp2SEXhOHL+3GFG
 185V7KgWxkU76j9vz0lzOyqPHKrC339N+te5S3vg70vaOvRz1RLCVtcpfjKiYlqMs1YM
 K+Cg==
X-Gm-Message-State: AOAM533Fkv7pigejRn66zYtJ4XnVDZUZVBdrq6xEab7een07JYZqrOu4
 +GhjCXY045C2ugxjKimDWw3UZA==
X-Google-Smtp-Source: ABdhPJzDyXbJ5oiJeJM1+1uFcXWrB43YEPXT+ZHV9hULBBomq9G68oQkCiEkLjlw9Juc82HcneKgAw==
X-Received: by 2002:a62:1642:0:b0:4bb:b3b6:c037 with SMTP id
 63-20020a621642000000b004bbb3b6c037mr56659975pfw.50.1641505576581; 
 Thu, 06 Jan 2022 13:46:16 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:16 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 13/32] drm/exynos: Migrate to aggregate driver
Date: Thu,  6 Jan 2022 13:45:36 -0800
Message-Id: <20220106214556.2461363-14-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220106214556.2461363-1-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
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
Cc: Joonyoung Shim <jy0922.shim@samsung.com>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index d8f1cf4d6b69..dcb52ec2bd35 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -253,8 +253,9 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
-static int exynos_drm_bind(struct device *dev)
+static int exynos_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct exynos_drm_private *private;
 	struct drm_encoder *encoder;
 	struct drm_device *drm;
@@ -330,8 +331,9 @@ static int exynos_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void exynos_drm_unbind(struct device *dev)
+static void exynos_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -350,9 +352,13 @@ static void exynos_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops exynos_drm_ops = {
-	.bind		= exynos_drm_bind,
-	.unbind		= exynos_drm_unbind,
+static struct aggregate_driver exynos_drm_aggregate_driver = {
+	.probe		= exynos_drm_bind,
+	.remove		= exynos_drm_unbind,
+	.driver		= {
+		.name	= "exynos_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int exynos_drm_platform_probe(struct platform_device *pdev)
@@ -365,13 +371,12 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(match))
 		return PTR_ERR(match);
 
-	return component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &exynos_drm_aggregate_driver, match);
 }
 
 static int exynos_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &exynos_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &exynos_drm_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

