Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B051717F
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAF910EBB5;
	Mon,  2 May 2022 14:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAA010EBB3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:25:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0DA31F747;
 Mon,  2 May 2022 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651501528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JU1FYdVcjMKZDlvtZnEkYkJq3t4PEzcxMij+XjTqqQI=;
 b=KOu/mH7oMrsMlCYOgsAcMKAL5n+RUb55kUKq/uXLkyn+UPGpG8lhGPpE1xYeXgK1jqItU/
 cQ/xMOnbeoeTSQZ06L+7YIXEMy4vUOZeRfMsxMp0bN3xtaYtFisZG11TC1KaBQyMZWZ8Jl
 19tZ9h++YaYH5/A2AVMvi+KpdNmvm+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651501528;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JU1FYdVcjMKZDlvtZnEkYkJq3t4PEzcxMij+XjTqqQI=;
 b=ToHNhtub0Y/kzKuWpLW8116Z9h4e5g6Df1/g1eEf6G9sDGQTKdmRjyGblHMKxRUaeKPvi1
 XQmrKCFPr2oXS5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B416F13491;
 Mon,  2 May 2022 14:25:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sCE6K9jpb2J4MgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 May 2022 14:25:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 2/3] drm/ast: Protect concurrent access to I/O registers with
 lock
Date: Mon,  2 May 2022 16:25:13 +0200
Message-Id: <20220502142514.2174-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502142514.2174-1-tzimmermann@suse.de>
References: <20220502142514.2174-1-tzimmermann@suse.de>
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

Add a mutex lock to protect concurrent access to I/O registers
against each other. This happens between invokataion of commit-
tail functions and get-mode operations. Both with use the CRTC
index register AST_IO_CRTC_PORT. Concurrent access can lead to
failed mode-setting operations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c |  4 +++
 drivers/gpu/drm/ast/ast_mode.c | 48 +++++++++++++++++++++++++++++++---
 3 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index a19315b2f7e56..43cedd767f8f1 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -158,6 +158,7 @@ to_ast_sil164_connector(struct drm_connector *connector)
 struct ast_private {
 	struct drm_device base;
 
+	struct mutex ioregs_lock; /* Protects access to I/O registers in ioregs */
 	void __iomem *regs;
 	void __iomem *ioregs;
 	void __iomem *dp501_fw_buf;
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 22e9e2d3c71ab..5ad473aeaea2b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -420,6 +420,10 @@ struct ast_private *ast_device_create(const struct drm_driver *drv,
 
 	pci_set_drvdata(pdev, dev);
 
+	ret = drmm_mutex_init(dev, &ast->ioregs_lock);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ast->regs = pcim_iomap(pdev, 1, 0);
 	if (!ast->regs)
 		return ERR_PTR(-EIO);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 45b56b39ad473..f7849638fcb7e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1099,6 +1099,20 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static void ast_crtc_helper_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct ast_private *ast = to_ast_private(dev);
+
+	/*
+	 * Concurrent operations could possibly trigger a call to
+	 * drm_connector_helper_funcs.get_modes by trying to read the
+	 * display modes. Protect access to I/O registers by acquiring
+	 * the I/O-register lock. Released in atomic_flush().
+	 */
+	mutex_lock(&ast->ioregs_lock);
+}
+
 static void
 ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state)
@@ -1107,7 +1121,8 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 									  crtc);
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
 									      crtc);
-	struct ast_private *ast = to_ast_private(crtc->dev);
+	struct drm_device *dev = crtc->dev;
+	struct ast_private *ast = to_ast_private(dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
 
@@ -1117,6 +1132,8 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	 */
 	if (old_ast_crtc_state->format != ast_crtc_state->format)
 		ast_crtc_load_lut(ast, crtc);
+
+	mutex_unlock(&ast->ioregs_lock);
 }
 
 static void
@@ -1175,6 +1192,7 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
 	.mode_valid = ast_crtc_helper_mode_valid,
 	.atomic_check = ast_crtc_helper_atomic_check,
+	.atomic_begin = ast_crtc_helper_atomic_begin,
 	.atomic_flush = ast_crtc_helper_atomic_flush,
 	.atomic_enable = ast_crtc_helper_atomic_enable,
 	.atomic_disable = ast_crtc_helper_atomic_disable,
@@ -1260,21 +1278,33 @@ static int ast_crtc_init(struct drm_device *dev)
 static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ast_vga_connector *ast_vga_connector = to_ast_vga_connector(connector);
+	struct drm_device *dev = connector->dev;
+	struct ast_private *ast = to_ast_private(dev);
 	struct edid *edid;
 	int count;
 
 	if (!ast_vga_connector->i2c)
 		goto err_drm_connector_update_edid_property;
 
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&ast->ioregs_lock);
+
 	edid = drm_get_edid(connector, &ast_vga_connector->i2c->adapter);
 	if (!edid)
-		goto err_drm_connector_update_edid_property;
+		goto err_mutex_unlock;
+
+	mutex_unlock(&ast->ioregs_lock);
 
 	count = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
 	return count;
 
+err_mutex_unlock:
+	mutex_unlock(&ast->ioregs_lock);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
@@ -1354,21 +1384,33 @@ static int ast_vga_output_init(struct ast_private *ast)
 static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ast_sil164_connector *ast_sil164_connector = to_ast_sil164_connector(connector);
+	struct drm_device *dev = connector->dev;
+	struct ast_private *ast = to_ast_private(dev);
 	struct edid *edid;
 	int count;
 
 	if (!ast_sil164_connector->i2c)
 		goto err_drm_connector_update_edid_property;
 
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&ast->ioregs_lock);
+
 	edid = drm_get_edid(connector, &ast_sil164_connector->i2c->adapter);
 	if (!edid)
-		goto err_drm_connector_update_edid_property;
+		goto err_mutex_unlock;
+
+	mutex_unlock(&ast->ioregs_lock);
 
 	count = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
 	return count;
 
+err_mutex_unlock:
+	mutex_unlock(&ast->ioregs_lock);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
-- 
2.36.0

