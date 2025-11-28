Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4CC93244
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 22:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EAF10E92A;
	Fri, 28 Nov 2025 21:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="KDKeBn+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5C610E924;
 Fri, 28 Nov 2025 21:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764363981; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KPDVuo9+EnGDLsuZweploJDFMSPxA3EwOZPw9aPHHhMz2DXUoWwiV7E4+0Iu/sGAn7NN1eYQDqoxdLuU/8cHLIKv0+/91JJqALSv8wTeWcUvbCWzKSKn1uyyUTX1dBoFx6mPE8NX2t6Z7KperR/W/6eMdu9mbtZ13QqW5iGa/2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764363981;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IBxMWqX4+1NiMuBr6BGqM8VA6p9l+VBzuvI2JeWQJUk=; 
 b=WX4+Q0p3B+Hc18XO9I7Zq5vEASk3TR/6sx4qIF/XSxXD38ioGMnk6rXUzQrVWiY7yhRgghHBEzt7bgMkvr2pKJ8hU9e9ouTecxHnKY41dseHzikuzWeSTfMSv3G0DI7VxHTCen7B4aIzcI/ZEM5NWr422qJHj9RcgNWHQC1MI6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764363981; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=IBxMWqX4+1NiMuBr6BGqM8VA6p9l+VBzuvI2JeWQJUk=;
 b=KDKeBn+2oZerSX3QOpV37D79KcKpgD5NU/avAqmIfHn26P43sELtFMjA3PIbGItM
 oIF7jte8lXsA25VmsfvHpV2uKlWgnD1atDLKO+YR51bkC9N1NHmIRUclkz08CqWLEft
 8DuabFfqAjcDNl6/1TXR7Sa1Yqtf1AFsv+/UCJJ8=
Received: by mx.zohomail.com with SMTPS id 1764363979976684.7501352747894;
 Fri, 28 Nov 2025 13:06:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:39 +0100
Subject: [PATCH v5 03/17] drm: Add enum conversion from DRM_COLOR_FORMAT to
 HDMI_COLORSPACE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-3-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
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
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
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

From: Marius Vlad <marius.vlad@collabora.com>

While the two enums have similar values, they're not identical, and
HDMI's enum is defined as per the HDMI standard.

Add a simple conversion function. Unexpected inputs aren't handled in
any clever way, DRM_COLOR_FORMAT_AUTO and any other value that doesn't
cleanly map to HDMI just gets returned as HDMI_COLORSPACE_RGB.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/drm/drm_connector.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 38968a557b82..cf556f0e5731 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2567,6 +2567,33 @@ int drm_connector_attach_color_format_property(struct drm_connector *connector);
 
 const char *drm_get_color_format_name(enum drm_color_format color_fmt);
 
+/**
+ * drm_color_format_to_hdmi_colorspace - convert DRM color format to HDMI
+ * @fmt: the &enum drm_color_format to convert
+ *
+ * Convert a given &enum drm_color_format to an equivalent
+ * &enum hdmi_colorspace. For non-representable values and
+ * %DRM_COLOR_FORMAT_AUTO, the value %HDMI_COLORSPACE_RGB is returned.
+ *
+ * Returns: the corresponding &enum hdmi_colorspace value
+ */
+static inline enum hdmi_colorspace __pure
+drm_color_format_to_hdmi_colorspace(enum drm_color_format fmt)
+{
+	switch (fmt) {
+	default:
+	case DRM_COLOR_FORMAT_AUTO:
+	case DRM_COLOR_FORMAT_RGB444:
+		return HDMI_COLORSPACE_RGB;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		return HDMI_COLORSPACE_YUV444;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		return HDMI_COLORSPACE_YUV422;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		return HDMI_COLORSPACE_YUV420;
+	}
+}
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor

-- 
2.52.0

