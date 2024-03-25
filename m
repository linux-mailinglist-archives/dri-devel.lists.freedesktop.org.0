Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7588B0E7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BC610E322;
	Mon, 25 Mar 2024 20:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF64F10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7058D5CB5C;
 Mon, 25 Mar 2024 20:09:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2205C13A71;
 Mon, 25 Mar 2024 20:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id eN4BB93ZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:09:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 10/13] drm/ast: Acquire I/O-register lock in DDC code
Date: Mon, 25 Mar 2024 21:06:55 +0100
Message-ID: <20240325200855.21150-11-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 7058D5CB5C
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

The modeset lock protects the DDC code from concurrent modeset
operations, which use the same registers. Move that code from the
connector helpers into the DDC helpers .pre_xfer() and .post_xfer().

Both, .pre_xfer() and .post_xfer(), enclose the transfer of data blocks
over the I2C channel in the internal I2C function bit_xfer(). Both
calls are executed unconditionally if present. Invoking DDC transfers
from any where within the driver now takes the lock.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/ast/ast_ddc.c  | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_mode.c | 30 ++++--------------------------
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
index b84e656124f18..b7718084422f3 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -59,6 +59,28 @@ static void ast_ddc_algo_bit_data_setscl(void *data, int state)
 	}
 }
 
+static int ast_ddc_algo_bit_data_pre_xfer(struct i2c_adapter *adapter)
+{
+	struct ast_ddc *ddc = i2c_get_adapdata(adapter);
+	struct ast_device *ast = ddc->ast;
+
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&ast->modeset_lock);
+
+	return 0;
+}
+
+static void ast_ddc_algo_bit_data_post_xfer(struct i2c_adapter *adapter)
+{
+	struct ast_ddc *ddc = i2c_get_adapdata(adapter);
+	struct ast_device *ast = ddc->ast;
+
+	mutex_unlock(&ast->modeset_lock);
+}
+
 static int ast_ddc_algo_bit_data_getsda(void *data)
 {
 	struct ast_ddc *ddc = data;
@@ -137,6 +159,8 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
 	bit->setscl = ast_ddc_algo_bit_data_setscl;
 	bit->getsda = ast_ddc_algo_bit_data_getsda;
 	bit->getscl = ast_ddc_algo_bit_data_getscl;
+	bit->pre_xfer = ast_ddc_algo_bit_data_pre_xfer;
+	bit->post_xfer = ast_ddc_algo_bit_data_post_xfer;
 
 	adapter->algo_data = bit;
 	ret = i2c_bit_add_bus(adapter);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index fc73d3b65b2a1..8766a0f2eb3c7 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1346,30 +1346,19 @@ static int ast_crtc_init(struct drm_device *dev)
 
 static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
-	struct ast_device *ast = to_ast_device(dev);
 	struct edid *edid;
 	int count;
 
-	/*
-	 * Protect access to I/O registers from concurrent modesetting
-	 * by acquiring the I/O-register lock.
-	 */
-	mutex_lock(&ast->modeset_lock);
-
 	edid = drm_get_edid(connector, connector->ddc);
 	if (!edid)
-		goto err_mutex_unlock;
-
-	mutex_unlock(&ast->modeset_lock);
+		goto err_drm_get_edid;
 
 	count = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
 	return count;
 
-err_mutex_unlock:
-	mutex_unlock(&ast->modeset_lock);
+err_drm_get_edid:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
 }
@@ -1444,30 +1433,19 @@ static int ast_vga_output_init(struct ast_device *ast)
 
 static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
-	struct ast_device *ast = to_ast_device(dev);
 	struct edid *edid;
 	int count;
 
-	/*
-	 * Protect access to I/O registers from concurrent modesetting
-	 * by acquiring the I/O-register lock.
-	 */
-	mutex_lock(&ast->modeset_lock);
-
 	edid = drm_get_edid(connector, connector->ddc);
 	if (!edid)
-		goto err_mutex_unlock;
-
-	mutex_unlock(&ast->modeset_lock);
+		goto err_drm_get_edid;
 
 	count = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
 	return count;
 
-err_mutex_unlock:
-	mutex_unlock(&ast->modeset_lock);
+err_drm_get_edid:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
 }
-- 
2.44.0

