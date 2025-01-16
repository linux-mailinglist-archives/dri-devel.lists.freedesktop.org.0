Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7AA13C3E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828A10E989;
	Thu, 16 Jan 2025 14:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F2D10E989;
 Thu, 16 Jan 2025 14:29:08 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 2/2] drm/client: Handle tiled displays better
Date: Thu, 16 Jan 2025 15:28:25 +0100
Message-ID: <20250116142825.3933-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116142825.3933-1-dev@lankhorst.se>
References: <20250116142825.3933-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When testing on my tiled display, initially the tiled display is
detected correctly:
[90376.523692] xe 0000:67:00.0: [drm:drm_client_firmware_config.isra.0 [drm]] fallback: Not all outputs enabled
[90376.523713] xe 0000:67:00.0: [drm:drm_client_firmware_config.isra.0 [drm]] Enabled: 0, detected: 2
...
[90376.523967] xe 0000:67:00.0: [drm:drm_client_modeset_probe [drm]] [CRTC:82:pipe A] desired mode 1920x2160 set (1920,0)
[90376.524020] xe 0000:67:00.0: [drm:drm_client_modeset_probe [drm]] [CRTC:134:pipe B] desired mode 1920x2160 set (0,0)

But then, when modes have been set:
[90379.729525] xe 0000:67:00.0: [drm:drm_client_firmware_config.isra.0 [drm]] [CONNECTOR:287:DP-4] on [CRTC:82:pipe A]: 1920x2160
[90379.729640] xe 0000:67:00.0: [drm:drm_client_firmware_config.isra.0 [drm]] [CONNECTOR:289:DP-5] on [CRTC:134:pipe B]: 1920x2160
...
[90379.730036] xe 0000:67:00.0: [drm:drm_client_modeset_probe [drm]] [CRTC:82:pipe A] desired mode 1920x2160 set (0,0)
[90379.730124] xe 0000:67:00.0: [drm:drm_client_modeset_probe [drm]] [CRTC:134:pipe B] desired mode 1920x2160 set (0,0)

Call drm_client_get_tile_offsets() in drm_client_firmware_config() as
well, to ensure that the offset is set correctly.

This has to be done as a separate pass, as the tile order may not be
equal to the drm connector order.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_client_modeset.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 251f943137179..aca442c25209a 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -743,6 +743,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	if ((conn_configured & mask) != mask && conn_configured != conn_seq)
 		goto retry;
 
+	for (i = 0; i < count; i++) {
+		struct drm_connector *connector = connectors[i];
+
+		if (connector->has_tile)
+			drm_client_get_tile_offsets(dev, connectors, connector_count,
+						    modes, offsets, i,
+						    connector->tile_h_loc, connector->tile_v_loc);
+	}
+
 	/*
 	 * If the BIOS didn't enable everything it could, fall back to have the
 	 * same user experiencing of lighting up as much as possible like the
-- 
2.43.0

