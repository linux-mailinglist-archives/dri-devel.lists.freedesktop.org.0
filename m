Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCA343A8DA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A596E1F9;
	Tue, 26 Oct 2021 00:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FB76E215
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:01:05 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so722545pjl.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pu3Ettw2+f3cI24EEPlu+iHiL6Bl5h06ZQoWL3Cz2Tw=;
 b=FyVFBxqfsIYw8YOp7sC2d6zkxP42HZ4IH945uwnHC8IJXRMGAOMflzcAsSWqsBv3LS
 rx7di7IicyojDoCy/pfarCS70keFfp5aLLJ7RAYiJFwVcBLnyfVyMQztieULiZDGYH9J
 XYY2V8lXbLnP7x9/7EQfmfg0ZmwwKzOjuvCN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pu3Ettw2+f3cI24EEPlu+iHiL6Bl5h06ZQoWL3Cz2Tw=;
 b=oaYDV2ixw6Sr6kM7p2RejsL9ng255S5qkTDTnA2uI7m6C2lQeXWxXHK8yBYNppN4kT
 XTiybNNie1qMpGss+Q/6udx4G1HOul4L6/fp0vk5OPls8FfOQIw/i4lyxuKJeAeoEw4r
 NnNzR20egSXnmwGEIVlLPShkIpNOboZ7IS66yw+XGAdOmjgKua3m4kWmsKHbgLmkVTIk
 YVZzbx4ZehTT/9+d4clggpU7kkkAmilBmJnPwfhuWlLfcKyJ7ffy0QSAbW6mh6GCg8ho
 WGRuYzX28h+9RWwU+CxFzX+hGg2OWWA0RUd7okckDfHJRfIJewmMNXSTXnA9FObWjnxM
 KwXg==
X-Gm-Message-State: AOAM5320WdOUpTHdw/8d6PveJJoCjAB5k5ZcRL0mXwMLPyH36ttzc5hP
 ZoM8Snsv2MxaHuId2oFWAPioXg==
X-Google-Smtp-Source: ABdhPJyo8+IVsPW4ErQRrYNvfYFj9VfY/6yHyL/Fe4pPomZF1IH2ZD3fGLXHX+N3iY4mjz6EA/xuLg==
X-Received: by 2002:a17:903:1111:b0:13f:d1d7:fb67 with SMTP id
 n17-20020a170903111100b0013fd1d7fb67mr18762269plh.85.1635206464672; 
 Mon, 25 Oct 2021 17:01:04 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:01:04 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 21/34] drm/rockchip: Migrate to aggregate driver
Date: Mon, 25 Oct 2021 17:00:31 -0700
Message-Id: <20211026000044.885195-22-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index bfba9793d238..cc63222c3ad0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -109,8 +109,9 @@ static void rockchip_iommu_cleanup(struct drm_device *drm_dev)
 	iommu_domain_free(private->domain);
 }
 
-static int rockchip_drm_bind(struct device *dev)
+static int rockchip_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm_dev;
 	struct rockchip_drm_private *private;
 	int ret;
@@ -186,8 +187,9 @@ static int rockchip_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void rockchip_drm_unbind(struct device *dev)
+static void rockchip_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm_dev);
@@ -342,9 +344,13 @@ static struct component_match *rockchip_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
-static const struct component_master_ops rockchip_drm_ops = {
-	.bind = rockchip_drm_bind,
-	.unbind = rockchip_drm_unbind,
+static struct aggregate_driver rockchip_aggregate_driver = {
+	.probe = rockchip_drm_bind,
+	.remove = rockchip_drm_unbind,
+	.driver = {
+		.name = "rockchip_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int rockchip_drm_platform_of_probe(struct device *dev)
@@ -415,7 +421,7 @@ static int rockchip_drm_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(match))
 		return PTR_ERR(match);
 
-	ret = component_master_add_with_match(dev, &rockchip_drm_ops, match);
+	ret = component_aggregate_register(dev, &rockchip_aggregate_driver, match);
 	if (ret < 0) {
 		rockchip_drm_match_remove(dev);
 		return ret;
@@ -426,7 +432,7 @@ static int rockchip_drm_platform_probe(struct platform_device *pdev)
 
 static int rockchip_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &rockchip_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &rockchip_aggregate_driver);
 
 	rockchip_drm_match_remove(&pdev->dev);
 
-- 
https://chromeos.dev

