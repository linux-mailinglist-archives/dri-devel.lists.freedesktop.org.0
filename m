Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E5184222
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBBD89D66;
	Fri, 13 Mar 2020 08:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E48C6EB29
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 18:56:39 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id 64so3848626plf.19
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 11:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fb+o65Uot0J8uKJF0VIG4K45eAKvXITiVF9xtLDLePk=;
 b=TDDm2qevwFX9GxIUmGOA/T9YmUiTAfhfF+Pn5w3zUMH3htOEfnTc/sZVwhxxas1N5/
 xwLUIIZ9d+6lSSfzIbW/H4v8vukxyzLTYud+FF0Jwpd5RZSYYysfKrce7s8MSYRgZYnl
 ka9K8ueBHqyRxJwaIKZKT0UrhhSOmna7xLVJdNGYJUslcPC0QhROXXs8C9OGAevwQZB2
 qEEqp2vFcwDnagGzDZ5JfpHPx2KW8P96cekkfvJDMsMMz9YpDrOuUuNumZ8KqTDtUEJt
 RcsB+7JXR+tenFPv5KKvwktko0k8Jxzf/kbfr7PtGeyfUrfqrCbchftFHA+KtpKyXuEA
 KwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fb+o65Uot0J8uKJF0VIG4K45eAKvXITiVF9xtLDLePk=;
 b=kETIDTB5Xg+xmWDKtm0CZlj6AIZp3B3ioloq/2hyG8VBilYMh8JNE9sz+UjPlJzywh
 zzhk/PGREIlPvBlOXtLMt4LZCUqzz0qS+8t4XeD9g8HtMS/CrQvjBowtjpKJ5Nz4dfBj
 AXnBkyM+4ysNhSoKEyyE0HlsIc5+yuflhrGLyVrQ5JoYkAu5FVFoOzaxhc9bzzIEDmT8
 SWNuGkw96IovsDG2EKKh4Dy0hT0eSUa+PyqbmbsuICuG7ay/YkKpmdOX93KWw977KaKL
 OdQasKtksBmgyzT51xcMsnp0yzEAWZfXw5LGj2NuMGjWHrlodThEMFuQ3D7zS/cGwuYH
 PDRw==
X-Gm-Message-State: ANhLgQ0nFYpD+asJv3DGScZuchDlXAI1e0WHNqAgkxtV2bO04v9tv8MY
 Rn4Uuv3i0/GUyR2t8TEl1qz8TPC7JhGn
X-Google-Smtp-Source: ADFU+vtyOiYbwvLNXy51lTMkIWRlelZ1/x29qicc6UJyY5EEj4KTcOH5UxcHuPr1XTQZNJdbVbTO/cuVylNh
X-Received: by 2002:a17:90a:1f8d:: with SMTP id
 x13mr5635664pja.27.1584039399008; 
 Thu, 12 Mar 2020 11:56:39 -0700 (PDT)
Date: Thu, 12 Mar 2020 11:56:26 -0700
In-Reply-To: <20200312185629.141280-1-rajatja@google.com>
Message-Id: <20200312185629.141280-3-rajatja@google.com>
Mime-Version: 1.0
References: <20200312185629.141280-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v9 2/5] drm/connector: Add support for privacy-screen property
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>, 
 "=?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?=" <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, mathewk@google.com, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Pavel Machek <pavel@denx.de>, seanpaul@google.com,
 Duncan Laurie <dlaurie@google.com>, 
 jsbarnes@google.com, Thierry Reding <thierry.reding@gmail.com>,
 mpearson@lenovo.com, Nitin Joshi1 <njoshi1@lenovo.com>,
 Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>, 
 Tomoki Maruichi <maruichit@lenovo.com>
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for generic electronic privacy screen property, that
can be added by systems that have an integrated EPS.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v9: rebased on top of https://cgit.freedesktop.org/drm/drm-tip:drm-tip
v8: Remove the ...destroy_privacy_screen() method and let the property
    be destroyed along with others at the time of device destruction.
    (because drm core doesn't also like properties destroyed in
     late_register()).
v7: * Initial version, formed by moving the privacy-screen property into
      drm core.
    * Break the init_property() into create_property() and attach_property()
      so that property can be created while registering connector, but
      attached in late_register() (after ACPI node detection).


 drivers/gpu/drm/drm_atomic_uapi.c |  4 +++
 drivers/gpu/drm/drm_connector.c   | 51 +++++++++++++++++++++++++++++++
 include/drm/drm_connector.h       | 24 +++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a1e5e262bae2d..843a8cdacd149 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -766,6 +766,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 						   fence_ptr);
 	} else if (property == connector->max_bpc_property) {
 		state->max_requested_bpc = val;
+	} else if (property == connector->privacy_screen_property) {
+		state->privacy_screen_status = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -842,6 +844,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = 0;
 	} else if (property == connector->max_bpc_property) {
 		*val = state->max_requested_bpc;
+	} else if (property == connector->privacy_screen_property) {
+		*val = state->privacy_screen_status;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 644f0ad106717..182aa557962b2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1186,6 +1186,10 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	can also expose this property to external outputs, in which case they
  *	must support "None", which should be the default (since external screens
  *	have a built-in scaler).
+ *
+ * privacy-screen:
+ *	This optional property can be used to enable / disable an integrated
+ *	electronic privacy screen that is available on some displays.
  */
 
 int drm_connector_create_standard_properties(struct drm_device *dev)
@@ -2152,6 +2156,53 @@ int drm_connector_set_panel_orientation_with_quirk(
 }
 EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
 
+static const struct drm_prop_enum_list privacy_screen_enum[] = {
+	{ PRIVACY_SCREEN_DISABLED, "Disabled" },
+	{ PRIVACY_SCREEN_ENABLED, "Enabled" },
+};
+
+/**
+ * drm_connector_create_privacy_screen_property -
+ *     create the drm connecter's privacy-screen property.
+ * @connector: connector for which to create the privacy-screen property
+ *
+ * This function creates the "privacy-screen" property for the
+ * connector. It is not attached.
+ */
+void
+drm_connector_create_privacy_screen_property(struct drm_connector *connector)
+{
+	if (connector->privacy_screen_property)
+		return;
+
+	connector->privacy_screen_property =
+		drm_property_create_enum(connector->dev, DRM_MODE_PROP_ENUM,
+					 "privacy-screen", privacy_screen_enum,
+					 ARRAY_SIZE(privacy_screen_enum));
+}
+EXPORT_SYMBOL(drm_connector_create_privacy_screen_property);
+
+/**
+ * drm_connector_attach_privacy_screen_property -
+ *     attach the drm connecter's privacy-screen property.
+ * @connector: connector on which to attach the privacy-screen property
+ *
+ * This function attaches the "privacy-screen" property to the
+ * connector. Initial state of privacy-screen is set to disabled.
+ */
+void
+drm_connector_attach_privacy_screen_property(struct drm_connector *connector)
+{
+	struct drm_property *prop = connector->privacy_screen_property;
+
+	if (!prop)
+		return;
+
+	drm_object_attach_property(&connector->base, prop,
+				   PRIVACY_SCREEN_DISABLED);
+}
+EXPORT_SYMBOL(drm_connector_attach_privacy_screen_property);
+
 int drm_connector_set_obj_prop(struct drm_mode_object *obj,
 				    struct drm_property *property,
 				    uint64_t value)
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 19ae6bb5c85be..f9ce89cc13542 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -271,6 +271,20 @@ struct drm_monitor_range_info {
 	u8 max_vfreq;
 };
 
+/**
+ * enum drm_privacy_screen_status - privacy screen status
+ *
+ * This enum is used to track and control the state of the integrated privacy
+ * screen present on some display panels, via the "privacy-screen" property.
+ *
+ * @PRIVACY_SCREEN_DISABLED: The privacy-screen on the panel is disabled
+ * @PRIVACY_SCREEN_ENABLED:  The privacy-screen on the panel is enabled
+ **/
+enum drm_privacy_screen_status {
+	PRIVACY_SCREEN_DISABLED = 0,
+	PRIVACY_SCREEN_ENABLED = 1,
+};
+
 /*
  * This is a consolidated colorimetry list supported by HDMI and
  * DP protocol standard. The respective connectors will register
@@ -686,6 +700,8 @@ struct drm_connector_state {
 	 */
 	u8 max_bpc;
 
+	enum drm_privacy_screen_status privacy_screen_status;
+
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
@@ -1285,6 +1301,12 @@ struct drm_connector {
 	 */
 	struct drm_property *max_bpc_property;
 
+	/**
+	 *  @privacy_screen_property: Optional property for the connector to
+	 *  control the integrated privacy screen, if available.
+	 */
+	struct drm_property *privacy_screen_property;
+
 #define DRM_CONNECTOR_POLL_HPD (1 << 0)
 #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
 #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
@@ -1598,6 +1620,8 @@ int drm_connector_set_panel_orientation_with_quirk(
 	int width, int height);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
+void drm_connector_create_privacy_screen_property(struct drm_connector *conn);
+void drm_connector_attach_privacy_screen_property(struct drm_connector *conn);
 
 /**
  * struct drm_tile_group - Tile group metadata
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
