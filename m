Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31CA88B0EE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED4210E6AF;
	Mon, 25 Mar 2024 20:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D1610E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:03 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 273375CB5F;
 Mon, 25 Mar 2024 20:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id CC09713A71;
 Mon, 25 Mar 2024 20:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id iP6YMN3ZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:09:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 12/13] drm/ast: Implement polling for VGA and SIL164
 connectors
Date: Mon, 25 Mar 2024 21:06:57 +0100
Message-ID: <20240325200855.21150-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 273375CB5F
X-Spam-Flag: NO
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

Implement polling for VGA and SIL164 connectors. Set the flag
DRM_CONNECTOR_POLL_DISCONNECT for each to detect the removal of the
monitor cable. Implement struct drm_connector_helper_funcs.detect_ctx
for each type of connector by testing for EDID data.

The helper drm_connector_helper_detect_ctx() implements .detect_ctx()
on top of the connector's DDC channel. The function can be used by
other drivers as companion to drm_connector_helper_get_modes().

v6:
- change helper name to drm_connector_helper_detec_from_ddc()
  (Maxime, Sui)
v5:
- share implementation in drm_connector_helper_detect_ctx() (Maxime)
- test for DDC presence with drm_probe_ddc() (Maxime, Jani)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/ast/ast_mode.c     |  6 ++++--
 drivers/gpu/drm/drm_probe_helper.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  4 ++++
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 71cc681d6188f..b4e1c812520cc 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1346,6 +1346,7 @@ static int ast_crtc_init(struct drm_device *dev)
 
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
 	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
 };
 
 static const struct drm_connector_funcs ast_vga_connector_funcs = {
@@ -1379,7 +1380,7 @@ static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
 }
@@ -1414,6 +1415,7 @@ static int ast_vga_output_init(struct ast_device *ast)
 
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
 	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
 };
 
 static const struct drm_connector_funcs ast_sil164_connector_funcs = {
@@ -1447,7 +1449,7 @@ static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connecto
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 4d60cc810b577..6223629b000db 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1272,3 +1272,32 @@ int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
 	return i;
 }
 EXPORT_SYMBOL(drm_connector_helper_tv_get_modes);
+
+/**
+ * drm_connector_helper_detect_from_ddc - Read EDID and detect connector status.
+ * @connector: The connector
+ * @ctx: Acquire context
+ * @force: Perform screen-destructive operations, if necessary
+ *
+ * Detects the connector status by reading the EDID using drm_probe_ddc(),
+ * which requires connector->ddc to be set. Returns connector_status_connected
+ * on success or connector_status_disconnected on failure.
+ *
+ * Returns:
+ * The connector status as defined by enum drm_connector_status.
+ */
+int drm_connector_helper_detect_from_ddc(struct drm_connector *connector,
+					 struct drm_modeset_acquire_ctx *ctx,
+					 bool force)
+{
+	struct i2c_adapter *ddc = connector->ddc;
+
+	if (!ddc)
+		return connector_status_unknown;
+
+	if (drm_probe_ddc(ddc))
+		return connector_status_connected;
+
+	return connector_status_disconnected;
+}
+EXPORT_SYMBOL(drm_connector_helper_detect_from_ddc);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 62741a88796bb..e9dc32433631b 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -37,4 +37,8 @@ int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
 int drm_connector_helper_get_modes(struct drm_connector *connector);
 int drm_connector_helper_tv_get_modes(struct drm_connector *connector);
 
+int drm_connector_helper_detect_from_ddc(struct drm_connector *connector,
+					 struct drm_modeset_acquire_ctx *ctx,
+					 bool force);
+
 #endif
-- 
2.44.0

