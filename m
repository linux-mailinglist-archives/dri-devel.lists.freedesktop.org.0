Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDAC828F79
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 23:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE5910E506;
	Tue,  9 Jan 2024 22:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296E710E4B2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 18:11:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso34426675e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1704823904; x=1705428704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FOig009jjEjeh+vnprQEku+JrOLkbdtfCg1b2Ndzfw=;
 b=SajxNQ7ZNRj5I9VQ5oVQS9It+MdpNNPWP0NuW3G7OVPT26YzGc2i7g6mHPztEj98so
 VB6Sdjavyu0NzupdqyrkGvRsD7bT7JNEJDu6y8UQkXTfIDucILcC1suVFI0cnfmIkVAq
 bSvYVUzEnZt1h85azeR+tCLu1jh7CQBd3DL0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704823904; x=1705428704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FOig009jjEjeh+vnprQEku+JrOLkbdtfCg1b2Ndzfw=;
 b=O37AX9ae5ARt5banJ0dOUfn4BGm+9MrcobH07MR/KqPXgsKoXwgWgUKfg1wGraXlP8
 5FmOJUUqouquyJwrjZbOkZx1HA36uo+12rRK4YDN6NuUYZN1BG9H7S9WRywR2DK+q2dw
 GSRDKeq3q7NdFPdlAf2DMZExuaNKjbYLdh8ehPSklU2T7D1V9NNNsfawB9Z77M+pvtCs
 y3X96NG45ppikghEXkDxIyysTLM16ocxfIdEg/hk20Gm/dK0/OUjg4qBXZZh74vXOlzQ
 gkxQwY0RTUEXwYkTmtUliAZ+dHPtF/wlJn+pkhQIAtYmlF8KcHq9MrVZ1KcQjpUN6IcB
 EGcg==
X-Gm-Message-State: AOJu0YyrOIk89PZzjDyNL9z/XQFTEFesYd5DzoAf3La+MEhEzuGSMd3F
 7Ncrjs52hFbsLfEoYrXD6sj1pGNYMYy1gw==
X-Google-Smtp-Source: AGHT+IFzA8uBOAMbRxLaFNUGf0cxS9vZD5/6R/qJ13W5c3i448PbrK2IbE7snX+W95EFhYkD/m0DGA==
X-Received: by 2002:a7b:ce10:0:b0:40e:4572:57ea with SMTP id
 m16-20020a7bce10000000b0040e457257eamr1973874wmc.65.1704823904568; 
 Tue, 09 Jan 2024 10:11:44 -0800 (PST)
Received: from andri-workstation.turninn.appdynamic.com
 ([2a01:8280:aa07:ad:7285:c2ff:fef0:4baf])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a05600c3b9900b0040e527602c8sm2104579wms.9.2024.01.09.10.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 10:11:44 -0800 (PST)
From: Andri Yngvason <andri@yngvason.is>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH 5/7] drm/uAPI: Add "preferred color format" drm property as
 setting for userspace
Date: Tue,  9 Jan 2024 18:11:02 +0000
Message-ID: <20240109181104.1670304-6-andri@yngvason.is>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109181104.1670304-1-andri@yngvason.is>
References: <20240109181104.1670304-1-andri@yngvason.is>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Jan 2024 22:13:19 +0000
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
Cc: amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>,
 Andri Yngvason <andri@yngvason.is>, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Werner Sembach <wse@tuxedocomputers.com>

Add a new general drm property "preferred color format" which can be used
by userspace to tell the graphic drivers to which color format to use.

Possible options are:
    - auto (default/current behaviour)
    - rgb
    - ycbcr444
    - ycbcr422 (not supported by both amdgpu and i915)
    - ycbcr420

In theory the auto option should choose the best available option for the
current setup, but because of bad internal conversion some monitors look
better with rgb and some with ycbcr444.

Also, because of bad shielded connectors and/or cables, it might be
preferable to use the less bandwidth heavy ycbcr422 and ycbcr420 formats
for a signal that is less deceptible to interference.

In the future, automatic color calibration for screens might also depend on
this option being available.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Tested-by: Andri Yngvason <andri@yngvason.is>
---
 drivers/gpu/drm/drm_atomic_helper.c |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
 drivers/gpu/drm/drm_connector.c     | 50 ++++++++++++++++++++++++++++-
 include/drm/drm_connector.h         | 17 ++++++++++
 4 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 68ffcc0b00dca..745a43d9c5da3 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -707,6 +707,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			if (old_connector_state->max_requested_bpc !=
 			    new_connector_state->max_requested_bpc)
 				new_crtc_state->connectors_changed = true;
+
+			if (old_connector_state->preferred_color_format !=
+			    new_connector_state->preferred_color_format)
+				new_crtc_state->connectors_changed = true;
 		}
 
 		if (funcs->atomic_check)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 98d3b10c08ae1..eba5dea1249e5 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -798,6 +798,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->max_requested_bpc = val;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		state->privacy_screen_sw_state = val;
+	} else if (property == connector->preferred_color_format_property) {
+		state->preferred_color_format = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -881,6 +883,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->max_requested_bpc;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		*val = state->privacy_screen_sw_state;
+	} else if (property == connector->preferred_color_format_property) {
+		*val = state->preferred_color_format;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 30d62e505d188..4de48a38792cf 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1061,6 +1061,14 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
 	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
 };
 
+static const struct drm_prop_enum_list drm_preferred_color_format_enum_list[] = {
+	{ 0, "auto" },
+	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
+	{ DRM_COLOR_FORMAT_YCBCR444, "ycbcr444" },
+	{ DRM_COLOR_FORMAT_YCBCR422, "ycbcr422" },
+	{ DRM_COLOR_FORMAT_YCBCR420, "ycbcr420" },
+};
+
 static const struct drm_prop_enum_list drm_active_color_format_enum_list[] = {
 	{ 0, "not applicable" },
 	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
@@ -1398,11 +1406,20 @@ static const u32 dp_colorspaces =
  *	drm_connector_attach_max_bpc_property() to create and attach the
  *	property to the connector during initialization.
  *
+ * preferred color format:
+ *	This property is used by userspace to change the used color format. When
+ *	used the driver will use the selected format if valid for the hardware,
+ *	sink, and current resolution and refresh rate combination. Drivers to
+ *	use the function drm_connector_attach_preferred_color_format_property()
+ *	to create and attach the property to the connector during
+ *	initialization. Possible values are "auto", "rgb", "ycbcr444",
+ *	"ycbcr422", and "ycbcr420".
+ *
  * active color format:
  *	This read-only property tells userspace the color format actually used
  *	by the hardware display engine "on the cable" on a connector. The chosen
  *	value depends on hardware capabilities, both display engine and
- *	connected monitor. Drivers shall use
+ *	connected monitor, and the "preferred color format". Drivers shall use
  *	drm_connector_attach_active_color_format_property() to install this
  *	property. Possible values are "not applicable", "rgb", "ycbcr444",
  *	"ycbcr422", and "ycbcr420".
@@ -2468,6 +2485,37 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
 
+/**
+ * drm_connector_attach_preferred_color_format_property - attach "preferred color format" property
+ * @connector: connector to attach preferred color format property on.
+ *
+ * This is used to add support for selecting a color format on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_preferred_color_format_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (!connector->preferred_color_format_property) {
+		prop = drm_property_create_enum(dev, 0, "preferred color format",
+						drm_preferred_color_format_enum_list,
+						ARRAY_SIZE(drm_preferred_color_format_enum_list));
+		if (!prop)
+			return -ENOMEM;
+
+		connector->preferred_color_format_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop, 0);
+	connector->state->preferred_color_format = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_preferred_color_format_property);
+
 /**
  * drm_connector_attach_active_color_format_property - attach "active color format" property
  * @connector: connector to attach active color format property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 9ae73cfdceeb1..d7bc54c8b42cb 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1026,6 +1026,16 @@ struct drm_connector_state {
 	 */
 	enum drm_privacy_screen_status privacy_screen_sw_state;
 
+	/**
+	 * preferred_color_format: Property set by userspace to tell the GPU
+	 * driver which color format to use. It only gets applied if hardware,
+	 * meaning both the computer and the monitor, and the driver support the
+	 * given format at the current resolution and refresh rate. Userspace
+	 * can check for (un-)successful application via the "active color
+	 * format" property.
+	 */
+	u32 preferred_color_format;
+
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
@@ -1699,6 +1709,12 @@ struct drm_connector {
 	 */
 	struct drm_property *privacy_screen_hw_state_property;
 
+	/**
+	 * @preferred_color_format_property: Default connector property for the
+	 * preferred color format to be driven out of the connector.
+	 */
+	struct drm_property *preferred_color_format_property;
+
 	/**
 	 * @active_color_format_property: Default connector property for the
 	 * active color format to be driven out of the connector.
@@ -2059,6 +2075,7 @@ void drm_connector_attach_privacy_screen_provider(
 	struct drm_connector *connector, struct drm_privacy_screen *priv);
 void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
 
+int drm_connector_attach_preferred_color_format_property(struct drm_connector *connector);
 int drm_connector_attach_active_color_format_property(struct drm_connector *connector);
 void drm_connector_set_active_color_format_property(struct drm_connector *connector,
 						    u32 active_color_format);
-- 
2.43.0

