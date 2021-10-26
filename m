Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7743A8AD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DC96E1ED;
	Tue, 26 Oct 2021 00:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0766E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:57 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 75so12301803pga.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsjwfsQuiDMEQ+TXne3j17pwDv7xto97Rnhld6OcLgM=;
 b=JsNKkygmeK7t9BKO6qrvtUSpxQse23oLtPi1Ud+f8iOJIEjnjJoQyjhNwQBsbe7Z9F
 M0+wkg4ZKQiVoMM8IoJFOjkU2VGe29j7CfYlRftUp21IthOYQqKKp5hC4GlQarR3MHWh
 iHXFOzHIMsAvr6cTyAlsNu12s72IGx7u09yis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsjwfsQuiDMEQ+TXne3j17pwDv7xto97Rnhld6OcLgM=;
 b=1N5u7+AIg0YM/hxKJ2FkewKNBnhFWL/m/U2oWpQ633zUR2CjUyAjblDdlV5P1Mpz6Y
 /Q1BPmgNUI+UG8cyE9nyxN3D3n14A2mmUDqDJEV3veBuiZH75hp1LnIlGTu4aBWP66GN
 HD543rlBjSZouOS1k/6o7JHmLZiP4wzwSwjfxo7cw9KnzSPa6va8P+Rt3o9cn4o9u/Wb
 zPZWfZKs+883x8KCg4/S0Ee4iwY5kxYBNTjrN+JdqVpfHIn3g4KdqAuktwtE6we6p+w5
 2bMofb9tPF34o0qYLX/ObGc+ne7KH2N0cbnjGbALMXeO/+/sflAJC7ORc3mgX3wFJgLn
 4eTw==
X-Gm-Message-State: AOAM533IRcoQXxykuRXyDvJ+qTWZyZNFMhvSy/xP2gND+Vq1mVwDm4lx
 A6GsUYF0Gn3oCv22BjZKrGQWAg==
X-Google-Smtp-Source: ABdhPJzmber7LbCziYMRWNipuyoAiMg+eV8DtfkSPeLWCTaFcNe7I0rGqreDAXhlNy+iuVwrhW/bIQ==
X-Received: by 2002:a05:6a00:2309:b0:47c:fb3:f127 with SMTP id
 h9-20020a056a00230900b0047c0fb3f127mr859661pfh.78.1635206456941; 
 Mon, 25 Oct 2021 17:00:56 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:56 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 12/34] drm/etnaviv: Migrate to aggregate driver
Date: Mon, 25 Oct 2021 17:00:22 -0700
Message-Id: <20211026000044.885195-13-swboyd@chromium.org>
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

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 7dcc6392792d..95d1e518ff13 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,8 +494,9 @@ static const struct drm_driver etnaviv_drm_driver = {
 /*
  * Platform driver:
  */
-static int etnaviv_bind(struct device *dev)
+static int etnaviv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
 	int ret;
@@ -552,8 +553,9 @@ static int etnaviv_bind(struct device *dev)
 	return ret;
 }
 
-static void etnaviv_unbind(struct device *dev)
+static void etnaviv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct etnaviv_drm_private *priv = drm->dev_private;
 
@@ -569,9 +571,13 @@ static void etnaviv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops etnaviv_master_ops = {
-	.bind = etnaviv_bind,
-	.unbind = etnaviv_unbind,
+static struct aggregate_driver etnaviv_aggregate_driver = {
+	.probe = etnaviv_bind,
+	.remove = etnaviv_unbind,
+	.driver = {
+		.name = "etnaviv_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -609,12 +615,12 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			component_match_add(dev, &match, compare_str, names[i]);
 	}
 
-	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
+	return component_aggregate_register(dev, &etnaviv_aggregate_driver, match);
 }
 
 static int etnaviv_pdev_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &etnaviv_master_ops);
+	component_aggregate_unregister(&pdev->dev, &etnaviv_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

