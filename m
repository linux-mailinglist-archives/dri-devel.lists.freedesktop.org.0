Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBB8BEA921
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD7D10EC8C;
	Fri, 17 Oct 2025 16:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M46xBQ0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EA910EC8A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:15:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D99481A1488;
 Fri, 17 Oct 2025 16:15:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ACFD5606DB;
 Fri, 17 Oct 2025 16:15:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D28D6102F2326; 
 Fri, 17 Oct 2025 18:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760717749; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sF/nhZKtfysMmP54ubTvP/iQM/X0HdA/QjQ50RURtXU=;
 b=M46xBQ0Cqed1BxM8oRLaViX5BJmNwme4wCTVE3XLHaIthNEs1xOI9NUK2vbzoOH7BuM8R5
 nsBbnKQeNI+nzcMvpn1Edr9J1xO/GRH3Do1/i4GcT/26LlZ8586uanLUm5bEF2MfUUTlfU
 9ImBuVky8gIH10sRHhfa8x4VOSFvPIK1utx3o7qDQHe3lqrGFW2ZRRmEKjlCyCGmeV43ue
 XiWM8rmhPZPo4kJXicKAJn6jJu6TSSKIEa7ilj873CaKNd3hAH2GE5bViC2nA5MlZZENXV
 OYpzxusqHgaUwcR53AtrcRCe7I/KSl7qB7cOKGb+Ond2lz5q49PtMrm6EZvMCA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 17 Oct 2025 18:15:06 +0200
Subject: [PATCH v2 3/3] drm/display: bridge_connector: get/put the panel_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-3-667abf6d47c0@bootlin.com>
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

The panel_bridge pointer is taken inside the loop and used after the
loop. Being a local variable, use a cleanup action to ensure it is put on
return.

Based on the code structure the panel_bridge pointer might be assigned
during multiple loop iterations. Even though this is probably not possible
in the practice, ensure there is no reference leak by putting the reference
to the old value before overwriting with the new value.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v2:
- taking the panel_bridge specific code from the original (buggy) patch,
  and split it for clarity from the larger patch covering stored bridge
  pointers
- comapred to the original code, added drm_bridge_put() for extra safety
  even though likely not necessary
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 95ccf86527129edaa6fcc75c6202985e73c46da8..a2d30cf9e06df44b89456b5aba8198ee1e5d5601 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -652,7 +652,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
-	struct drm_bridge *panel_bridge = NULL;
+	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
 	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
 	bool support_hdcp = false;
@@ -787,8 +787,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ddc)
 			ddc = bridge->ddc;
 
-		if (drm_bridge_is_panel(bridge))
-			panel_bridge = bridge;
+		if (drm_bridge_is_panel(bridge)) {
+			drm_bridge_put(panel_bridge);
+			panel_bridge = drm_bridge_get(bridge);
+		}
 
 		if (bridge->support_hdcp)
 			support_hdcp = true;

-- 
2.51.0

