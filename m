Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B39DED81
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 00:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7749710E369;
	Fri, 29 Nov 2024 23:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D7CCYIUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A7510E5AC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 23:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732921993;
 bh=DVVuUQbmAm99ECO7j4qZY/M+0QSt0nokxG+RYufcIic=;
 h=From:Date:Subject:To:Cc:From;
 b=D7CCYIUXRWqiFElqOu4Us5iv4bvjfbDD4wbkRVSbgm9iiTnu3lqVnBNahOyXN959F
 OcZ6p5FF876Sfb+gWEUuCsNy8xelLDnTAblZ2ZEQemM/cFZJPicgdSYA927Hj1FRLg
 /Q98KWf+YdRqFtEfHBYdW9djy9ungsvtmcir9cg0oksaSN8WFDzZUTN5qwg6d4lB41
 9lEAlSl7ngKB125zq3sh1RNnsrtr4rW1F2fXsti15aoHwdupaXEQo3I8ekzWjG2rY/
 PVXp7vF7hwsNRM15gGimrNclXL0OpD25JtaZ9eh6qotGimsk2oEpOPDM16MOCIoZKa
 NHAA2SHf6QISQ==
Received: from localhost (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8664D17E0290;
 Sat, 30 Nov 2024 00:13:13 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 30 Nov 2024 01:13:01 +0200
Subject: [PATCH] drm/bridge-connector: Prioritize supported_formats over
 ycbcr_420_allowed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-bridge-conn-fmt-prio-v1-1-146b663f17f3@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHxKSmcC/x2MQQqAMAzAviI9W1jVIfgV8aBbpz24SSciiH93e
 EwgeSCzCmcYqgeUL8mSYgGqK3DbHFdG8YWhMU1H1BpcVHyxLsWIYT/xUEnoLPWOOtOzt1DSQzn
 I/W/H6X0/4ipcB2YAAAA=
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

Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..b1bb937da85dbe1dcb1f5e5f621fb02647bcc793 100644
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
+			if (!(bridge->supported_formats & HDMI_COLORSPACE_YUV420))
+				connector->ycbcr_420_allowed = false;
+
 			if (bridge->max_bpc)
 				max_bpc = bridge->max_bpc;
 		}

---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241130-bridge-conn-fmt-prio-c517c1407ed5

