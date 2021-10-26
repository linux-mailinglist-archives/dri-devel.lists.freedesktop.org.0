Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6620A43A8A1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCF36E1A5;
	Tue, 26 Oct 2021 00:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D46E187
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:50 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id s136so12300491pgs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0msA0xs8lhZ+Yu7wuGuAFKr0B67vxNoH5+pgXRqbiBg=;
 b=fINIymHE/3VXwQ4Cv4u1C8mWtt0WD7C3a+GM+AqVyvsqSuzRyN05Ov13w93KcIJ7YC
 uGfRG9WMH6ZmoC65whT9OOrVWakix/A3gm95LjHyVCeUQy6Bx/yGc6+TJwkSsF0zbtdp
 n/lFvtAUzzyUf1tY0ikLKeweCG2gHITgrOa/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0msA0xs8lhZ+Yu7wuGuAFKr0B67vxNoH5+pgXRqbiBg=;
 b=f4KjLF8chplDXqPQDHqZr/EMzI1lAdwYDlo0e0tJ3GW7eOEq6VS2M0aK4b0AMx0Pcc
 IloUCUeUXahDD5eieMUNYt5E4+VJ0tli+9sf6to81imcGSGRXFrhmUUwg+L5mQJxBPPi
 8NnXwqwbPQmvDrgq/FsI9TZeavnYZ8HQJQ2Qvh9I8hnd/otODlG1icKtpigY4ap01tC0
 yoGD6Ajz2gw7e5Ea+Su2arLEReysyMeEZcy9rsXSQKPuC9CpVHrg9tBXTVEadO6NvIpP
 VAxZc2Vmw8LB+Lu4SN1MxOQUOGWBjLwqGeMqxCL2IbMIdKgk8fx8iryZQXCZOAvh9iLs
 6Xow==
X-Gm-Message-State: AOAM531zyo9UmXTUY+gsUy8JWKeIIAWpQe55PYGIxfqLj/otuF70vxSz
 LAv5G+Lxz55LQmoKwHSt1ggAug==
X-Google-Smtp-Source: ABdhPJzqgDUOkGmwmKvQRwRgZjpUZ3O0xIL9NVI95wISsKuBIjI/vJP1pFC34pBwEaJ2WMB7uOBRsw==
X-Received: by 2002:a05:6a00:198b:b0:47b:ac2d:68f4 with SMTP id
 d11-20020a056a00198b00b0047bac2d68f4mr21337865pfl.1.1635206450134; 
 Mon, 25 Oct 2021 17:00:50 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:49 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 04/34] component: Move struct aggregate_device out to
 header file
Date: Mon, 25 Oct 2021 17:00:14 -0700
Message-Id: <20211026000044.885195-5-swboyd@chromium.org>
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

This allows aggregate driver writers to use the device passed to their
probe/remove/shutdown functions properly instead of treating it as an
opaque pointer.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
index 3d9d2f94df28..997b17053ecf 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -57,21 +57,6 @@ struct component_match {
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

