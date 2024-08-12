Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9FC94E9D5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791C510E18F;
	Mon, 12 Aug 2024 09:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="se3pafBu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2/mCN+2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="se3pafBu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2/mCN+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C2910E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:32:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F87E21CB8;
 Mon, 12 Aug 2024 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723455137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yl9P/TGxVtfs9jzeRQbAq6izj5AMJyS+FraGLVVts5Q=;
 b=se3pafBubTgGN9RSDQdATlCuI0moojaLtqvq8+XsPSpkJf4rFVF6xgngB4Fz16bIvQ9eGh
 DM+NgXF8E72iX2LaU1zfjToZ19/ZHPRiE9Uq4MmtRrhm1OiJcs+Kawo83eFXxsicwl5a0N
 R9Stw6zArYI6C+vdwm/yI7w2l/G692I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723455137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yl9P/TGxVtfs9jzeRQbAq6izj5AMJyS+FraGLVVts5Q=;
 b=z2/mCN+2hMDyxOmPnqLSqZYKyst5RGrmACdAO7IFHAcMsliMhTmNFA25+nD6Uf1rl7ztqH
 d2fdijl9lNQwFlCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723455137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yl9P/TGxVtfs9jzeRQbAq6izj5AMJyS+FraGLVVts5Q=;
 b=se3pafBubTgGN9RSDQdATlCuI0moojaLtqvq8+XsPSpkJf4rFVF6xgngB4Fz16bIvQ9eGh
 DM+NgXF8E72iX2LaU1zfjToZ19/ZHPRiE9Uq4MmtRrhm1OiJcs+Kawo83eFXxsicwl5a0N
 R9Stw6zArYI6C+vdwm/yI7w2l/G692I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723455137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yl9P/TGxVtfs9jzeRQbAq6izj5AMJyS+FraGLVVts5Q=;
 b=z2/mCN+2hMDyxOmPnqLSqZYKyst5RGrmACdAO7IFHAcMsliMhTmNFA25+nD6Uf1rl7ztqH
 d2fdijl9lNQwFlCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEA6E13A23;
 Mon, 12 Aug 2024 09:32:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8GMNNaDWuWYjMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 09:32:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/9] drm/ast: Move code for physical outputs into separate
 files
Date: Mon, 12 Aug 2024 11:30:35 +0200
Message-ID: <20240812093211.382263-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812093211.382263-1-tzimmermann@suse.de>
References: <20240812093211.382263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

Move the modesetting code for the various transmitter chips into
their own source files before adding BMC support. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/Makefile     |   4 +-
 drivers/gpu/drm/ast/ast_dp.c     | 214 +++++++++++++-
 drivers/gpu/drm/ast/ast_dp501.c  | 141 ++++++++-
 drivers/gpu/drm/ast/ast_drv.h    |  17 +-
 drivers/gpu/drm/ast/ast_mode.c   | 471 -------------------------------
 drivers/gpu/drm/ast/ast_sil164.c |  88 ++++++
 drivers/gpu/drm/ast/ast_vga.c    |  88 ++++++
 7 files changed, 530 insertions(+), 493 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_sil164.c
 create mode 100644 drivers/gpu/drm/ast/ast_vga.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index d794c076bc24..47da848fa3fc 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -11,6 +11,8 @@ ast-y := \
 	ast_main.o \
 	ast_mm.o \
 	ast_mode.o \
-	ast_post.o
+	ast_post.o \
+	ast_sil164.o \
+	ast_vga.o
 
 obj-$(CONFIG_DRM_AST) := ast.o
diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 5d07678b502c..ef2dd9d82de9 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -4,17 +4,23 @@
 
 #include <linux/firmware.h>
 #include <linux/delay.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
 #include "ast_drv.h"
 
-bool ast_astdp_is_connected(struct ast_device *ast)
+static bool ast_astdp_is_connected(struct ast_device *ast)
 {
 	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
 		return false;
 	return true;
 }
 
-int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
+static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 {
 	struct ast_device *ast = to_ast_device(dev);
 	int ret = 0;
@@ -120,7 +126,7 @@ int ast_dp_launch(struct ast_device *ast)
 	return 0;
 }
 
-bool ast_dp_power_is_on(struct ast_device *ast)
+static bool ast_dp_power_is_on(struct ast_device *ast)
 {
 	u8 vgacre3;
 
@@ -129,7 +135,7 @@ bool ast_dp_power_is_on(struct ast_device *ast)
 	return !(vgacre3 & AST_DP_PHY_SLEEP);
 }
 
-void ast_dp_power_on_off(struct drm_device *dev, bool on)
+static void ast_dp_power_on_off(struct drm_device *dev, bool on)
 {
 	struct ast_device *ast = to_ast_device(dev);
 	// Read and Turn off DP PHY sleep
@@ -143,7 +149,7 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_PHY_SLEEP, bE3);
 }
 
-void ast_dp_link_training(struct ast_device *ast)
+static void ast_dp_link_training(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
 	unsigned int i = 10;
@@ -160,7 +166,7 @@ void ast_dp_link_training(struct ast_device *ast)
 		drm_err(dev, "Link training failed\n");
 }
 
-void ast_dp_set_on_off(struct drm_device *dev, bool on)
+static void ast_dp_set_on_off(struct drm_device *dev, bool on)
 {
 	struct ast_device *ast = to_ast_device(dev);
 	u8 video_on_off = on;
@@ -179,7 +185,7 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
 	}
 }
 
-void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
+static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
 {
 	struct ast_device *ast = to_ast_device(crtc->dev);
 
@@ -252,3 +258,197 @@ void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mo
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE1, ASTDP_AND_CLEAR_MASK, ASTDP_MISC1);
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE2, ASTDP_AND_CLEAR_MASK, ModeIdx);
 }
+
+static void ast_wait_for_vretrace(struct ast_device *ast)
+{
+	unsigned long timeout = jiffies + HZ;
+	u8 vgair1;
+
+	do {
+		vgair1 = ast_io_read8(ast, AST_IO_VGAIR1_R);
+	} while (!(vgair1 & AST_IO_VGAIR1_VREFRESH) && time_before(jiffies, timeout));
+}
+
+/*
+ * Encoder
+ */
+
+static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder,
+						     struct drm_crtc_state *crtc_state,
+						     struct drm_connector_state *conn_state)
+{
+	struct drm_crtc *crtc = crtc_state->crtc;
+	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
+	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
+
+	ast_dp_set_mode(crtc, vbios_mode_info);
+}
+
+static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
+						   struct drm_atomic_state *state)
+{
+	struct drm_device *dev = encoder->dev;
+	struct ast_device *ast = to_ast_device(dev);
+
+	ast_dp_power_on_off(dev, AST_DP_POWER_ON);
+	ast_dp_link_training(ast);
+
+	ast_wait_for_vretrace(ast);
+	ast_dp_set_on_off(dev, 1);
+}
+
+static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
+						    struct drm_atomic_state *state)
+{
+	struct drm_device *dev = encoder->dev;
+
+	ast_dp_set_on_off(dev, 0);
+	ast_dp_power_on_off(dev, AST_DP_POWER_OFF);
+}
+
+static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
+	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
+	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
+	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
+};
+
+/*
+ * Connector
+ */
+
+static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
+{
+	void *edid;
+	struct drm_device *dev = connector->dev;
+	struct ast_device *ast = to_ast_device(dev);
+
+	int succ;
+	int count;
+
+	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	if (!edid)
+		goto err_drm_connector_update_edid_property;
+
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&ast->modeset_lock);
+
+	succ = ast_astdp_read_edid(connector->dev, edid);
+	if (succ < 0)
+		goto err_mutex_unlock;
+
+	mutex_unlock(&ast->modeset_lock);
+
+	drm_connector_update_edid_property(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
+	return count;
+
+err_mutex_unlock:
+	mutex_unlock(&ast->modeset_lock);
+	kfree(edid);
+err_drm_connector_update_edid_property:
+	drm_connector_update_edid_property(connector, NULL);
+	return 0;
+}
+
+static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector,
+						 struct drm_modeset_acquire_ctx *ctx,
+						 bool force)
+{
+	struct drm_device *dev = connector->dev;
+	struct ast_device *ast = to_ast_device(connector->dev);
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
+
+	if (ast_astdp_is_connected(ast))
+		status = connector_status_connected;
+
+	if (!is_active && status == connector_status_disconnected)
+		ast_dp_power_on_off(dev, false);
+
+	mutex_unlock(&ast->modeset_lock);
+
+	return status;
+}
+
+static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
+	.get_modes = ast_astdp_connector_helper_get_modes,
+	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
+};
+
+static const struct drm_connector_funcs ast_astdp_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector *connector)
+{
+	int ret;
+
+	ret = drm_connector_init(dev, connector, &ast_astdp_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ast_astdp_connector_helper_funcs);
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+
+	return 0;
+}
+
+int ast_astdp_output_init(struct ast_device *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
+	struct drm_encoder *encoder = &ast->output.astdp.encoder;
+	struct drm_connector *connector = &ast->output.astdp.connector;
+	int ret;
+
+	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
+	drm_encoder_helper_add(encoder, &ast_astdp_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = ast_astdp_connector_init(dev, connector);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 9a4c3a0963f9..478efa226170 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -4,6 +4,11 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+
 #include "ast_drv.h"
 
 MODULE_FIRMWARE("ast_dp501_fw.bin");
@@ -170,7 +175,7 @@ static void clear_cmd(struct ast_device *ast)
 }
 #endif
 
-void ast_set_dp501_video_output(struct drm_device *dev, u8 mode)
+static void ast_set_dp501_video_output(struct drm_device *dev, u8 mode)
 {
 	ast_write_cmd(dev, 0x40);
 	ast_write_data(dev, mode);
@@ -272,7 +277,7 @@ static bool ast_launch_m68k(struct drm_device *dev)
 	return true;
 }
 
-bool ast_dp501_is_connected(struct ast_device *ast)
+static bool ast_dp501_is_connected(struct ast_device *ast)
 {
 	u32 boot_address, offset, data;
 
@@ -313,7 +318,7 @@ bool ast_dp501_is_connected(struct ast_device *ast)
 	return true;
 }
 
-bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
+static bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
 {
 	struct ast_device *ast = to_ast_device(dev);
 	u32 i, boot_address, offset, data;
@@ -470,3 +475,133 @@ void ast_init_3rdtx(struct drm_device *dev)
 		}
 	}
 }
+
+/*
+ * Encoder
+ */
+
+static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static void ast_dp501_encoder_helper_atomic_enable(struct drm_encoder *encoder,
+						   struct drm_atomic_state *state)
+{
+	struct drm_device *dev = encoder->dev;
+
+	ast_set_dp501_video_output(dev, 1);
+}
+
+static void ast_dp501_encoder_helper_atomic_disable(struct drm_encoder *encoder,
+						    struct drm_atomic_state *state)
+{
+	struct drm_device *dev = encoder->dev;
+
+	ast_set_dp501_video_output(dev, 0);
+}
+
+static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
+	.atomic_enable = ast_dp501_encoder_helper_atomic_enable,
+	.atomic_disable = ast_dp501_encoder_helper_atomic_disable,
+};
+
+/*
+ * Connector
+ */
+
+static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
+{
+	void *edid;
+	bool succ;
+	int count;
+
+	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	if (!edid)
+		goto err_drm_connector_update_edid_property;
+
+	succ = ast_dp501_read_edid(connector->dev, edid);
+	if (!succ)
+		goto err_kfree;
+
+	drm_connector_update_edid_property(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
+	return count;
+
+err_kfree:
+	kfree(edid);
+err_drm_connector_update_edid_property:
+	drm_connector_update_edid_property(connector, NULL);
+	return 0;
+}
+
+static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector,
+						 struct drm_modeset_acquire_ctx *ctx,
+						 bool force)
+{
+	struct ast_device *ast = to_ast_device(connector->dev);
+
+	if (ast_dp501_is_connected(ast))
+		return connector_status_connected;
+	return connector_status_disconnected;
+}
+
+static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
+	.get_modes = ast_dp501_connector_helper_get_modes,
+	.detect_ctx = ast_dp501_connector_helper_detect_ctx,
+};
+
+static const struct drm_connector_funcs ast_dp501_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector *connector)
+{
+	int ret;
+
+	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+
+	return 0;
+}
+
+int ast_dp501_output_init(struct ast_device *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
+	struct drm_encoder *encoder = &ast->output.dp501.encoder;
+	struct drm_connector *connector = &ast->output.dp501.connector;
+	int ret;
+
+	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
+	drm_encoder_helper_add(encoder, &ast_dp501_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = ast_dp501_connector_init(dev, connector);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index d23b98ce4359..3a4f80cb5c0f 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -460,22 +460,17 @@ void ast_post_gpu(struct drm_device *dev);
 u32 ast_mindwm(struct ast_device *ast, u32 r);
 void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
 void ast_patch_ahb_2500(void __iomem *regs);
+
+int ast_vga_output_init(struct ast_device *ast);
+int ast_sil164_output_init(struct ast_device *ast);
+
 /* ast dp501 */
-void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
 bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
-bool ast_dp501_is_connected(struct ast_device *ast);
-bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
-u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
+int ast_dp501_output_init(struct ast_device *ast);
 
 /* aspeed DP */
-bool ast_astdp_is_connected(struct ast_device *ast);
-int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
 int ast_dp_launch(struct ast_device *ast);
-bool ast_dp_power_is_on(struct ast_device *ast);
-void ast_dp_power_on_off(struct drm_device *dev, bool no);
-void ast_dp_link_training(struct ast_device *ast);
-void ast_dp_set_on_off(struct drm_device *dev, bool no);
-void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
+int ast_astdp_output_init(struct ast_device *ast);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ddb7696acc04..d823e9d85b04 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -47,7 +47,6 @@
 #include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
-#include "ast_ddc.h"
 #include "ast_drv.h"
 #include "ast_tables.h"
 
@@ -1310,476 +1309,6 @@ static int ast_crtc_init(struct drm_device *dev)
 	return 0;
 }
 
-/*
- * VGA Encoder
- */
-
-static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/*
- * VGA Connector
- */
-
-static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
-	.get_modes = drm_connector_helper_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc,
-};
-
-static const struct drm_connector_funcs ast_vga_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
-{
-	struct ast_device *ast = to_ast_device(dev);
-	struct i2c_adapter *ddc;
-	int ret;
-
-	ddc = ast_ddc_create(ast);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret)
-		return ret;
-
-	drm_connector_helper_add(connector, &ast_vga_connector_helper_funcs);
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
-
-	return 0;
-}
-
-static int ast_vga_output_init(struct ast_device *ast)
-{
-	struct drm_device *dev = &ast->base;
-	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.vga.encoder;
-	struct drm_connector *connector = &ast->output.vga.connector;
-	int ret;
-
-	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret)
-		return ret;
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-
-	ret = ast_vga_connector_init(dev, connector);
-	if (ret)
-		return ret;
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/*
- * SIL164 Encoder
- */
-
-static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/*
- * SIL164 Connector
- */
-
-static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
-	.get_modes = drm_connector_helper_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc,
-};
-
-static const struct drm_connector_funcs ast_sil164_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
-{
-	struct ast_device *ast = to_ast_device(dev);
-	struct i2c_adapter *ddc;
-	int ret;
-
-	ddc = ast_ddc_create(ast);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
-					  DRM_MODE_CONNECTOR_DVII, ddc);
-	if (ret)
-		return ret;
-
-	drm_connector_helper_add(connector, &ast_sil164_connector_helper_funcs);
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
-
-	return 0;
-}
-
-static int ast_sil164_output_init(struct ast_device *ast)
-{
-	struct drm_device *dev = &ast->base;
-	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.sil164.encoder;
-	struct drm_connector *connector = &ast->output.sil164.connector;
-	int ret;
-
-	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
-	if (ret)
-		return ret;
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-
-	ret = ast_sil164_connector_init(dev, connector);
-	if (ret)
-		return ret;
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/*
- * DP501 Encoder
- */
-
-static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-static void ast_dp501_encoder_helper_atomic_enable(struct drm_encoder *encoder,
-						   struct drm_atomic_state *state)
-{
-	struct drm_device *dev = encoder->dev;
-
-	ast_set_dp501_video_output(dev, 1);
-}
-
-static void ast_dp501_encoder_helper_atomic_disable(struct drm_encoder *encoder,
-						    struct drm_atomic_state *state)
-{
-	struct drm_device *dev = encoder->dev;
-
-	ast_set_dp501_video_output(dev, 0);
-}
-
-static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
-	.atomic_enable = ast_dp501_encoder_helper_atomic_enable,
-	.atomic_disable = ast_dp501_encoder_helper_atomic_disable,
-};
-
-/*
- * DP501 Connector
- */
-
-static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
-{
-	void *edid;
-	bool succ;
-	int count;
-
-	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-	if (!edid)
-		goto err_drm_connector_update_edid_property;
-
-	succ = ast_dp501_read_edid(connector->dev, edid);
-	if (!succ)
-		goto err_kfree;
-
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-
-err_kfree:
-	kfree(edid);
-err_drm_connector_update_edid_property:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
-}
-
-static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector,
-						 struct drm_modeset_acquire_ctx *ctx,
-						 bool force)
-{
-	struct ast_device *ast = to_ast_device(connector->dev);
-
-	if (ast_dp501_is_connected(ast))
-		return connector_status_connected;
-	return connector_status_disconnected;
-}
-
-static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
-	.get_modes = ast_dp501_connector_helper_get_modes,
-	.detect_ctx = ast_dp501_connector_helper_detect_ctx,
-};
-
-static const struct drm_connector_funcs ast_dp501_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector *connector)
-{
-	int ret;
-
-	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret)
-		return ret;
-
-	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
-
-	return 0;
-}
-
-static int ast_dp501_output_init(struct ast_device *ast)
-{
-	struct drm_device *dev = &ast->base;
-	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.dp501.encoder;
-	struct drm_connector *connector = &ast->output.dp501.connector;
-	int ret;
-
-	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
-	if (ret)
-		return ret;
-	drm_encoder_helper_add(encoder, &ast_dp501_encoder_helper_funcs);
-
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-
-	ret = ast_dp501_connector_init(dev, connector);
-	if (ret)
-		return ret;
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/*
- * ASPEED Display-Port Encoder
- */
-
-static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder,
-						     struct drm_crtc_state *crtc_state,
-						     struct drm_connector_state *conn_state)
-{
-	struct drm_crtc *crtc = crtc_state->crtc;
-	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
-	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
-
-	ast_dp_set_mode(crtc, vbios_mode_info);
-}
-
-static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
-						   struct drm_atomic_state *state)
-{
-	struct drm_device *dev = encoder->dev;
-	struct ast_device *ast = to_ast_device(dev);
-
-	ast_dp_power_on_off(dev, AST_DP_POWER_ON);
-	ast_dp_link_training(ast);
-
-	ast_wait_for_vretrace(ast);
-	ast_dp_set_on_off(dev, 1);
-}
-
-static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
-						    struct drm_atomic_state *state)
-{
-	struct drm_device *dev = encoder->dev;
-
-	ast_dp_set_on_off(dev, 0);
-	ast_dp_power_on_off(dev, AST_DP_POWER_OFF);
-}
-
-static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
-	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
-	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
-	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
-};
-
-/*
- * ASPEED Display-Port Connector
- */
-
-static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
-{
-	void *edid;
-	struct drm_device *dev = connector->dev;
-	struct ast_device *ast = to_ast_device(dev);
-
-	int succ;
-	int count;
-
-	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-	if (!edid)
-		goto err_drm_connector_update_edid_property;
-
-	/*
-	 * Protect access to I/O registers from concurrent modesetting
-	 * by acquiring the I/O-register lock.
-	 */
-	mutex_lock(&ast->modeset_lock);
-
-	succ = ast_astdp_read_edid(connector->dev, edid);
-	if (succ < 0)
-		goto err_mutex_unlock;
-
-	mutex_unlock(&ast->modeset_lock);
-
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-
-err_mutex_unlock:
-	mutex_unlock(&ast->modeset_lock);
-	kfree(edid);
-err_drm_connector_update_edid_property:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
-}
-
-static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector,
-						 struct drm_modeset_acquire_ctx *ctx,
-						 bool force)
-{
-	struct drm_device *dev = connector->dev;
-	struct ast_device *ast = to_ast_device(connector->dev);
-	enum drm_connector_status status = connector_status_disconnected;
-	struct drm_connector_state *connector_state = connector->state;
-	bool is_active = false;
-
-	mutex_lock(&ast->modeset_lock);
-
-	if (connector_state && connector_state->crtc) {
-		struct drm_crtc_state *crtc_state = connector_state->crtc->state;
-
-		if (crtc_state && crtc_state->active)
-			is_active = true;
-	}
-
-	if (!is_active && !ast_dp_power_is_on(ast)) {
-		ast_dp_power_on_off(dev, true);
-		msleep(50);
-	}
-
-	if (ast_astdp_is_connected(ast))
-		status = connector_status_connected;
-
-	if (!is_active && status == connector_status_disconnected)
-		ast_dp_power_on_off(dev, false);
-
-	mutex_unlock(&ast->modeset_lock);
-
-	return status;
-}
-
-static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
-	.get_modes = ast_astdp_connector_helper_get_modes,
-	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
-};
-
-static const struct drm_connector_funcs ast_astdp_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector *connector)
-{
-	int ret;
-
-	ret = drm_connector_init(dev, connector, &ast_astdp_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret)
-		return ret;
-
-	drm_connector_helper_add(connector, &ast_astdp_connector_helper_funcs);
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
-
-	return 0;
-}
-
-static int ast_astdp_output_init(struct ast_device *ast)
-{
-	struct drm_device *dev = &ast->base;
-	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.astdp.encoder;
-	struct drm_connector *connector = &ast->output.astdp.connector;
-	int ret;
-
-	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
-	if (ret)
-		return ret;
-	drm_encoder_helper_add(encoder, &ast_astdp_encoder_helper_funcs);
-
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-
-	ret = ast_astdp_connector_init(dev, connector);
-	if (ret)
-		return ret;
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 /*
  * BMC virtual Connector
  */
diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
new file mode 100644
index 000000000000..6e17d84f994e
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_sil164.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "ast_ddc.h"
+#include "ast_drv.h"
+
+/*
+ * Encoder
+ */
+
+static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+/*
+ * Connector
+ */
+
+static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
+	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
+};
+
+static const struct drm_connector_funcs ast_sil164_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
+{
+	struct ast_device *ast = to_ast_device(dev);
+	struct i2c_adapter *ddc;
+	int ret;
+
+	ddc = ast_ddc_create(ast);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
+		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
+					  DRM_MODE_CONNECTOR_DVII, ddc);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ast_sil164_connector_helper_funcs);
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+
+	return 0;
+}
+
+int ast_sil164_output_init(struct ast_device *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
+	struct drm_encoder *encoder = &ast->output.sil164.encoder;
+	struct drm_connector *connector = &ast->output.sil164.connector;
+	int ret;
+
+	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = ast_sil164_connector_init(dev, connector);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
new file mode 100644
index 000000000000..2ea0763844f3
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_vga.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "ast_ddc.h"
+#include "ast_drv.h"
+
+/*
+ * Encoder
+ */
+
+static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+/*
+ * Connector
+ */
+
+static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
+	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
+};
+
+static const struct drm_connector_funcs ast_vga_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
+{
+	struct ast_device *ast = to_ast_device(dev);
+	struct i2c_adapter *ddc;
+	int ret;
+
+	ddc = ast_ddc_create(ast);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
+		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA, ddc);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ast_vga_connector_helper_funcs);
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+
+	return 0;
+}
+
+int ast_vga_output_init(struct ast_device *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
+	struct drm_encoder *encoder = &ast->output.vga.encoder;
+	struct drm_connector *connector = &ast->output.vga.connector;
+	int ret;
+
+	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = ast_vga_connector_init(dev, connector);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
-- 
2.46.0

