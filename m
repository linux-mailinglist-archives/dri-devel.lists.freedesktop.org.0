Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA04539F22
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582AD10EEC6;
	Wed,  1 Jun 2022 08:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC69A10EDC0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:35 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id s68so1211675pgs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J6otup5wwDiJiR5+96KYND5483KtpYkBAJdtKoJuyjw=;
 b=BGAvSYU9vjZTkpLSJ7omYSCLkD5rwGC1Zrhe14tzTJ6mJD+IIaL5fUI5zVIvCYI+5u
 O3f/OGU3hXmiYGCIGDMvonGidLU3nu4HPEq+CqlZbJgIDMOLjCYmDLKBo5HvLSpDqxVe
 H1KJgITqR080yv/vNhZy4x0gJZsaELlx3YRkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6otup5wwDiJiR5+96KYND5483KtpYkBAJdtKoJuyjw=;
 b=AzRmfjpxqsj2SePIZU8Yfu61cQN44WBnJNFws08oOxLRnr+Vt2+6IC3vYLZ5Ju49Fu
 3P/KCQ1UFQRQDBpG1ua1tutIYkkKFdC4zTAol8q6yPn17JYMK1cX+glPCsJeqEG6tPGL
 ayiwuI9WexjoyyAO8GhZRTmOt9OEOxu6+ap/qtY8jAEsHUTbwX0tWKJ2sA4+YAOvs4Ro
 i9IgpuDSfEC9HKbdI763wcI6xCNxgs62Bg8CgtQoWOl5gbR6ITy5PAwu7xzQOx8JJvuH
 UYPBssIDY8nTX1zkSGqwwkFzTaC8h/tnofaUn1pl/z+m9TiG+onJ5Z9EhQuH9M7bDL3U
 oEJw==
X-Gm-Message-State: AOAM533wa3+p8uQq93GEwMDW10sqP1LLyVE99qyiLNXN3ZdfaQuq/Kyp
 tO+hNOhbKz26Sz24AJWMS7pywA==
X-Google-Smtp-Source: ABdhPJxZtG9SxZt0jjn5YoMjm5E41BxQstTom3oWSD4bkT9rz40vuUR4Iqfq9TVHuB+ISGAC/oywrw==
X-Received: by 2002:a05:6a00:850:b0:518:a9b2:1a19 with SMTP id
 q16-20020a056a00085000b00518a9b21a19mr45874414pfk.75.1654071515261; 
 Wed, 01 Jun 2022 01:18:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:34 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 1/8] drm/panel: Add an API drm_panel_get_orientation() to
 return panel orientation
Date: Wed,  1 Jun 2022 16:18:16 +0800
Message-Id: <20220601081823.1038797-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
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

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Previous discussion:
https://patchwork.kernel.org/project/linux-mediatek/cover/20220530081910.3947168-1-hsinyi@chromium.org/#24877477
---
 drivers/gpu/drm/drm_panel.c |  8 ++++++++
 include/drm/drm_panel.h     | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..4a512ca80673 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -223,6 +223,14 @@ int drm_panel_get_modes(struct drm_panel *panel,
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
 #ifdef CONFIG_OF
 /**
  * of_drm_find_panel - look up a panel using a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 1ba2d424a53f..d1bd3be4bbdf 100644
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
@@ -195,6 +204,7 @@ int drm_panel_enable(struct drm_panel *panel);
 int drm_panel_disable(struct drm_panel *panel);
 
 int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
+enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel);
 
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
 struct drm_panel *of_drm_find_panel(const struct device_node *np);
-- 
2.36.1.255.ge46751e96f-goog

