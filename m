Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0AD49EBD6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9D10E51C;
	Thu, 27 Jan 2022 20:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EFD10E30A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:23 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 nn16-20020a17090b38d000b001b56b2bce31so4124372pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZZOtrHonizJg96tLMp/t5Fsa0Q7P0xuTO1TufH5G0g=;
 b=JtASTOgjliVzgUuDAEkW0Ir5wrdjaMJtLwikgtGfArBmRuX33OZG0aepVuJRx2P4EY
 K5Jj7OesE+FqfW5gq9Ay8XCHtB7gY/xTVO9TMH8Moi/hdtqH5YekBCbOK8iwI9v0qKx2
 u1JKO+JV8tJOVYIHoSfVA+SwgZ2Vh34t89+2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZZOtrHonizJg96tLMp/t5Fsa0Q7P0xuTO1TufH5G0g=;
 b=qrw3OE3MSGsahrvZz5QfAAyH7lRle2ujewvxWdr6Khj41J8DNrp5Swswh4jwVtic+g
 ihleSY4n4R7ZZaZv2BCteZFymVoZ5f92Pu6fVxcOTFElCxPUFl+/lL6arpDzAV/XSX49
 DpqtxbYfNMkPrWz/H9y07L+ZiFhtV94It0eOXbvXjF2uqYx2IWsOCngVvXHYwVnRsRJ8
 tiC79fmjPraMtqtr4ruQ+dwmKp2OAYjuSdwwsCHByx/Uu3M6lkEE7mevkOQqaWnGkXPf
 f5ezGPdR7oDG/+/IwRe6SHLWoEATmMYIHF/gNqpFllH279kHti/j3hwCw8FQzV+tg94q
 wwMQ==
X-Gm-Message-State: AOAM533G0pQ+Yj0eAaAHrkgtKFtG6UCl8lqa9oBgJruOo9yqWArJrNAa
 0Ut+z+yOztvMpZLRUUmP3SQAhA==
X-Google-Smtp-Source: ABdhPJwmi+gC9GIk+mPiD3jpNbRlfOIDByFSs57GlbKAx7rEbL4+ShWkEE9cxHVpUb+UV2YhHX+FQA==
X-Received: by 2002:a17:90b:38d1:: with SMTP id
 nn17mr5880056pjb.58.1643313743266; 
 Thu, 27 Jan 2022 12:02:23 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:22 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 22/35] drm/sun4i: Migrate to aggregate driver
Date: Thu, 27 Jan 2022 12:01:28 -0800
Message-Id: <20220127200141.1295328-23-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index b630614b3d72..9f20c3f0f93e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -56,8 +56,9 @@ static const struct drm_driver sun4i_drv_driver = {
 	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
 };
 
-static int sun4i_drv_bind(struct device *dev)
+static int sun4i_drv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm;
 	struct sun4i_drv *drv;
 	int ret;
@@ -125,8 +126,9 @@ static int sun4i_drv_bind(struct device *dev)
 	return ret;
 }
 
-static void sun4i_drv_unbind(struct device *dev)
+static void sun4i_drv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -140,9 +142,13 @@ static void sun4i_drv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops sun4i_drv_master_ops = {
-	.bind	= sun4i_drv_bind,
-	.unbind	= sun4i_drv_unbind,
+static struct aggregate_driver sun4i_aggregate_driver = {
+	.probe	= sun4i_drv_bind,
+	.remove	= sun4i_drv_unbind,
+	.driver = {
+		.name = "sun4i_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static bool sun4i_drv_node_is_connector(struct device_node *node)
@@ -398,16 +404,14 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 	}
 
 	if (count)
-		return component_master_add_with_match(&pdev->dev,
-						       &sun4i_drv_master_ops,
-						       match);
-	else
-		return 0;
+		return component_aggregate_register(&pdev->dev, &sun4i_aggregate_driver, match);
+
+	return 0;
 }
 
 static int sun4i_drv_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &sun4i_drv_master_ops);
+	component_aggregate_unregister(&pdev->dev, &sun4i_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

