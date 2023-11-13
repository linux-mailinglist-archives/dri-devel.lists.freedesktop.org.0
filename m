Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B647E989F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EE010E011;
	Mon, 13 Nov 2023 09:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301AE10E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DEC1D21901;
 Mon, 13 Nov 2023 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXSRnwccrq+yJLZ0jZsD6FFupyI6pHp9hVBE78jRiYU=;
 b=l1klCQvEl9QDeMnDOcup5bKHr0hoRBSweThwJgJZYu7VcMXXUTXdNPDT0wNA2Fvs0KMdq4
 s+rQb6693PCLU1LH1dJTgztBhvpik+Kge7NUU9DtH74ObmoWyU1/7da5oRm6HXB58W09TG
 7tJWtGWVD4U4VP1fZoloWE0KVb0GTr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXSRnwccrq+yJLZ0jZsD6FFupyI6pHp9hVBE78jRiYU=;
 b=WQuR+P24HacLwxg7VdUq/BA1fWV6lBKarRV9N2Wo/BP5l0jHt93K/L+i5XkfSaeghPXBHQ
 t4kEvdESLN1J9MBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2C9913398;
 Mon, 13 Nov 2023 09:14:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qH2gKgPpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 01/10] drm/ast: Turn ioregs_lock to modeset_lock
Date: Mon, 13 Nov 2023 09:50:23 +0100
Message-ID: <20231113091439.17181-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113091439.17181-1-tzimmermann@suse.de>
References: <20231113091439.17181-1-tzimmermann@suse.de>
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

The lock for the I/O registers is only relevant during mode-setting
operations. It protects the registers from concurrent access from
reading EDID information.

Reduce lock coverage to mode setting, rename the lock and move it
entirely into the mode-setting code. No functional changes, as the
I/O lock was never used for anything else than mode setting.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  3 ++-
 drivers/gpu/drm/ast/ast_main.c |  4 ----
 drivers/gpu/drm/ast/ast_mode.c | 26 +++++++++++++++-----------
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2aee32344f4a2..8b5d6e2954858 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -181,7 +181,6 @@ to_ast_sil164_connector(struct drm_connector *connector)
 struct ast_device {
 	struct drm_device base;
 
-	struct mutex ioregs_lock; /* Protects access to I/O registers in ioregs */
 	void __iomem *regs;
 	void __iomem *ioregs;
 	void __iomem *dp501_fw_buf;
@@ -196,6 +195,8 @@ struct ast_device {
 	unsigned long	vram_size;
 	unsigned long	vram_fb_available;
 
+	struct mutex modeset_lock; /* Protects access to modeset I/O registers in ioregs */
+
 	struct ast_plane primary_plane;
 	struct ast_plane cursor_plane;
 	struct drm_crtc crtc;
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f4ab40e22ceac..445cf47871a43 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -440,10 +440,6 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 
 	pci_set_drvdata(pdev, dev);
 
-	ret = drmm_mutex_init(dev, &ast->ioregs_lock);
-	if (ret)
-		return ERR_PTR(ret);
-
 	ast->regs = pcim_iomap(pdev, 1, 0);
 	if (!ast->regs)
 		return ERR_PTR(-EIO);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cb96149842851..817c291aef2c4 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1358,13 +1358,13 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 	 * Protect access to I/O registers from concurrent modesetting
 	 * by acquiring the I/O-register lock.
 	 */
-	mutex_lock(&ast->ioregs_lock);
+	mutex_lock(&ast->modeset_lock);
 
 	edid = drm_get_edid(connector, &ast_vga_connector->i2c->adapter);
 	if (!edid)
 		goto err_mutex_unlock;
 
-	mutex_unlock(&ast->ioregs_lock);
+	mutex_unlock(&ast->modeset_lock);
 
 	count = drm_add_edid_modes(connector, edid);
 	kfree(edid);
@@ -1372,7 +1372,7 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 	return count;
 
 err_mutex_unlock:
-	mutex_unlock(&ast->ioregs_lock);
+	mutex_unlock(&ast->modeset_lock);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
@@ -1464,13 +1464,13 @@ static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector
 	 * Protect access to I/O registers from concurrent modesetting
 	 * by acquiring the I/O-register lock.
 	 */
-	mutex_lock(&ast->ioregs_lock);
+	mutex_lock(&ast->modeset_lock);
 
 	edid = drm_get_edid(connector, &ast_sil164_connector->i2c->adapter);
 	if (!edid)
 		goto err_mutex_unlock;
 
-	mutex_unlock(&ast->ioregs_lock);
+	mutex_unlock(&ast->modeset_lock);
 
 	count = drm_add_edid_modes(connector, edid);
 	kfree(edid);
@@ -1478,7 +1478,7 @@ static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector
 	return count;
 
 err_mutex_unlock:
-	mutex_unlock(&ast->ioregs_lock);
+	mutex_unlock(&ast->modeset_lock);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
@@ -1670,13 +1670,13 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	 * Protect access to I/O registers from concurrent modesetting
 	 * by acquiring the I/O-register lock.
 	 */
-	mutex_lock(&ast->ioregs_lock);
+	mutex_lock(&ast->modeset_lock);
 
 	succ = ast_astdp_read_edid(connector->dev, edid);
 	if (succ < 0)
 		goto err_mutex_unlock;
 
-	mutex_unlock(&ast->ioregs_lock);
+	mutex_unlock(&ast->modeset_lock);
 
 	drm_connector_update_edid_property(connector, edid);
 	count = drm_add_edid_modes(connector, edid);
@@ -1685,7 +1685,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	return count;
 
 err_mutex_unlock:
-	mutex_unlock(&ast->ioregs_lock);
+	mutex_unlock(&ast->modeset_lock);
 	kfree(edid);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
@@ -1827,9 +1827,9 @@ static void ast_mode_config_helper_atomic_commit_tail(struct drm_atomic_state *s
 	 * display modes. Protect access to I/O registers by acquiring
 	 * the I/O-register lock. Released in atomic_flush().
 	 */
-	mutex_lock(&ast->ioregs_lock);
+	mutex_lock(&ast->modeset_lock);
 	drm_atomic_helper_commit_tail_rpm(state);
-	mutex_unlock(&ast->ioregs_lock);
+	mutex_unlock(&ast->modeset_lock);
 }
 
 static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs = {
@@ -1866,6 +1866,10 @@ int ast_mode_config_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	int ret;
 
+	ret = drmm_mutex_init(dev, &ast->modeset_lock);
+	if (ret)
+		return ret;
+
 	ret = drmm_mode_config_init(dev);
 	if (ret)
 		return ret;
-- 
2.42.0

