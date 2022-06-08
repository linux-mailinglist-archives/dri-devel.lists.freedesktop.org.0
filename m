Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91456542BDE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CBC10E350;
	Wed,  8 Jun 2022 09:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1202610E350
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:26 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id o17so17192293pla.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dk2EVUG101rQm23r/ZlU8mzZDKwDG1KKDCi7n9ZjRd8=;
 b=j8QWqh3VeH6zE+x5CqSxyRP92nBBtths9qDeKi+gqFUHoz2TBsRRzOmCA/dl65TGwX
 /YWZzow5DUgSybhjFdXM6++3qtRpUf+Y3ZTUfD0/hucV8+31RhGlibfVOBG48yYoOvcN
 ChPCccBhnxS9PivqID9+qUOQp1utj7jEqX7+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dk2EVUG101rQm23r/ZlU8mzZDKwDG1KKDCi7n9ZjRd8=;
 b=1kzF+cvbHZ8K6+Dq4NDp64QHSEv/0gETJV0eh7wEJL0hD5A1qRufpTTg6Y/mgAfHXN
 AETPFLiednyNat+ULsaqDahaHJB/3bUsRZ61mOoiIM6ZtV3viYNkknUkYGWGVTWWTDnf
 Jm8CtAZFdD4Jr2bWmvP2BoYciipOYIy3JBfI3GJSbeUZ+unQaQpC51RkXzFTcawpwY0Q
 AvOHx4yTcG4gZCnZRqYOmsjIoOyoO08MPL+NAwQwSPE28dKs04sMoScNzysogcnwwreM
 N5yQbW53cSiee+xMvgfQpVLRRx2GchTat5Z7jNSDHEoh5i0OBcN7St5gxKSDi1wSrOKU
 NiBw==
X-Gm-Message-State: AOAM533nBfBzKBFzfJG5+E+JJBuQOvuDgy8HkNJhg8mfZpu60Ki7Gtx4
 PNOMJ4OuH7mY2R+C0khJ8AGhuQ==
X-Google-Smtp-Source: ABdhPJzyscN4nhpdxlEaz3bHujhJtkfRSWOh9x+gpg+krvUZqaEWRACfaESxbhHHo/6Uk0P45Tdfvg==
X-Received: by 2002:a17:90b:c85:b0:1e2:e645:a8c9 with SMTP id
 o5-20020a17090b0c8500b001e2e645a8c9mr36464915pjz.185.1654681705655; 
 Wed, 08 Jun 2022 02:48:25 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:25 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 1/8] drm/panel: Add an API to allow drm to set orientation
 from panel
Date: Wed,  8 Jun 2022 17:48:09 +0800
Message-Id: <20220608094816.2898692-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608094816.2898692-1-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN().

The orientation property is known earlier. For example, some panels
parse the property through device tree during probe.

Add an API to return the property from panel to drm/kms driver, so the
drivers are able to call drm_connector_set_orientation_from_panel() before
drm_dev_register().

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/drm_connector.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  4 ++++
 include/drm/drm_panel.h         |  9 +++++++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1c48d162c77e..859165a1c8f1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -24,6 +24,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_utils.h>
 #include <drm/drm_print.h>
 #include <drm/drm_drv.h>
@@ -2320,6 +2321,9 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
  * It is allowed to call this function with a panel_orientation of
  * DRM_MODE_PANEL_ORIENTATION_UNKNOWN, in which case it is a no-op.
  *
+ * The function shouldn't be called in panel after drm is registered (i.e.
+ * drm_dev_register() is called in drm).
+ *
  * Returns:
  * Zero on success, negative errno on failure.
  */
@@ -2389,6 +2393,34 @@ int drm_connector_set_panel_orientation_with_quirk(
 }
 EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
 
+/**
+ * drm_connector_set_orientation_from_panel -
+ * 	set the connector's panel_orientation from panel's callback.
+ * @connector: connector for which to init the panel-orientation property.
+ * @panel: panel that can provide orientation information.
+ *
+ * Drm drivers should call this function before drm_dev_register().
+ * Orientation is obtained from panel's .get_orientation() callback.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_set_orientation_from_panel(
+	struct drm_connector *connector,
+	struct drm_panel *panel)
+{
+	enum drm_panel_orientation panel_orientation;
+
+	if (panel && panel->funcs && panel->funcs->get_orientation)
+		panel_orientation = panel->funcs->get_orientation(panel);
+	else
+		panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+
+	return drm_connector_set_panel_orientation(connector,
+						   panel_orientation);
+}
+EXPORT_SYMBOL(drm_connector_set_orientation_from_panel);
+
 static const struct drm_prop_enum_list privacy_screen_enum[] = {
 	{ PRIVACY_SCREEN_DISABLED,		"Disabled" },
 	{ PRIVACY_SCREEN_ENABLED,		"Enabled" },
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3ac4bf87f257..94b422b55cc1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -38,6 +38,7 @@ struct drm_modeset_acquire_ctx;
 struct drm_device;
 struct drm_crtc;
 struct drm_encoder;
+struct drm_panel;
 struct drm_property;
 struct drm_property_blob;
 struct drm_printer;
@@ -1802,6 +1803,9 @@ int drm_connector_set_panel_orientation_with_quirk(
 	struct drm_connector *connector,
 	enum drm_panel_orientation panel_orientation,
 	int width, int height);
+int drm_connector_set_orientation_from_panel(
+	struct drm_connector *connector,
+	struct drm_panel *panel);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
 void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index d279ee455f01..3a271128c078 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -116,6 +116,15 @@ struct drm_panel_funcs {
 	int (*get_modes)(struct drm_panel *panel,
 			 struct drm_connector *connector);
 
+	/**
+	 * @get_orientation:
+	 *
+	 * Return the panel orientation set by device tree or EDID.
+	 *
+	 * This function is optional.
+	 */
+	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
+
 	/**
 	 * @get_timings:
 	 *
-- 
2.36.1.255.ge46751e96f-goog

