Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD8F538F84
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 13:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88278112A16;
	Tue, 31 May 2022 11:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4745A112A12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:15:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DFF401F991;
 Tue, 31 May 2022 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653995706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TE1Cn6DhGzk0vAavgAROc5Iu8GMEysAv6qSa/J/6GvU=;
 b=YgaY4cvDCtXJrW2+5xvEcaLSGtxBmIJDqh11c9ZfrvgfudCYbBxsMFjvT+QlDecJSV8Sta
 AePvr7+rP68siE10iOsV1yUCAKt9EbeP/ysL87i5vlTUlmFUz4YT/Og6qB+dgB73K3bpaY
 D6URa2JVxC9FSs4W/z/27snaTjKQ0ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653995706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TE1Cn6DhGzk0vAavgAROc5Iu8GMEysAv6qSa/J/6GvU=;
 b=eMy1XX3Mq2cdTllbbreB5qAOeajpqBdDKoF3j+0x/9PRINICtrb8s1rCTSMar6aSX4zQvY
 0w3j/ulcrqQxr7BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B736613B06;
 Tue, 31 May 2022 11:15:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GJHuK7r4lWKZSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 31 May 2022 11:15:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 3/5] drm/ast: Support output polling
Date: Tue, 31 May 2022 13:15:00 +0200
Message-Id: <20220531111502.4470-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531111502.4470-1-tzimmermann@suse.de>
References: <20220531111502.4470-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable output polling for all connectors. VGA always uses EDID for this. As
there's currently no interrupt handling for the ast devices, we have to use
that trick for the various DP and DVI ports as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c     | 14 ++++++++----
 drivers/gpu/drm/drm_probe_helper.c | 35 ++++++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  3 +++
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 4ff8ec1c8931..bbc566c4c768 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1319,6 +1319,7 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
 	.get_modes = ast_vga_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_ctx_from_edid,
 };
 
 static const struct drm_connector_funcs ast_vga_connector_funcs = {
@@ -1354,7 +1355,7 @@ static int ast_vga_connector_init(struct drm_device *dev,
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
 }
@@ -1390,6 +1391,7 @@ static int ast_vga_output_init(struct ast_private *ast)
 
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
 	.get_modes = ast_vga_connector_helper_get_modes, // same as VGA connector
+	.detect_ctx = drm_connector_helper_detect_ctx_from_edid,
 };
 
 static const struct drm_connector_funcs ast_sil164_connector_funcs = {
@@ -1425,7 +1427,7 @@ static int ast_sil164_connector_init(struct drm_device *dev,
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
 }
@@ -1488,6 +1490,7 @@ static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
 	.get_modes = ast_dp501_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_ctx_from_edid,
 };
 
 static const struct drm_connector_funcs ast_dp501_connector_funcs = {
@@ -1512,7 +1515,7 @@ static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
 }
@@ -1575,6 +1578,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
 	.get_modes = ast_astdp_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_ctx_from_edid,
 };
 
 static const struct drm_connector_funcs ast_astdp_connector_funcs = {
@@ -1599,7 +1603,7 @@ static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
 }
@@ -1709,5 +1713,7 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	drm_mode_config_reset(dev);
 
+	drm_kms_helper_poll_init(dev);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 425f56280d51..4440a7b6b240 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1031,3 +1031,38 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
 	return count;
 }
 EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
+
+/**
+ * drm_connector_helper_detect_ctx_from_edid -
+ *	Updates the connector's status by reading EDID data
+ * @connector: The connector.
+ * @ctx: The lock-acquisition context.
+ * @force: True if the operation was requested by userspace, false otherwise.
+ *
+ * Returns:
+ * The connector's status as enum drm_connector_status.
+ *
+ * Updates the connector's EDID property by reading the display modes
+ * and returns the connector's status. If the EDID property is set, the
+ * connector is assumed to be connected; and disconnected otherwise.
+ * If the get_modes helper is missing, the default status is 'unknown'.
+ *
+ * See struct drm_connector_helper_funcs.detect_ctx.
+ */
+int drm_connector_helper_detect_ctx_from_edid(struct drm_connector *connector,
+					      struct drm_modeset_acquire_ctx *ctx,
+					      bool force)
+{
+	const struct drm_connector_helper_funcs *helper_funcs = connector->helper_private;
+
+	if (!helper_funcs || !helper_funcs->get_modes)
+		return connector_status_unknown;
+
+	helper_funcs->get_modes(connector);
+
+	if (!connector->edid_blob_ptr)
+		return connector_status_disconnected;
+
+	return connector_status_connected;
+}
+EXPORT_SYMBOL(drm_connector_helper_detect_ctx_from_edid);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index c80cab7a53b7..7408cf010794 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -27,5 +27,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev);
 bool drm_kms_helper_is_poll_worker(void);
 
 int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
+int drm_connector_helper_detect_ctx_from_edid(struct drm_connector *connector,
+					      struct drm_modeset_acquire_ctx *ctx,
+					      bool force);
 
 #endif
-- 
2.36.1

