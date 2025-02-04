Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7522FA272D4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179FB10E32F;
	Tue,  4 Feb 2025 13:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD3510E32F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 13:32:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8EA21F38C;
 Tue,  4 Feb 2025 13:32:14 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9362E13A21;
 Tue,  4 Feb 2025 13:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ODKvIt4WomfsVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Feb 2025 13:32:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/ast: astdp: Store mode index in connector state
Date: Tue,  4 Feb 2025 14:26:39 +0100
Message-ID: <20250204133209.403327-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204133209.403327-1-tzimmermann@suse.de>
References: <20250204133209.403327-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B8EA21F38C
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Look up the mode index for the astdp transmitter ship in the encoder's
atomic check and report an error if the display mode is not supported.

The lookup uses the DRM display mode instead of the driver's internal
VBIOS mode. Both are be equivalent. The modesetting code later reads
the calculated index from the connector state to avoid recalculating it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 37 ++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index e7b00153c37e..056991afde7f 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -5,6 +5,7 @@
 #include <linux/firmware.h>
 #include <linux/delay.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -44,6 +45,8 @@ static const struct ast_astdp_mode_index_table_entry ast_astdp_mode_index_table[
 
 struct ast_astdp_connector_state {
 	struct drm_connector_state base;
+
+	int mode_index;
 };
 
 static struct ast_astdp_connector_state *
@@ -305,14 +308,12 @@ static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder
 	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 	const struct ast_vbios_enhtable *vmode = ast_crtc_state->vmode;
-	int mode_index;
+	struct ast_astdp_connector_state *astdp_conn_state =
+		to_ast_astdp_connector_state(conn_state);
+	int mode_index = astdp_conn_state->mode_index;
 	u8 refresh_rate_index;
 	u8 vgacre0, vgacre1, vgacre2;
 
-	mode_index = ast_astdp_get_mode_index(vmode->hde, vmode->vde);
-	if (drm_WARN_ON(dev, mode_index < 0))
-		return;
-
 	if (drm_WARN_ON(dev, vmode->refresh_rate_index < 1 || vmode->refresh_rate_index > 255))
 		return;
 	refresh_rate_index = vmode->refresh_rate_index - 1;
@@ -368,10 +369,30 @@ static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 	ast_dp_set_phy_sleep(ast, true);
 }
 
+static int ast_astdp_encoder_helper_atomic_check(struct drm_encoder *encoder,
+						 struct drm_crtc_state *crtc_state,
+						 struct drm_connector_state *conn_state)
+{
+	const struct drm_display_mode *mode = &crtc_state->mode;
+	struct ast_astdp_connector_state *astdp_conn_state =
+		to_ast_astdp_connector_state(conn_state);
+	int res;
+
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		res = ast_astdp_get_mode_index(mode->hdisplay, mode->vdisplay);
+		if (res < 0)
+			return res;
+		astdp_conn_state->mode_index = res;
+	}
+
+	return 0;
+}
+
 static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
 	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
 	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
 	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
+	.atomic_check = ast_astdp_encoder_helper_atomic_check,
 };
 
 /*
@@ -459,7 +480,7 @@ static void ast_astdp_connector_reset(struct drm_connector *connector)
 static struct drm_connector_state *
 ast_astdp_connector_atomic_duplicate_state(struct drm_connector *connector)
 {
-	struct ast_astdp_connector_state *new_astdp_state;
+	struct ast_astdp_connector_state *new_astdp_state, *astdp_state;
 	struct drm_device *dev = connector->dev;
 
 	if (drm_WARN_ON(dev, !connector->state))
@@ -470,6 +491,10 @@ ast_astdp_connector_atomic_duplicate_state(struct drm_connector *connector)
 		return NULL;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_astdp_state->base);
 
+	astdp_state = to_ast_astdp_connector_state(connector->state);
+
+	new_astdp_state->mode_index = astdp_state->mode_index;
+
 	return &new_astdp_state->base;
 }
 
-- 
2.48.1

