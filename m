Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240687F93E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3219810F5FD;
	Tue, 19 Mar 2024 08:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Q6QXQfho";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPpfccOy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q6QXQfho";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPpfccOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA3410F599
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:14:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 043A55D33C;
 Tue, 19 Mar 2024 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZazCjhxEjywAUN/bztrQrCNB9pGpd993ou3gcI7sMM=;
 b=Q6QXQfhoJWB/COd43aEu8GAqDEFvozk/GZYo+aUUTIpzXgBmXYbUEjTX5gHv78xfWsQ6vH
 wgTR350OY3Q5aJ+xYbFRuZWnCeDqgi7DeXI5AQQtz6JlQ6zLQ3FGdi+7hm4XcSzY5t3gW6
 eRNx8Gl6hY9jjSjNNDt9stnO7DHYyQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZazCjhxEjywAUN/bztrQrCNB9pGpd993ou3gcI7sMM=;
 b=HPpfccOyNEZC1HtAPveE8Hpd7U210F5jfCsorISZTf9dcJGsOHu7gD5RIZ8J43Zx5gsqxt
 QRkZaXuiICt3DJAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZazCjhxEjywAUN/bztrQrCNB9pGpd993ou3gcI7sMM=;
 b=Q6QXQfhoJWB/COd43aEu8GAqDEFvozk/GZYo+aUUTIpzXgBmXYbUEjTX5gHv78xfWsQ6vH
 wgTR350OY3Q5aJ+xYbFRuZWnCeDqgi7DeXI5AQQtz6JlQ6zLQ3FGdi+7hm4XcSzY5t3gW6
 eRNx8Gl6hY9jjSjNNDt9stnO7DHYyQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZazCjhxEjywAUN/bztrQrCNB9pGpd993ou3gcI7sMM=;
 b=HPpfccOyNEZC1HtAPveE8Hpd7U210F5jfCsorISZTf9dcJGsOHu7gD5RIZ8J43Zx5gsqxt
 QRkZaXuiICt3DJAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAA0513700;
 Tue, 19 Mar 2024 08:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OFoZLGxJ+WWLeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 08:14:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 11/12] drm/ast: Use drm_connector_helper_get_modes()
Date: Tue, 19 Mar 2024 09:00:31 +0100
Message-ID: <20240319081430.10165-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319081430.10165-1-tzimmermann@suse.de>
References: <20240319081430.10165-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.58
X-Spamd-Result: default: False [3.58 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.12)[67.11%]
X-Spam-Level: ***
Authentication-Results: smtp-out2.suse.de;
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

The .get_modes() code for VGA and SIL164 connectors does not depend
on either type of connector. Replace the driver code with the common
helper drm_connector_helper_get_modes(). It reads EDID data via
DDC and updates the connector's EDID property.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

