Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9516486C74
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190B210EFB7;
	Thu,  6 Jan 2022 21:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3399B10EF24
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:27 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso8543017pjm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3a3i/nDaB8ZUdNqJ4VU8hWXyXTL7/wWiLoMS1h5NiSM=;
 b=fdvHO09XyrK1fRBMv6ZCuxZJEOBZEnRNlYv157RP6xvIBDI1KvxVfeWRIWISqNDWJy
 Mje3eRi4npSQNpDWJ9O/5uGZmlZQUlN1UZC4PK3FDQL/MgLM1GrU1WmJLfcElmnrOL1s
 6sKDsY1CzavLw8ggHfgi4o17oPUIa2PeA1B94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3a3i/nDaB8ZUdNqJ4VU8hWXyXTL7/wWiLoMS1h5NiSM=;
 b=Q0/In+YDxai0EtL/kVv4cXFK0gs5FZiGaJBJ9s8EZgWZXSnFpYN5NTLtgQFV7Z1Ep9
 Y41pfsIA2t0AJUSK4u9UU7XcQwUQNqO4gu6jjvDPL5+IzVg8LL/uu3MhSB97UAuoiPZj
 fVt3jgp5+rCbDmjJAEBpDwZYt4g5sjK7cqWiKYjgxRrQQ6Etx79fTUctz5jfHNtHpMaI
 nvkLT4+lu8F0qe3JQ7W/umZpq20j4ZIT6aABxjMQ2kH1JnrQWoG0mzuji8geCvEuPya0
 mJK+Rg3RjnkGsvgzO7Rdzw8jFbml5oZmMD389zwJlW4X+Ln+iImDhQ5o0J/Z/a4e6yky
 DgHA==
X-Gm-Message-State: AOAM532zFZxHwX5wSuFXO9P7UUpXj17gS/ITRRQKDhYK7nTU3mEYYWYr
 0AKZjKoIxz6VxpFHk1eK3iqNPg==
X-Google-Smtp-Source: ABdhPJwr1viR7RiIgdiNaWACG2FQzv9WC65+KPeGyqeBih/ukDD1zE8+KmCzZ5Vl/9CAHYBtTaRbIw==
X-Received: by 2002:a17:902:ec85:b0:148:a8d2:91c0 with SMTP id
 x5-20020a170902ec8500b00148a8d291c0mr60254706plg.94.1641505586819; 
 Thu, 06 Jan 2022 13:46:26 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:26 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 21/32] drm/sti: Migrate to aggregate driver
Date: Thu,  6 Jan 2022 13:45:44 -0800
Message-Id: <20220106214556.2461363-22-swboyd@chromium.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/sti/sti_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index c7efb43b83ee..b277cc679154 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -182,8 +182,9 @@ static void sti_cleanup(struct drm_device *ddev)
 	ddev->dev_private = NULL;
 }
 
-static int sti_bind(struct device *dev)
+static int sti_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *ddev;
 	int ret;
 
@@ -216,8 +217,9 @@ static int sti_bind(struct device *dev)
 	return ret;
 }
 
-static void sti_unbind(struct device *dev)
+static void sti_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *ddev = dev_get_drvdata(dev);
 
 	drm_dev_unregister(ddev);
@@ -225,9 +227,13 @@ static void sti_unbind(struct device *dev)
 	drm_dev_put(ddev);
 }
 
-static const struct component_master_ops sti_ops = {
-	.bind = sti_bind,
-	.unbind = sti_unbind,
+static struct aggregate_driver sti_aggregate_driver = {
+	.probe = sti_bind,
+	.remove = sti_unbind,
+	.driver = {
+		.name = "sti_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int sti_platform_probe(struct platform_device *pdev)
@@ -249,12 +255,12 @@ static int sti_platform_probe(struct platform_device *pdev)
 		child_np = of_get_next_available_child(node, child_np);
 	}
 
-	return component_master_add_with_match(dev, &sti_ops, match);
+	return component_aggregate_register(dev, &sti_aggregate_driver, match);
 }
 
 static int sti_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &sti_ops);
+	component_aggregate_unregister(&pdev->dev, &sti_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

