Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB1486C6C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4C710EF46;
	Thu,  6 Jan 2022 21:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324ED10EF22
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:23 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso2710389pjo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0P0B2t7jpcQb6RReBEhUJcwiQBX6wggU1M1usRBo/kI=;
 b=OMmriz8g6SqvUhC+jJKguXZPzeNbrMkAffwjErEk+CltWZ6StTRLM1QhiC5eJkz90c
 Z0YD413vMw0bVDIg90Vurus2guUNuLOOw7WxT2Ux27KNw3xAswtMH624dH2SEC/F2Yhx
 VcAd0TKcwWLB7s5I7sk8rCos61gT5buuj5b2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0P0B2t7jpcQb6RReBEhUJcwiQBX6wggU1M1usRBo/kI=;
 b=EhX5tgFs7SyxPON+Ux/ZksIW27/gBC2cWg/CemDm1Os7UTl+cF6hMPKLELRikhey4Q
 Iz3810901JPQCBSqPjk8TcrYfNwekkhR4xKiuYsdyzYYHIAhzHDyusHdNOO2yH+ZXtg8
 JDf/kHoRAiYOwN9YlqnNLNcatYIzphhznhIPK1ZGjwuULGY94LNoXuhorIIkRwvUl88Z
 cMEiHJPkg328BAvqPtJ71NC6QRPZEFCAg9/YwngNOcg/ZSuP3xBFd07o3+Glf1Xq0rf2
 Ey3WKI/Y28A2/yD3FJPUCJujKwWM08yYyyLMOmrw9uv7UdisKNU3yGuA0Lc+k+pYLSH2
 lGtw==
X-Gm-Message-State: AOAM530xaFUdEFZFlC26LcrpqdQoP7VyZdIbWtVukapSDEF4vd975fyA
 jlsGEzn/iguNXz18vLopWSzlxKmeGgjTbA==
X-Google-Smtp-Source: ABdhPJwevDLAx3RQTtIwgYxJoTRsVhvDf16aEqPPEqco33SsVOKqwUE3w+uhW5OAbjFhWL2saEpvwQ==
X-Received: by 2002:a17:902:d645:b0:149:b7bf:9932 with SMTP id
 y5-20020a170902d64500b00149b7bf9932mr22561186plh.48.1641505582894; 
 Thu, 06 Jan 2022 13:46:22 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:22 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 18/32] drm/meson: Migrate to aggregate driver
Date: Thu,  6 Jan 2022 13:45:41 -0800
Message-Id: <20220106214556.2461363-19-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 7f41a33592c8..3028f2a45f66 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -356,13 +356,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int meson_drv_bind(struct device *dev)
+static int meson_drv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return meson_drv_bind_master(dev, true);
 }
 
-static void meson_drv_unbind(struct device *dev)
+static void meson_drv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct meson_drm *priv = dev_get_drvdata(dev);
 	struct drm_device *drm = priv->drm;
 
@@ -386,9 +389,13 @@ static void meson_drv_unbind(struct device *dev)
 	}
 }
 
-static const struct component_master_ops meson_drv_master_ops = {
-	.bind	= meson_drv_bind,
-	.unbind	= meson_drv_unbind,
+static struct aggregate_driver meson_aggregate_drv = {
+	.probe	= meson_drv_bind,
+	.remove	= meson_drv_unbind,
+	.driver = {
+		.name = "meson_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
@@ -502,9 +509,7 @@ static int meson_drv_probe(struct platform_device *pdev)
 	if (count) {
 		dev_info(&pdev->dev, "Queued %d outputs on vpu\n", count);
 
-		return component_master_add_with_match(&pdev->dev,
-						       &meson_drv_master_ops,
-						       match);
+		return component_aggregate_register(&pdev->dev, &meson_aggregate_drv, match);
 	}
 
 	/* If no output endpoints were available, simply bail out */
-- 
https://chromeos.dev

