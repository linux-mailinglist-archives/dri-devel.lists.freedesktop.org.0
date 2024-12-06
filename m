Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8649E795F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 21:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9837910F1A7;
	Fri,  6 Dec 2024 20:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EcGL0vVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B8610F1A7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 20:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733515261;
 bh=wJFpZYjvbcAJE78Oh0X5Elu4itegB/Xs0WGo8oeSKBQ=;
 h=From:Date:Subject:To:Cc:From;
 b=EcGL0vVNeFDYa6IY+f1PKKRtqJNpP/80lV83Ha5FDs8JdfeKPuRJUOZP4kjfIwL9C
 Wjx5SRf6romQeFbR56pv5exChrWNeHO42SAS22hn0dwCGS7vGYCHgsMTtNO0cQP3aS
 7Ni8ohBspgedEHO4z4Lk8gi3npJghkNLpZn4W/B/LPXf3NlwykoiW/Vjl4j+PHy1b7
 wTMv73lw170EAQGTr4lORz4wMfRRpV6r9t4ulBe4T43kyxUOnOsRO4EmufFA3nt+oO
 s8XDmmNFMZryrKWiV6/4jEJr+4z19hTdK5cP/fFgnRTV87LDzNjDpb1R+pLf72r4PK
 +vaybO7DQZzVg==
Received: from localhost (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B48CA17E37E7;
 Fri,  6 Dec 2024 21:01:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 06 Dec 2024 22:00:46 +0200
Subject: [PATCH v2] drm/bridge-connector: Prioritize supported_formats over
 ycbcr_420_allowed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-bridge-conn-fmt-prio-v2-1-85c817529b88@collabora.com>
X-B4-Tracking: v=1; b=H4sIAO1XU2cC/4WNTQqDMBCFryKzbooT/6Cr3kNcJDGpA5qRiUiLe
 PemXqC81ffgfe+A5IV8gkdxgPidEnHMoG8FuMnEl1c0ZgZd6hqxKpUVGnPrOEYVlk2tQqxcg53
 Duuz82ECeruIDvS9tP2SeKG0sn+tlx1/7R7ijyqlb27ZVwC5UT8fzbCyLuTteYDjP8wuCwjq+v
 AAAAA==
X-Change-ID: 20241130-bridge-conn-fmt-prio-c517c1407ed5
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Bridges having the DRM_BRIDGE_OP_HDMI flag set in drm_bridge->ops are
supposed to rely on drm_bridge->supported_formats bitmask to advertise
the supported colorspaces, including HDMI_COLORSPACE_YUV420.  Therefore,
the newly introduced drm_bridge->ycbcr_420_allowed flag becomes
redundant in this particular context.

Moreover, when drm_bridge_connector gets initialised, only
drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
the equivalent property of the base drm_connector, which effectively
discards the formats advertised by the HDMI bridge.

Handle the inconsistency by ignoring ycbcr_420_allowed for HDMI bridges
and, instead, make use of the supported_formats bitmask when setting up
the bridge connector.

Additionally, ensure the YUV420 related bit is removed from the bitmask
passed to drmm_connector_hdmi_init() when the final ycbcr_420_allowed
flag for the connector ends up not being set (i.e. the case of having at
least one non-HDMI bridge in the pipeline that didn't enable it).

Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Wrapped HDMI_COLORSPACE_YUV420 flag in the BIT() macro to properly
  check its presence in supported_formats
- Ensured YUV420 gets removed from the bitmask passed to
  drmm_connector_hdmi_init() when ycbcr_420_allowed is not set
- Link to v1: https://lore.kernel.org/r/20241130-bridge-conn-fmt-prio-v1-1-146b663f17f3@collabora.com
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..1f05278b8683a25a845f943720c76faeed24c2e2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -414,7 +414,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	drm_for_each_bridge_in_chain(encoder, bridge) {
 		if (!bridge->interlace_allowed)
 			connector->interlace_allowed = false;
-		if (!bridge->ycbcr_420_allowed)
+		if (!bridge->ycbcr_420_allowed && !(bridge->ops & DRM_BRIDGE_OP_HDMI))
 			connector->ycbcr_420_allowed = false;
 
 		if (bridge->ops & DRM_BRIDGE_OP_EDID)
@@ -436,6 +436,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 			if (bridge->supported_formats)
 				supported_formats = bridge->supported_formats;
+
+			if (!(bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV420)))
+				connector->ycbcr_420_allowed = false;
+
 			if (bridge->max_bpc)
 				max_bpc = bridge->max_bpc;
 		}
@@ -459,7 +463,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		if (!connector->ycbcr_420_allowed)
+			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -468,10 +475,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
+	}
 	if (ret)
 		return ERR_PTR(ret);
 

---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241130-bridge-conn-fmt-prio-c517c1407ed5

