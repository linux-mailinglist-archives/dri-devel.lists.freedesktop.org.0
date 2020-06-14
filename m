Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079EA1F8FB4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF546E2CD;
	Mon, 15 Jun 2020 07:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1696289EF7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 20:01:45 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u16so8284470lfl.8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 13:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vWfY4zIihMKIqVQsNJvI1F9WXeF9VfCOeT2znS/jkBE=;
 b=I92A6vFvYRmXFMFlLXE0dvrv2v1ZT86Q6B8yuD0d7W4+I6+lG5BtRpx6yMHvP2zWn3
 IQbQGP515wItCFw3PVnxaY1z9uIJzgi7PUq+BWx9EYmjRYDt5p0orxHCIFkVeRNrvrEF
 ZIaYIfF56FpyWmNBYPnZ9S9FiLM/Mlcgjsi04F2cg3tgBgRxufrcQY0RZRzSa/r42PrP
 NLV6ySPjIytaou8FXRmy0Vl/vANztw1x0K3DdpGSXZ6pw4zp3OAu/xGGScXn5iO5tIUu
 G9Ja2WdsdbPJq2HRB4tKmJUNpH02hqRDNkxkpovZ+PxLRYaHcO0wvCANcu2+emhGmj1j
 5XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vWfY4zIihMKIqVQsNJvI1F9WXeF9VfCOeT2znS/jkBE=;
 b=f61Y8PjhvqltuXy4gzwV/7dnR2+En/1McIB23+5uU9BaeZPG3nTF9XXsLcmJYw+vRb
 8xNF6UbEf8aDO0YTAP7PJm6Z89Mz5G2wx9lGlf8AQn2fjhO304bwIUCqAALlyxZO5x3J
 /miyC3gRo3oMocgk/syD1eulP8CaOykWI4zfSQLNaJXIvP6GRzHxv1Js84FxtWOIWc9x
 hXpzgG0BnxsY1b8wAh3arPdBCvUBSdSq5XLbZ61QWmvxeE8a9J/vVeJjxNeLUlZ+Pgr5
 F17qRM5B03GnsJtwRuFkd5FLyDjKQeryFScmdK1Ar+EznEhlVH787MOi6MZbXgtp2NeJ
 aPWg==
X-Gm-Message-State: AOAM533OeBWnRFoQQeF+Ked7yN8pX6lRCjZc/mdQ3Jh754HQe/X3ZnzO
 zjZVAhdwgsM06pOHwOVMIhI=
X-Google-Smtp-Source: ABdhPJyquOv0rIens15YMdI/BhmzeC2GXeZ/2F8wC+6/DIjUEi9FTzACjRXR4/AQ7tL3D0TaQsUlCA==
X-Received: by 2002:a19:8389:: with SMTP id f131mr487597lfd.16.1592164903554; 
 Sun, 14 Jun 2020 13:01:43 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id 144sm1422105lfm.87.2020.06.14.13.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 13:01:42 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v2 2/5] drm/panel: lvds: Set up panel orientation
Date: Sun, 14 Jun 2020 23:01:18 +0300
Message-Id: <20200614200121.14147-3-digetx@gmail.com>
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

The panel orientation needs to parsed from a device-tree and assigned to
the panel's connector in order to make orientation property available to
userspace. That's what this patch does for the generic LVDS panel.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 5ce3f4a2b7a1..333d21cee5f6 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -37,6 +37,8 @@ struct panel_lvds {
 
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
+
+	enum drm_panel_orientation orientation;
 };
 
 static inline struct panel_lvds *to_panel_lvds(struct drm_panel *panel)
@@ -99,6 +101,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = lvds->data_mirror
 					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
 					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
@@ -223,6 +226,11 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	drm_panel_init(&lvds->panel, lvds->dev, &panel_lvds_funcs,
 		       DRM_MODE_CONNECTOR_LVDS);
 
+	ret = of_drm_get_panel_orientation(lvds->dev->of_node,
+					   &lvds->orientation);
+	if (ret)
+		return ret;
+
 	ret = drm_panel_of_backlight(&lvds->panel);
 	if (ret)
 		return ret;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
