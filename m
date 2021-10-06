Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B04246DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 21:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6836EE24;
	Wed,  6 Oct 2021 19:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2472F6EE29
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 19:38:29 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id p1so3269150pfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 12:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSt66/qxaj+Yl6pIb1r8ArjDZRzSqERxTSL7e01cwWQ=;
 b=BmiI3LSyKjcVMkJ2gZd3LhPTHWfcmkydptEVQ9oiWWAFWzIe1MohWjx9bbawlzcH7q
 qetmyBf+RlGrk5ISWZRggAq3lthN3K/k4DISR3I5gMMLDXMXT8AzbWlWkmrgXro8h50I
 0A+4VMPnY2FjF4u4slYiTPHpdBdGgrCNY66dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSt66/qxaj+Yl6pIb1r8ArjDZRzSqERxTSL7e01cwWQ=;
 b=AVSUr5sKWF/JHmcx5JO5oRUy0ZlgZCbyuRIaozpS82g1+k71jWBmmhWBr8kADfXKiQ
 9sgJVDnX8aWZiPzeM0Sq7l2PSaxqeBpUfOE+zPVluuCTUb2Az+fI87b+mnumcyRiTV/5
 ZUgNuhADQMAZwPvB+XLIFbOLl6vXJcoEU4wq0DTzkc+yA44KmXmDo0mifyLLfTE+OpRy
 s+mOVJamlbOYnBWZ/UO40Dxvit1LI3cPlBvxsDBvIJluPiMNsKlvoLMYQ0lkeeE/D2a8
 1t0ISHDWPk2zSUgnB5k7/5GutuZ9bE/EO9M+CVIWdl+dBZSm1H86EJLitvF3WwpIpbZG
 /M2Q==
X-Gm-Message-State: AOAM533N3cqbUvrWbueX1MAt8K4xFozYxA7CYeKri9zKmJgGBWFeqAx/
 ZBBuLZUkeail6NF7w3H6XxzmRw==
X-Google-Smtp-Source: ABdhPJxNGoDafhlEh+0TsExPrHB7fqmUepOv8+MJYv9j+yZKMoyNAQ1lN9Vxlb31AxOrCCSdOAdpeg==
X-Received: by 2002:a63:5717:: with SMTP id l23mr443433pgb.87.1633549108801;
 Wed, 06 Oct 2021 12:38:28 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
 by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:38:28 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 05/34] component: Add {bind,
 unbind}_component() ops that take aggregate device
Date: Wed,  6 Oct 2021 12:37:50 -0700
Message-Id: <20211006193819.2654854-6-swboyd@chromium.org>
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

We'd like to get more device model features in the component framework
so let's pass the struct aggregate_device pointer instead of the parent
device pointer to the component binding functions. This will allow
drivers to inspect and control things related to the aggregate device in
case they need it, and they'll always be able to get back to the device
they were using before by using the 'parent' member of the aggregate
device struct.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 14 +++++++++++---
 include/linux/component.h | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index f49b48695c8f..a6dd33d0ddeb 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -707,8 +707,13 @@ static void component_unbind(struct component *component,
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
@@ -773,7 +778,10 @@ static int component_bind(struct component *component, struct aggregate_device *
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

