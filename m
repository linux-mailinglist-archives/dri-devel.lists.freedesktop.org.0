Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A1538F81
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 13:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FB6112A12;
	Tue, 31 May 2022 11:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21090112A0F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:15:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B538A1F98F;
 Tue, 31 May 2022 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653995706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nbVEjfF6PCPlHW4ayCiKZsgKA89/JsJc1oggKFJHq8=;
 b=0IguvXbC3xn4qOC4bs+Ibjfyyo7MyJN50X7k/KFwp2MxQ9pJsg1Q/oyGAfs9kFZkve74UG
 DTbklwQ2hz9V8r0kbR3vFzvq07FhOQh7ErFkszmt7DVV9cG5/ZO7pXMR/43Xx6eGvvmjQH
 iQ5+zISIpOGSHgbztXMG6y7+xe72yqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653995706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nbVEjfF6PCPlHW4ayCiKZsgKA89/JsJc1oggKFJHq8=;
 b=eaL9yXijp1G7ChRp/mM/PdFNtx9pBBpW/oNX8k7KommHJq+v6bZdfT6xUzM7/9wNYduW8+
 2b3lvOIXaBUW+0BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C22C13AA2;
 Tue, 31 May 2022 11:15:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GAZcIbr4lWKZSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 31 May 2022 11:15:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 2/5] drm/ast: Fix updating the connector's EDID property
Date: Tue, 31 May 2022 13:14:59 +0200
Message-Id: <20220531111502.4470-3-tzimmermann@suse.de>
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

Read the display modes from the connectors DDC helper, which also
updates the connector's EDID property. The code for the connector's
.get_modes helper is now shared between VGA and SIL164.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 57 ++--------------------------------
 1 file changed, 2 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e19dd2f9b3ce..4ff8ec1c8931 100644
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

