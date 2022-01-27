Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D44949EBB7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B016210E2FF;
	Thu, 27 Jan 2022 20:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4BE10E1D8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:12 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id j10so3233678pgc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0aVwrwMtPKI+Zw3p14aaTjDl64C47sBEcl9anDi+5w=;
 b=kwn63WCLro2pEoW3NUZStHAHthYrQFBO+1kqeg7vZ8cjmQFS4RPcurvo1UPCUI+Zu8
 DCf3dOakK6x7VObPCC2Q4M9xUJzgL5Td/24BIsWeDVcKmXGpiAVsawi7ymo0ynrlFQ+W
 ZYTQlHIHGczG/PxwdFJuVlHEKV6iuElGTDXfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0aVwrwMtPKI+Zw3p14aaTjDl64C47sBEcl9anDi+5w=;
 b=ZFwuk9KJz5d9eU7H3XvnRrmFGIZ6pZTvAvlKF62ive1T1115DikqZ3yXyDoc26yF9S
 cOOo8IRYR9/XEHzgeBRMu1KMNtr3dR7ubYRO9whoK8wzUlVdUH4CkgrILpQwx7IhRBxB
 lzNDRnTCiyuzR1Rs+hp2bh7qMJasMODxM2hZpkljXoFUOH6BtkdpXpVp0+rVJYXAPbb7
 kqHH8iIN0TmED13kzSjPgQefMoS980CsXyv3L8xLUqnaVp5cPgxYnJAg80rdCzmS3hLs
 og1EzPrFHav9+6pQtlmHPKtYVJ0Fw1ghF/IoMOvnYDkfoRKX0fHE5vYmJP8PwfJuG+Sd
 XbMQ==
X-Gm-Message-State: AOAM5315g30R780RrIGO9FqyfBCvpag9kwlY7jvIFZ/xWmXo9yGCJA/F
 OZPgysJZXGb3lZ71IynnTO72TQ==
X-Google-Smtp-Source: ABdhPJyTdj2Y9H1zXEx5aZHrVW5+2vFsseg434LApAeWM0b1LjcrFdbsVgv1CpDt9kWrjMPypwnnEA==
X-Received: by 2002:a65:6743:: with SMTP id c3mr3974983pgu.306.1643313731691; 
 Thu, 27 Jan 2022 12:02:11 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:11 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 13/35] drm/exynos: Migrate to aggregate driver
Date: Thu, 27 Jan 2022 12:01:19 -0800
Message-Id: <20220127200141.1295328-14-swboyd@chromium.org>
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
index 9743b6b17447..f9a3e7041254 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -244,8 +244,9 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
-static int exynos_drm_bind(struct device *dev)
+static int exynos_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct exynos_drm_private *private;
 	struct drm_encoder *encoder;
 	struct drm_device *drm;
@@ -321,8 +322,9 @@ static int exynos_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void exynos_drm_unbind(struct device *dev)
+static void exynos_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -341,9 +343,13 @@ static void exynos_drm_unbind(struct device *dev)
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
@@ -356,13 +362,12 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
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

