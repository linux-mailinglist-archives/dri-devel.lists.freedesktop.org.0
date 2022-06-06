Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0F53E562
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4D21122F0;
	Mon,  6 Jun 2022 15:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687C61122F0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:24:41 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id f9so1912591plg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LOT6rcj75BLu5PAhhZSBrZhENYGfSEJ9VcTy2ymZ8A=;
 b=WEtPtsSlp7epK+M3w4yaaaGS/p+B2+4rpNHJeUsP9pApwkHOD6/CvyYeaubs73Yt/w
 oPoFAMzIMC++OPvNhqyBh/HoAvv2qP66rFYT0/uEsedGJhm18S6d890znFvx8vGNsOEa
 vHBGRFLbv9y2nkty8mKnNyBjq9KlWxKnFuADI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LOT6rcj75BLu5PAhhZSBrZhENYGfSEJ9VcTy2ymZ8A=;
 b=J97nnJbBTndsGqNCuM48qfH/OqktBA377lplvy0ZarqguM5YO3kOf62NPYezjpA5q4
 oNYTJZcbZRatMoLmuiM8cxroifyilKcjw3hT72jrkmHJuHfgtgYrsa9ONU51zNIPYihN
 y29PJsJ1K3FHe43yXzbnOJcgUDgdw0wtIy+ZwTL51GXdI7g3kDTbbqrZxhxu1KSCJs5e
 OBT1Bj9atrKDSddNb1S+/7OB5Df/7MZLd07Ncg1BUaYQGetdOWdy4lUbVweGkrDHA303
 PR3r0W3TqNd/UMq+DkPLLsax93UAiFz44Ayn5adUPqdG6dSH8UXRsQYHuKsWv8GSNJ1j
 6/WQ==
X-Gm-Message-State: AOAM531qFxPr5rFttncDeYp+OnD+uNEx0+tUm0ZaVS5yOC1VxXD3pTIf
 JSNaqvaId7clKLZ9Gx5+nDXZ/A==
X-Google-Smtp-Source: ABdhPJy7JvLDYfxz5F4Nt8K+TVZ3FjEYm4tRpfxZ1sLiT7du/kp/1NB5fmpP5Q6LvbYZVHw35nx5Nw==
X-Received: by 2002:a17:902:d50b:b0:165:2aa0:4b22 with SMTP id
 b11-20020a170902d50b00b001652aa04b22mr24685964plg.131.1654529080928; 
 Mon, 06 Jun 2022 08:24:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0a:5e4:e24:c8c4]) by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 08:24:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation() to
 return panel orientation
Date: Mon,  6 Jun 2022 23:24:24 +0800
Message-Id: <20220606152431.1889185-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN().

The orientation property is known earlier. For example, some panels
parse the property through device tree during probe.

Add an API to return the property from panel to drm/kms driver, so the
drivers are able to call drm_connector_set_panel_orientation() before
drm_dev_register().

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v3->v4: Add a blank line.
---
 drivers/gpu/drm/drm_panel.c |  9 +++++++++
 include/drm/drm_panel.h     | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..e12056cfeca8 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
+enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->get_orientation)
+		return panel->funcs->get_orientation(panel);
+
+	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+}
+EXPORT_SYMBOL(drm_panel_get_orientation);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_panel - look up a panel using a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index d279ee455f01..5dadbf3b0370 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -133,6 +133,15 @@ struct drm_panel_funcs {
 	 * Allows panels to create panels-specific debugfs files.
 	 */
 	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
+
+	/**
+	 * @get_orientation:
+	 *
+	 * Return the panel orientation set by device tree or EDID.
+	 *
+	 * This function is optional.
+	 */
+	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
 };
 
 /**
@@ -202,6 +211,7 @@ int drm_panel_enable(struct drm_panel *panel);
 int drm_panel_disable(struct drm_panel *panel);
 
 int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
+enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel);
 
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
 struct drm_panel *of_drm_find_panel(const struct device_node *np);
-- 
2.36.1.255.ge46751e96f-goog

