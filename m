Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E50A486C79
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAB010EE47;
	Thu,  6 Jan 2022 21:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5024910EFA7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:32 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id v11so3610484pfu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cp/sB0csPJfGnASpc4rymZ0PPQPzUhdhwUtGaGHpcvc=;
 b=hh951AuDm1lnuTY6Tg2bk0JqAZI+SXik/wKYCanK/9z21XaxR8dcVOq5HuTUHvXX+4
 BA5DB+cYLOeFa4Yj/qhEHktwsW51FrcAvaCxu93fkpHy98KKRByaAlCqq3LMH6f2Yesv
 syDwoIVXJ+hcSDIJ+jirliEw4GXQyzkO5KEuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cp/sB0csPJfGnASpc4rymZ0PPQPzUhdhwUtGaGHpcvc=;
 b=XYsWiQt6NuQ1yiijKn1/6+S01ROLpIK/d6251yhJ2dISlIb0cUOF7G3I9HDQliZF8u
 kxhigfUjbn1ecQcFOa2DjAaJFcnh3LjOk9ZgypOMT2OSH6l7WRR5qgNyQtQnOqTHzFWM
 8cYZ/vi3Ru3pNkMElkAtMGRsB/jHmpyT57IY3BiduBLOM+4YWB5gDjf+q7+xPWhkOGE7
 +CwRwP/c+qgbCD/EqawKma97M1Jr6/O//j/QwTiL6Ss9W0o74/ML6lWBfYoFdyjhb9R3
 H63F0dhFaonPamxmXiuq82MzuumwZEzbk7NFqStOgAhGoWWzC3RW0GUOZ3Svn+CNQFtJ
 0suw==
X-Gm-Message-State: AOAM532ffXx30nZNDYu6Qn/7cNLLr54IYuGlKrMahkdG7bVKf2BuVRr7
 +Lxnpuj5k43SMeke9Z9YyW2vEw==
X-Google-Smtp-Source: ABdhPJy9dQQssWkM2CNx3zabLk5PMLLArRIIl85gPr/Wn1u8evvprhCEN6jMJEhMiz/HIX7vMXU6aQ==
X-Received: by 2002:a63:a744:: with SMTP id w4mr31926122pgo.142.1641505591920; 
 Thu, 06 Jan 2022 13:46:31 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:31 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
Date: Thu,  6 Jan 2022 13:45:48 -0800
Message-Id: <20220106214556.2461363-26-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org,
 Yong Wu <yong.wu@mediatek.com>
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
index 25b834104790..8e722898cbe2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -752,9 +752,13 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
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
@@ -895,7 +899,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			goto out_list_del;
 	}
 
-	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	ret = component_aggregate_register(dev, &mtk_iommu_aggregate_driver, match);
 	if (ret)
 		goto out_bus_set_null;
 	return ret;
@@ -928,7 +932,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
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

