Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B2245D49
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B56F6E48C;
	Mon, 17 Aug 2020 07:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CA86E260
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 21:56:32 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v4so7887133ljd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 14:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O7qBXRGOJkpPjsWWIvuCbGocx96q/WvFO969Ya+/TD4=;
 b=i2geYsx8r78/23QAK4haMQCO4P3mUskznKeR7l8N8Ha3L0hNlNLHQGiI8/E8TK2oaQ
 ocED2HdkzeCiQf9qFIh62YqLgnWdHkUL0ofHLTOJLF5ysacLvA8nls6FgTBaPq7JGpiy
 skIQTg4Is6FW8/mfZaG7ollg1ZrPEj0c9HjmaMPMIxTg1bp62J/O4pGnRs3qy6PpWig4
 3WNXRnC02za6PrtLWCeiKOUKrqu3u1Bj7U4byOSijjgPZ9LrSB2pNMBwvo5iqEQn6B6p
 xZ32xFTM8tPsmkPoI16dzCWSWD7Z20Hl4r8yfwaW+tT28b8C25vvuh3TAD+ezEzjxRKv
 5EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7qBXRGOJkpPjsWWIvuCbGocx96q/WvFO969Ya+/TD4=;
 b=Ujw3nZeSyp+CLAk5AwvyALSYPBiuX/mgTIYZaNc+vc8iHawdw1BTo8dI4q+NXALZIW
 gvIrTKHtP6VmjKTS0KUpY5QeE/OfVGwQTqbCHr6lvl+jNigBsT1KeCxGwhsDcAuiW9pE
 YQrgxDUNHA4wnwie/9pww5DMI9DEkXVt/OM6xzsQyOecdHTUo2pdsUXPJvNVgCO7ExSs
 qNmGRPkNZrXfP65Xjg3uBQO2Cc2glK5T8RtToXGxC6EzcPCw1Owu65pFRi5LhdB1wwr9
 VC2JWw8tQOmll0Ro6ujGICRLfLGB8cHx4KtuHHXoUA5uO0+RYhO8e1XmgW/qukUuIwKe
 M+5w==
X-Gm-Message-State: AOAM533aE3KaSNMeMAGVbJusWBvGV316zDFKjcjJrHibUJzz9eEdxSz7
 t5jVYQxcbmHjpT7p6Vx0vZA=
X-Google-Smtp-Source: ABdhPJzI8Zb+3XIWnEMDQ/hzYFtXQxfOW8jntx5zXPHoaLem5kvIfWYygZGhvVKDuiPr/3qyzxHYDg==
X-Received: by 2002:a2e:9810:: with SMTP id a16mr2666614ljj.157.1597355790900; 
 Thu, 13 Aug 2020 14:56:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id z20sm1349977ljk.97.2020.08.13.14.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 14:56:30 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH RESEND v12 1/4] drm/panel: Add helper for reading DT rotation
Date: Fri, 14 Aug 2020 00:56:06 +0300
Message-Id: <20200813215609.28643-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813215609.28643-1-digetx@gmail.com>
References: <20200813215609.28643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Derek Basehore <dbasehore@chromium.org>
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
