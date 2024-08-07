Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE2694AB41
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BC810E56B;
	Wed,  7 Aug 2024 15:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tkV3Byw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFD310E56C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 15:05:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A493FCE0FC2;
 Wed,  7 Aug 2024 15:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4B6C32781;
 Wed,  7 Aug 2024 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723043110;
 bh=OvC6sMxuD76yiN1XFOBZZj0bucRN6lbEN30I7smOTaw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tkV3Byw1wD9CTRSpus6P6PR2cuaSeYbS/ZVadxazIXyShleRkRXNiCHwadRh53x5j
 OSPSoWmHrd1W4I+Ev7cocRfoRBKFSyESp3O5rVPpqFqcP2SI33vHvbI4kWG7evbzL6
 WptmbvG8YnCq+w7W1+mjm441t6i9PjiUv4zKQknw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6.10 093/123] drm/ast: astdp: Wake up during connector status
 detection
Date: Wed,  7 Aug 2024 17:00:12 +0200
Message-ID: <20240807150023.836802626@linuxfoundation.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807150020.790615758@linuxfoundation.org>
References: <20240807150020.790615758@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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

6.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 0ce91928ec62d189b5c51816e325f02587b53118 upstream.

Power up the ASTDP connector for connection status detection if the
connector is not active. Keep it powered if a display is attached.

This fixes a bug where the connector does not come back after
disconnecting the display. The encoder's atomic_disable turns off
power on the physical connector. Further HPD reads will fail,
thus preventing the driver from detecting re-connected displays.

For connectors that are actively used, only test the HPD flag without
touching power.

Fixes: f81bb0ac7872 ("drm/ast: report connection status on Display Port.")
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.6+
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240717143319.104012-2-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_dp.c   |    7 +++++++
 drivers/gpu/drm/ast/ast_drv.h  |    1 +
 drivers/gpu/drm/ast/ast_mode.c |   29 +++++++++++++++++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -158,7 +158,14 @@ void ast_dp_launch(struct drm_device *de
 			       ASTDP_HOST_EDID_READ_DONE);
 }
 
+bool ast_dp_power_is_on(struct ast_device *ast)
+{
+	u8 vgacre3;
+
+	vgacre3 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xe3);
 
+	return !(vgacre3 & AST_DP_PHY_SLEEP);
+}
 
 void ast_dp_power_on_off(struct drm_device *dev, bool on)
 {
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -472,6 +472,7 @@ void ast_init_3rdtx(struct drm_device *d
 bool ast_astdp_is_connected(struct ast_device *ast);
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
 void ast_dp_launch(struct drm_device *dev);
+bool ast_dp_power_is_on(struct ast_device *ast);
 void ast_dp_power_on_off(struct drm_device *dev, bool no);
 void ast_dp_set_on_off(struct drm_device *dev, bool no);
 void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -28,6 +28,7 @@
  * Authors: Dave Airlie <airlied@redhat.com>
  */
 
+#include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/pci.h>
 
@@ -1641,11 +1642,35 @@ static int ast_astdp_connector_helper_de
 						 struct drm_modeset_acquire_ctx *ctx,
 						 bool force)
 {
+	struct drm_device *dev = connector->dev;
 	struct ast_device *ast = to_ast_device(connector->dev);
+	enum drm_connector_status status = connector_status_disconnected;
+	struct drm_connector_state *connector_state = connector->state;
+	bool is_active = false;
+
+	mutex_lock(&ast->modeset_lock);
+
+	if (connector_state && connector_state->crtc) {
+		struct drm_crtc_state *crtc_state = connector_state->crtc->state;
+
+		if (crtc_state && crtc_state->active)
+			is_active = true;
+	}
+
+	if (!is_active && !ast_dp_power_is_on(ast)) {
+		ast_dp_power_on_off(dev, true);
+		msleep(50);
+	}
 
 	if (ast_astdp_is_connected(ast))
-		return connector_status_connected;
-	return connector_status_disconnected;
+		status = connector_status_connected;
+
+	if (!is_active && status == connector_status_disconnected)
+		ast_dp_power_on_off(dev, false);
+
+	mutex_unlock(&ast->modeset_lock);
+
+	return status;
 }
 
 static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {


