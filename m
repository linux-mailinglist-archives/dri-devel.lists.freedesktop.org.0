Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHXMB1kVk2nD1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:02:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80DE14386D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3039B10E36D;
	Mon, 16 Feb 2026 13:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="FpBVMtkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D7410E35F;
 Mon, 16 Feb 2026 13:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771246923; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eZVJThR2gA+t6hkkAUI5SiueBkenMCTQGNboTDOT65PQZMu3+zq00/VhZBiglKzBsk1jA2N07djIqRDFnII5j26Eu8F9DhZmFII2ZesM8ylBZJQFSb1iaYzRXJ9JnSUXARypRiFxyyc05s4RH8+nJYSuDOxeuaiNR+x0MZxyxcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771246923;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=E6/IL9T9r6JCufl0RYsNc7jJmCuMbPJaKhaRNoo53fQ=; 
 b=KRAM4C9X2fTMr9MLZ2xbdRCP7NvnMxvBcYwYIrRrMnO1tuVg+DRiwOsRO1nUZ/z9d7GIFTl5aTm/ZMlA6caww4W/QcW6DK/JGiGJlN8bP7qjNM4MsMJXW4DbdcOoNjfpqLJqx7qLBjMFrVLNR61kz57mPiieoLytaA4mRXUtrK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771246923; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=E6/IL9T9r6JCufl0RYsNc7jJmCuMbPJaKhaRNoo53fQ=;
 b=FpBVMtkJwvPluuKs/sxzKjDlt1CbhDZFt4WkGb9BSe4LMlPQW1yoSMu69gTAt74y
 HpVAFcu5AdSRH1ubBHV+nepgFnJpdvIBDjRHU5DX4mp8uaN9D1PdaLLIxQ3qdSCjuJe
 7weY5+F2NQaz25CVMfZb17kXtAL7ShwL1ChjauVc=
Received: by mx.zohomail.com with SMTPS id 1771246921436134.4296104447676;
 Mon, 16 Feb 2026 05:02:01 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Feb 2026 14:01:17 +0100
Subject: [PATCH v8 03/20] drm: Add enum conversions for drm_color_format_enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-color-format-v8-3-5722ce175dd5@collabora.com>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
In-Reply-To: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: D80DE14386D
X-Rspamd-Action: no action

While the drm_color_format_enum enum and the hdmi_colorspace enum have
similar values, they're not identical, and HDMI's enum is defined as per
the HDMI standard.

Meanwhile, each DRM_COLOR_FORMAT_* define has a corresponding
drm_color_format_enum, which allows conversion from the bitshifted
defines to the enum values.

Implement conversion functions from DRM_COLOR_FORMAT bitshifted defines
to drm_color_format_enum, and from hdmi_colorspace enum values to
drm_color_format_enum enum values.

In both conversions, an unexpected input results in a
DRM_COLOR_FORMAT_ENUM_INVALID result. The functions are kept inline
__pure to give the compiler maximum freedom to do as it pleases.

Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/drm/drm_connector.h | 53 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 18bd875b6918..886defdd069b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2694,6 +2694,59 @@ int drm_connector_attach_color_format_property(struct drm_connector *connector);
 
 const char *drm_get_color_format_name(enum drm_color_format_enum color_fmt);
 
+/**
+ * drm_color_format_to_enum - convert a single DRM_COLOR_FORMAT\_ to enum
+ * @fmt: One of the possible DRM_COLOR_FORMAT\_ values
+ *
+ * Converts a single DRM_COLOR_FORMAT\_ value to a corresponding
+ * &enum drm_color_format_enum value. Bitmasks of multiple DRM_COLOR_FORMAT\_
+ * values are not supported, as they would not map to a single enum value.
+ *
+ * Returns converted enum value on success, or %DRM_COLOR_FORMAT_ENUM_INVALID on
+ * failure.
+ */
+static inline enum drm_color_format_enum __pure
+drm_color_format_to_enum(u32 fmt)
+{
+	switch (fmt) {
+	case DRM_COLOR_FORMAT_RGB444:
+		return DRM_COLOR_FORMAT_ENUM_RGB444;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR444;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR422;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR420;
+	default:
+		return DRM_COLOR_FORMAT_ENUM_INVALID;
+	}
+}
+
+/**
+ * drm_color_format_enum_from_hdmi_colorspace - convert hdmi_colorspace enum to
+ *                                              drm_color_format_enum
+ * @fmt: The &enum hdmi_colorspace to convert
+ *
+ * Returns the converted result on success, or %DRM_COLOR_FORMAT_ENUM_INVALID on
+ * failure.
+ */
+static inline enum drm_color_format_enum __pure
+drm_color_format_enum_from_hdmi_colorspace(enum hdmi_colorspace fmt)
+{
+	switch (fmt) {
+	case HDMI_COLORSPACE_RGB:
+		return DRM_COLOR_FORMAT_ENUM_RGB444;
+	case HDMI_COLORSPACE_YUV444:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR444;
+	case HDMI_COLORSPACE_YUV422:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR422;
+	case HDMI_COLORSPACE_YUV420:
+		return DRM_COLOR_FORMAT_ENUM_YCBCR420;
+	default:
+		return DRM_COLOR_FORMAT_ENUM_INVALID;
+	}
+}
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor

-- 
2.53.0

