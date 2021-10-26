Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EBC43A8EE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF196E23D;
	Tue, 26 Oct 2021 00:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9146E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:01:11 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id m26so12491371pff.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzJHB9t+Bicwdag3X6iL63lm7ZGof5i0wMOcRCsHtBw=;
 b=boke8wkv6Aham8Rt4L0L5vG7+UiINMv54CSRwWE5RydVsN59BHDs3a+awA6esz9uWu
 XwHPcUKkuQb3LB/LRTLBkKJvP6FpQE+PQYWhEP1O1RLc3qhDd+SM0K/laNL0JQ0YB3WL
 +NauKlzlORpgl8Fmq31rtSDDkSwXwjNEJ5zpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzJHB9t+Bicwdag3X6iL63lm7ZGof5i0wMOcRCsHtBw=;
 b=8M/Xm0K4e/Rtyjt3D2oAkqbZSFJKGAag1yNLFWSpZxFWzHQyLXAmqo4IOK+0hHZB2T
 lsXT9sFSKFsBIV0Uk9PZ140ecLZD5ogK4qD6KRlkclNgk7klFoPfR4qZz7L7slh+QZ1h
 gA2T3N04xzSO3kyBA7809IdZBwuUaH6LJsFe4z32EfPrdrfjImHSzvkUGWD5ZdmS9ilh
 f+7Q8ZXxOVEu6tgNnRkmi8V3fRjV+eEFZwUzM8M7+gdhxDzCYHr3+hvhY0BmT8ZEPrFY
 ch98n85VuokMZlMBMfMWQQ6+Cz+eXVPk4z5T37FHZSJA9cy0QhbDxMXpnM1Kj//Hz31Q
 s6NA==
X-Gm-Message-State: AOAM531QnVT4jS4Kexi55Mzwm1CwrwPhBTMRyGk08cVMSbuaq5nCVCuk
 mCzAh9xoYITzDKckD+cclWsVNQ==
X-Google-Smtp-Source: ABdhPJxbbHUNLbuw3wWsLSHvufzeB/7MKJjbgFqA9Hr4ZQjVEZvD6yklukD9Oh3Qh4aCj1tOM7pf4Q==
X-Received: by 2002:a63:c:: with SMTP id 12mr16453074pga.477.1635206470644;
 Mon, 25 Oct 2021 17:01:10 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:01:10 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 28/34] mei: Migrate to aggregate driver
Date: Mon, 25 Oct 2021 17:00:38 -0700
Message-Id: <20211026000044.885195-29-swboyd@chromium.org>
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

Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/misc/mei/hdcp/mei_hdcp.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index ec2a4fce8581..79dcc02277d2 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -732,8 +732,9 @@ static const struct i915_hdcp_component_ops mei_hdcp_ops = {
 	.close_hdcp_session = mei_hdcp_close_session,
 };
 
-static int mei_component_master_bind(struct device *dev)
+static int mei_component_master_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct i915_hdcp_comp_master *comp_master =
 						mei_cldev_get_drvdata(cldev);
@@ -749,8 +750,9 @@ static int mei_component_master_bind(struct device *dev)
 	return 0;
 }
 
-static void mei_component_master_unbind(struct device *dev)
+static void mei_component_master_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct i915_hdcp_comp_master *comp_master =
 						mei_cldev_get_drvdata(cldev);
@@ -759,9 +761,13 @@ static void mei_component_master_unbind(struct device *dev)
 	component_unbind_all(dev, comp_master);
 }
 
-static const struct component_master_ops mei_component_master_ops = {
-	.bind = mei_component_master_bind,
-	.unbind = mei_component_master_unbind,
+static struct aggregate_driver mei_aggregate_driver = {
+	.probe = mei_component_master_bind,
+	.remove = mei_component_master_unbind,
+	.driver = {
+		.name = "mei_agg",
+		.owner = THIS_MODULE,
+	},
 };
 
 /**
@@ -826,9 +832,7 @@ static int mei_hdcp_probe(struct mei_cl_device *cldev,
 	}
 
 	mei_cldev_set_drvdata(cldev, comp_master);
-	ret = component_master_add_with_match(&cldev->dev,
-					      &mei_component_master_ops,
-					      master_match);
+	ret = component_aggregate_register(&cldev->dev, &mei_aggregate_driver, master_match);
 	if (ret < 0) {
 		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
 		goto err_exit;
@@ -850,7 +854,7 @@ static void mei_hdcp_remove(struct mei_cl_device *cldev)
 						mei_cldev_get_drvdata(cldev);
 	int ret;
 
-	component_master_del(&cldev->dev, &mei_component_master_ops);
+	component_aggregate_unregister(&cldev->dev, &mei_aggregate_driver);
 	kfree(comp_master);
 	mei_cldev_set_drvdata(cldev, NULL);
 
-- 
https://chromeos.dev

