Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBA389A7B
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 02:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDF26E4F1;
	Thu, 20 May 2021 00:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049F46E51A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 00:25:27 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id f22so9682529pgb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 17:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afln5pUep7CA8czW3eFHRb7wRCbIvQjwwa8m82gMfM0=;
 b=Og4P+TetlkXO7tfAm66hNWsLN74wmWjg3kkfyJV+tSR/ttbMTHQm0eDxhE8SnprsVf
 dstYES5iR47IqbziSmF6ufMokvaEscXuA8WyjNSlInlJHmSlOv51+amPZqJukSda+XGh
 +2UVkEZhujUS1GmCKdVNlKD9Auc1bKBTK0hCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afln5pUep7CA8czW3eFHRb7wRCbIvQjwwa8m82gMfM0=;
 b=pY2d3+T0Dw3XN0bzz5KWij6IbSFeVzltpQKfV7x22Q/FV5EzjzFzutoQiJVdk6FASA
 eMhybmesnScKZlSUoMLG60rXvgrxZh4DppED7TKTCWRk91j4NNqZGlyXjtXBFzU47X4+
 NVwojdxVh0mmzpDLgl42VuSMqoa87RwZN8Ph1cs92Pgc8TBkSzkGTtW/TtzVwA+SBjDw
 yBENNWXZciVNT+gprT3Bghh60AFL/otAzgwsVCUy8IteOank7VdCPpdreJv70p4Fs+39
 KEhpyTRrZwDX5eEyj+4YU09CsLd55ajcQhu6KzFTNTf1FeqvuCitS+sSu7mWzFQkzSbv
 Z3pg==
X-Gm-Message-State: AOAM530Xo0YVnkW+YM169x6an0AXraom01yNjMDWLibPW9K9uBq27oMc
 GxXB1LXTvf/o3D2w0cuQUlkJZA==
X-Google-Smtp-Source: ABdhPJxMIw6gfwmdrSEYl9rPWq6HfeJoGPcR/9JwGCJSwRoBSJlKwXs5YL29BzrifP4aXHKfO5Vbbg==
X-Received: by 2002:a05:6a00:14d1:b029:2dd:4fff:204 with SMTP id
 w17-20020a056a0014d1b02902dd4fff0204mr1678617pfu.46.1621470326581; 
 Wed, 19 May 2021 17:25:26 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
 by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:25:26 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5/7] component: Use dev.parent instead of adev->parent
Date: Wed, 19 May 2021 17:25:17 -0700
Message-Id: <20210520002519.3538432-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
References: <20210520002519.3538432-1-swboyd@chromium.org>
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

We left this in place to ease the code diff, but now we can remove it
because the aggregate device parent pointer is the same.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index a6c0bb7ccdbc..155aab7eefa6 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -64,7 +64,6 @@ struct component_match {
 
 struct aggregate_device {
 	const struct component_master_ops *ops;
-	struct device *parent;
 	struct device dev;
 	struct component_match *match;
 
@@ -105,7 +104,7 @@ static int component_devices_show(struct seq_file *s, void *data)
 	seq_printf(s, "%-40s %20s\n", "aggregate_device name", "status");
 	seq_puts(s, "-------------------------------------------------------------\n");
 	seq_printf(s, "%-40s %20s\n\n",
-		   dev_name(m->parent), m->dev.driver ? "bound" : "not bound");
+		   dev_name(m->dev.parent), m->dev.driver ? "bound" : "not bound");
 
 	seq_printf(s, "%-40s %20s\n", "device name", "status");
 	seq_puts(s, "-------------------------------------------------------------\n");
@@ -134,13 +133,13 @@ core_initcall(component_debug_init);
 
 static void component_master_debugfs_add(struct aggregate_device *m)
 {
-	debugfs_create_file(dev_name(m->parent), 0444, component_debugfs_dir, m,
+	debugfs_create_file(dev_name(m->dev.parent), 0444, component_debugfs_dir, m,
 			    &component_devices_fops);
 }
 
 static void component_master_debugfs_del(struct aggregate_device *m)
 {
-	debugfs_remove(debugfs_lookup(dev_name(m->parent), component_debugfs_dir));
+	debugfs_remove(debugfs_lookup(dev_name(m->dev.parent), component_debugfs_dir));
 }
 
 #else
@@ -203,7 +202,7 @@ static int find_components(struct aggregate_device *adev)
 		struct component_match_array *mc = &match->compare[i];
 		struct component *c;
 
-		dev_dbg(adev->parent, "Looking for component %zu\n", i);
+		dev_dbg(adev->dev.parent, "Looking for component %zu\n", i);
 
 		if (match->compare[i].component)
 			continue;
@@ -212,7 +211,7 @@ static int find_components(struct aggregate_device *adev)
 		if (!c)
 			return 0;
 
-		dev_dbg(adev->parent, "found component %s, duplicate %u\n",
+		dev_dbg(adev->dev.parent, "found component %s, duplicate %u\n",
 			dev_name(c->dev), !!c->adev);
 
 		/* Attach this component to the adev */
@@ -420,12 +419,12 @@ static int aggregate_device_match(struct device *dev, struct device_driver *drv)
 /* TODO: Remove once all aggregate drivers use component_aggregate_register() */
 static int component_probe_bind(struct aggregate_device *adev)
 {
-	return adev->ops->bind(adev->parent);
+	return adev->ops->bind(adev->dev.parent);
 }
 
 static void component_remove_unbind(struct aggregate_device *adev)
 {
-	adev->ops->unbind(adev->parent);
+	adev->ops->unbind(adev->dev.parent);
 }
 
 static int aggregate_driver_probe(struct device *dev)
@@ -443,7 +442,7 @@ static int aggregate_driver_probe(struct device *dev)
 	}
 
 	mutex_lock(&component_mutex);
-	if (devres_open_group(adev->parent, NULL, GFP_KERNEL)) {
+	if (devres_open_group(adev->dev.parent, NULL, GFP_KERNEL)) {
 		ret = adrv->probe(adev);
 		if (ret)
 			devres_release_group(dev->parent, NULL);
@@ -549,8 +548,6 @@ static struct aggregate_device *aggregate_device_add(struct device *parent,
 	}
 
 	adev->id = id;
-	adev->parent = parent;
-
 	adev->dev.parent = parent;
 	adev->dev.bus = &aggregate_bus_type;
 	adev->dev.release = aggregate_device_release;
@@ -709,7 +706,7 @@ static void component_unbind(struct component *component,
 	WARN_ON(!component->bound);
 
 	if (component->ops && component->ops->unbind)
-		component->ops->unbind(component->dev, adev->parent, data);
+		component->ops->unbind(component->dev, adev->dev.parent, data);
 	component->bound = false;
 
 	/* Release all resources claimed in the binding of this component */
@@ -758,7 +755,7 @@ static int component_bind(struct component *component, struct aggregate_device *
 	 * This allows us to roll-back a failed component without
 	 * affecting anything else.
 	 */
-	if (!devres_open_group(adev->parent, NULL, GFP_KERNEL))
+	if (!devres_open_group(adev->dev.parent, NULL, GFP_KERNEL))
 		return -ENOMEM;
 
 	/*
@@ -767,14 +764,14 @@ static int component_bind(struct component *component, struct aggregate_device *
 	 * at the appropriate moment.
 	 */
 	if (!devres_open_group(component->dev, component, GFP_KERNEL)) {
-		devres_release_group(adev->parent, NULL);
+		devres_release_group(adev->dev.parent, NULL);
 		return -ENOMEM;
 	}
 
-	dev_dbg(adev->parent, "binding %s (ops %ps)\n",
+	dev_dbg(adev->dev.parent, "binding %s (ops %ps)\n",
 		dev_name(component->dev), component->ops);
 
-	ret = component->ops->bind(component->dev, adev->parent, data);
+	ret = component->ops->bind(component->dev, adev->dev.parent, data);
 	if (!ret) {
 		component->bound = true;
 
@@ -785,16 +782,16 @@ static int component_bind(struct component *component, struct aggregate_device *
 		 * can clean those resources up independently.
 		 */
 		devres_close_group(component->dev, NULL);
-		devres_remove_group(adev->parent, NULL);
+		devres_remove_group(adev->dev.parent, NULL);
 
-		dev_info(adev->parent, "bound %s (ops %ps)\n",
+		dev_info(adev->dev.parent, "bound %s (ops %ps)\n",
 			 dev_name(component->dev), component->ops);
 	} else {
 		devres_release_group(component->dev, NULL);
-		devres_release_group(adev->parent, NULL);
+		devres_release_group(adev->dev.parent, NULL);
 
 		if (ret != -EPROBE_DEFER)
-			dev_err(adev->parent, "failed to bind %s (ops %ps): %d\n",
+			dev_err(adev->dev.parent, "failed to bind %s (ops %ps): %d\n",
 				dev_name(component->dev), component->ops, ret);
 	}
 
-- 
https://chromeos.dev

