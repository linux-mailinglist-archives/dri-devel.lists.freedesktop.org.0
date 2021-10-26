Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9443A8AC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1C86E1D5;
	Tue, 26 Oct 2021 00:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A696E183
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:54 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id l203so7756834pfd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udX8aXVKtCgorZpoo7KBRMV9fl84l0zJ44mq5nPYnXQ=;
 b=oOYmIe4UvKQQvisPK3WuEw7ME4lP+nazSx/hRRpLY0yBbhMPCYujJquJIK5b94R8jp
 8sbFQOc8KdXO5SC2t/68pNHSVGvIVLpalP7a5LBhlDTOi/jkkpZ82StuSzQcYtUdQjY6
 82iQNKg40+yF7kNn5Wkbjv7yn8gR7Ocj/Z6WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udX8aXVKtCgorZpoo7KBRMV9fl84l0zJ44mq5nPYnXQ=;
 b=Iy04R/4wRw48KyoXnS0o9s28wM2VHB9MT1tBQUobqahPFEAhFnK/jciHh0RMNJWdSO
 B4qXy6oDSehGheOjbxCFMHfubBNzPuWsb7nBJZdyHJaJyaeRK9hiaZ1uwoYZ2X+mwtpA
 /dYDo/r/tXPNxwIYlFStZB7H+MUzD2Q/95IHPac7JI4xUVG/TbrxhOml7VIfO6rqYIsm
 EzpUl/4+dVHpPTjOTI/B11TRaxuQRD8m2IoGfu4OF0OaKNbzniOD/N9C5KP/dj9aAJos
 ukM43Tvu6WmF4Qs+JiWcaRPL5ocXQgBmv6fv/VZFy1MK4yysxAeMTXOZgx3NFAlJNRBS
 dN4A==
X-Gm-Message-State: AOAM5332ovBUTkQ+7Oag3ihdI8pKdxWD7g0nRoyMgdCUce88e+qBOhYy
 9uQtri9qCEuRzh692iOUw8duCw==
X-Google-Smtp-Source: ABdhPJzfxXxKFo3+Xvkv15QUx2RXTLOPinKLew58cncPDti5ojzv4SjagRZb6zDGlFLBKc5ivazMYw==
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr22176793pfj.79.1635206454412; 
 Mon, 25 Oct 2021 17:00:54 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:54 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 09/34] drm/arm/hdlcd: Migrate to aggregate driver
Date: Mon, 25 Oct 2021 17:00:19 -0700
Message-Id: <20211026000044.885195-10-swboyd@chromium.org>
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

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 479c2422a2e0..5c03eb98d814 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -270,8 +270,9 @@ static const struct drm_driver hdlcd_driver = {
 	.minor = 0,
 };
 
-static int hdlcd_drm_bind(struct device *dev)
+static int hdlcd_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	struct hdlcd_drm_private *hdlcd;
 	int ret;
@@ -344,8 +345,9 @@ static int hdlcd_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void hdlcd_drm_unbind(struct device *dev)
+static void hdlcd_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct hdlcd_drm_private *hdlcd = drm->dev_private;
 
@@ -367,9 +369,13 @@ static void hdlcd_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops hdlcd_master_ops = {
-	.bind		= hdlcd_drm_bind,
-	.unbind		= hdlcd_drm_unbind,
+static struct aggregate_driver hdlcd_aggregate_driver = {
+	.probe		= hdlcd_drm_bind,
+	.remove		= hdlcd_drm_unbind,
+	.driver		= {
+		.name	= "hdlcd_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int compare_dev(struct device *dev, void *data)
@@ -390,13 +396,12 @@ static int hdlcd_probe(struct platform_device *pdev)
 	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
 	of_node_put(port);
 
-	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &hdlcd_aggregate_driver, match);
 }
 
 static int hdlcd_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &hdlcd_master_ops);
+	component_aggregate_unregister(&pdev->dev, &hdlcd_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

