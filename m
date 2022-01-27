Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80A49EBB2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CDF10E2D3;
	Thu, 27 Jan 2022 20:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944FD10E1C3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:01:59 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id c9so3659732plg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mnLXiJbCUaC6XTZzeAM0x5jkp+ZwTQGnS1QkwL8Pb08=;
 b=lWqllZqrDcVmSKuLBzM5NetfRm+wmp9lMVdzziEYwXfKf4DloUdfa+Hdk0K+m5nRv5
 08JmDvKm12bU1zd+uSV5KyJxyXHDBz0ytGNa5+M+uSId9nA4tL0CF53rTjg3W9Pgts8F
 CKDmILXBrnN/1i89gLb87AXvEofiPkb6aj2jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mnLXiJbCUaC6XTZzeAM0x5jkp+ZwTQGnS1QkwL8Pb08=;
 b=CXdZPWcfySxzODycs0En/3uwlEzt2HvC6XYCxwM/dQtXa2yPkH/5EBVd0cChTYxWnu
 HEQ4SJpa1tiOsZo0wEs+fe2OksFyzgl/msO2bQFl1cFGPUbb8EruydSqqEmTrzGKhKIH
 RC431gbxSMp4JgM0wh/0r58G0VJ6A/SVCs08FwAeE5KbF4ypsAZ5GKm3k+8XwHBp2qfO
 NrjQD5ryRoKHtPlmhpDvzGCv3vNODxKKmDc58DygSZecfB5Iv3mkGiTnCygSSOTaz29m
 jzeXv7+N+Gd6VgWVsH/cLAva9H9RM8WoeV6ibOIC6ZDBXYirc6pyVGpZLRzCYm0loyT2
 eBVg==
X-Gm-Message-State: AOAM531F3R9kFW+POrW6XpIJRcCllTlcPx2uHiQb/jLiBcKxkxuAJzeQ
 X9/vmQamPNluUGK3917CqClQsA==
X-Google-Smtp-Source: ABdhPJwELBm2hJJkKCHCGDWi0uz0RH9y0pifltZnK5CSGFtfaIxRrrrZ6UAYfSEjLNlhVwuFfkr4HQ==
X-Received: by 2002:a17:90b:3b46:: with SMTP id
 ot6mr9864097pjb.179.1643313719206; 
 Thu, 27 Jan 2022 12:01:59 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:01:58 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 04/35] component: Add {bind,
 unbind}_component() ops that take aggregate device
Date: Thu, 27 Jan 2022 12:01:10 -0800
Message-Id: <20220127200141.1295328-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
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
 include/linux/component.h | 23 ++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 13ac2004a913..5b91a114786d 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -735,8 +735,13 @@ static void component_unbind(struct component *component,
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
@@ -801,7 +806,10 @@ static int component_bind(struct component *component, struct aggregate_device *
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
index c39dea7824af..073cbe9fea32 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -6,6 +6,7 @@
 #include <linux/device/driver.h>
 #include <linux/refcount.h>
 
+struct aggregate_device;
 struct device;
 
 /**
@@ -20,18 +21,39 @@ struct component_ops {
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
@@ -42,7 +64,6 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *parent, void *data);
 void component_unbind_all(struct device *parent, void *data);
 
-struct aggregate_device;
 struct device *aggregate_device_parent(const struct aggregate_device *adev);
 
 /**
-- 
https://chromeos.dev

