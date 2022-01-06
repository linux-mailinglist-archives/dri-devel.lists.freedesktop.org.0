Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22C486C7D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73CF10EFEE;
	Thu,  6 Jan 2022 21:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6870110EF55
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:35 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso2710742pjo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGqq0UfufzgH1LXDtnLjAQyDmHk5g+0Lk09sKMzlfmI=;
 b=AOWN7v58HvJOqlZ6lHNZHE2A28mPb4zKe2Mj9bTZpwUh+HozXtTE3jJKFaw47lD3eY
 5NtO2Oi1pTx6/Avl2BGK7Xwjzdc8hSPXzduFzhd2fF7rpBHqfzUQDhHs4/BcY7K7tS7F
 0U4tA0tg9yLN38FNIeknPel3KIr+eOw+2+HBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGqq0UfufzgH1LXDtnLjAQyDmHk5g+0Lk09sKMzlfmI=;
 b=4hh3/vNZfFljOT/tQb0hRYf30vdhNfHYcrMN9RNPOM3LRG5Mxv2A+k6hKriIeYLgV7
 JM6VUUIMCO5gS8QYv2FQgpp4rY63jUlAYo6jyRrLhdIQGGMNsYXwtx1w76iktH7EFtwQ
 oYkXVpNb1RcRR/AOxZpuAk9aU5CtJ0zHISQel658uKn+fCODaD2/l5onQrrldwbvvR/a
 gdgRLvuMP2bob7dnd9T5CD1AROwAqPeL4D3GHA/InDTHVufQdZyJYnkwEuLmMA/tY4Tv
 fOqQQLfLaiYLy9O+lD1hwZfZDA1oQTf3AuwX4YH534mym42t5ipIcxxRbGRQPdCGveQz
 543w==
X-Gm-Message-State: AOAM531cYIqxudXgNO1uHUlwz8EDHcXy+F/9pHyOPKRSAA1dtS3k9m+0
 2o9vnvP7r5WIIo1wsGqt/TFhhg==
X-Google-Smtp-Source: ABdhPJxsrSp0V86crFp4pzNtzJwdoL0M0g2Krz5WE6X1drEmfa7npHt6A/QP0naMp9HjGxQ1EzBxtQ==
X-Received: by 2002:a17:902:ce85:b0:148:d590:5734 with SMTP id
 f5-20020a170902ce8500b00148d5905734mr60400961plg.1.1641505594793; 
 Thu, 06 Jan 2022 13:46:34 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:34 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 27/32] power: supply: ab8500: Migrate to aggregate driver
Date: Thu,  6 Jan 2022 13:45:50 -0800
Message-Id: <20220106214556.2461363-28-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Acked-by: Sebastian Reichel <sre@kernel.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>
Cc: <linux-pm@vger.kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/power/supply/ab8500_charger.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/power/supply/ab8500_charger.c b/drivers/power/supply/ab8500_charger.c
index 15eadaf46f14..52d4105e28f2 100644
--- a/drivers/power/supply/ab8500_charger.c
+++ b/drivers/power/supply/ab8500_charger.c
@@ -3312,8 +3312,9 @@ static const struct power_supply_desc ab8500_usb_chg_desc = {
 	.get_property	= ab8500_charger_usb_get_property,
 };
 
-static int ab8500_charger_bind(struct device *dev)
+static int ab8500_charger_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct ab8500_charger *di = dev_get_drvdata(dev);
 	int ch_stat;
 	int ret;
@@ -3354,8 +3355,9 @@ static int ab8500_charger_bind(struct device *dev)
 	return 0;
 }
 
-static void ab8500_charger_unbind(struct device *dev)
+static void ab8500_charger_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct ab8500_charger *di = dev_get_drvdata(dev);
 	int ret;
 
@@ -3380,9 +3382,13 @@ static void ab8500_charger_unbind(struct device *dev)
 	component_unbind_all(dev, di);
 }
 
-static const struct component_master_ops ab8500_charger_comp_ops = {
-	.bind = ab8500_charger_bind,
-	.unbind = ab8500_charger_unbind,
+static struct aggregate_driver ab8500_charger_aggregate_driver = {
+	.probe = ab8500_charger_bind,
+	.remove = ab8500_charger_unbind,
+	.driver = {
+		.name = "ab8500_charger_agg",
+		.owner = THIS_MODULE,
+	},
 };
 
 static struct platform_driver *const ab8500_charger_component_drivers[] = {
@@ -3663,9 +3669,7 @@ static int ab8500_charger_probe(struct platform_device *pdev)
 	}
 
 
-	ret = component_master_add_with_match(&pdev->dev,
-					      &ab8500_charger_comp_ops,
-					      match);
+	ret = component_aggregate_register(&pdev->dev, &ab8500_charger_aggregate_driver, match);
 	if (ret) {
 		dev_err(dev, "failed to add component master\n");
 		goto free_notifier;
@@ -3688,7 +3692,7 @@ static int ab8500_charger_remove(struct platform_device *pdev)
 {
 	struct ab8500_charger *di = platform_get_drvdata(pdev);
 
-	component_master_del(&pdev->dev, &ab8500_charger_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &ab8500_charger_aggregate_driver);
 
 	usb_unregister_notifier(di->usb_phy, &di->nb);
 	usb_put_phy(di->usb_phy);
-- 
https://chromeos.dev

