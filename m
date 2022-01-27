Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9149EBAB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FE910E2CF;
	Thu, 27 Jan 2022 20:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7F510E24A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:05 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id u11so3653529plh.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iMJcZepLim/YpIi7Y7hIab1z+GE+IIU8h9QgrFmMU/0=;
 b=OZNuVGwmg+5DpXtgxq+BMEkKae3EDK19392kSo4/J2z3xPzFGcdXFvJ1uC38LmN+lD
 RCdoVkHQwjCTjT9aJVj8uGSKfPaj4VhZ6b3P8SwCCKGRNX03bgKzXtD2isYFr1AFNjHr
 VPrC3gXCOEEDHIF0ibxT9aiOAQxnq9XdvcSRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iMJcZepLim/YpIi7Y7hIab1z+GE+IIU8h9QgrFmMU/0=;
 b=aaMvbW0+ctTdZc7PCrIY+ezbORdDw3xvbN+O31YyBM4AyZ3x9v91hPOonPhAHD6F8G
 v1dD+3MeA85Kx6LH6V5yfGE15yl/bxszuBf2wgLaDpaRAA3GJeh9H8QsT5aZsRceTHRR
 PDkfktUcd4FaxKkde6jwDlGPunc3Z1AIo+gfYS4Q6yzJ42fbmgeVrsx5DBf/GX/15K0K
 7uUlPixAz9AodjXt2sljIZ0SUGlsUL6gsaztF9ZHNy1BJwrXFxKVf+3t5e7z9EKlqq34
 kqm9ug+bLArZNvC0J1TQE4FekugcCeUCMPuhlfJZhJFriEeGIMz2iYgLrGNVn5RpThNR
 /vpQ==
X-Gm-Message-State: AOAM533qt7oa3m6GV5RxEe8TWt9GL6zFNLPs1zvUU8jPLgoDfyZY9h5s
 QKXlWuoC+mGEZeKtst0BJHAW9w==
X-Google-Smtp-Source: ABdhPJy5iEP9ZiYeQrh0T9dMlgNgumKZeRB+e4a/VBs0O8cCc+ML1Kugu6geT3ueGmazrHLnrAbX+A==
X-Received: by 2002:a17:902:ab49:: with SMTP id
 ij9mr4763950plb.1.1643313725021; 
 Thu, 27 Jan 2022 12:02:05 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:04 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 08/35] drm/arm/hdlcd: Migrate to aggregate driver
Date: Thu, 27 Jan 2022 12:01:14 -0800
Message-Id: <20220127200141.1295328-9-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
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
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
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
index 479c2422a2e0..e3ed925797d5 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -270,8 +270,9 @@ static const struct drm_driver hdlcd_driver = {
 	.minor = 0,
 };
 
-static int hdlcd_drm_bind(struct device *dev)
+static int hdlcd_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm;
 	struct hdlcd_drm_private *hdlcd;
 	int ret;
@@ -344,8 +345,9 @@ static int hdlcd_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void hdlcd_drm_unbind(struct device *dev)
+static void hdlcd_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
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
+		.name	= "hdlcd_drm",
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

