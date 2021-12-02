Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4688466C7E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63376FC75;
	Thu,  2 Dec 2021 22:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3886FC38
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:49 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id o4so916087pfp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InGYSc3cNsqSsbEpZp55brWuJhvXfCPzOPufF1ln430=;
 b=hq0KVI3W2yasYBuPgIGtzBCut5dk4DJYuICxw3vS2py6HtWsmJi0uOZrbEt2z5j4bQ
 vk45hg2s5gz+GFi/7KR+2nDoWq28hq/63rxC2XqkyKm+DHAxwf8l/MoPaqX83nBWNAiP
 byNhGcarciphKJgh8x2UQWNtymc+mEA+PPlJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InGYSc3cNsqSsbEpZp55brWuJhvXfCPzOPufF1ln430=;
 b=7wm1q5Rjo+Ek9V2earX/nz0NEAlj48woKbljJm8pXHRf5LbLTAVl6AtEp29EKjn6VT
 deAyAzWw493BwrXnX0S4JC+aL88hGC2gEUCb9zB9Mv6N2LXRV7xUhN98jnMeY8amcwYu
 lb298TAGgtJeI5fYzIxBnGcjSUqaEQzJnzL6SulzLWh1OgvZai2BnH4l4e3AfnX6vfno
 vaYoSTj3S4o6bPas55M4ANoBLu4E/infhmY9YwySwD2jT+287LukqJ4FPM8GnSNARIHd
 zKX3gFMJUhwoHLZGO+MKFRwyyg/ps7xqbIwcIE+uyiCCIGO1f17HVvHBk/8vT9vbk3fs
 DuAg==
X-Gm-Message-State: AOAM530ggmBhpY5DeE4xqUrXub7Cn3Q5VEe0g8qVywKR93E372fR7ULq
 +I7XOahimjH1rHZcToooDeqKbg==
X-Google-Smtp-Source: ABdhPJzBOFRRT3xYAgGwIIFyu36iZ8Fa/CB6Iksub5c1GFh4wBor6MIE8SX52J8xtv42ROyKRqcMew==
X-Received: by 2002:a63:2ccd:: with SMTP id s196mr1541758pgs.77.1638484069377; 
 Thu, 02 Dec 2021 14:27:49 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:49 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 16/34] drm/ingenic: Migrate to aggregate driver
Date: Thu,  2 Dec 2021 14:27:14 -0800
Message-Id: <20211202222732.2453851-17-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

TODO: Move the helpers to PM in aggregate driver hooks.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 25 +++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a5df1c8d34cd..d5330fb486e8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1150,8 +1150,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int ingenic_drm_bind_with_components(struct device *dev)
+static int ingenic_drm_bind_with_components(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return ingenic_drm_bind(dev, true);
 }
 
@@ -1174,9 +1176,20 @@ static void ingenic_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(&priv->drm);
 }
 
-static const struct component_master_ops ingenic_master_ops = {
-	.bind = ingenic_drm_bind_with_components,
-	.unbind = ingenic_drm_unbind,
+static void ingenic_aggregate_remove(struct aggregate_device *adev)
+{
+	struct device *dev = adev->parent;
+
+	ingenic_drm_unbind(dev);
+}
+
+static struct aggregate_driver ingenic_aggregate_driver = {
+	.probe = ingenic_drm_bind_with_components,
+	.remove = ingenic_aggregate_remove,
+	.driver = {
+		.name = "ingenic_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int ingenic_drm_probe(struct platform_device *pdev)
@@ -1196,7 +1209,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	drm_of_component_match_add(dev, &match, compare_of, np);
 	of_node_put(np);
 
-	return component_master_add_with_match(dev, &ingenic_master_ops, match);
+	return component_aggregate_register(dev, &ingenic_aggregate_driver, match);
 }
 
 static int ingenic_drm_remove(struct platform_device *pdev)
@@ -1206,7 +1219,7 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
 		ingenic_drm_unbind(dev);
 	else
-		component_master_del(dev, &ingenic_master_ops);
+		component_aggregate_unregister(dev, &ingenic_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

