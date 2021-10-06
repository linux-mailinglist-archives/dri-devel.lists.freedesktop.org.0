Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD654246EE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49A66EE30;
	Wed,  6 Oct 2021 19:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAED76EE2D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:31 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so5183846pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TrXWSXEHZSSe+ZNP0MEWDrKg7JGFcV3ZLPK0R/nqLBY=;
 b=BYGV2YJoDO3XYhcc2ImhdpJbxGgocl9uyQLt3U1WbZvj0WL1FshJVPAYJb1NRelDJX
 xSs8FKrvBjdPyW8re4vl4F7WY1oqMfj+MzapTE21WGwzZRESm3Pj2S10sX9mNELTef+/
 tz9fcvBz3MaIYvACyA/0R/zTO0Xrz9+s4yWuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrXWSXEHZSSe+ZNP0MEWDrKg7JGFcV3ZLPK0R/nqLBY=;
 b=7TWzWXw7flE8JO62/ucj2fsofVhNhzJnkcAx4KPkCY27PlQwv8wSCPVG4sHXL7MyZm
 DI96YDm3sZ3iAdUHKEownq+CPDdLsypryhS6+2wh+hsRfR+dK8n3Llamu07D9vei+6Rg
 GZ+0fCUiK8G4vm3kUIerfFcMdqQY7hFOaK72XfbhVkQPx6JgLMyusdEcTE0YfUd5Nnm7
 5/H+QdAAcspgxfBwSJQUAE6uqkofzS/IHrvI+xXEutrTx9GhJnv522k0Cor3wU4/t8hp
 uHsKgowVyFTSbEVpOUAAaBGCGacIdpxkQweTzfz6J/D+u81+5dmuKOM552gNLgdVdQp0
 33aA==
X-Gm-Message-State: AOAM533TkEI9k6VXKyAQzyKBmLxw4v/mgxolX4RbHBlAijb+me01QugA
 Gr3NluzlAZ6mZQ6r1YIlK/nUhw==
X-Google-Smtp-Source: ABdhPJzmaWGAcSqzevd1G0esgXTcACMs0ekVu6jIQ64fXf44o8eRUL2dBeO9lQ2MaAbCFARLQI3HAg==
X-Received: by 2002:a17:902:bf07:b0:138:e32d:9f2e with SMTP id
 bi7-20020a170902bf0700b00138e32d9f2emr12466282plb.59.1633549106864; 
 Wed, 06 Oct 2021 12:38:26 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:26 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 03/34] component: Move struct aggregate_device out to
 header file
Date: Wed,  6 Oct 2021 12:37:48 -0700
Message-Id: <20211006193819.2654854-4-swboyd@chromium.org>
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

This allows aggregate driver writers to use the device passed to their
probe/remove/shutdown functions properly instead of treating it as an
opaque pointer.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 15 ---------------
 include/linux/component.h | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index d99e99cabb99..f49b48695c8f 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -62,21 +62,6 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct aggregate_device {
-	const struct component_master_ops *ops;
-	struct device *parent;
-	struct device dev;
-	struct component_match *match;
-	struct aggregate_driver *adrv;
-
-	int id;
-};
-
-static inline struct aggregate_device *to_aggregate_device(struct device *d)
-{
-	return container_of(d, struct aggregate_device, dev);
-}
-
 struct component {
 	struct list_head node;
 	struct aggregate_device *adev;
diff --git a/include/linux/component.h b/include/linux/component.h
index 95d1b23ede8a..e99cf8e910f0 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -5,6 +5,8 @@
 #include <linux/stddef.h>
 #include <linux/device.h>
 
+struct component_match;
+
 /**
  * struct component_ops - callbacks for component drivers
  *
@@ -39,8 +41,6 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-struct aggregate_device;
-
 /**
  * struct component_master_ops - callback for the aggregate driver
  *
@@ -80,7 +80,20 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
-struct component_match;
+struct aggregate_device {
+	const struct component_master_ops *ops;
+	struct device *parent;
+	struct device dev;
+	struct component_match *match;
+	struct aggregate_driver *adrv;
+
+	int id;
+};
+
+static inline struct aggregate_device *to_aggregate_device(struct device *d)
+{
+	return container_of(d, struct aggregate_device, dev);
+}
 
 /**
  * struct aggregate_driver - Aggregate driver (made up of other drivers)
-- 
https://chromeos.dev

