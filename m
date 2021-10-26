Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C94643A8BA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170456E1F1;
	Tue, 26 Oct 2021 00:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CBC6E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:58 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id e65so12288115pgc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+fM2dIjOxE0hdJ7o5inMEoSl4k+Dtn8hCQbdOli+o8=;
 b=WK1ox2oRHtuob3v/ROgeEhC1PVQBBzfwdp0Vcx+Dzp3pUstlggErRUG3DVNU3uE2n/
 vRNQwS26UtVE2R4pJjjbJxrVBD1WGWrU9P20RfSOtE5t14iUTUOVyJjOi4BSBgmP69U+
 Wx41UMi8X3CGf7P7D+FfisrIp491w2OHpPdzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+fM2dIjOxE0hdJ7o5inMEoSl4k+Dtn8hCQbdOli+o8=;
 b=CIfNzWm+65NkN1E10/mTc49Rqt/tlHZGiMj3YWeVkfLpidBul3gfeorlid1J+4beWL
 0iflWoAbKaU1WI97+uYWb1n53jfQICZQzni6vzoL8M8MLIM4CTBtEAGJMYhkuL7i/35p
 nmqig4rmmBOAYbneBlY4BI+gkz+t9X7HoG8DRxDYlH72S6wLDZzjkNJmPM5xiFhQYYMU
 7dkLnddbQmzYTmB26P5mKLX3W+vuRo3ooFYtF0ivUmuuZUsJOzx4tuKbatkeRK5hg/LP
 wFK5lhnWQmp+51/X7MFQRD8eWcxSGzvB0dA4SFKmavUdh8tCqBtEv8LpMGdJ7/lkDY7B
 KFyA==
X-Gm-Message-State: AOAM531dVzTZPCVm35Ki4/iGkWjDDczK6ZfY+RqqqbUgGVNEHsxSD1oy
 qCNVw7+1GFqluGlgNKNAQ7DFWw==
X-Google-Smtp-Source: ABdhPJyAH+KqK4V7Wo1bh2UQ9/xYGJyYJ5MoNL/eKeZvWyDr56giKqwSJvUB9ld4uN59VRUEoCXXxw==
X-Received: by 2002:a62:2944:0:b0:44d:b731:4228 with SMTP id
 p65-20020a622944000000b0044db7314228mr21635086pfp.9.1635206457831; 
 Mon, 25 Oct 2021 17:00:57 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:57 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <john.stultz@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 13/34] drm/kirin: Migrate to aggregate driver
Date: Mon, 25 Oct 2021 17:00:23 -0700
Message-Id: <20211026000044.885195-14-swboyd@chromium.org>
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

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 98ae9a48f3fe..00d47c784cbb 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -217,8 +217,9 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
 	return 0;
 }
 
-static int kirin_drm_bind(struct device *dev)
+static int kirin_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct kirin_drm_data *driver_data;
 	struct drm_device *drm_dev;
 	int ret;
@@ -253,8 +254,9 @@ static int kirin_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void kirin_drm_unbind(struct device *dev)
+static void kirin_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm_dev);
@@ -262,9 +264,13 @@ static void kirin_drm_unbind(struct device *dev)
 	drm_dev_put(drm_dev);
 }
 
-static const struct component_master_ops kirin_drm_ops = {
-	.bind = kirin_drm_bind,
-	.unbind = kirin_drm_unbind,
+static struct aggregate_driver kirin_drm_aggregate_driver = {
+	.probe = kirin_drm_bind,
+	.remove = kirin_drm_unbind,
+	.driver = {
+		.name = "kirin_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int kirin_drm_platform_probe(struct platform_device *pdev)
@@ -281,12 +287,12 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	drm_of_component_match_add(dev, &match, compare_of, remote);
 	of_node_put(remote);
 
-	return component_master_add_with_match(dev, &kirin_drm_ops, match);
+	return component_aggregate_register(dev, &kirin_drm_aggregate_driver, match);
 }
 
 static int kirin_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &kirin_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &kirin_drm_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

