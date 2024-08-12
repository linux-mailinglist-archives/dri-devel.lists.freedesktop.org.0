Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E5F94E9D4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D52B10E18D;
	Mon, 12 Aug 2024 09:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A6F10E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:32:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A82322024F;
 Mon, 12 Aug 2024 09:32:18 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72FED13A23;
 Mon, 12 Aug 2024 09:32:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sKx0GqLWuWYjMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 09:32:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/9] drm/ast: sil164: Transparently handle BMC support
Date: Mon, 12 Aug 2024 11:30:41 +0200
Message-ID: <20240812093211.382263-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812093211.382263-1-tzimmermann@suse.de>
References: <20240812093211.382263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: A82322024F
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Permanently set the connector status to 'connected'. Return BMC modes
for connector if no display is attached to the physical DP connector.
Otherwise use EDID modes as before.

If the status of the physical connector changes, the driver still
generates a hotplug event. DRM clients will then reconfigure their
output to a mode appropriate for either physical display or BMC.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_sil164.c | 40 ++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
index 6e17d84f994e..940118544fae 100644
--- a/drivers/gpu/drm/ast/ast_sil164.c
+++ b/drivers/gpu/drm/ast/ast_sil164.c
@@ -21,9 +21,45 @@ static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
  * Connector
  */
 
+static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
+{
+	int count = drm_connector_helper_get_modes(connector);
+
+	if (!count) {
+		/*
+		 * There's no EDID data without a connected monitor. Set BMC-
+		 * compatible modes in this case. The XGA default resolution
+		 * should work well for all BMCs.
+		 */
+		count = drm_add_modes_noedid(connector, 4096, 4096);
+		if (count)
+			drm_set_preferred_mode(connector, 1024, 768);
+	}
+
+	return count;
+}
+
+static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connector,
+						  struct drm_modeset_acquire_ctx *ctx,
+						  bool force)
+{
+	enum drm_connector_status old_status, status;
+
+	if (connector->edid_blob_ptr)
+		old_status = connector_status_connected;
+	else
+		old_status = connector_status_disconnected;
+
+	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
+
+	if (status != old_status)
+		++connector->epoch_counter;
+	return connector_status_connected;
+}
+
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
-	.get_modes = drm_connector_helper_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc,
+	.get_modes = ast_sil164_connector_helper_get_modes,
+	.detect_ctx = ast_sil164_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_sil164_connector_funcs = {
-- 
2.46.0

