Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73597498DC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423FE10E4C0;
	Thu,  6 Jul 2023 10:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CB210E4C0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688637692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=corwgVGyYcNB96CJKCi0rOk04IZRSazqcIEjefoKIsE=;
 b=LonSM+foLYIJeKnPblT0GAdKUJDXmPN5UGejH6fzcWUnbY8xSm3qYq1hmC7rjn8rlqEAx+
 wYzNaUqHn6reR0sWC4JHlF8Cwijo0BP+K+tEPC34IYN6fxGVgvyh7kHFov8xGKs8OrEkaF
 CkfjPXX9fVeDy7u7U1iLTG2fOuhbmb4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-jv_wig3sNhy5Ah8quHsdpg-1; Thu, 06 Jul 2023 06:01:29 -0400
X-MC-Unique: jv_wig3sNhy5Ah8quHsdpg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC3DD280D200;
 Thu,  6 Jul 2023 10:01:28 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1839492B01;
 Thu,  6 Jul 2023 10:01:25 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, jani.nikula@linux.intel.com
Subject: [PATCH v2] drm/ast: report connection status on Display Port.
Date: Thu,  6 Jul 2023 11:58:41 +0200
Message-ID: <20230706100102.563458-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Aspeed always report the display port as "connected", because it
doesn't set a .detect callback.
Fix this by providing the proper detect callback for astdp and dp501.

This also fixes the following regression:
Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
 EDID on DP")
The default resolution is now 640x480 when no monitor is connected.
But Aspeed graphics is mostly used in servers, where no monitor
is attached. This also affects the remote BMC resolution to 640x480,
which is inconvenient, and breaks the anaconda installer.

v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_dp.c    |  9 ++++++++
 drivers/gpu/drm/ast/ast_dp501.c | 37 ++++++++++++++++++++++-----------
 drivers/gpu/drm/ast/ast_drv.h   |  2 ++
 drivers/gpu/drm/ast/ast_mode.c  | 24 +++++++++++++++++++++
 4 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 6dc1a09504e1..fbc154930fdf 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -7,6 +7,15 @@
 #include <drm/drm_print.h>
 #include "ast_drv.h"
 
+bool ast_astdp_is_connected(struct ast_device *ast)
+{
+	if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, ASTDP_MCU_FW_EXECUTING) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, ASTDP_LINK_SUCCESS) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, ASTDP_HPD))
+		return true;
+	return false;
+}
+
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 {
 	struct ast_device *ast = to_ast_device(dev);
diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index a5d285850ffb..f10d53b0c94f 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -272,11 +272,9 @@ static bool ast_launch_m68k(struct drm_device *dev)
 	return true;
 }
 
-bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
+bool ast_dp501_is_connected(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
-	u32 i, boot_address, offset, data;
-	u32 *pEDIDidx;
+	u32 boot_address, offset, data;
 
 	if (ast->config_mode == ast_use_p2a) {
 		boot_address = get_fw_base(ast);
@@ -292,14 +290,6 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
 		data = ast_mindwm(ast, boot_address + offset);
 		if (!(data & AST_DP501_PNP_CONNECTED))
 			return false;
-
-		/* Read EDID */
-		offset = AST_DP501_EDID_DATA;
-		for (i = 0; i < 128; i += 4) {
-			data = ast_mindwm(ast, boot_address + offset + i);
-			pEDIDidx = (u32 *)(ediddata + i);
-			*pEDIDidx = data;
-		}
 	} else {
 		if (!ast->dp501_fw_buf)
 			return false;
@@ -319,7 +309,30 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
 		data = readl(ast->dp501_fw_buf + offset);
 		if (!(data & AST_DP501_PNP_CONNECTED))
 			return false;
+	}
+	return true;
+}
+
+bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
+{
+	struct ast_device *ast = to_ast_device(dev);
+	u32 i, boot_address, offset, data;
+	u32 *pEDIDidx;
+
+	if (!ast_dp501_is_connected(ast))
+		return false;
+
+	if (ast->config_mode == ast_use_p2a) {
+		boot_address = get_fw_base(ast);
 
+		/* Read EDID */
+		offset = AST_DP501_EDID_DATA;
+		for (i = 0; i < 128; i += 4) {
+			data = ast_mindwm(ast, boot_address + offset + i);
+			pEDIDidx = (u32 *)(ediddata + i);
+			*pEDIDidx = data;
+		}
+	} else {
 		/* Read EDID */
 		offset = AST_DP501_EDID_DATA;
 		for (i = 0; i < 128; i += 4) {
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 3f6e0c984523..99a24d779b9c 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -510,6 +510,7 @@ void ast_patch_ahb_2500(struct ast_device *ast);
 /* ast dp501 */
 void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
 bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
+bool ast_dp501_is_connected(struct ast_device *ast);
 bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
@@ -518,6 +519,7 @@ void ast_init_3rdtx(struct drm_device *dev);
 struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
 
 /* aspeed DP */
+bool ast_astdp_is_connected(struct ast_device *ast);
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
 void ast_dp_launch(struct drm_device *dev);
 void ast_dp_power_on_off(struct drm_device *dev, bool no);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index f711d592da52..ccf48d57d239 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1586,12 +1586,24 @@ static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs
 	.get_modes = ast_dp501_connector_helper_get_modes,
 };
 
+static enum drm_connector_status ast_dp501_connector_helper_detect(
+	struct drm_connector *connector,
+	bool force)
+{
+	struct ast_device *ast = to_ast_device(connector->dev);
+
+	if (ast_dp501_is_connected(ast))
+		return connector_status_connected;
+	return connector_status_disconnected;
+}
+
 static const struct drm_connector_funcs ast_dp501_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.detect = ast_dp501_connector_helper_detect,
 };
 
 static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector *connector)
@@ -1684,12 +1696,24 @@ static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs
 	.get_modes = ast_astdp_connector_helper_get_modes,
 };
 
+static enum drm_connector_status ast_astdp_connector_helper_detect(
+	struct drm_connector *connector,
+	bool force)
+{
+	struct ast_device *ast = to_ast_device(connector->dev);
+
+	if (ast_astdp_is_connected(ast))
+		return connector_status_connected;
+	return connector_status_disconnected;
+}
+
 static const struct drm_connector_funcs ast_astdp_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.detect = ast_astdp_connector_helper_detect,
 };
 
 static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector *connector)

base-commit: b32d5a51f3c21843011d68a58e6ac0b897bce9f2
-- 
2.41.0

