Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55BF49EBC6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AB710E319;
	Thu, 27 Jan 2022 20:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E81D10E309
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:17 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id q63so4155281pja.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5nHsB00jtundOhkCVDWS5TBuSGtd2+UB36XQklCAGT4=;
 b=EAPzMHqfta1nmc6u+9Lz9Pg6102ho3xcaQ0U7gHOVeh/7b1Y70gnQahXl4F8vZwb31
 vmNDp4HH13iMO7nVsGIQmuOMCJmPL2XQTGmVOBYhIDww/Ty5WgBFNioiYZQymIEd9BcH
 hEsTcdMeWg/p03KnJHevUNINE8XesrzNa0HBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5nHsB00jtundOhkCVDWS5TBuSGtd2+UB36XQklCAGT4=;
 b=fx/b6TujSworzmzeAUY2pQqNSWO8ggEX70LsN+YvAEF5C1+SGpGVfqulZqcg9y3XUU
 SzjB4zPfEX945jV7S+xPIWzyclWp17DoZD+DJE+G5bRXUE3wSeddsh5/bmL6YTBufNbY
 nt0sEhs0eqazzn38Xa6e+AfHWXorAL3Qtlu6J3STA4SomYFtFD7H8HWWXAfurJmNJsqw
 ho6HHstuOFrzEvUMMFWCQKHdqv/pQIuJEXKo2sKQ8wkwMyAqJz83VsRpLZ2HfhKhGCnz
 0tqU3Khp7qD6iC5doOhvstEkRGHjm/WySXvde/FWdiHHNg+l/c4EutFR9qesMrFWp8JW
 OHKg==
X-Gm-Message-State: AOAM533yiyFfXjjtX6/fEOYW7J+0nu/nAR5FA9/Aope8h6OeoTHJrnq7
 2VxqZ3kQ5VASvrxazKjIGiv26A==
X-Google-Smtp-Source: ABdhPJzAgFOIdFDf3XTRUBFIzS7iQ6d3J1G2j6LVj19GOwcMvSsXue1RzG2Hk4lmi4hswUqUzBKqNQ==
X-Received: by 2002:a17:902:c40b:: with SMTP id
 k11mr4550482plk.48.1643313736945; 
 Thu, 27 Jan 2022 12:02:16 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:16 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 17/35] drm/mediatek: Migrate to aggregate driver
Date: Thu, 27 Jan 2022 12:01:23 -0800
Message-Id: <20220127200141.1295328-18-swboyd@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 56ff8c57ef8f..b486e98bf8d9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -374,8 +374,9 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
-static int mtk_drm_bind(struct device *dev)
+static int mtk_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm;
 	int ret;
@@ -406,8 +407,9 @@ static int mtk_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void mtk_drm_unbind(struct device *dev)
+static void mtk_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 
 	drm_dev_unregister(private->drm);
@@ -417,9 +419,13 @@ static void mtk_drm_unbind(struct device *dev)
 	private->drm = NULL;
 }
 
-static const struct component_master_ops mtk_drm_ops = {
-	.bind		= mtk_drm_bind,
-	.unbind		= mtk_drm_unbind,
+static struct aggregate_driver mtk_drm_aggregate_driver = {
+	.probe		= mtk_drm_bind,
+	.remove		= mtk_drm_unbind,
+	.driver		= {
+		.name	= "mtk_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
@@ -635,7 +641,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, private);
 
-	ret = component_master_add_with_match(dev, &mtk_drm_ops, match);
+	ret = component_aggregate_register(dev, &mtk_drm_aggregate_driver, match);
 	if (ret)
 		goto err_pm;
 
@@ -658,7 +664,7 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	struct mtk_drm_private *private = platform_get_drvdata(pdev);
 	int i;
 
-	component_master_del(&pdev->dev, &mtk_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &mtk_drm_aggregate_driver);
 	pm_runtime_disable(&pdev->dev);
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
-- 
https://chromeos.dev

