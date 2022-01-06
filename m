Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BE486C57
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC2810EED1;
	Thu,  6 Jan 2022 21:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5112B10EED9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:18 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id q14so3416374plx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOJT4e2/QJLKFjWixGXmSkqLgf4Tc1N8aTB3xOsamvQ=;
 b=ILyUjL86PabuV9iHfi1owzAuxjRlH7hKmctefUf5iFSmxQ8yCo6Qxg6zuq8+cH5t8y
 8J0ddJ4qudUuoIlluaf9tgrxEAF9hlHaJrFhw3EfweYx2L4UlcukINHY/jfEMiup7Ohq
 9Op19HAyziojbD0kXGY/lhxAXsVKWhFs600dQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOJT4e2/QJLKFjWixGXmSkqLgf4Tc1N8aTB3xOsamvQ=;
 b=0dU0muEDkGBcxWRzJh6ApU9hMntyQBkU+qS5BhGeNav7XCD1Cv8Yrv3zip+etGQGLO
 MSJE3y1rNFtK17Xr0ZinWrnRi0JrVf/9C2h/oTL2TXfl7gcDGzmmYTUzHaQLzWukMZyC
 OYZSh3BvSoKTumJMcgHz3HRKgNENJ04SPCM9ggjhnhNJ3URRxGcpOA9LwRvi7XZTwypp
 Ir4yF+cn8qbn/uEVMYgREPH7HYjDu5uZlNsEz9crOzLLhpLg28WWM61wuR8VjOTKZ0go
 bpwJm0JxwZpbYEMR+t8YKtUWa7axrLvjmXFnnAmRMndbKiFyarL2a1UkmI3GnS3iQ+E4
 JjPw==
X-Gm-Message-State: AOAM532VbQmbVK7KGT5SDE/vdP/ZXBVSby4uSJTsJU1QYYt+zLoH1D5q
 nNpm8p7jl8o1IH+8pT/Fth3reA==
X-Google-Smtp-Source: ABdhPJwN2qnfcJ9KhRSA5B219O9Th4wHo5ZTmhjZ5kL2M3+vwlyvS8V9GWpKXf0xhxdnHdYNhmKZuA==
X-Received: by 2002:a17:90a:ccb:: with SMTP id
 11mr7745818pjt.135.1641505577797; 
 Thu, 06 Jan 2022 13:46:17 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:17 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 14/32] drm/imx: Migrate to aggregate driver
Date: Thu,  6 Jan 2022 13:45:37 -0800
Message-Id: <20220106214556.2461363-15-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/imx/imx-drm-core.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index cb685fe2039b..9e28bb16364c 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -196,8 +196,9 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == np;
 }
 
-static int imx_drm_bind(struct device *dev)
+static int imx_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	int ret;
 
@@ -264,8 +265,9 @@ static int imx_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void imx_drm_unbind(struct device *dev)
+static void imx_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -279,14 +281,18 @@ static void imx_drm_unbind(struct device *dev)
 	dev_set_drvdata(dev, NULL);
 }
 
-static const struct component_master_ops imx_drm_ops = {
-	.bind = imx_drm_bind,
-	.unbind = imx_drm_unbind,
+static struct aggregate_driver imx_drm_aggregate_driver = {
+	.probe = imx_drm_bind,
+	.remove = imx_drm_unbind,
+	.driver = {
+		.name = "imx_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int imx_drm_platform_probe(struct platform_device *pdev)
 {
-	int ret = drm_of_component_probe(&pdev->dev, compare_of, &imx_drm_ops);
+	int ret = drm_of_aggregate_probe(&pdev->dev, compare_of, &imx_drm_aggregate_driver);
 
 	if (!ret)
 		ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
@@ -296,7 +302,7 @@ static int imx_drm_platform_probe(struct platform_device *pdev)
 
 static int imx_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &imx_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &imx_drm_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

