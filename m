Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iItPLjiRqWkSAAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:20:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C60213299
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B274E10E160;
	Thu,  5 Mar 2026 14:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="hy06T9Ch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F97010E160;
 Thu,  5 Mar 2026 14:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772720427; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kE1gkYIy4roB7Zqx6C0hPAB8EnLR09rtZFvkeznCqbAa14wqu0BflrUfYIhNbSGQusSGjPuDFijVaxKgYK0JW8NR+9/eEBHMXCEDmBwQhUKsiA8z6PrFW3nVRUNOV3QKADb6PNLxvflHA4QjZaVtPyLUtO83Y6uf/qqS91wgVAs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772720427;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1GYBntpDRl1K9/KJsuLXL9DarNNNt6t+bGGjopojHHU=; 
 b=jnlP2aLHefduuOf68GW98eMAtIHkXFavv/1MJ9DbyghpJSS72wEQBUEiVijzyBQg3MndgaEafDAuvt2JoANXPoVWC5Iw0qd3H/iAJCjwt/9siP0y/ZMST4iDVVnk6WXGSn6crRbgjTaKvxH5K+dvowBOnJZEyhP2P0rzGg9tDwI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772720427; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=1GYBntpDRl1K9/KJsuLXL9DarNNNt6t+bGGjopojHHU=;
 b=hy06T9ChiZe1ouMxO2gqIcCP8Dx+SjwWGt08Un9yX/uRSAB67wy8ikvum1SznSef
 QsQg6317b21peo26LGII0GAsvo2fUSMix/AW8aftPVbYfA8tDieAD/Ou66skxOg6viA
 cfikXI53XmNfr9teCmYZo/45t2nSJL55Vcs7VOpc=
Received: by mx.zohomail.com with SMTPS id 1772720426504290.57315155882134;
 Thu, 5 Mar 2026 06:20:26 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Mar 2026 15:19:29 +0100
Subject: [PATCH v10 03/22] drm: Add new general DRM property "color format"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-color-format-v10-3-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
In-Reply-To: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 66C60213299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Add a new general DRM property named "color format" which can be used by
userspace to request the display driver to output a particular color
format.

Possible options are:
    - auto (setup by default, driver internally picks the color format)
    - rgb
    - ycbcr444
    - ycbcr422
    - ycbcr420

Drivers should advertise from this list which formats they support.
Together with this list and EDID data from the sink we should be able
to relay a list of usable color formats to users to pick from.

Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Co-developed-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |   5 ++
 drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
 drivers/gpu/drm/drm_connector.c     | 108 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h         | 104 ++++++++++++++++++++++++++++++++++
 4 files changed, 228 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 26953ed6b53e..b7753454b777 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -737,6 +737,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			if (old_connector_state->max_requested_bpc !=
 			    new_connector_state->max_requested_bpc)
 				new_crtc_state->connectors_changed = true;
+
+			if (old_connector_state->color_format !=
+			    new_connector_state->color_format)
+				new_crtc_state->connectors_changed = true;
+
 		}
 
 		if (funcs->atomic_check)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 87de41fb4459..e7ce79bb161e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -931,6 +931,15 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->privacy_screen_sw_state = val;
 	} else if (property == connector->broadcast_rgb_property) {
 		state->hdmi.broadcast_rgb = val;
+	} else if (property == connector->color_format_property) {
+		if (val > INT_MAX || !drm_connector_color_format_valid(val)) {
+			drm_dbg_atomic(connector->dev,
+				       "[CONNECTOR:%d:%s] unknown color format %llu\n",
+				       connector->base.id, connector->name, val);
+			return -EINVAL;
+		}
+
+		state->color_format = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -1016,6 +1025,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
 		*val = state->hdmi.broadcast_rgb;
+	} else if (property == connector->color_format_property) {
+		*val = state->color_format;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 47dc53c4a738..e848374dee0b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1388,6 +1388,18 @@ static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
 	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
 
+static const u32 hdmi_colorformats =
+	BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
+
+static const u32 dp_colorformats =
+	BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
+
 /*
  * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Colorimetry
  * Format Table 2-120
@@ -2940,6 +2952,102 @@ int drm_connector_attach_colorspace_property(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_attach_colorspace_property);
 
+/**
+ * drm_connector_attach_color_format_property - create and attach color format property
+ * @connector: connector to create the color format property on
+ * @supported_color_formats: bitmask of bit-shifted &enum drm_output_color_format
+ *                           values the connector supports
+ *
+ * Called by a driver to create a color format property. The property is
+ * attached to the connector automatically on success.
+ *
+ * @supported_color_formats should only include color formats the connector
+ * type can actually support.
+ *
+ * Returns:
+ * 0 on success, negative errno on error
+ */
+int drm_connector_attach_color_format_property(struct drm_connector *connector,
+					       unsigned long supported_color_formats)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_prop_enum_list enum_list[DRM_CONNECTOR_COLOR_FORMAT_COUNT];
+	unsigned int i = 0;
+	unsigned long fmt;
+
+	if (connector->color_format_property)
+		return 0;
+
+	if (!supported_color_formats) {
+		drm_err(dev, "No supported color formats provided on [CONNECTOR:%d:%s]\n",
+			connector->base.id, connector->name);
+		return -EINVAL;
+	}
+
+	if (supported_color_formats & ~GENMASK(DRM_OUTPUT_COLOR_FORMAT_COUNT - 1, 0)) {
+		drm_err(dev, "Unknown color formats provided on [CONNECTOR:%d:%s]\n",
+			connector->base.id, connector->name);
+		return -EINVAL;
+	}
+
+	switch (connector->connector_type) {
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+		if (supported_color_formats & ~hdmi_colorformats) {
+			drm_err(dev, "Color formats not allowed for HDMI on [CONNECTOR:%d:%s]\n",
+				connector->base.id, connector->name);
+			return -EINVAL;
+		}
+		break;
+	case DRM_MODE_CONNECTOR_DisplayPort:
+	case DRM_MODE_CONNECTOR_eDP:
+		if (supported_color_formats & ~dp_colorformats) {
+			drm_err(dev, "Color formats not allowed for DP on [CONNECTOR:%d:%s]\n",
+				connector->base.id, connector->name);
+			return -EINVAL;
+		}
+		break;
+	}
+
+	enum_list[0].name = "AUTO";
+	enum_list[0].type = DRM_CONNECTOR_COLOR_FORMAT_AUTO;
+
+	for_each_set_bit(fmt, &supported_color_formats, DRM_OUTPUT_COLOR_FORMAT_COUNT) {
+		switch (fmt) {
+		case DRM_OUTPUT_COLOR_FORMAT_RGB444:
+			enum_list[++i].type = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
+			break;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
+			enum_list[++i].type = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
+			break;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
+			enum_list[++i].type = DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
+			break;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
+			enum_list[++i].type = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
+			break;
+		default:
+			drm_warn(dev, "Unknown supported format %ld on [CONNECTOR:%d:%s]\n",
+				 fmt, connector->base.id, connector->name);
+			continue;
+		}
+		enum_list[i].name = drm_hdmi_connector_get_output_format_name(fmt);
+	}
+
+	connector->color_format_property =
+		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "color format",
+					 enum_list, i + 1);
+
+	if (!connector->color_format_property)
+		return -ENOMEM;
+
+	drm_object_attach_property(&connector->base, connector->color_format_property,
+				   DRM_CONNECTOR_COLOR_FORMAT_AUTO);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_color_format_property);
+
 /**
  * drm_connector_atomic_hdr_metadata_equal - checks if the hdr metadata changed
  * @old_state: old connector state to compare
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index af8b92d2d5b7..bd549f912b76 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -571,14 +571,102 @@ enum drm_colorspace {
  *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
  * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
  *   YCbCr 4:2:0 output format (ie. with horizontal and vertical subsampling)
+ * @DRM_OUTPUT_COLOR_FORMAT_COUNT:
+ *   Number of valid output color format values in this enum
  */
 enum drm_output_color_format {
 	DRM_OUTPUT_COLOR_FORMAT_RGB444 = 0,
 	DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
 	DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
 	DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
+	DRM_OUTPUT_COLOR_FORMAT_COUNT,
 };
 
+/**
+ * enum drm_connector_color_format - Connector Color Format Request
+ *
+ * This enum, unlike &enum drm_output_color_format, is used to specify requests
+ * for a specific color format on a connector through the DRM "color format"
+ * property. The difference is that it has an "AUTO" value to specify that
+ * no specific choice has been made.
+ */
+enum drm_connector_color_format {
+	/**
+	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
+	 * helpers should pick a suitable color format. All implementations of a
+	 * specific display protocol must behave the same way with "AUTO", but
+	 * different display protocols do not necessarily have the same "AUTO"
+	 * semantics.
+	 *
+	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
+	 * bandwidth required for full-scale RGB is not available, or the mode
+	 * is YCbCr 4:2:0-only, as long as the mode and output both support
+	 * YCbCr 4:2:0.
+	 *
+	 * For display protocols other than HDMI, the recursive bridge chain
+	 * format selection picks the first chain of bridge formats that works,
+	 * as has already been the case before the introduction of the "color
+	 * format" property. Non-HDMI bridges should therefore either sort their
+	 * bus output formats by preference, or agree on a unified auto format
+	 * selection logic that's implemented in a common state helper (like
+	 * how HDMI does it).
+	 */
+	DRM_CONNECTOR_COLOR_FORMAT_AUTO = 0,
+
+	/**
+	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
+	 */
+	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
+
+	/**
+	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
+	 * not subsampled)
+	 */
+	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
+
+	/**
+	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
+	 * with horizontal subsampling)
+	 */
+	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
+
+	/**
+	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
+	 * with horizontal and vertical subsampling)
+	 */
+	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
+
+	/**
+	 * @DRM_CONNECTOR_COLOR_FORMAT_COUNT: Number of valid connector color
+	 * format values in this enum
+	 */
+	DRM_CONNECTOR_COLOR_FORMAT_COUNT,
+};
+
+/**
+ * drm_connector_color_format_valid - Validate drm_connector_color_format value
+ * @fmt: value to check against all values of &enum drm_connector_color_format
+ *
+ * Checks whether the passed in value of @fmt is one of the allowable values in
+ * &enum drm_connector_color_format.
+ *
+ * Returns: %true if it's a valid value for the enum, %false otherwise.
+ */
+static inline bool __pure
+drm_connector_color_format_valid(enum drm_connector_color_format fmt)
+{
+	switch (fmt) {
+	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+		return true;
+	default:
+		return false;
+	}
+}
+
 const char *
 drm_hdmi_connector_get_output_format_name(enum drm_output_color_format fmt);
 
@@ -1129,6 +1217,13 @@ struct drm_connector_state {
 	 */
 	enum drm_colorspace colorspace;
 
+	/**
+	 * @color_format: State variable for Connector property to request
+	 * color format change on Sink. This is most commonly used to switch
+	 * between RGB to YUV and vice-versa.
+	 */
+	enum drm_connector_color_format color_format;
+
 	/**
 	 * @writeback_job: Writeback job for writeback connectors
 	 *
@@ -2127,6 +2222,12 @@ struct drm_connector {
 	 */
 	struct drm_property *colorspace_property;
 
+	/**
+	 * @color_format_property: Connector property to set the suitable
+	 * color format supported by the sink.
+	 */
+	struct drm_property *color_format_property;
+
 	/**
 	 * @path_blob_ptr:
 	 *
@@ -2610,6 +2711,9 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 					struct drm_encoder *encoder);
 const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 
+int drm_connector_attach_color_format_property(struct drm_connector *connector,
+					       unsigned long supported_color_formats);
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor

-- 
2.53.0

