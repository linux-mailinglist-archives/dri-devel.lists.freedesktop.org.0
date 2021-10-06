Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B44246FD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D86A6EE3B;
	Wed,  6 Oct 2021 19:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728A46EE29
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:31 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id 187so3257908pfc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdKC3RDnWMeVhqBKuTAcfq/eZBHYEe2Kb+X7ix5SdpY=;
 b=bYXZrb2Mw0ygA/9KQUszZR0D4+fBHb1MS2IAeBPCv5THUvbkeF9CzMvcUArorOxTAK
 B1HrTvXihaUQeWiLQvL+0lEMneUWKCwMfy/POUvBJf8ELzE+zKDqutR6eEmcX2r97Guc
 Uv7Q5lG6rFPLy8WnQ5GTASLWbtTQ5A00scm0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdKC3RDnWMeVhqBKuTAcfq/eZBHYEe2Kb+X7ix5SdpY=;
 b=8OkuBMR2dn+5BS0UcUq3b6pvr290tKn7E/WXrraOFyAKDpgsRmpdCuJd9nWO9d4tZ2
 u6PvpXWAHP/mDZUdvUGX4nGGZ52kgJDNFhTHne9WrFXbiUCULf0wXBfe3I5u1Mz7dDQp
 1GFCg6PMjNplEvoPHt/Wh0G8FCrrnUOxZz+YPx+EIhKrGAU9zX1GWdmXOElwfWvZNxOy
 0gH1TX/t8Pp5B6m8FrH8y9AbEOmhqJZP/g4lwCTjEqG4D26Nu125ABH7TtYpL4ptgBKk
 twQgCCIsofFy8KXAOg+h7ze4AhHEKv15tiF/TmoW4aFXgnYg3Io4wBQGsHCpaoxMnh4A
 4KRQ==
X-Gm-Message-State: AOAM532nlaA1Ia2rDihkd73B/jTfd7VDRHbllVMxgNmFNy7uWtV+IpWd
 5aiN/UJl6Z5+BQKjVaAKa+/BVw==
X-Google-Smtp-Source: ABdhPJyQxcu7a9c6zJ5OPG0sbw5QtjSSLjEp7prUkIluddBHbCR+Nhq+ATnHLHRc/o8nEL0u0iy0bg==
X-Received: by 2002:a63:2022:: with SMTP id g34mr433631pgg.173.1633549111054; 
 Wed, 06 Oct 2021 12:38:31 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:30 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 James Qian Wang <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 07/34] drm/komeda: Migrate to aggregate driver
Date: Wed,  6 Oct 2021 12:37:52 -0700
Message-Id: <20211006193819.2654854-8-swboyd@chromium.org>
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

Cc: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../gpu/drm/arm/display/komeda/komeda_drv.c   | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index e7933930a657..0463386a6ed2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -25,8 +25,9 @@ struct komeda_dev *dev_to_mdev(struct device *dev)
 	return mdrv ? mdrv->mdev : NULL;
 }
 
-static void komeda_unbind(struct device *dev)
+static void komeda_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
 
 	if (!mdrv)
@@ -45,8 +46,9 @@ static void komeda_unbind(struct device *dev)
 	devm_kfree(dev, mdrv);
 }
 
-static int komeda_bind(struct device *dev)
+static int komeda_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct komeda_drv *mdrv;
 	int err;
 
@@ -87,9 +89,13 @@ static int komeda_bind(struct device *dev)
 	return err;
 }
 
-static const struct component_master_ops komeda_master_ops = {
-	.bind	= komeda_bind,
-	.unbind	= komeda_unbind,
+static struct aggregate_driver komeda_aggregate_driver = {
+	.probe	= komeda_bind,
+	.remove	= komeda_unbind,
+	.driver = {
+		.name  = "komeda_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -129,12 +135,12 @@ static int komeda_platform_probe(struct platform_device *pdev)
 		komeda_add_slave(dev, &match, child, KOMEDA_OF_PORT_OUTPUT, 1);
 	}
 
-	return component_master_add_with_match(dev, &komeda_master_ops, match);
+	return component_aggregate_register(dev, &komeda_aggregate_driver, match);
 }
 
 static int komeda_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &komeda_master_ops);
+	component_aggregate_unregister(&pdev->dev, &komeda_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

