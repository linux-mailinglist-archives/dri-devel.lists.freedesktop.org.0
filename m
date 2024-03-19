Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15787F937
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D35A10F599;
	Tue, 19 Mar 2024 08:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Dv/pG3TA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bMeLDCjP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dv/pG3TA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bMeLDCjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8660710F5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:14:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C4043750B;
 Tue, 19 Mar 2024 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLRVr6yG71OKVYKY30NHaQDpHOY5DWIh7GrleLHgH60=;
 b=Dv/pG3TAqmO3gOeJwuYjR+bHb006f2h7k+KGifcUE+o7j+ZIjsq930Ufmm7v8QTJpwTffL
 Y8Js2C8A1cgMXOh/g3duMKnt6igjopAMXlY/HePA7DhY+yPpSfjldqGM59o1ZBHugd9Bqr
 G0+QSyk1RfjAxGoxAKQya0MPvCcAZds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLRVr6yG71OKVYKY30NHaQDpHOY5DWIh7GrleLHgH60=;
 b=bMeLDCjPrKpLrapLR+ISA7FjKI5ESX7JlWXW/0CCB6HY46+zfbVILBpqMeogY2P+EZrT3P
 RmW0ve52EI6QHBCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLRVr6yG71OKVYKY30NHaQDpHOY5DWIh7GrleLHgH60=;
 b=Dv/pG3TAqmO3gOeJwuYjR+bHb006f2h7k+KGifcUE+o7j+ZIjsq930Ufmm7v8QTJpwTffL
 Y8Js2C8A1cgMXOh/g3duMKnt6igjopAMXlY/HePA7DhY+yPpSfjldqGM59o1ZBHugd9Bqr
 G0+QSyk1RfjAxGoxAKQya0MPvCcAZds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLRVr6yG71OKVYKY30NHaQDpHOY5DWIh7GrleLHgH60=;
 b=bMeLDCjPrKpLrapLR+ISA7FjKI5ESX7JlWXW/0CCB6HY46+zfbVILBpqMeogY2P+EZrT3P
 RmW0ve52EI6QHBCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0DB9A136D6;
 Tue, 19 Mar 2024 08:14:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AC2uAW1J+WWLeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 08:14:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 12/12] drm/ast: Implement polling for VGA and SIL164
 connectors
Date: Tue, 19 Mar 2024 09:00:32 +0100
Message-ID: <20240319081430.10165-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319081430.10165-1-tzimmermann@suse.de>
References: <20240319081430.10165-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: **
X-Spam-Score: 2.97
X-Spamd-Result: default: False [2.97 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.73)[83.76%]
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

Implement polling for VGA and SIL164 connectors. Set the flag
DRM_CONNECTOR_POLL_DISCONNECT for each to detect the removal of the
monitor cable. Implement struct drm_connector_helper_funcs.detect_ctx
for each type of connector by testing for EDID data. The code for
both types of connectors is identical for now. Maybe this can later
become a common helper function for various drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 36 ++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 71cc681d6188f..f740b8706a38b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1344,8 +1344,24 @@ static int ast_crtc_init(struct drm_device *dev)
  * VGA Connector
  */
 
+static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
+					       struct drm_modeset_acquire_ctx *ctx,
+					       bool force)
+{
+	enum drm_connector_status status = connector_status_disconnected;
+	const struct drm_edid *edid;
+
+	edid = drm_edid_read(connector);
+	if (edid)
+		status = connector_status_connected;
+	drm_edid_free(edid);
+
+	return status;
+}
+
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
 	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = ast_vga_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_vga_connector_funcs = {
@@ -1379,7 +1395,7 @@ static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
 }
@@ -1412,8 +1428,24 @@ static int ast_vga_output_init(struct ast_device *ast)
  * SIL164 Connector
  */
 
+static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connector,
+						  struct drm_modeset_acquire_ctx *ctx,
+						  bool force)
+{
+	enum drm_connector_status status = connector_status_disconnected;
+	const struct drm_edid *edid;
+
+	edid = drm_edid_read(connector);
+	if (edid)
+		status = connector_status_connected;
+	drm_edid_free(edid);
+
+	return status;
+}
+
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
 	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = ast_sil164_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_sil164_connector_funcs = {
@@ -1447,7 +1479,7 @@ static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connecto
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return 0;
 }
-- 
2.44.0

