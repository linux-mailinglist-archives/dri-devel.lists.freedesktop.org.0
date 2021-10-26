Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0878143A8A7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD376E190;
	Tue, 26 Oct 2021 00:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7BA6E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:00:51 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id l186so5843799pge.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nyCvsKt5+Vg32VhSvS6UqrlYOzSvHpna9uhIikJbGlY=;
 b=ELI/xc9tsfUf5fr+ncUE1iTWXYgL9wN1B/iAw0x8RTP+cUC6wIoHOVfIaIFGEXaSZb
 +kL2JmE3M315dNsVvJDrzLpV5w5TJbA2xxHQpsgJFQxq+s3VEh6nJuh/RKu05HSOBjgm
 RFnkiS7RdhrqKvrmNed4oXt8kVMItRLUtv9WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nyCvsKt5+Vg32VhSvS6UqrlYOzSvHpna9uhIikJbGlY=;
 b=2UUmLWAu5SqJ6Fb8/h9Ml/0saYfA7MEFN2DeRNNqDtOXxNLsQBiB460yFvmA3gVcLv
 U9XQk+/6GhSGCbLXWYoGOY6z+MfOeE7WrwZ45VXhrB9dSKn/tsYuf9Pi3nGDrbHqQfXa
 bhyWs+LoH2tiIYb39PvaRBnSFTs7bdf7FpE+8BKB5b0kkJENWvxVqUMpNFiGAQ24h5qD
 FQ5aYm0oNQENGESI3cPxhU8wbLt1jb0VP97ifygF9VovBjaZK+Dhw24et8Ki4TtRGwnA
 3ln0cxXTqnxanGmGR+BGBJwwFnCh+cirrDzk7UY5LZ8cC1L0TX2Cw0aWLhhOkidud5Sp
 7x+Q==
X-Gm-Message-State: AOAM533hYvY+nRcPmdPoCfuZXUG1QdgSeGMFeWcJCKjVjrsr2lMkH/li
 J6inNCa/hlOVHxcFJm2gx5QF/w==
X-Google-Smtp-Source: ABdhPJxxWAJ1TnvFsOCtLkbloK5cC5/gmyT9bei2QcgtaXrJKPnE5W7zyCnnzehuXKBJIqgM2vw1SA==
X-Received: by 2002:a63:6901:: with SMTP id e1mr16110874pgc.320.1635206451092; 
 Mon, 25 Oct 2021 17:00:51 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:00:50 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 05/34] component: Add {bind,
 unbind}_component() ops that take aggregate device
Date: Mon, 25 Oct 2021 17:00:15 -0700
Message-Id: <20211026000044.885195-6-swboyd@chromium.org>
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

We'd like to get more device model features in the component framework
so let's pass the struct aggregate_device pointer instead of the parent
device pointer to the component binding functions. This will allow
drivers to inspect and control things related to the aggregate device in
case they need it, and they'll always be able to get back to the device
they were using before by using the 'parent' member of the aggregate
device struct.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 14 +++++++++++---
 include/linux/component.h | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 997b17053ecf..cbf2d4cc0794 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -699,8 +699,13 @@ static void component_unbind(struct component *component,
 {
 	WARN_ON(!component->bound);
 
-	if (component->ops && component->ops->unbind)
-		component->ops->unbind(component->dev, adev->parent, data);
+	if (component->ops) {
+		if (component->ops->unbind)
+			component->ops->unbind(component->dev, adev->parent, data);
+		else if (component->ops->unbind_component)
+			component->ops->unbind_component(component->dev, adev, data);
+	}
+
 	component->bound = false;
 
 	/* Release all resources claimed in the binding of this component */
@@ -765,7 +770,10 @@ static int component_bind(struct component *component, struct aggregate_device *
 	dev_dbg(adev->parent, "binding %s (ops %ps)\n",
 		dev_name(component->dev), component->ops);
 
-	ret = component->ops->bind(component->dev, adev->parent, data);
+	if (component->ops->bind_component)
+		ret = component->ops->bind_component(component->dev, adev, data);
+	else
+		ret = component->ops->bind(component->dev, adev->parent, data);
 	if (!ret) {
 		component->bound = true;
 
diff --git a/include/linux/component.h b/include/linux/component.h
index e99cf8e910f0..d8dcbf9733da 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 
 struct component_match;
+struct aggregate_device;
 
 /**
  * struct component_ops - callbacks for component drivers
@@ -19,18 +20,39 @@ struct component_ops {
 	 *
 	 * Called through component_bind_all() when the aggregate driver is
 	 * ready to bind the overall driver.
+	 *
+	 * Deprecated: Use bind_component() instead.
 	 */
 	int (*bind)(struct device *comp, struct device *master,
 		    void *master_data);
+	/**
+	 * @bind_component:
+	 *
+	 * Called through component_bind_all() when the aggregate driver is
+	 * ready to bind the overall driver.
+	 */
+	int (*bind_component)(struct device *comp, struct aggregate_device *adev,
+			      void *aggregate_data);
 	/**
 	 * @unbind:
 	 *
 	 * Called through component_unbind_all() when the aggregate driver is
 	 * ready to bind the overall driver, or when component_bind_all() fails
 	 * part-ways through and needs to unbind some already bound components.
+	 *
+	 * Deprecated: Use unbind_component() instead.
 	 */
 	void (*unbind)(struct device *comp, struct device *master,
 		       void *master_data);
+	/**
+	 * @unbind_component:
+	 *
+	 * Called through component_unbind_all() when the aggregate driver is
+	 * ready to unbind the overall driver, or when component_bind_all() fails
+	 * part-ways through and needs to unbind some already bound components.
+	 */
+	int (*unbind_component)(struct device *comp, struct aggregate_device *adev,
+				void *aggregate_data);
 };
 
 int component_add(struct device *, const struct component_ops *);
-- 
https://chromeos.dev

