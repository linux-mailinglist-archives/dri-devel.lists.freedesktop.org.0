Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1702E53F978
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BBD12AEF9;
	Tue,  7 Jun 2022 09:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB1112AEE4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:20:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17EC821B3B;
 Tue,  7 Jun 2022 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654593610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/JTVYx6YIzOT0oExnwndA8ZEyZRP0LJ7CQLQgKW+BM=;
 b=bCwNDDweQO/QlAorgGAi137B0RIjekcDmrFFxXEylL+y1NjmxjRmkpLt7r/XnwrgLp2xVM
 uKBJQUvYyn/bBCSPM4HMYQWgknidWMYqy82EGFVG4T0CUVZxaRsXkyYtE99Ck0H7UL2kbv
 qVP3HUXmD/7HUQT+BmfKefGUjlCYYzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654593610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/JTVYx6YIzOT0oExnwndA8ZEyZRP0LJ7CQLQgKW+BM=;
 b=IeUM19pmcK/rov5DXJ5o2GexywyGAKpUHy5CxrlZ66B/H1LZ5CJORcOTUmz/UtVTlLENYm
 22VQJMFDzIFUNiDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6A5013638;
 Tue,  7 Jun 2022 09:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IAOQM0kYn2JwLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Jun 2022 09:20:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 patrik.r.jakobsson@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 2/5] drm/ast: Fix updating the connector's EDID property
Date: Tue,  7 Jun 2022 11:20:05 +0200
Message-Id: <20220607092008.22123-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607092008.22123-1-tzimmermann@suse.de>
References: <20220607092008.22123-1-tzimmermann@suse.de>
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

Read the display modes from the connectors DDC helper, which also
updates the connector's EDID property. The code for the connector's
.get_modes helper is now shared between VGA and SIL164.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 57 ++--------------------------------
 1 file changed, 2 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index db2010a55674..57f41e56c6cb 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1302,37 +1302,19 @@ static int ast_crtc_init(struct drm_device *dev)
 
 static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ast_vga_connector *ast_vga_connector = to_ast_vga_connector(connector);
 	struct drm_device *dev = connector->dev;
 	struct ast_private *ast = to_ast_private(dev);
-	struct edid *edid;
 	int count;
 
-	if (!ast_vga_connector->i2c)
-		goto err_drm_connector_update_edid_property;
-
 	/*
 	 * Protect access to I/O registers from concurrent modesetting
 	 * by acquiring the I/O-register lock.
 	 */
 	mutex_lock(&ast->ioregs_lock);
-
-	edid = drm_get_edid(connector, &ast_vga_connector->i2c->adapter);
-	if (!edid)
-		goto err_mutex_unlock;
-
+	count = drm_connector_helper_get_modes_from_ddc(connector);
 	mutex_unlock(&ast->ioregs_lock);
 
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
 	return count;
-
-err_mutex_unlock:
-	mutex_unlock(&ast->ioregs_lock);
-err_drm_connector_update_edid_property:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
 }
 
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
@@ -1406,43 +1388,8 @@ static int ast_vga_output_init(struct ast_private *ast)
  * SIL164 Connector
  */
 
-static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct ast_sil164_connector *ast_sil164_connector = to_ast_sil164_connector(connector);
-	struct drm_device *dev = connector->dev;
-	struct ast_private *ast = to_ast_private(dev);
-	struct edid *edid;
-	int count;
-
-	if (!ast_sil164_connector->i2c)
-		goto err_drm_connector_update_edid_property;
-
-	/*
-	 * Protect access to I/O registers from concurrent modesetting
-	 * by acquiring the I/O-register lock.
-	 */
-	mutex_lock(&ast->ioregs_lock);
-
-	edid = drm_get_edid(connector, &ast_sil164_connector->i2c->adapter);
-	if (!edid)
-		goto err_mutex_unlock;
-
-	mutex_unlock(&ast->ioregs_lock);
-
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-
-err_mutex_unlock:
-	mutex_unlock(&ast->ioregs_lock);
-err_drm_connector_update_edid_property:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
-}
-
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
-	.get_modes = ast_sil164_connector_helper_get_modes,
+	.get_modes = ast_vga_connector_helper_get_modes, // same as VGA connector
 };
 
 static const struct drm_connector_funcs ast_sil164_connector_funcs = {
-- 
2.36.1

