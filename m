Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD164246F8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AA66EE38;
	Wed,  6 Oct 2021 19:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7E66EE2B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:32 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 75so3418241pga.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZ50+nY6iKl4XzIgEo27g77S25bE2oAR00ZvAHfRl/s=;
 b=VAuNWWpXvcDIC0EtmclApgGs3mUgw132HiRjwqx6qFpK7airfdQxAgppizP53solsC
 sbfIgh3sZ8h1i4NGIbFxB7GpyHzj25lS+98cfdXkHV4mEv1BdzftynD+NrGP0EHv1v4W
 MvKJy3mJ1XO818T/sKGM0Xd/N6A9Jk7VquK7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZ50+nY6iKl4XzIgEo27g77S25bE2oAR00ZvAHfRl/s=;
 b=IONXRXANNvx04+3KSN3/buCyaaDustJ+xnQOXtsED7vMBFEgOP6B2TU/eWrs+lUlsY
 3lUExLfolT05AvW04Y673IqREsE1RGFVq1fOjZzuIdXSkR3Nf8N/EjisVne8brEqC/Hd
 lLcMKnGmQPTtuNKUXaF2Y4/ED6pne6DRHDJUo01YDbRGQwBuwUJLu5ZqUpD5OsFJQECK
 8yp7LPh1JoPdZDSnn/42BFI1xZoRWM7jfbyhSgEFOnujQIr4k25kJngoPPWnQ2WVfzs+
 jC73yTflT5mazO7nqqq3ceeqLf22IyXsUfQL+28Zf6gAAAouax6zzaevhBLiUNC6JYcZ
 MVtQ==
X-Gm-Message-State: AOAM532fY6+V5xDCGAaR5I5n7NOtekLvArBBuCcg4FO9u3tCKvTstto5
 wAUF99cmlSSb/UtmOtH5FLgbtw==
X-Google-Smtp-Source: ABdhPJxlVpTQwUTtDgr6C3JCHEPtvD3GPaVWT3EFo7FG/d0w7JfLy1mAQ6Kb40DgOcgVvm3myI73kQ==
X-Received: by 2002:a63:c10b:: with SMTP id w11mr468986pgf.228.1633549112200; 
 Wed, 06 Oct 2021 12:38:32 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:31 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 08/34] drm/arm/hdlcd: Migrate to aggregate driver
Date: Wed,  6 Oct 2021 12:37:53 -0700
Message-Id: <20211006193819.2654854-9-swboyd@chromium.org>
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

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 479c2422a2e0..8f3e5924042a 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -270,8 +270,9 @@ static const struct drm_driver hdlcd_driver = {
 	.minor = 0,
 };
 
-static int hdlcd_drm_bind(struct device *dev)
+static int hdlcd_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	struct hdlcd_drm_private *hdlcd;
 	int ret;
@@ -344,8 +345,9 @@ static int hdlcd_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void hdlcd_drm_unbind(struct device *dev)
+static void hdlcd_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct hdlcd_drm_private *hdlcd = drm->dev_private;
 
@@ -367,9 +369,13 @@ static void hdlcd_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops hdlcd_master_ops = {
-	.bind		= hdlcd_drm_bind,
-	.unbind		= hdlcd_drm_unbind,
+static struct aggregate_driver hdlcd_aggregate_driver = {
+	.probe		= hdlcd_drm_bind,
+	.remove		= hdlcd_drm_unbind,
+	.driver		= {
+		.name 	= "hdlcd_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int compare_dev(struct device *dev, void *data)
@@ -390,13 +396,12 @@ static int hdlcd_probe(struct platform_device *pdev)
 	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
 	of_node_put(port);
 
-	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &hdlcd_aggregate_driver, match);
 }
 
 static int hdlcd_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &hdlcd_master_ops);
+	component_aggregate_unregister(&pdev->dev, &hdlcd_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

