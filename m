Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9F99536EF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 17:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3C510E45C;
	Thu, 15 Aug 2024 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ghD1LLlS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+NJhp86";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ghD1LLlS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+NJhp86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840A010E45C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 15:20:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 381A120030;
 Thu, 15 Aug 2024 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5t3EocSQyZ7ubL3dJES2wbKDcmI889D0pQFDz03BZns=;
 b=ghD1LLlSLl/JIYcXbriAdEBpSE1gB58/3HJ7w9byAcy4EUc2KIskUX01sz4VcBAsJq/glL
 Vwt4GR0HPHQGEfhWB35Gr6twSvGEqEMxu+wZgN7S1DV6kKpbeHMSR/W05BjV+jIp6vquXU
 awnHP2Hjpu5m39wesWtN3XH+FjsJpq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5t3EocSQyZ7ubL3dJES2wbKDcmI889D0pQFDz03BZns=;
 b=9+NJhp862QWs8vMoni9EFpvw6xsX/IZyYYJHouEzcU+JTgLDZ/Q2BEMig8jMvKCtAE+b8T
 dQtBGVULX3Q/7wCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5t3EocSQyZ7ubL3dJES2wbKDcmI889D0pQFDz03BZns=;
 b=ghD1LLlSLl/JIYcXbriAdEBpSE1gB58/3HJ7w9byAcy4EUc2KIskUX01sz4VcBAsJq/glL
 Vwt4GR0HPHQGEfhWB35Gr6twSvGEqEMxu+wZgN7S1DV6kKpbeHMSR/W05BjV+jIp6vquXU
 awnHP2Hjpu5m39wesWtN3XH+FjsJpq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5t3EocSQyZ7ubL3dJES2wbKDcmI889D0pQFDz03BZns=;
 b=9+NJhp862QWs8vMoni9EFpvw6xsX/IZyYYJHouEzcU+JTgLDZ/Q2BEMig8jMvKCtAE+b8T
 dQtBGVULX3Q/7wCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAF8813B0C;
 Thu, 15 Aug 2024 15:19:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wF0nOJ8cvmb6DAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Aug 2024 15:19:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 09/11] drm/ast: sil164: Transparently handle BMC support
Date: Thu, 15 Aug 2024 17:18:51 +0200
Message-ID: <20240815151953.184679-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815151953.184679-1-tzimmermann@suse.de>
References: <20240815151953.184679-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Permanently set the connector status to 'connected'. Return BMC modes
for connector if no display is attached to the physical DP connector.
Otherwise use EDID modes as before.

If the status of the physical connector changes, the driver still
generates a hotplug event. DRM clients will then reconfigure their
output to a mode appropriate for either physical display or BMC.

v3:
- use struct ast_connector.physical_status to handle BMC

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_sil164.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
index 05f991aa34ca..496c7120e515 100644
--- a/drivers/gpu/drm/ast/ast_sil164.c
+++ b/drivers/gpu/drm/ast/ast_sil164.c
@@ -21,6 +21,27 @@ static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
  * Connector
  */
 
+static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct ast_connector *ast_connector = to_ast_connector(connector);
+	int count;
+
+	if (ast_connector->physical_status == connector_status_connected) {
+		count = drm_connector_helper_get_modes(connector);
+	} else {
+		/*
+		 * There's no EDID data without a connected monitor. Set BMC-
+		 * compatible modes in this case. The XGA default resolution
+		 * should work well for all BMCs.
+		 */
+		count = drm_add_modes_noedid(connector, 4096, 4096);
+		if (count)
+			drm_set_preferred_mode(connector, 1024, 768);
+	}
+
+	return count;
+}
+
 static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connector,
 						  struct drm_modeset_acquire_ctx *ctx,
 						  bool force)
@@ -30,13 +51,15 @@ static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connecto
 
 	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
 
+	if (status != ast_connector->physical_status)
+		++connector->epoch_counter;
 	ast_connector->physical_status = status;
 
-	return status;
+	return connector_status_connected;
 }
 
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
-	.get_modes = drm_connector_helper_get_modes,
+	.get_modes = ast_sil164_connector_helper_get_modes,
 	.detect_ctx = ast_sil164_connector_helper_detect_ctx,
 };
 
-- 
2.46.0

