Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4CF8D6FFF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A0710E0D2;
	Sat,  1 Jun 2024 13:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CcIMQRSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7012610E0D2
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717247587;
 bh=0XPNMqqFtOhoxjrDgj6/3VgASXxe/+nxRaHRw8jQO2Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CcIMQRSyY1+Z92ftcrx1DteAUgwOPwlot84JpoOPX/eObZdYfStC0xX4VzqfB53xr
 r+0ty4/5Fw1SKcNW/6WYGoAGRc7jh8Rme12L9IHJVFY+vT/UpoAVGdUs0/oBblNXtQ
 KRiUteamltWxYkVn6xDg+DF5ndxcgY7v+Dh+SMnDIzd+LzHFvqCAtBC8Gds6CswbGv
 4yTRffFSMfkQPeM7tPorG8R0anVEmck3TajYYctUBN8fSiIbHvaDu597h1eu36aAxK
 yiqHd+U4Y7YZdD2LZwVoGXPLhBBL58hyeZixdKyIgiPDm72+gmxBJhdnyr7u7dIYG2
 sIuEp4Nrj8HUw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD74437821EF;
 Sat,  1 Jun 2024 13:13:06 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 01 Jun 2024 16:12:29 +0300
Subject: [PATCH 07/14] drm/bridge: dw-hdmi: Commonize
 dw_hdmi_connector_create()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-b4-rk3588-bridge-upstream-v1-7-f6203753232b@collabora.com>
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
and minimize code duplication, export dw_hdmi_connector_create()
function, while adding a new parameter to allow using a different
drm_connector_funcs structure.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h | 2 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c        | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
index 5fb65db4aaea..512fbaa1bb0c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
@@ -161,6 +161,8 @@ void dw_hdmi_prep_data(struct dw_hdmi *hdmi,
 
 enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force);
+int dw_hdmi_connector_create(struct dw_hdmi *hdmi,
+			     const struct drm_connector_funcs *funcs);
 
 int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 				struct drm_bridge_state *bridge_state,
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index d124c781da20..95c9ccb809ec 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2469,7 +2469,8 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.atomic_check = dw_hdmi_connector_atomic_check,
 };
 
-static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
+int dw_hdmi_connector_create(struct dw_hdmi *hdmi,
+			     const struct drm_connector_funcs *funcs)
 {
 	struct drm_connector *connector = &hdmi->connector;
 	struct cec_connector_info conn_info;
@@ -2487,7 +2488,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
 
 	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
-				    &dw_hdmi_connector_funcs,
+				    funcs ? funcs : &dw_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
 
@@ -2516,6 +2517,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_hdmi_connector_create);
 
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
@@ -2804,7 +2806,7 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
 					 bridge, flags);
 
-	return dw_hdmi_connector_create(hdmi);
+	return dw_hdmi_connector_create(hdmi, NULL);
 }
 
 void dw_hdmi_bridge_detach(struct drm_bridge *bridge)

-- 
2.45.0

