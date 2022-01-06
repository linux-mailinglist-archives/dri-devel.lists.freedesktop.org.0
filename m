Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B9486C3D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB0B10EE77;
	Thu,  6 Jan 2022 21:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4962210EE77
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:09 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id i30so3768951pgl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdKC3RDnWMeVhqBKuTAcfq/eZBHYEe2Kb+X7ix5SdpY=;
 b=IcaBfWVygHDNB6C8LkFxsWDgsRiQvHr6RF8HBCSc8kKeIzuGmKt6X6QMGLS4D8+pBO
 irbkBZrK9VdODT76096dKX1fUVhxrt6DZfbKHR2KJbI2wpIcsg4+hotoJ66bXLb8rWfq
 QM+viogiXHi5P8VefoPXVvE8N/Cic8ZmjsZKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdKC3RDnWMeVhqBKuTAcfq/eZBHYEe2Kb+X7ix5SdpY=;
 b=ggLyhTHsSkIRFLZMNMzflyHP2RJhUUt00kfGkHVfMF4GwwFA50W4KdrDffbFzs6iT1
 MdUDjGuI0GQqWzqKFY7bIr+UJBX8ZRW1j1ey2PUcOeEutWDUA1tZe+UvehcpYi+eYiCz
 Qk/rzmCVs1lBVJEYmJyZQM6Wf+gjcCq6754guoz8YSvj7SeJDQHOGAr5VPV105RYPpeD
 ELk/LDFnV1OIuxdd0HJtEAf+kIEZ4cP9KUKUlU014FjqptsNW4QqFUwmGu0xLiQ992sR
 GknkUCN8keeYogC9H4l70o1NQd9sFm8rQN+UBrQMcn9cSYETmmU+yChQCcXPkX5WVIy6
 BG3g==
X-Gm-Message-State: AOAM5328buwjTplVZpwWf+y1atKX09Mk01MG9ysvtXLzHNGZQ82gFrBI
 +GbG/70Qtos5XmjqxIMKUqu8cA==
X-Google-Smtp-Source: ABdhPJxWvdamkm9BbUfP5bbx8cClxJTqWYMaUw5Takg8Yhy/ubQOstHCKsaqxVAG6NtjkwEGXyIWHw==
X-Received: by 2002:a65:5589:: with SMTP id j9mr54673150pgs.119.1641505568659; 
 Thu, 06 Jan 2022 13:46:08 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:08 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 07/32] drm/komeda: Migrate to aggregate driver
Date: Thu,  6 Jan 2022 13:45:30 -0800
Message-Id: <20220106214556.2461363-8-swboyd@chromium.org>
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
 James Qian Wang <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../gpu/drm/arm/display/komeda/komeda_drv.c   | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index e7933930a657..0463386a6ed2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -25,8 +25,9 @@ struct komeda_dev *dev_to_mdev(struct device *dev)
 	return mdrv ? mdrv->mdev : NULL;
 }
 
-static void komeda_unbind(struct device *dev)
+static void komeda_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
 
 	if (!mdrv)
@@ -45,8 +46,9 @@ static void komeda_unbind(struct device *dev)
 	devm_kfree(dev, mdrv);
 }
 
-static int komeda_bind(struct device *dev)
+static int komeda_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct komeda_drv *mdrv;
 	int err;
 
@@ -87,9 +89,13 @@ static int komeda_bind(struct device *dev)
 	return err;
 }
 
-static const struct component_master_ops komeda_master_ops = {
-	.bind	= komeda_bind,
-	.unbind	= komeda_unbind,
+static struct aggregate_driver komeda_aggregate_driver = {
+	.probe	= komeda_bind,
+	.remove	= komeda_unbind,
+	.driver = {
+		.name  = "komeda_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -129,12 +135,12 @@ static int komeda_platform_probe(struct platform_device *pdev)
 		komeda_add_slave(dev, &match, child, KOMEDA_OF_PORT_OUTPUT, 1);
 	}
 
-	return component_master_add_with_match(dev, &komeda_master_ops, match);
+	return component_aggregate_register(dev, &komeda_aggregate_driver, match);
 }
 
 static int komeda_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &komeda_master_ops);
+	component_aggregate_unregister(&pdev->dev, &komeda_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

