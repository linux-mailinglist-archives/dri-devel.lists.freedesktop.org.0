Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365B194AA46
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 16:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCA910E549;
	Wed,  7 Aug 2024 14:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="he18nhNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAC810E549
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 14:37:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39A6C6102E;
 Wed,  7 Aug 2024 14:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B028FC32781;
 Wed,  7 Aug 2024 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723041449;
 bh=j/025TqMPnM58Bt8EkAtGeN0RwgMYUhBGvF7QTQGNaw=;
 h=Subject:To:Cc:From:Date:From;
 b=he18nhNZrjcaly9FMFP/eKREWgNt/Lt+QIR9KI/TvF+/2PKMWPV+9e2JLt2cCxH1I
 IX2dYgr0R0dGP9+7sP7iCXLso3B3S4D1asgKORSPSwzrluuT4Hyxjo1ak1D77ZObLI
 fYpSrqT7O84NZ2MLWcSUg+tGDcBs06T0ml0MCZ48=
Subject: Patch "drm/ast: astdp: Wake up during connector status detection" has
 been added to the 6.6-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 07 Aug 2024 16:35:57 +0200
Message-ID: <2024080757-fruit-spinner-ff5a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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


This is a note to let you know that I've just added the patch titled

    drm/ast: astdp: Wake up during connector status detection

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-astdp-wake-up-during-connector-status-detection.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 0ce91928ec62d189b5c51816e325f02587b53118 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 17 Jul 2024 16:24:16 +0200
Subject: drm/ast: astdp: Wake up during connector status detection

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
@@ -537,6 +537,7 @@ struct ast_i2c_chan *ast_i2c_create(stru
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
 
@@ -1696,11 +1697,35 @@ static int ast_astdp_connector_helper_de
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


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.6/video-add-helpers-for-decoding-screen_info.patch
queue-6.6/drm-ast-astdp-wake-up-during-connector-status-detection.patch
queue-6.6/drm-ast-fix-black-screen-after-resume.patch
queue-6.6/fbdev-vesafb-replace-references-to-global-screen_inf.patch
queue-6.6/video-provide-screen_info_get_pci_dev-to-find-screen.patch
queue-6.6/fbdev-vesafb-detect-vga-compatibility-from-screen-in.patch
queue-6.6/firmware-sysfb-update-screen_info-for-relocated-efi-.patch
