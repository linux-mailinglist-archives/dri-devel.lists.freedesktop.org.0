Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2593D424727
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052F46EE54;
	Wed,  6 Oct 2021 19:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B626EE48
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:55 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id r201so3415334pgr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzJHB9t+Bicwdag3X6iL63lm7ZGof5i0wMOcRCsHtBw=;
 b=LjCBQ+OlDWXcZsNZnBQtgm7AMig+37EhFW/9+yCcAfo48unx4nzdWSchzmgePmUhjA
 XyCY7hFDWvvn/+KhoHPX2V7JR+YVar3L1AffYvxYFJsLh905j5B2OD38wqtDboraJ85U
 3QKnCZtLlfUM6fZHBa+mf8XZ+uBlsfEQEyFQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzJHB9t+Bicwdag3X6iL63lm7ZGof5i0wMOcRCsHtBw=;
 b=YzPzdWPjsP7dpKE9UHL78jH3neR6WgWQkQFtHPX3rFG/UwyCdFC1ffomrXr/vI7siI
 mio9fZdd9/SHJzryRldjNmY0DXY5BpRqY7XIhb6cMKX/iClkNuUuyKRR+5j8IErUvkEO
 hGIVnuNAiYkAJaV+nYGipcZw7pHpaPueTlm+WhTogZXfsg56uB/k66MFU/An9TLJ7MVK
 cxxRxgT8JXJg2Pnr55UXaFCehLRCKb0LKK0Kjc5OZfx4xXJwxTEqKb0nGka0XDYq3iV8
 7mCy7Qb2nXK/fg2AAqDZATK3EogJxGP384AaowCLBeaTlfiHx/zPH9pwA4iY2Qb2kfwI
 AD0A==
X-Gm-Message-State: AOAM532kf84A24703cpm16uPRL0YDP0cG/YAyoTFVcQrFQgzjpYFpuUH
 nFJCqjYOpedmJpoBEe4RSv0OSw==
X-Google-Smtp-Source: ABdhPJyH/as0xMCs+5MiZJ/L86BaynP3B044XAxgMkggLOL+q+e8ZFGlst8xK+9CCrIfuhGqIgEPxQ==
X-Received: by 2002:a62:403:0:b0:433:9582:d449 with SMTP id
 3-20020a620403000000b004339582d449mr178657pfe.15.1633549134744; 
 Wed, 06 Oct 2021 12:38:54 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:54 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 27/34] mei: Migrate to aggregate driver
Date: Wed,  6 Oct 2021 12:38:12 -0700
Message-Id: <20211006193819.2654854-28-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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

