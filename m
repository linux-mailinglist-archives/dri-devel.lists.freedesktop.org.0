Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70D880EC8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDB510E8B3;
	Wed, 20 Mar 2024 09:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ml4LMp3X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ua4bO08r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ml4LMp3X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ua4bO08r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9510E732
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BCB0020BD3;
 Wed, 20 Mar 2024 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvzJ6XP97FiM8esHXESDr8agAOXqrP3d1TsVPhkpIJE=;
 b=Ml4LMp3XfVteK/a11X8K0uqTDedvc4Eo+ANpDR0+5QQqQLZLtUtnngyqJgL0HlJZoxSAMz
 QTyuo5Hi/xCL3fhy1jafgS+rR7/5FC2P0daS3DiQXpSh6w+2kdyOztDsmLUtXSGW0QjYW5
 CtxJ99MHJqvbUEURSESkx2w/ctKGHkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvzJ6XP97FiM8esHXESDr8agAOXqrP3d1TsVPhkpIJE=;
 b=ua4bO08rfIyUNfsrHU0RTCYl/6yHpla+SE5HCrbx/cfnNGA8RxSzePjDx29wxhd1pv+dZc
 A2PUtHUbmRBoOfAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvzJ6XP97FiM8esHXESDr8agAOXqrP3d1TsVPhkpIJE=;
 b=Ml4LMp3XfVteK/a11X8K0uqTDedvc4Eo+ANpDR0+5QQqQLZLtUtnngyqJgL0HlJZoxSAMz
 QTyuo5Hi/xCL3fhy1jafgS+rR7/5FC2P0daS3DiQXpSh6w+2kdyOztDsmLUtXSGW0QjYW5
 CtxJ99MHJqvbUEURSESkx2w/ctKGHkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvzJ6XP97FiM8esHXESDr8agAOXqrP3d1TsVPhkpIJE=;
 b=ua4bO08rfIyUNfsrHU0RTCYl/6yHpla+SE5HCrbx/cfnNGA8RxSzePjDx29wxhd1pv+dZc
 A2PUtHUbmRBoOfAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74DD6136CD;
 Wed, 20 Mar 2024 09:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mIFhG2mu+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 12/13] drm/ast: Implement polling for VGA and SIL164
 connectors
Date: Wed, 20 Mar 2024 10:34:17 +0100
Message-ID: <20240320093738.6341-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320093738.6341-1-tzimmermann@suse.de>
References: <20240320093738.6341-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.51
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.51 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[9];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ml4LMp3X;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ua4bO08r
X-Rspamd-Queue-Id: BCB0020BD3
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

v5:
- share implementation in drm_connector_helper_detect_ctx() (Maxime)
- test for DDC presence with drm_probe_ddc() (Maxime, Jani)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c     |  6 ++++--
 drivers/gpu/drm/drm_probe_helper.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  3 +++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 71cc681d6188f..a42a0956c51de 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1346,6 +1346,7 @@ static int ast_crtc_init(struct drm_device *dev)
 
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
 	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_ctx,
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
+	.detect_ctx = drm_connector_helper_detect_ctx,
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
index 4d60cc810b577..b06dcc6c614e8 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1272,3 +1272,32 @@ int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
 	return i;
 }
 EXPORT_SYMBOL(drm_connector_helper_tv_get_modes);
+
+/**
+ * drm_connector_helper_detect_ctx - Read EDID and detect connector status.
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
+int drm_connector_helper_detect_ctx(struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx,
+				    bool force)
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
+EXPORT_SYMBOL(drm_connector_helper_detect_ctx);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 62741a88796bb..031b044528c89 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -37,4 +37,7 @@ int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
 int drm_connector_helper_get_modes(struct drm_connector *connector);
 int drm_connector_helper_tv_get_modes(struct drm_connector *connector);
 
+int drm_connector_helper_detect_ctx(struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx,
+				    bool force);
 #endif
-- 
2.44.0

