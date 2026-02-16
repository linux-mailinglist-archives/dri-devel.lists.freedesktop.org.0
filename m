Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK1qN10Vk2nD1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:02:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6354E14387B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7EC10E19E;
	Mon, 16 Feb 2026 13:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="gaxXP8Xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C6110E19E;
 Mon, 16 Feb 2026 13:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771246929; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=T06pjv0CfT4bVh0U3NXZON3T33KH29hxdIqPPYlzEV5CapQDNdriu+sxh+RX7VG4VUqkGoAkNxk2FlxXk8ARqf7JFoSrnb0qPxB/1kCQy4J7rMiqyDLsVqOjzANcLi8Yht8ZVCQmcrtls4eUAvy4sYLtZyOWG6wvUGcZZxkuzao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771246929;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ps/3KHfahzE4CA312vsVuNcKxzi74v58TBa5PtaiWoo=; 
 b=WwZ83nOP+RxoAqjXsNj7A0Duic26PCxZoymUq17CsIlU3bXylgyLbrTqUStqrldK7FfG0vjCug/k0EsOK3ORDwLQDW5WLBLuppktWpbwnMoOUR0UoVHC7b3CqiijDPNTFJJtGWJH1ZAWBtcWepAxsB9z6QQyaAf9c+87QaUzfQw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771246929; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Ps/3KHfahzE4CA312vsVuNcKxzi74v58TBa5PtaiWoo=;
 b=gaxXP8XnBCk4o6tA7GWn/+ooa2ZFozNFTn+6S5YEsbywsF5vMdfjKB1PgsWrj3Ar
 VPrf0bMWie/UZYZWmuC+OVdwATgz1OQ7d241K1S8LRwYHQRpTPZUxjenc3Dwn6UHyyu
 Voasj9EAGNAV7NSFhu+aswo56LGLpFyVVQMBUlmo=
Received: by mx.zohomail.com with SMTPS id 1771246928485527.7495564542533;
 Mon, 16 Feb 2026 05:02:08 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Feb 2026 14:01:18 +0100
Subject: [PATCH v8 04/20] drm/bridge: Act on the DRM color format property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-color-format-v8-4-5722ce175dd5@collabora.com>
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
	RCPT_COUNT_TWELVE(0.00)[37];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 6354E14387B
X-Rspamd-Action: no action

The new DRM color format property allows userspace to request a specific
color format on a connector. In turn, this fills the connector state's
color_format member to switch color formats.

Make drm_bridges consider the color_format set in the connector state
during the atomic bridge check. For bridges that represent HDMI bridges,
rely on whatever format the HDMI logic set. Reject any output bus
formats that do not correspond to the requested color format.

Non-HDMI last bridges with DRM_COLOR_FORMAT_ENUM_AUTO set will end up
choosing the first output format that functions to make a whole
recursive bridge chain format selection succeed.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 78 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 94864e05619d..36a5158f0554 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1117,6 +1117,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 	return ret;
 }
 
+static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_color_format_enum fmt)
+{
+	if (fmt == DRM_COLOR_FORMAT_ENUM_AUTO)
+		return true;
+
+	switch (bus_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+		return true;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		return fmt == DRM_COLOR_FORMAT_ENUM_RGB444;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		return fmt == DRM_COLOR_FORMAT_ENUM_YCBCR444;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_VYUY10_1X20:
+	case MEDIA_BUS_FMT_YVYU10_1X20:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+	case MEDIA_BUS_FMT_VYUY12_1X24:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
+	case MEDIA_BUS_FMT_YVYU12_1X24:
+		return fmt == DRM_COLOR_FORMAT_ENUM_YCBCR422;
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		return fmt == DRM_COLOR_FORMAT_ENUM_YCBCR420;
+	default:
+		return false;
+	}
+}
+
 /*
  * This function is called by &drm_atomic_bridge_chain_check() just before
  * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
@@ -1160,6 +1201,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_bridge_state *last_bridge_state;
 	unsigned int i, num_out_bus_fmts = 0;
+	enum drm_color_format_enum fmt;
 	u32 *out_bus_fmts;
 	int ret = 0;
 
@@ -1201,13 +1243,47 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
 	}
 
+	/*
+	 * On HDMI connectors, use the output format chosen by whatever does the
+	 * HDMI logic. For everyone else, just trust that the bridge out_bus_fmts
+	 * are sorted by preference for %DRM_COLOR_FORMAT_AUTO, as
+	 * bus_format_is_color_fmt() always returns true for AUTO.
+	 */
+	if (last_bridge->ops & DRM_BRIDGE_OP_HDMI) {
+		fmt = drm_color_format_enum_from_hdmi_colorspace(conn_state->hdmi.output_format);
+		if (fmt == DRM_COLOR_FORMAT_ENUM_INVALID) {
+			ret = -EINVAL;
+			drm_dbg_kms(last_bridge->dev,
+				    "Couldn't convert HDMI format to DRM format\n");
+			goto out_free;
+		}
+		drm_dbg_kms(last_bridge->dev, "HDMI bridge requests format %s\n",
+			    drm_get_color_format_name(fmt));
+	} else {
+		fmt = conn_state->color_format;
+		drm_dbg_kms(last_bridge->dev, "Non-HDMI bridge requests format %s\n",
+			    drm_get_color_format_name(fmt));
+	}
+
 	for (i = 0; i < num_out_bus_fmts; i++) {
+		if (!bus_format_is_color_fmt(out_bus_fmts[i], fmt)) {
+			drm_dbg_kms(last_bridge->dev,
+				    "Skipping bus format 0x%04x as it doesn't match %s\n",
+				    out_bus_fmts[i], drm_get_color_format_name(fmt));
+			ret = -ENOTSUPP;
+			continue;
+		}
 		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
 					       conn_state, out_bus_fmts[i]);
-		if (ret != -ENOTSUPP)
+		if (ret != -ENOTSUPP) {
+			drm_dbg_kms(last_bridge->dev,
+				    "Found bridge chain ending with bus format 0x%04x\n",
+				    out_bus_fmts[i]);
 			break;
+		}
 	}
 
+out_free:
 	kfree(out_bus_fmts);
 
 	return ret;

-- 
2.53.0

