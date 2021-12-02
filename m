Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF07466C85
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D9E6FBD0;
	Thu,  2 Dec 2021 22:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA5A6FC5F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:56 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b13so758501plg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlRODoqLGygqE0LYiWEnBFh9kz/XzAvDsSAOOxu5peY=;
 b=aYALRHsFn0lNW8BmuMj4+kHCOs9s7+R3OgAv3OJiR95IZOKFQZ+w9qea1ICG/SodJ/
 +igOzUmHyzEw8aAwsBgJXPFpnzUsIWHpzkXGRs6MiCl/xNqRK4S7e4JncJDKrp9lxp5C
 rfQZhyDKl2Hmvyfaujv6SVjj5DXjOOdZ9ekBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlRODoqLGygqE0LYiWEnBFh9kz/XzAvDsSAOOxu5peY=;
 b=QC4fFaSTEobCbgmC4vCv42fPkHQ3C9RSL6yeBMijpLUQ0OIZ73LM7OnvpVkYp8aoDW
 PlTaobzU6vC5UGbIM3g1WKfUM/X+2QJSKVw2Nu7JFZTodgG9ETwlFYzuLmAp08pIY2OQ
 b+UOQmOJKBLeW3R0cGSZYUA/U53MFuH3vA5DA+UHZYo6/krIPRRw/oOz8QF73hT4d7Ug
 YMEO6VZXkXMZBZwz18rGA67K4O5C/9R6CfUG9hlB8T8wHMuJnqXsV4oXlVe5H9EHhiuI
 dvBOHcnPjgyQ3Yxot6qU4cIGR1Ce1SRJCJ3ExR6D3GZu77DYMLwLLrerBT8G0RvDCjQz
 9Dkw==
X-Gm-Message-State: AOAM531BswabZouEYxON/J7n4VuaJnUfUFEvqp0vpD1sSkwzq4sUqJJj
 0UjIzJvHtEiit4CWRYEM5pU7Poy7ozPyRA==
X-Google-Smtp-Source: ABdhPJxUiQZ6cWHUZ7HxSKVla2/DNt2mW2yGwcM3YSXCD3G009K29EH1KFvgM4SvxeeeA68bDxoOhA==
X-Received: by 2002:a17:90b:4b03:: with SMTP id
 lx3mr9200581pjb.18.1638484076151; 
 Thu, 02 Dec 2021 14:27:56 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:55 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 24/34] drm/tilcdc: Migrate to aggregate driver
Date: Thu,  2 Dec 2021 14:27:22 -0800
Message-Id: <20211202222732.2453851-25-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>,
 Tomi Valkeinen <tomba@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Tested-by: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3ddb7c710a3d..92ff516fb6de 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -529,13 +529,16 @@ static const struct dev_pm_ops tilcdc_pm_ops = {
 /*
  * Platform driver:
  */
-static int tilcdc_bind(struct device *dev)
+static int tilcdc_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return tilcdc_init(&tilcdc_driver, dev);
 }
 
-static void tilcdc_unbind(struct device *dev)
+static void tilcdc_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *ddev = dev_get_drvdata(dev);
 
 	/* Check if a subcomponent has already triggered the unloading. */
@@ -545,9 +548,13 @@ static void tilcdc_unbind(struct device *dev)
 	tilcdc_fini(dev_get_drvdata(dev));
 }
 
-static const struct component_master_ops tilcdc_comp_ops = {
-	.bind = tilcdc_bind,
-	.unbind = tilcdc_unbind,
+static struct aggregate_driver tilcdc_aggregate_driver = {
+	.probe = tilcdc_bind,
+	.remove = tilcdc_unbind,
+	.driver = {
+		.name = "tilcdc_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int tilcdc_pdev_probe(struct platform_device *pdev)
@@ -564,12 +571,9 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 	ret = tilcdc_get_external_components(&pdev->dev, &match);
 	if (ret < 0)
 		return ret;
-	else if (ret == 0)
+	if (ret == 0)
 		return tilcdc_init(&tilcdc_driver, &pdev->dev);
-	else
-		return component_master_add_with_match(&pdev->dev,
-						       &tilcdc_comp_ops,
-						       match);
+	return component_aggregate_register(&pdev->dev, &tilcdc_aggregate_driver, match);
 }
 
 static int tilcdc_pdev_remove(struct platform_device *pdev)
@@ -579,10 +583,10 @@ static int tilcdc_pdev_remove(struct platform_device *pdev)
 	ret = tilcdc_get_external_components(&pdev->dev, NULL);
 	if (ret < 0)
 		return ret;
-	else if (ret == 0)
+	if (ret == 0)
 		tilcdc_fini(platform_get_drvdata(pdev));
 	else
-		component_master_del(&pdev->dev, &tilcdc_comp_ops);
+		component_aggregate_unregister(&pdev->dev, &tilcdc_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

