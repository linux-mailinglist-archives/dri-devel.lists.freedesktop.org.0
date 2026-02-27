Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EFeCK/uoWm5xQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:21:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AB21BCA05
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC3810EBFB;
	Fri, 27 Feb 2026 19:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QMCG0Fg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96E910EBFB;
 Fri, 27 Feb 2026 19:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772220065; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CuDtymhFYBZKAp4fGdd2gpif9YWaDf+JeJJ+ImGvix0qeFNETuBWQYtYhBYgpq2I0cQZWyl8wedtjuDSVmeAtCaPhLCGrr7h+4ymI9tVVoVBKC+Akczk8diUbBb1f9CSCxPDjbWny+3athkkW70ihT6H/b6uF4HzAPhN3vJqVxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772220065;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7CRAmTFQCtq+1fmVyGcK9BYvQbCYnvTEoio6+jtAKiI=; 
 b=mTa+TVkdHMYMHNKMjOktCKWVMRJx9eYj+RS0KdfuRzaCtRC5+/aUNpVr2QCDookul3xyGjfdpg+s/R165cjnw1HCou14Y1KeDawNtHXFahh7Ypwv3swcMpjqz9e+rbh7StYlu0c+CZyPZ8BMqO01MRC2AhceMQ11gjZqjhIuDfA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220065; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=7CRAmTFQCtq+1fmVyGcK9BYvQbCYnvTEoio6+jtAKiI=;
 b=QMCG0Fg20PpjZuW8trMWkofAxH7FKBIRjKUH4CvoPnIVYAUQK/cOUnYa0YaMcIYM
 fW+uEEikuPV4avBJ+GMz1OsAE64w6citd4HdGmbZpeLn45Jyc+AqTD9jyYVOASm4iUf
 b1bSBQKn6YiHj44iq7zUkCfA7P+z194if/V6TaV8=
Received: by mx.zohomail.com with SMTPS id 1772220064429633.5205645122492;
 Fri, 27 Feb 2026 11:21:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:09 +0100
Subject: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
In-Reply-To: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: C2AB21BCA05
X-Rspamd-Action: no action

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by translating the requested drm_connector_color_format to
a drm_output_color_format enum value as per the logic HDMI should use
for this: Auto is translated to RGB, and a fallback to YUV420 is only
performed if the original color format was auto.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9f3b696aceeb..31c6d55fa995 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -669,10 +669,34 @@ hdmi_compute_config(const struct drm_connector *connector,
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
+	enum drm_output_color_format fmt;
 	int ret;
 
-	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
-				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	switch (conn_state->color_format) {
+	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+		break;
+	default:
+		drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\n",
+			    conn_state->color_format);
+		return -EINVAL;
+	}
+
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
+
+	if (conn_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO)
+		return ret;
+
 	if (ret) {
 		if (connector->ycbcr_420_allowed) {
 			ret = hdmi_compute_format_bpc(connector, conn_state,

-- 
2.53.0

