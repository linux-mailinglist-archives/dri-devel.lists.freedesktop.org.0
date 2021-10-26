Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDE43A887
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2176E182;
	Tue, 26 Oct 2021 00:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9920F6E095
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:48 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id s136so12300345pgs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kiNOxXumrSGzV6vW4uZBorP3H/jCdIuX85JHNzz9/pA=;
 b=JMiy5eF8fFhoaXn0XtQA82qv7f3Kn/gzOSEl6q6IP9UA+c2TYZxwR4GVpZOQ1XYabD
 DdoRH4AdBDSVqcecLfZZ2aazEwXu6Bv6xNHJb4qXAV848IlvHVMT7L5QCWoNoscX+gft
 MAZY0D2nvFDXOW35ypGnfdQ6lD2L8CpXJx8Pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kiNOxXumrSGzV6vW4uZBorP3H/jCdIuX85JHNzz9/pA=;
 b=hZnCb4cdl7Cm003K4WbH0Y+y2PiULQZYB1uY2pAlfCfVW+Et44tSPyre5ny8Z/8x85
 M7xrSbKLKI6wd4cRI9bd4uAdAd1ThicZgTji03HAOPxMTtVyiHKDTwh1pWubrScJrC9J
 6ni7p/rzz0vIk9UXRX5Fa8suT5pWPAp0fk7VkQyAu9KCedahDlG4eJJKKMWTn2ojMVUX
 aYbRdHx50llHNroA/2Jz753FJ3AM0cTzApM6ZYJ7tEA8VUjInP9oW3PIFYzrke8RXFhr
 VD63Zp4RzF4DJDRvpc5XV/xBqroW8UUkACtXrlDFECBdU7vn11/Ouoy9AjAlVX9VVoIx
 hb7A==
X-Gm-Message-State: AOAM530Ztz0TOOqg/Zy37pHQQ7ZwJVYcR2EZprmPFcFEPZ5Nm8nkGAkc
 KCr/b/UlZ3JVYtuwtDm2r/hFaw==
X-Google-Smtp-Source: ABdhPJwvUKoZW6zKdmGgERvHcDncEYduLAC0b2YntCqNtzLoBZnREGEKrDhNeilGhp1QXgjPTSTzNw==
X-Received: by 2002:aa7:8149:0:b0:44c:916c:1fdb with SMTP id
 d9-20020aa78149000000b0044c916c1fdbmr22481157pfn.34.1635206447235; 
 Mon, 25 Oct 2021 17:00:47 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:46 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 01/34] component: Introduce struct aggregate_device
Date: Mon, 25 Oct 2021 17:00:11 -0700
Message-Id: <20211026000044.885195-2-swboyd@chromium.org>
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

Replace 'struct master' with 'struct aggregate_device' and then rename
'master' to 'adev' everywhere in the code. While we're here, put a
struct device inside the aggregate device so that we can register it
with a bus_type in the next patch.

The diff is large but that's because this is mostly a rename, where
sometimes 'master' is replaced with 'adev' and other times it is
replaced with 'parent' to indicate that the struct device that was being
used is actually the parent of the aggregate device and driver.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5e79299f6c3f..1c3c91ba7d2e 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -9,6 +9,7 @@
  */
 #include <linux/component.h>
 #include <linux/device.h>
+#include <linux/idr.h>
 #include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -64,7 +65,10 @@ struct master {
 
 	const struct component_master_ops *ops;
 	struct device *parent;
+	struct device dev;
 	struct component_match *match;
+
+	int id;
 };
 
 struct component {
@@ -80,6 +84,7 @@ struct component {
 static DEFINE_MUTEX(component_mutex);
 static LIST_HEAD(component_list);
 static LIST_HEAD(masters);
+static DEFINE_IDA(aggregate_ida);
 
 #ifdef CONFIG_DEBUG_FS
 
@@ -440,6 +445,7 @@ static void free_master(struct master *master)
 		}
 	}
 
+	ida_free(&aggregate_ida, master->id);
 	kfree(master);
 }
 
@@ -460,7 +466,7 @@ int component_master_add_with_match(struct device *parent,
 	struct component_match *match)
 {
 	struct master *master;
-	int ret;
+	int ret, id;
 
 	/* Reallocate the match array for its true size */
 	ret = component_match_realloc(match, match->num);
@@ -471,9 +477,17 @@ int component_master_add_with_match(struct device *parent,
 	if (!master)
 		return -ENOMEM;
 
+	id = ida_alloc(&aggregate_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(master);
+		return id;
+	}
+
+	master->id = id;
 	master->parent = parent;
 	master->ops = ops;
 	master->match = match;
+	dev_set_name(&master->dev, "aggregate%d", id);
 
 	component_master_debugfs_add(master);
 	/* Add to the list of available masters. */
-- 
https://chromeos.dev

