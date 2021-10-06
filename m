Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63BA4246F3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19486EE31;
	Wed,  6 Oct 2021 19:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1486EE2D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:33 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id a73so3456786pge.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyFhWuo5Hgtey/EJ0ER9SojRROyEQ1lmEqqEKYabFj8=;
 b=WbivjpxeeLzpbDhsokO1QAyB+XeHitmcvYdTvkg9A9dVGb5dDzGxavDwdHcpUlgwDU
 V8/p9ZJfFgtjFFTBIQCPzL9Jc4iZN4LdjP1xFwucOfErOWq5i7zqiM9yhCRiZAlMDOFp
 XVvHkDRFsICOg23ZGy7WLJVSYgKUKLIWw454A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyFhWuo5Hgtey/EJ0ER9SojRROyEQ1lmEqqEKYabFj8=;
 b=2UwjD3/U4HRa9skr+hL1gkl/Yw3n/0BWVbuESX9i4NoCd9gdqguRoHfSIdt3QhfTxB
 PY06Cuzjtxaz7mE0FRJcd7xkWaYeDNUFV48wTj7wBe+B+qJIJ1vNuKS6U7O9K069zoW9
 SlK0Cu56UxWrhn3U1HlRD/ZnZwUGwKjt0ChjZi56WusDxNL1OZjMdS2BpuwU/xye4hYb
 EpJYXtNSgMS2nlVuRX1iCgCELPzfLp17+sKS0FTytpxc+/KNgSqm2kuWRHTAQou3pwn1
 8A6vmaV+5VUcOFnmrqyqpX3ZiGo8zgP8FcjYr4U3HmfpNQgkYRl4n6PLcHl9mB7jdYKq
 zj8w==
X-Gm-Message-State: AOAM531tQrv7p9oAus8RdGX3TtsCerthefErTnWK5YwdMxF2832ynbIQ
 qgPfUNiVueD/SsjC3cK9/k9+vA==
X-Google-Smtp-Source: ABdhPJznGJCOeCeyKq8Z/Qhtw8kvrQb8bZRBLDlNwr9nxrZXmfzjPyXz1pMYkJN8S5TO6MRfL6Q8fg==
X-Received: by 2002:a05:6a00:1789:b0:43d:ea98:7ea8 with SMTP id
 s9-20020a056a00178900b0043dea987ea8mr39552269pfg.67.1633549113415; 
 Wed, 06 Oct 2021 12:38:33 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:33 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 09/34] drm/malidp: Migrate to aggregate driver
Date: Wed,  6 Oct 2021 12:37:54 -0700
Message-Id: <20211006193819.2654854-10-swboyd@chromium.org>
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

TODO: This can be updated to move the drm helper logic into the
aggregate driver shutdown op.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/arm/malidp_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 78d15b04b105..e6ee4d1e3bb8 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -702,8 +702,9 @@ static int malidp_runtime_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int malidp_bind(struct device *dev)
+static int malidp_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct resource *res;
 	struct drm_device *drm;
 	struct malidp_drm *malidp;
@@ -894,8 +895,9 @@ static int malidp_bind(struct device *dev)
 	return ret;
 }
 
-static void malidp_unbind(struct device *dev)
+static void malidp_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct malidp_drm *malidp = drm->dev_private;
 	struct malidp_hw_device *hwdev = malidp->dev;
@@ -921,9 +923,13 @@ static void malidp_unbind(struct device *dev)
 	of_reserved_mem_device_release(dev);
 }
 
-static const struct component_master_ops malidp_master_ops = {
-	.bind = malidp_bind,
-	.unbind = malidp_unbind,
+static struct aggregate_driver malidp_aggregate_driver = {
+	.probe = malidp_bind,
+	.remove = malidp_unbind,
+	.driver = {
+		.name = "malidp_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int malidp_compare_dev(struct device *dev, void *data)
@@ -949,13 +955,12 @@ static int malidp_platform_probe(struct platform_device *pdev)
 	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
 				   port);
 	of_node_put(port);
-	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &malidp_aggregate_driver, match);
 }
 
 static int malidp_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &malidp_master_ops);
+	component_aggregate_unregister(&pdev->dev, &malidp_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

