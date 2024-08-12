Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BA94E9D7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7F910E195;
	Mon, 12 Aug 2024 09:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SsG4WIve";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VCUbgclP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SsG4WIve";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VCUbgclP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B045C10E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:32:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6AC441FB87;
 Mon, 12 Aug 2024 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723455137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCPLkN2ui1TSl3asX0Ygi6Rk/tHb+SOMN771jQD1R6s=;
 b=SsG4WIveUPSSukPARTRjaSpMYqA9Q7vOb4iZpohqc+eA0rGV8CYibMK2NKj0HMMLBOnSDs
 4QxZpmQqwGViVmW7PhJdvIOpAJnzZatDajaAo1+MBLUbm3ZOYjFrTWgga1d2ZaI5H/cwsL
 36TMrux/03sbgFynIF0IHsVtqNzVXJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723455137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCPLkN2ui1TSl3asX0Ygi6Rk/tHb+SOMN771jQD1R6s=;
 b=VCUbgclPNXDf6sQyUPk8bC8HQKbABkUTMb9vUBOR4qOLh+iNv2X5U1285LZg3novD+wNgD
 V6wIAx6n667QsVCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723455137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCPLkN2ui1TSl3asX0Ygi6Rk/tHb+SOMN771jQD1R6s=;
 b=SsG4WIveUPSSukPARTRjaSpMYqA9Q7vOb4iZpohqc+eA0rGV8CYibMK2NKj0HMMLBOnSDs
 4QxZpmQqwGViVmW7PhJdvIOpAJnzZatDajaAo1+MBLUbm3ZOYjFrTWgga1d2ZaI5H/cwsL
 36TMrux/03sbgFynIF0IHsVtqNzVXJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723455137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCPLkN2ui1TSl3asX0Ygi6Rk/tHb+SOMN771jQD1R6s=;
 b=VCUbgclPNXDf6sQyUPk8bC8HQKbABkUTMb9vUBOR4qOLh+iNv2X5U1285LZg3novD+wNgD
 V6wIAx6n667QsVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2EDE413A3D;
 Mon, 12 Aug 2024 09:32:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cOMfCqHWuWYjMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 09:32:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/9] drm/ast: astdp: Move locking into EDID helper
Date: Mon, 12 Aug 2024 11:30:36 +0200
Message-ID: <20240812093211.382263-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812093211.382263-1-tzimmermann@suse.de>
References: <20240812093211.382263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

The modeset mutex protects EDID retrival from concurrent modeset
operations. Acquire the lock in ast_astdp_read_edid(). Prepares the
code for conversion to struct drm_edid.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_dp.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index ef2dd9d82de9..217c155f0874 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -26,6 +26,12 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	int ret = 0;
 	u8 i;
 
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&ast->modeset_lock);
+
 	/* Start reading EDID data */
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
 
@@ -95,6 +101,8 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE,
 			       AST_IO_VGACRE5_EDID_READ_DONE);
 
+	mutex_unlock(&ast->modeset_lock);
+
 	return ret;
 }
 
@@ -323,9 +331,6 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
 static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 {
 	void *edid;
-	struct drm_device *dev = connector->dev;
-	struct ast_device *ast = to_ast_device(dev);
-
 	int succ;
 	int count;
 
@@ -333,17 +338,9 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto err_drm_connector_update_edid_property;
 
-	/*
-	 * Protect access to I/O registers from concurrent modesetting
-	 * by acquiring the I/O-register lock.
-	 */
-	mutex_lock(&ast->modeset_lock);
-
 	succ = ast_astdp_read_edid(connector->dev, edid);
 	if (succ < 0)
-		goto err_mutex_unlock;
-
-	mutex_unlock(&ast->modeset_lock);
+		goto err_kfree;
 
 	drm_connector_update_edid_property(connector, edid);
 	count = drm_add_edid_modes(connector, edid);
@@ -351,8 +348,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 
 	return count;
 
-err_mutex_unlock:
-	mutex_unlock(&ast->modeset_lock);
+err_kfree:
 	kfree(edid);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
-- 
2.46.0

