Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A1C53F902
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073CE112BEF;
	Tue,  7 Jun 2022 09:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E90510ED4B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:05:59 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so20232795pjl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JYiFnAz00MQeZi91E0UGkYUB+X1a+/Lsax/pqn3rMlA=;
 b=KH3+lr+udpk9BxBvp8pMA2hNB+th+s1iQrrtA3y5IMRralVN952OscgP2INjWAZFd8
 k4mjICqnU4+kEi0V4d+uTKrHr7Rh/7LZgNlFafUHVj0Q1/jNY9mXrUrB2PtUobzOOhqC
 rFSPen3RMgxDU4KLhSxdhq54eJ0q9X09oVhzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JYiFnAz00MQeZi91E0UGkYUB+X1a+/Lsax/pqn3rMlA=;
 b=ejb2NYYzsOxWlWTffMOj6lg6QMf28Kwr/SjNTSYxV6QSBF8mFiENsaI0WnoLijNunX
 ZrvoGdbmupJ3qq+b7Y1YVQjns/02P+1pN40BjASwl0USyI17ESXXrPmBGSVjw3QM9sa5
 JLsF7UkW/G7oHyXbF8XrPtsTJ0dD5B5qJW2QZCetpR7nlLHyNcuQf3nxEavI+FZfcMMv
 e0SulqAvR/Xiy/j10i41G+GbWWZWCVTBAjaU8HXsrov8VU0hvEBNu2GkvC4lOJI7v5v+
 oR7ZhIKPp6B3LjS78FQf43X1EzLDcHjKskqK8/IVq7nAw5BnVDUEkHPSNzPorEFGCWaf
 61sA==
X-Gm-Message-State: AOAM531110cBeKqlZsBMzObl6KKTkW5D7vYjBJrktRKkyt4R1sYXs9dM
 tN36qwnhYgcJ5TNehx7pyKrIIw==
X-Google-Smtp-Source: ABdhPJyr2A4/F6vIPaUyB60Ia6c6CqNra9a2QyXEjIj5RyHeqzXzhdCeEAtKv/SYI0gMhRUktDj0qw==
X-Received: by 2002:a17:902:a413:b0:156:15b:524a with SMTP id
 p19-20020a170902a41300b00156015b524amr28148208plq.106.1654592758652; 
 Tue, 07 Jun 2022 02:05:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:05:58 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 1/8] drm/panel: Add an API to allow drm to set orientation
 from panel
Date: Tue,  7 Jun 2022 17:05:42 +0800
Message-Id: <20220607090549.2345795-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
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
drivers are able to call drm_connector_set_orientation_from_panel() before
drm_dev_register().

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v4 -> v5:
- Simplify the caller from drm_connector_set_panel_orientation(connector,
drm_panel_get_orientation(panel)) to
drm_connector_set_orientation_from_panel(connector, panel).
The main function is also moved from drm_panel to drm_connector.
- Add some notice for the original drm_connector_set_panel_orientation()
usage.
- sort callbacks.
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

