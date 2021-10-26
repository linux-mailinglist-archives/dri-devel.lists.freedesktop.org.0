Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A543A8AA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A42A6E1A7;
	Tue, 26 Oct 2021 00:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7786E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:54 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id x66so12447241pfx.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdKC3RDnWMeVhqBKuTAcfq/eZBHYEe2Kb+X7ix5SdpY=;
 b=ScBbBZrEAh2lBChYx/tCIpUXX8xvkpEqsNKFZx3qbRUi/82oySHk3vV6s7gy+WjO6d
 GD9J4lxRh7r9GFCln+KzcqOonD5rUsO6W6K8W7mNy+wk/aJ2bWJS/6zLnW7OYX9VOJf+
 gC3AlR3tRBnO/SBzeXgstVka9muvTag4kQJe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdKC3RDnWMeVhqBKuTAcfq/eZBHYEe2Kb+X7ix5SdpY=;
 b=dwRoMdvrmLabBCIdWjEmlFJtxWoYQFuHpLymGfRQMhpwvyf1xXrPUKcXxWHh5J/aP1
 cYTnWjuAcwUmjphs+WtR3tM8lyuIO3RyRHn7ibwZnTfiPpCgNXX08mGVL+TKe29qFeLr
 1Iui4jNPKTktT8bSB2rLoLnDngvNZgA79ieQ6W4QAcx1UOAL9xIFX2P5pSQVswAhWjxR
 p81sAhRpH88TcTjUo6LItIgRZ4Hi1XQYVK8W/6bq3PmfdyhuERuVG3XS60Yiu0do2Vj6
 pqKuwreI0IChipNvWRNVwonj1UmSWKRvTcScTuQPjg8t/5Srj/GWN3e/bNK0GRUDpn68
 bDJg==
X-Gm-Message-State: AOAM531TWbi0CI3IYsT1VIr/F0XOfTbv01fKwTusy47klwC1tRZXKRFn
 1rhKcNTTw7+DRdBcAkpastx8UA==
X-Google-Smtp-Source: ABdhPJwo6+mQQbH98imAtqflEv1mDZYTboLdeeEKWtF3bN7eLk6HrnCpT7Tb1CXcGWNN4tfDYob9ZA==
X-Received: by 2002:a05:6a00:1501:b0:44d:8dbe:ca59 with SMTP id
 q1-20020a056a00150100b0044d8dbeca59mr22500474pfu.75.1635206453554; 
 Mon, 25 Oct 2021 17:00:53 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:53 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 James Qian Wang <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 08/34] drm/komeda: Migrate to aggregate driver
Date: Mon, 25 Oct 2021 17:00:18 -0700
Message-Id: <20211026000044.885195-9-swboyd@chromium.org>
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

