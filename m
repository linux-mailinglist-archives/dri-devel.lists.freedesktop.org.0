Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C3B88B0F2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235F810E714;
	Mon, 25 Mar 2024 20:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBFA10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:03 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C5D265CB5D;
 Mon, 25 Mar 2024 20:09:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7725C13A71;
 Mon, 25 Mar 2024 20:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OKTGG93ZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:09:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 11/13] drm/ast: Use drm_connector_helper_get_modes()
Date: Mon, 25 Mar 2024 21:06:56 +0100
Message-ID: <20240325200855.21150-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.00
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Queue-Id: C5D265CB5D
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

The .get_modes() code for VGA and SIL164 connectors does not depend
on either type of connector. Replace the driver code with the common
helper drm_connector_helper_get_modes(). It reads EDID data via
DDC and updates the connector's EDID property.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 42 ++--------------------------------
 1 file changed, 2 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 8766a0f2eb3c7..71cc681d6188f 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1344,27 +1344,8 @@ static int ast_crtc_init(struct drm_device *dev)
  * VGA Connector
  */
 
-static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct edid *edid;
-	int count;
-
-	edid = drm_get_edid(connector, connector->ddc);
-	if (!edid)
-		goto err_drm_get_edid;
-
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-
-err_drm_get_edid:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
-}
-
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
-	.get_modes = ast_vga_connector_helper_get_modes,
+	.get_modes = drm_connector_helper_get_modes,
 };
 
 static const struct drm_connector_funcs ast_vga_connector_funcs = {
@@ -1431,27 +1412,8 @@ static int ast_vga_output_init(struct ast_device *ast)
  * SIL164 Connector
  */
 
-static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct edid *edid;
-	int count;
-
-	edid = drm_get_edid(connector, connector->ddc);
-	if (!edid)
-		goto err_drm_get_edid;
-
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-
-err_drm_get_edid:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
-}
-
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
-	.get_modes = ast_sil164_connector_helper_get_modes,
+	.get_modes = drm_connector_helper_get_modes,
 };
 
 static const struct drm_connector_funcs ast_sil164_connector_funcs = {
-- 
2.44.0

