Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B633949EBDB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C71010E330;
	Thu, 27 Jan 2022 20:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0910E330
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:31 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so8677116pju.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=riumb/7yMkcFbw4RrpVGufoj0gjKUJSuK0Qg2XknZ7c=;
 b=NpYO5ID7f28ORexqnHkzZ0M54adxGnU0hRqq3qMqQyrYGblQq3T7AbkbyeSwkleWwX
 1tdKASzL3lfB1QiEImyl7I5sFgEJAzg5lhJ31c07BZMxspqw1wEXyCWCACCBDKj4GvBM
 Mku2sKRUm6mYUtIPaoIcno6DGaPIftBeAqDeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=riumb/7yMkcFbw4RrpVGufoj0gjKUJSuK0Qg2XknZ7c=;
 b=vj1ZQtaMV0XdJMdyvyrCueGil4iJ/fIMPcq4VMnyY5YH+uPrXtYeuarBZi4gmvvSSI
 49Uo1LPvgaljZpGMRt7UaHNF4ouQv6raQlFkogjIhahOBpu1V3YsC6f9F090s+yNHO0Y
 iSN3zl4FkRS08ZVrpQCsRyIoGcngaFy2eVl0TYsTFa84YPIwO9QFc4hAx44YdN7tjk4f
 YPr9gYRKszJJ99IRGVFIWwYWwMhNyE1Mzqp6ZvLHkVisE+z1la0hN9hEamRkgx2hGChY
 pEquTtRcAVi7ESPLRq+2Kfv9S3Rr9pEyOptDAiPvVr4kRmkeVnaI2rdc1CibL33TTSf7
 vsfw==
X-Gm-Message-State: AOAM531GIzQUpHK+zvxRafGNBxkopaXOm2yXXc3by0YBzhOQDD9S5MsM
 0/Lzxbh5YEJn2HxwVM9Qf2jYTw==
X-Google-Smtp-Source: ABdhPJwWoTTDM63H2gCdds/RxYfOFR7pmlktYW6DhFTALTQitolMZJK4DIvXjvtcObjDsy8ZXAWysA==
X-Received: by 2002:a17:902:7ec1:: with SMTP id
 p1mr4549151plb.159.1643313750817; 
 Thu, 27 Jan 2022 12:02:30 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:30 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 27/35] power: supply: ab8500: Migrate to aggregate driver
Date: Thu, 27 Jan 2022 12:01:33 -0800
Message-Id: <20220127200141.1295328-28-swboyd@chromium.org>
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
index ce074c018dcb..e3164e8335ca 100644
--- a/drivers/power/supply/ab8500_charger.c
+++ b/drivers/power/supply/ab8500_charger.c
@@ -3335,8 +3335,9 @@ static const struct power_supply_desc ab8500_usb_chg_desc = {
 	.get_property	= ab8500_charger_usb_get_property,
 };
 
-static int ab8500_charger_bind(struct device *dev)
+static int ab8500_charger_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct ab8500_charger *di = dev_get_drvdata(dev);
 	int ch_stat;
 	int ret;
@@ -3377,8 +3378,9 @@ static int ab8500_charger_bind(struct device *dev)
 	return 0;
 }
 
-static void ab8500_charger_unbind(struct device *dev)
+static void ab8500_charger_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct ab8500_charger *di = dev_get_drvdata(dev);
 	int ret;
 
@@ -3403,9 +3405,13 @@ static void ab8500_charger_unbind(struct device *dev)
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
@@ -3694,9 +3700,7 @@ static int ab8500_charger_probe(struct platform_device *pdev)
 	}
 
 
-	ret = component_master_add_with_match(&pdev->dev,
-					      &ab8500_charger_comp_ops,
-					      match);
+	ret = component_aggregate_register(&pdev->dev, &ab8500_charger_aggregate_driver, match);
 	if (ret) {
 		dev_err(dev, "failed to add component master\n");
 		goto free_notifier;
@@ -3721,7 +3725,7 @@ static int ab8500_charger_remove(struct platform_device *pdev)
 {
 	struct ab8500_charger *di = platform_get_drvdata(pdev);
 
-	component_master_del(&pdev->dev, &ab8500_charger_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &ab8500_charger_aggregate_driver);
 
 	usb_unregister_notifier(di->usb_phy, &di->nb);
 	ab8500_bm_of_remove(di->usb_chg.psy, di->bm);
-- 
https://chromeos.dev

