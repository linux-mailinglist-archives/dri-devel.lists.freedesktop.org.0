Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF6C6A4810
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 18:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F05A10E1CB;
	Mon, 27 Feb 2023 17:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1921E10E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:33:02 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso2916073pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/lQxEf2TtHUNWLWo3NazK/gJXKzS8+QxqszMeM4eHg=;
 b=SljLYax88JRFlAq7jh76tJzoQUy3YJdcchQ2w2pP89+EK9FOO/0eLn5M8g/DPB2UWq
 wlpv09NmzvTh88SMfYvl+IXDqU+TrNpZ+Hq+1cG1yFizPwkEwUOVqDXr/41ZCT/7bvbM
 L1lhCrVC9+whVMZU93SqypA4bN5smowSF1wDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/lQxEf2TtHUNWLWo3NazK/gJXKzS8+QxqszMeM4eHg=;
 b=pAX26rC4KDwdnLq6vjGtxY5/nrjQNN1YK5Fj5UB5CjcfqNeObTMLxdlDrUJy3A4GYC
 TgE+eCSAW25DF8UjUyuvp40u390Oq8IXql/5Td70LJxfwf7f60hHO/AEpy8BUvqL9qLK
 Do6HwG/qMYBXBAQAYSf+IEY/tRjETko+nCLKgju0/nbY0RNKH0lQWeCIlKPMNpdPclb2
 klw3cTYRXHnEwG80hub4ONplGtY1JI48HjpRQz1q3Uo3Yaezrvm0OsCRaqxlsbaMAgMK
 wHWUWqQLsSDfDKO4cZdBUsHMlWnHBN441Jhvm7lBO7LrNysLzPscwXGez2gSyFOouQ6s
 izNg==
X-Gm-Message-State: AO0yUKXr1UCAgUW0dCcYl0TrNkgWqI9SasFd7i14xAVdUBEsMxcJHXmq
 xAMzzMidr5RncH3ODhUwSrTOlg==
X-Google-Smtp-Source: AK7set8ZFzgn6DEfqVXbC9Ew/4cbHbnSxpcIwRbwbgyYJjkkDPKoiBYh3UY5Vc8lp80jYQMvNCZSRA==
X-Received: by 2002:a17:90b:3890:b0:233:f990:d646 with SMTP id
 mu16-20020a17090b389000b00233f990d646mr26900495pjb.35.1677519181209; 
 Mon, 27 Feb 2023 09:33:01 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a1ce:9be1:7461:c30:b70a])
 by smtp.gmail.com with ESMTPSA id
 a63-20020a639042000000b004fbb48e3e5csm4308881pge.77.2023.02.27.09.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:33:00 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v14 2/3] drm: bridge: panel: Add drmm_panel_bridge_add_nodrm
Date: Mon, 27 Feb 2023 23:02:30 +0530
Message-Id: <20230227173231.950107-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227173231.950107-1-jagan@amarulasolutions.com>
References: <20230227173231.950107-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drmm_panel_bridge_add_nodrm is an another type of DRM-managed action
helper with nodrm pointer.

DRM pointer is required to perform DRM-managed action,
- The conventional component-based drm bridges, the DRM pointer can
  access in component ops bind API.
- The non-component-based bridges (like host DSI bridges), the DRM
  pointer can access only when a specific bridge has been found
  via bridge->dev.

This drmm_panel_bridge_add_nodrm helper exclusively for the
non-component-based bridges.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v14:
- new patch

 drivers/gpu/drm/bridge/panel.c | 48 ++++++++++++++++++++++++++++------
 include/drm/drm_bridge.h       |  1 +
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index e8aae3cdc73d..d235a3843fcb 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -378,6 +378,22 @@ static void drmm_drm_panel_bridge_release(struct drm_device *drm, void *ptr)
 	drm_panel_bridge_remove(bridge);
 }
 
+static struct drm_bridge *
+drmm_panel_bridge_add_action(struct drm_device *drm, struct drm_panel *panel,
+			     struct drm_bridge *bridge)
+{
+	int ret;
+
+	ret = drmm_add_action_or_reset(drm, drmm_drm_panel_bridge_release,
+				       bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	bridge->pre_enable_prev_first = panel->prepare_prev_first;
+
+	return bridge;
+}
+
 /**
  * drmm_panel_bridge_add - Creates a DRM-managed &drm_bridge and
  *                         &drm_connector that just calls the
@@ -394,22 +410,38 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 					 struct drm_panel *panel)
 {
 	struct drm_bridge *bridge;
-	int ret;
 
 	bridge = drm_panel_bridge_add_typed(panel, panel->connector_type);
 	if (IS_ERR(bridge))
 		return bridge;
 
-	ret = drmm_add_action_or_reset(drm, drmm_drm_panel_bridge_release,
-				       bridge);
-	if (ret)
-		return ERR_PTR(ret);
+	return drmm_panel_bridge_add_action(drm, panel, bridge);
+}
+EXPORT_SYMBOL(drmm_panel_bridge_add);
 
-	bridge->pre_enable_prev_first = panel->prepare_prev_first;
+/**
+ * drmm_panel_bridge_add_nodrm - Creates a DRM-managed &drm_bridge and
+ *				 &drm_connector that just calls the
+ *				 appropriate functions from &drm_panel
+ *				 with no @dev.
+ *
+ * @panel: The drm_panel being wrapped.  Must be non-NULL.
+ *
+ * This is the DRM-managed version of drm_panel_bridge_add() which
+ * automatically calls drm_panel_bridge_remove() when @dev is cleaned
+ * up.
+ */
+struct drm_bridge *drmm_panel_bridge_add_nodrm(struct drm_panel *panel)
+{
+	struct drm_bridge *bridge;
 
-	return bridge;
+	bridge = drm_panel_bridge_add_typed(panel, panel->connector_type);
+	if (IS_ERR(bridge))
+		return bridge;
+
+	return drmm_panel_bridge_add_action(bridge->dev, panel, bridge);
 }
-EXPORT_SYMBOL(drmm_panel_bridge_add);
+EXPORT_SYMBOL(drmm_panel_bridge_add_nodrm);
 
 /**
  * drm_panel_bridge_connector - return the connector for the panel bridge
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 42f86327b40a..acc118bab758 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -912,6 +912,7 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   u32 connector_type);
 struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 					     struct drm_panel *panel);
+struct drm_bridge *drmm_panel_bridge_add_nodrm(struct drm_panel *panel);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
 #else
 static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
-- 
2.25.1

