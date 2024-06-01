Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E88D7000
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091D210E13E;
	Sat,  1 Jun 2024 13:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QIGTIiy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0533010E0FD
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717247585;
 bh=b/8Z0IbvDFW+qeJDNTjrqHUhEf0nvgproXHjL4e1WRI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QIGTIiy3XZLCetWY1vfuTkHYAicPqxVBwLZGMg4+CVqjnLOC9tVhCw8R+as9Q8mpt
 izg3Y3PL//M+kLZBoLm5q2NiuEGOhdrcUH5G1m8Yb3IZD+OXdGcbRoiXPNTD5iVrCF
 f4TMtFd+cnIcFs0qm+q2RlEMQtO6Zj2geWLnd6qiQdXz639OJRyA3w5c0opQY49IJ9
 GZrCgrExzVOjmvpVQ/pNxy/W5u8qWn0lKYaBMJtGt/AHUu0WKr1dfxKMGR7JpygMMZ
 vjtR8jKpjdKgTN3Ps8fpm5PsQNlpjaLn2fMcr1ksajJEE7AbbXY7O4eNdDkH6bUyIw
 yCzEhq/KCgvyg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A257E37821ED;
 Sat,  1 Jun 2024 13:13:05 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 01 Jun 2024 16:12:28 +0300
Subject: [PATCH 06/14] drm/bridge: dw-hdmi: Factor out hdmi_data_info setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-b4-rk3588-bridge-upstream-v1-6-f6203753232b@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
X-Mailer: b4 0.14-dev-f7c49
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

In preparation to add support for the HDMI 2.1 Quad-Pixel TX Controller
and minimize code duplication, factor out the hdmi_data_info setup from
dw_hdmi_setup() into a common dw_hdmi_prep_data() helper.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h |  2 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c        | 21 ++++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
index e73b8eb7528b..5fb65db4aaea 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
@@ -156,6 +156,8 @@ void dw_hdmi_prep_avi_infoframe(struct hdmi_avi_infoframe *frame,
 				const struct drm_display_mode *mode);
 struct hdmi_vmode *dw_hdmi_prep_vmode(struct dw_hdmi *hdmi,
 				      const struct drm_display_mode *mode);
+void dw_hdmi_prep_data(struct dw_hdmi *hdmi,
+		       const struct drm_display_mode *mode);
 
 enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 5cf929f68ae9..d124c781da20 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2133,14 +2133,9 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 		    HDMI_IH_MUTE_FC_STAT2);
 }
 
-static int dw_hdmi_setup(struct dw_hdmi *hdmi,
-			 const struct drm_connector *connector,
-			 const struct drm_display_mode *mode)
+void dw_hdmi_prep_data(struct dw_hdmi *hdmi,
+		       const struct drm_display_mode *mode)
 {
-	int ret;
-
-	hdmi_disable_overflow_interrupts(hdmi);
-
 	hdmi->vic = drm_match_cea_mode(mode);
 
 	if (!hdmi->vic) {
@@ -2180,6 +2175,18 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 	hdmi->hdmi_data.pix_repet_factor = 0;
 	hdmi->hdmi_data.hdcp_enable = 0;
 	hdmi->hdmi_data.video_mode.mdataenablepolarity = true;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_prep_data);
+
+static int dw_hdmi_setup(struct dw_hdmi *hdmi,
+			 const struct drm_connector *connector,
+			 const struct drm_display_mode *mode)
+{
+	int ret;
+
+	hdmi_disable_overflow_interrupts(hdmi);
+
+	dw_hdmi_prep_data(hdmi, mode);
 
 	/* HDMI Initialization Step B.1 */
 	hdmi_av_composer(hdmi, &connector->display_info, mode);

-- 
2.45.0

