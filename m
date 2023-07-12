Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAAC7501C3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 10:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9624D10E36F;
	Wed, 12 Jul 2023 08:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D17A10E36F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689151087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbEs8vjh3ovpka3QyRc/gENziblhBWmXzIssM4I2PJ4=;
 b=hPcZ0TjHFT/1Cl4IWsiZrdINspUp58HuRxJCkM4bEdRrzIDXgutdTFUNaHSCH/jnhqm932
 7EvOBXXz4FBizww4lCBVBSbd96XHR9KIrjin5V8NXWQlF0lAZmWK4CMY8T8N9D2OUbfkB0
 WNOVSJHDh6//MJVwkqWBWO+4DN4WLvA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-KaMM2bMYO2G2VSVgzM30lg-1; Wed, 12 Jul 2023 04:38:03 -0400
X-MC-Unique: KaMM2bMYO2G2VSVgzM30lg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCB9B8EBBA5;
 Wed, 12 Jul 2023 08:38:02 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F1C5492C13;
 Wed, 12 Jul 2023 08:38:01 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, jani.nikula@linux.intel.com,
 dianders@chromium.org
Subject: [PATCH v3 2/2] drm/ast: report connection status on Display Port.
Date: Wed, 12 Jul 2023 10:35:54 +0200
Message-ID: <20230712083733.223275-2-jfalempe@redhat.com>
In-Reply-To: <20230712083733.223275-1-jfalempe@redhat.com>
References: <20230712083733.223275-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
The default resolution is now 640x480 when no monitor is connected. But
Aspeed graphics is mostly used in servers, where no monitor is attached.
This also affects the remote BMC resolution to 640x480, which is
inconvenient, and breaks the anaconda installer.

v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
v3: Use .detect_ctx callback, and refactors (Thomas Zimmermann)
    Add a BMC virtual connector

Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID on DP")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_dp.c    | 11 ++++++++++
 drivers/gpu/drm/ast/ast_dp501.c | 37 ++++++++++++++++++++++-----------
 drivers/gpu/drm/ast/ast_drv.h   |  2 ++
 drivers/gpu/drm/ast/ast_mode.c  | 27 ++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 6dc1a09504e1..bf78f3d4aa3f 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -7,6 +7,17 @@
 #include <drm/drm_print.h>
 #include "ast_drv.h"
 
+bool ast_astdp_is_connected(struct ast_device *ast)
+{
+	if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, ASTDP_MCU_FW_EXECUTING))
+		return false;
+	if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, ASTDP_LINK_SUCCESS))
+		return false;
+	if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, ASTDP_HPD))
+		return false;
+	return true;
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
index c9659e72002f..848a9f1403e8 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -514,6 +514,7 @@ void ast_patch_ahb_2500(struct ast_device *ast);
 /* ast dp501 */
 void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
 bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
+bool ast_dp501_is_connected(struct ast_device *ast);
 bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
@@ -522,6 +523,7 @@ void ast_init_3rdtx(struct drm_device *dev);
 struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
 
 /* aspeed DP */
+bool ast_astdp_is_connected(struct ast_device *ast);
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
 void ast_dp_launch(struct drm_device *dev);
 void ast_dp_power_on_off(struct drm_device *dev, bool no);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 8896b22eb5cf..8d019a785fb4 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1582,8 +1582,22 @@ static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static int ast_dp501_connector_helper_detect_ctx(
+	struct drm_connector *connector,
+	struct drm_modeset_acquire_ctx *ctx,
+	bool force)
+{
+	struct ast_device *ast = to_ast_device(connector->dev);
+
+	if (ast_dp501_is_connected(ast))
+		return connector_status_connected;
+	return connector_status_disconnected;
+}
+
+
 static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
 	.get_modes = ast_dp501_connector_helper_get_modes,
+	.detect_ctx = ast_dp501_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_dp501_connector_funcs = {
@@ -1680,8 +1694,21 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static int ast_astdp_connector_helper_detect_ctx(
+	struct drm_connector *connector,
+	struct drm_modeset_acquire_ctx *ctx,
+	bool force)
+{
+	struct ast_device *ast = to_ast_device(connector->dev);
+
+	if (ast_astdp_is_connected(ast))
+		return connector_status_connected;
+	return connector_status_disconnected;
+}
+
 static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
 	.get_modes = ast_astdp_connector_helper_get_modes,
+	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_astdp_connector_funcs = {
-- 
2.41.0

