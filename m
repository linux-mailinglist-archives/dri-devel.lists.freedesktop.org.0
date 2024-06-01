Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CAF8D6FFB
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554BA10E11D;
	Sat,  1 Jun 2024 13:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="m6CKoWUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEBF10E0D2
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717247584;
 bh=wdTfL3nRIT/i+BGqWfrDyHK4xJeuD/9ukGuYk+DmWew=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=m6CKoWUXxqep7cMzq8BiuH4GBKCkAcKYFtsJnatfngYUx1pOTHpmi3Uj+EvCKdnFM
 VLqRBcCSiGT3NC4mx6FbdbysQ1hs8VmLSUVaWI8uSIJyLB+4fhxfL5vOXKMeXVtKR1
 D9qhllMmBdlfRoiBpUhjHXTWJln1viwNQosSMj+CkiiSOCttanMgqdDF8MN+WfdBsd
 12I+YJZykeGgtUzc8bLkVaqyLoHTH8ZSI8xCf/rSD7Mo8VgLgt6CXjnjg4BCDLj0ST
 ImUSsLk/bea73FOSS6Z5hmfy2gYRExXAUJuDqK1tzfvGRjVpxx2vmhx6EOgni2F/+/
 TNy1dzihq1B/w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6745D37821EE;
 Sat,  1 Jun 2024 13:13:04 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 01 Jun 2024 16:12:27 +0300
Subject: [PATCH 05/14] drm/bridge: dw-hdmi: Factor out vmode setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-b4-rk3588-bridge-upstream-v1-5-f6203753232b@collabora.com>
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
and minimize code duplication, factor out the vmode setup from
hdmi_av_composer() into a common dw_hdmi_prep_vmode() helper.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h |  2 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c        | 23 ++++++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
index 0569196bbe3b..e73b8eb7528b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
@@ -154,6 +154,8 @@ void dw_hdmi_prep_avi_infoframe(struct hdmi_avi_infoframe *frame,
 				struct dw_hdmi *hdmi,
 				const struct drm_connector *connector,
 				const struct drm_display_mode *mode);
+struct hdmi_vmode *dw_hdmi_prep_vmode(struct dw_hdmi *hdmi,
+				      const struct drm_display_mode *mode);
 
 enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 81d73fbcb2e6..5cf929f68ae9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1864,15 +1864,10 @@ static void hdmi_config_drm_infoframe(struct dw_hdmi *hdmi,
 		  HDMI_FC_PACKET_TX_EN_DRM_MASK, HDMI_FC_PACKET_TX_EN);
 }
 
-static void hdmi_av_composer(struct dw_hdmi *hdmi,
-			     const struct drm_display_info *display,
-			     const struct drm_display_mode *mode)
+struct hdmi_vmode *dw_hdmi_prep_vmode(struct dw_hdmi *hdmi,
+				      const struct drm_display_mode *mode)
 {
-	u8 inv_val, bytes;
-	const struct drm_hdmi_info *hdmi_info = &display->hdmi;
 	struct hdmi_vmode *vmode = &hdmi->hdmi_data.video_mode;
-	int hblank, vblank, h_de_hs, v_de_vs, hsync_len, vsync_len;
-	unsigned int vdisplay, hdisplay;
 
 	vmode->mpixelclock = mode->clock * 1000;
 
@@ -1900,6 +1895,20 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	dev_dbg(hdmi->dev, "final tmdsclock = %d\n", vmode->mtmdsclock);
 
+	return vmode;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_prep_vmode);
+
+static void hdmi_av_composer(struct dw_hdmi *hdmi,
+			     const struct drm_display_info *display,
+			     const struct drm_display_mode *mode)
+{
+	u8 inv_val, bytes;
+	const struct drm_hdmi_info *hdmi_info = &display->hdmi;
+	struct hdmi_vmode *vmode = dw_hdmi_prep_vmode(hdmi, mode);
+	int hblank, vblank, h_de_hs, v_de_vs, hsync_len, vsync_len;
+	unsigned int vdisplay, hdisplay;
+
 	/* Set up HDMI_FC_INVIDCONF */
 	inv_val = (hdmi->hdmi_data.hdcp_enable ||
 		   (dw_hdmi_support_scdc(hdmi, display) &&

-- 
2.45.0

