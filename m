Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15805C932AA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 22:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A4010E944;
	Fri, 28 Nov 2025 21:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="iLKadd0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEFE10E943;
 Fri, 28 Nov 2025 21:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764364076; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nyTRTxGsYjn7JDIYdQE6WLU3Kt/P4SfRL5acZvwnaq5ayXR76sOUhLMHOGrOdeYjd1VHPgzO8W3JZ+hn9aQUx0aVuGaCwFhQbcyjd3IaP+zaYn6I/RjfkpLNafomAbuXYMKap2fQsDmQCiaCPDtfQJ8hoBj2tX58PmbiWIrqR9o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764364076;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9QuLWrENbkGYBCc3w7FgA13jgu4Hw3OC9FC2Cv0BZ3U=; 
 b=AGtQr4gwIHbp9cvtjpcrH4mwn0wvxl13Is3SyAK/gVmt96UCtbfW9feSgyRC2lJU16fKHFN034/pbq3BROixANBBgH3pqhjQnjERiBKIWoVpBDtXyFTHVmL/dtubIcpGac2NpJfQJpb8djJfgbRszRCr73IHL1iZiihby5Ud6+E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764364076; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=9QuLWrENbkGYBCc3w7FgA13jgu4Hw3OC9FC2Cv0BZ3U=;
 b=iLKadd0WNu3o+iKeaggTUViIUSuZuBGpVB5r7y8kehs6ztJLJwI3ooTgSkAGwRMw
 8iDkaCRU4weCQedAjSKKAZb1FxQH6nAD0o9hneaFSsJa/kcwKSRvn/QOWZUwcxDBkNC
 1ukJaoylZhYc3zUuRyurIqw9BzpuD+hMmN29Sp3A=
Received: by mx.zohomail.com with SMTPS id 1764364074414719.0521648254899;
 Fri, 28 Nov 2025 13:07:54 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:52 +0100
Subject: [PATCH v5 16/17] drm/connector: Register color format property on
 HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-16-63e82f1db1e1@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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

The drmm_connector_hdmi_init function can figure out what DRM color
formats are supported by a particular connector based on the supported
HDMI format bitmask that's passed in.

Use it to register the drm color format property.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 13151d9bfb82..7c38123f99cd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -578,6 +578,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
+	u32 supported_drm_formats = 0;
 	int ret;
 
 	if (!vendor || !product)
@@ -621,6 +622,18 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	if (supported_formats & BIT(HDMI_COLORSPACE_RGB))
+		supported_drm_formats |= DRM_COLOR_FORMAT_RGB444;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV444))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR444;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV422))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR422;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV420))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR420;
+
+	if (!drm_mode_create_color_format_property(connector, supported_drm_formats))
+		drm_connector_attach_color_format_property(connector);
+
 	connector->hdmi.funcs = hdmi_funcs;
 
 	return 0;

-- 
2.52.0

