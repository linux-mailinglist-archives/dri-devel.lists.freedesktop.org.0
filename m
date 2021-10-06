Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CBE42471C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FB989A6D;
	Wed,  6 Oct 2021 19:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87C06EE4D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:46 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id p1so3269845pfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pu3Ettw2+f3cI24EEPlu+iHiL6Bl5h06ZQoWL3Cz2Tw=;
 b=AoJOg0gAf+6zGwvuJJeeIopwS/luJM74WeAdJcNoi4aR3fyjHLgI+7l4/3l4kIibtM
 ILgyOcQB0cXJGhXPmE5p5jSxrGNBoqnbwmkydJPJRwMuNIL3ITrGrsU+3YgYgQV6aLj+
 FqH2V+UVNaS3JmHv5SqQ8Qgtw2hHq1nZQSDB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pu3Ettw2+f3cI24EEPlu+iHiL6Bl5h06ZQoWL3Cz2Tw=;
 b=Ypg8wwdYI0lPaH4108DFVeIG8kR2r6vhhDwzpqgYy11bpSBaPJgW6GCOQWItex4qIp
 7IJCf9jREx+L+jdn0XjPC4VG0GDqXkdphpByCGcduKLBGE8BRLMkc8nKiAIbaMucYe30
 2pHlQixwjmClHzx5KalgsYMno3wlt4HkXYDzzQ+el5oT42uSIu1mAW54o7whpiamYgYk
 MDCMg3BYdLKGTWSC46cIkLJflCyRKEK9a8dbkfutR+HNa8JIa4hH0vj+YUAweSCwaJcs
 X36uj141F3eTsTXgaa/ygYY1fQR209iHHdixe0AqjLfhhKI2sE/22AftKF82O3MHQSkv
 qzUw==
X-Gm-Message-State: AOAM531zahbR8u5HJSXBC57yKsCp3P9+nxtKAM/J/7ZqD/HCiU7ttJKM
 wPzDrVgIlisWmQtyxk71GAB6KQ==
X-Google-Smtp-Source: ABdhPJyI8RrLozWLxX6QPY3zy5oLd/u5hIdHdrRvetAHEi7WRN1RPUvNEvFIk6AytWoJe1c0d9j2Uw==
X-Received: by 2002:a62:4e87:0:b0:447:ce02:c32e with SMTP id
 c129-20020a624e87000000b00447ce02c32emr38015805pfb.33.1633549126124; 
 Wed, 06 Oct 2021 12:38:46 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:45 -0700 (PDT)
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
Subject: [PATCH v2 20/34] drm/rockchip: Migrate to aggregate driver
Date: Wed,  6 Oct 2021 12:38:05 -0700
Message-Id: <20211006193819.2654854-21-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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

