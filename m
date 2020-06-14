Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6171F8FC7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32696E2CC;
	Mon, 15 Jun 2020 07:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B0D89ED3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 20:01:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id o4so642329lfi.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 13:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=//s7SgUTdZk+8R0ozrOfOf203NYUFv49iTLgW3uAUIg=;
 b=p8FlROeIHMU+80XLsAsY3zFZqSiEq7oaT2fgY3JL8e//OFfrvoGekDl4kI3JmydCIZ
 CpYcdY44klOGtGOluYcC/Zvope3pfNNDWyAIe7KM4swQYNeaKEZ1zb4Mm8tTbNhocus+
 PJMZfrqLJKnhQMUJl/0iyeFLNCJDCGnp8qTMHf7x4R1W34Kp+Bzs0qpNehklXR7fms1V
 L5clzZYyZE8+87NGdo9JL+Yaam8lvssz5FskCZ/LMRqShGIFpTzu6HgiXnlnEUSWV6tL
 fLy0zG3S7QKUZ6yMxIoFHzOOpfaj5QyqX+iGmk4m31zncYElQLlMrWjjHMcZhBcrOtQ2
 FpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=//s7SgUTdZk+8R0ozrOfOf203NYUFv49iTLgW3uAUIg=;
 b=hWviB26LV0gWTXDfhRlsMRSJWaJ0F3/6LYKKdvi4ASxpmKk0IXuCELpLE4rsrjTWDH
 dgSKyCSWkjyE8RA1P1HUpDLL7oKggCV+dlrqjyofdaAUqakyrh7gB96xH8AWrxjfOEHf
 iOcXeK/J0RmLTQU7j2QI8A0OfCqlRbF1mdVLCTRCvpE0WwhYork7ypDYasF5zeNXoj6D
 1QT4WBeLWLtblsYPY+tyUZJ6ucKplZyxSt5/hJvRK6TtNFPn29XHMoP98D4Lt9VYAYji
 E34gZilF0E084j5aEkGipEhZOn/2ExKsvW4eTJB1rL2cP9NKuKBlHSZ9ghkuw8j/x7Z0
 beTQ==
X-Gm-Message-State: AOAM532Zy9ZuxiYBW7/zfTS8PBPcauJsMPC7muAVhgVrcPFrHTAsfYdg
 WtG+WOGxXTGTym+v3RMy3sk=
X-Google-Smtp-Source: ABdhPJzDUXrvTGWJPXT1RIij9O/dOiKRpxwRH+3PWIhrxfAWUuI7IRJJLtpJO2GCLBjc+jxQlKu/6w==
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr3556664lfa.60.1592164902463; 
 Sun, 14 Jun 2020 13:01:42 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id 144sm1422105lfm.87.2020.06.14.13.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 13:01:41 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v2 1/5] drm/panel: Add helper for reading DT rotation
Date: Sun, 14 Jun 2020 23:01:17 +0300
Message-Id: <20200614200121.14147-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614200121.14147-1-digetx@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Derek Basehore <dbasehore@chromium.org>

This adds a helper function for reading the rotation (panel
orientation) from the device tree.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_panel.c | 43 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_panel.h     |  9 ++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 8c7bac85a793..5557c75301f1 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -300,6 +300,49 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 	return ERR_PTR(-EPROBE_DEFER);
 }
 EXPORT_SYMBOL(of_drm_find_panel);
+
+/**
+ * of_drm_get_panel_orientation - look up the orientation of the panel through
+ * the "rotation" binding from a device tree node
+ * @np: device tree node of the panel
+ * @orientation: orientation enum to be filled in
+ *
+ * Looks up the rotation of a panel in the device tree. The orientation of the
+ * panel is expressed as a property name "rotation" in the device tree. The
+ * rotation in the device tree is counter clockwise.
+ *
+ * Return: 0 when a valid rotation value (0, 90, 180, or 270) is read or the
+ * rotation property doesn't exist. -EERROR otherwise.
+ */
+int of_drm_get_panel_orientation(const struct device_node *np,
+				 enum drm_panel_orientation *orientation)
+{
+	int rotation, ret;
+
+	ret = of_property_read_u32(np, "rotation", &rotation);
+	if (ret == -EINVAL) {
+		/* Don't return an error if there's no rotation property. */
+		*orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+		return 0;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (rotation == 0)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	else if (rotation == 90)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+	else if (rotation == 180)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+	else if (rotation == 270)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
 #if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 6193cb555acc..781c735f0f9b 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -35,6 +35,8 @@ struct drm_device;
 struct drm_panel;
 struct display_timing;
 
+enum drm_panel_orientation;
+
 /**
  * struct drm_panel_funcs - perform operations on a given panel
  *
@@ -191,11 +193,18 @@ int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector
 
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
 struct drm_panel *of_drm_find_panel(const struct device_node *np);
+int of_drm_get_panel_orientation(const struct device_node *np,
+				 enum drm_panel_orientation *orientation);
 #else
 static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
 {
 	return ERR_PTR(-ENODEV);
 }
+static inline int of_drm_get_panel_orientation(const struct device_node *np,
+		enum drm_panel_orientation *orientation)
+{
+	return -ENODEV;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_PANEL) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
