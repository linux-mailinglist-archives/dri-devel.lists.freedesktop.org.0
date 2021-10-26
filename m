Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A843A8F7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95F56E3D0;
	Tue, 26 Oct 2021 00:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA2F6E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:01:10 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id s136so12301377pgs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HoQjuHREWvjsK8rKG+0w83Xi8iEfhBhp3a3+GSxKR9Y=;
 b=DIhkC3T27QWq0sDeTLd/pr0xlBZ6AEq0iYox+eP070HrrQqVsjk72M5k7wP2t56sxg
 nUpxgLIOUf7HQYcVRntTeybsGhiJ6B+vlNLvh/bCCBltL6jY2o2L7n9HEyT3fW/Fddx2
 YyoB4EFXHbMZZ+qQyX+8c7nPGuGh3lcnj/m14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HoQjuHREWvjsK8rKG+0w83Xi8iEfhBhp3a3+GSxKR9Y=;
 b=TVvIGv5Yk9m390OLwH2cHgJ8sLCiC8u+wszVWTFypwWXFKO4apQaVz2nj8iueoRlQ2
 yLPylMmT+dlH3dZp04GXkC56q8TFzWkzUQXQnQvTkJg6iuWwuAH06yPeJCyQqePkOBTX
 TPOImxAUg0n5Cq+PfXPv/2cCdlur0n3P5LBzqLS7OJUvZ5xQdAhO2qHast+uEUvwQlZV
 5PzFKG6iF6pnmCCkOqBSJxo585KoRl5t3ytJROMhIhpuVqtwJIsZy4iuUj7viOI5JQI1
 8F8Kniw/YAuIgZMvMjDAoHCmJjU5vfeUl+ppFmFMG2q+x9t0gJQPc5jqn7nRl1joshCF
 wlyw==
X-Gm-Message-State: AOAM532dNfCDIPOhVCNDF/JHFWMdXI+df5/9w2up6FJxN6CbfPmVub2W
 Y86nF7A0On15a5KrsOjqa71B+w==
X-Google-Smtp-Source: ABdhPJynhUMsHB9LK1BHid86Ud8rB2LhjTYdJktOnjDEBbojEbu62iBzXU41wEZsmNHaGoRcSmutkg==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr16268519pgl.376.1635206469768; 
 Mon, 25 Oct 2021 17:01:09 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:01:09 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 27/34] iommu/mtk: Migrate to aggregate driver
Date: Mon, 25 Oct 2021 17:00:37 -0700
Message-Id: <20211026000044.885195-28-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
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

Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/iommu/mtk_iommu.c    | 14 +++++++++-----
 drivers/iommu/mtk_iommu.h    |  6 ++++--
 drivers/iommu/mtk_iommu_v1.c | 14 +++++++++-----
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d837adfd1da5..8b303c388a9b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -750,9 +750,13 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	return 0;
 }
 
-static const struct component_master_ops mtk_iommu_com_ops = {
-	.bind		= mtk_iommu_bind,
-	.unbind		= mtk_iommu_unbind,
+static struct aggregate_driver mtk_iommu_aggregate_driver = {
+	.probe		= mtk_iommu_bind,
+	.remove		= mtk_iommu_unbind,
+	.driver		= {
+		.name	= "mtk_iommu_agg",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int mtk_iommu_probe(struct platform_device *pdev)
@@ -893,7 +897,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			goto out_list_del;
 	}
 
-	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	ret = component_aggregate_register(dev, &mtk_iommu_aggregate_driver, match);
 	if (ret)
 		goto out_bus_set_null;
 	return ret;
@@ -926,7 +930,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 	device_link_remove(data->smicomm_dev, &pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	devm_free_irq(&pdev->dev, data->irq, data);
-	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
+	component_aggregate_unregister(&pdev->dev, &mtk_iommu_aggregate_driver);
 	return 0;
 }
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index f81fa8862ed0..064fd4f4eade 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -94,15 +94,17 @@ static inline void release_of(struct device *dev, void *data)
 	of_node_put(data);
 }
 
-static inline int mtk_iommu_bind(struct device *dev)
+static inline int mtk_iommu_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 
 	return component_bind_all(dev, &data->larb_imu);
 }
 
-static inline void mtk_iommu_unbind(struct device *dev)
+static inline void mtk_iommu_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 
 	component_unbind_all(dev, &data->larb_imu);
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be22fcf988ce..5fb29058a165 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -534,9 +534,13 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{}
 };
 
-static const struct component_master_ops mtk_iommu_com_ops = {
-	.bind		= mtk_iommu_bind,
-	.unbind		= mtk_iommu_unbind,
+static struct aggregate_driver mtk_iommu_aggregate_driver = {
+	.probe		= mtk_iommu_bind,
+	.remove		= mtk_iommu_unbind,
+	.driver		= {
+		.name	= "mtk_iommu_agg",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int mtk_iommu_probe(struct platform_device *pdev)
@@ -624,7 +628,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			goto out_dev_unreg;
 	}
 
-	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	ret = component_aggregate_register(dev, &mtk_iommu_aggregate_driver, match);
 	if (ret)
 		goto out_bus_set_null;
 	return ret;
@@ -650,7 +654,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->bclk);
 	devm_free_irq(&pdev->dev, data->irq, data);
-	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
+	component_aggregate_unregister(&pdev->dev, &mtk_iommu_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

