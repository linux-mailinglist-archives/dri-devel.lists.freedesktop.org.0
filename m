Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB826880ED0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0FB10F3FC;
	Wed, 20 Mar 2024 09:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="H/1MwHiH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2dPwTPOB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H/1MwHiH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2dPwTPOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA5D10E732
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C9A3340ED;
 Wed, 20 Mar 2024 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQOs9D9FimIjHjSSYXXrEiFpHbuOV08Ooc3WEzqx+rc=;
 b=H/1MwHiHNzvJHI63c+8KtTgSq4jWJkyXpcrhrHz3vvFXG+wB6F+s2S49D3IHsFG5Ul+1fi
 HDSzkwdaEcBQir8n+7b4UKXfVes20VVDKF3gqmwAqh71IOrcqE+yDiZDpzF+XGbq/jg/mo
 1xWNWnSrGwfQQoyd2Ku697zIqL3hpEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQOs9D9FimIjHjSSYXXrEiFpHbuOV08Ooc3WEzqx+rc=;
 b=2dPwTPOBfQdrrhT81+/BjuRvJLbQa2OT4E8QINLvyU7DLA4dRZsq2+y9U/SrSgMxhakGv1
 AhRoC9GaYwujVACA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQOs9D9FimIjHjSSYXXrEiFpHbuOV08Ooc3WEzqx+rc=;
 b=H/1MwHiHNzvJHI63c+8KtTgSq4jWJkyXpcrhrHz3vvFXG+wB6F+s2S49D3IHsFG5Ul+1fi
 HDSzkwdaEcBQir8n+7b4UKXfVes20VVDKF3gqmwAqh71IOrcqE+yDiZDpzF+XGbq/jg/mo
 1xWNWnSrGwfQQoyd2Ku697zIqL3hpEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQOs9D9FimIjHjSSYXXrEiFpHbuOV08Ooc3WEzqx+rc=;
 b=2dPwTPOBfQdrrhT81+/BjuRvJLbQa2OT4E8QINLvyU7DLA4dRZsq2+y9U/SrSgMxhakGv1
 AhRoC9GaYwujVACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5D17136CD;
 Wed, 20 Mar 2024 09:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OHHoNmiu+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 10/13] drm/ast: Acquire I/O-register lock in DDC code
Date: Wed, 20 Mar 2024 10:34:15 +0100
Message-ID: <20240320093738.6341-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320093738.6341-1-tzimmermann@suse.de>
References: <20240320093738.6341-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
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

