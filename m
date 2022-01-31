Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9FF4A58E5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A1810EA2E;
	Tue,  1 Feb 2022 09:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1676 seconds by postgrey-1.36 at gabe;
 Mon, 31 Jan 2022 17:15:39 UTC
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5847C10E146
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 17:15:39 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8411AD4C49
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 16:47:46 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 734F6240003;
 Mon, 31 Jan 2022 16:47:38 +0000 (UTC)
From: quentin.schulz@theobroma-systems.com
To: 
Subject: [PATCH 1/3] drm/panel: ltk050h3146w: add mipi_dsi_device.mode_flags
 to of_match_data
Date: Mon, 31 Jan 2022 17:47:21 +0100
Message-Id: <20220131164723.714836-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Feb 2022 09:01:14 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Quentin Schulz <foss+kernel@0leil.net>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

To prepare for a new display to be supported by this driver which has a
slightly different set of DSI mode related flags, let's move the
currently hardcoded mode flags to the .data field of of_device_id
structure.

Cc: Quentin Schulz <foss+kernel@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index a5a414920430..67eb474e28c6 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -25,6 +25,7 @@ struct ltk050h3146w_cmd {
 
 struct ltk050h3146w;
 struct ltk050h3146w_desc {
+	const unsigned long mode_flags;
 	const struct drm_display_mode *mode;
 	int (*init)(struct ltk050h3146w *ctx);
 };
@@ -339,6 +340,8 @@ static const struct drm_display_mode ltk050h3146w_mode = {
 static const struct ltk050h3146w_desc ltk050h3146w_data = {
 	.mode = &ltk050h3146w_mode,
 	.init = ltk050h3146w_init_sequence,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
 };
 
 static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int page)
@@ -433,6 +436,8 @@ static const struct drm_display_mode ltk050h3146w_a2_mode = {
 static const struct ltk050h3146w_desc ltk050h3146w_a2_data = {
 	.mode = &ltk050h3146w_a2_mode,
 	.init = ltk050h3146w_a2_init_sequence,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
 };
 
 static int ltk050h3146w_unprepare(struct drm_panel *panel)
@@ -592,8 +597,7 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+	dsi->mode_flags = ctx->panel_desc->mode_flags;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &ltk050h3146w_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-- 
2.34.1

