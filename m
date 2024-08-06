Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A23C948FB1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807DF10E26E;
	Tue,  6 Aug 2024 12:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DqgL1ofC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lEAWMvRY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DqgL1ofC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lEAWMvRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2234910E307
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:56:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BAED11FDD3;
 Tue,  6 Aug 2024 12:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722948967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM9zQrusGDXq1NZV/WYDJXx9Yt6eqxfDGTi+XlPuREE=;
 b=DqgL1ofC5gw1ry3FX7DhZDZvZLH2FCF0kScSgE6UaqMnJwbDDnDbrdP4XirzwUtk6VJp1a
 m1X8Y59EPBwjkveDG55MdhMAkoCRLf5lW7bGh0CtXH6xG88aQlYQt39xNV4vzbuexmCjED
 FEIi2lmcpLNGgxLeS0RBesdr8d8JGO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722948967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM9zQrusGDXq1NZV/WYDJXx9Yt6eqxfDGTi+XlPuREE=;
 b=lEAWMvRYB6OvfYsoXwjtbXYz0yqAnz5nYqZqJJSJ6kOem0CVc1UZaD7C09z/2Eu8+xfs73
 c66B4k0t82NGFgAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722948967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM9zQrusGDXq1NZV/WYDJXx9Yt6eqxfDGTi+XlPuREE=;
 b=DqgL1ofC5gw1ry3FX7DhZDZvZLH2FCF0kScSgE6UaqMnJwbDDnDbrdP4XirzwUtk6VJp1a
 m1X8Y59EPBwjkveDG55MdhMAkoCRLf5lW7bGh0CtXH6xG88aQlYQt39xNV4vzbuexmCjED
 FEIi2lmcpLNGgxLeS0RBesdr8d8JGO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722948967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM9zQrusGDXq1NZV/WYDJXx9Yt6eqxfDGTi+XlPuREE=;
 b=lEAWMvRYB6OvfYsoXwjtbXYz0yqAnz5nYqZqJJSJ6kOem0CVc1UZaD7C09z/2Eu8+xfs73
 c66B4k0t82NGFgAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8203513AF4;
 Tue,  6 Aug 2024 12:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eKh6Hmcdsmb9PQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Aug 2024 12:56:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/9] drm/ast: vga: Transparently handle BMC support
Date: Tue,  6 Aug 2024 14:52:03 +0200
Message-ID: <20240806125601.78650-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806125601.78650-1-tzimmermann@suse.de>
References: <20240806125601.78650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.79 / 50.00]; REPLY(-4.00)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.19)[-0.973];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.79
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_vga.c | 40 +++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
index 2ea0763844f3..8f080af0b61b 100644
--- a/drivers/gpu/drm/ast/ast_vga.c
+++ b/drivers/gpu/drm/ast/ast_vga.c
@@ -21,9 +21,45 @@ static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
  * Connector
  */
 
+static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
+{
+	int count = drm_connector_helper_get_modes(connector);
+
+	if (!count) {
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
+static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
+					       struct drm_modeset_acquire_ctx *ctx,
+					       bool force)
+{
+	enum drm_connector_status old_status, status;
+
+	if (connector->edid_blob_ptr)
+		old_status = connector_status_connected;
+	else
+		old_status = connector_status_disconnected;
+
+	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
+
+	if (status != old_status)
+		++connector->epoch_counter;
+	return connector_status_connected;
+}
+
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
-	.get_modes = drm_connector_helper_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc,
+	.get_modes = ast_vga_connector_helper_get_modes,
+	.detect_ctx = ast_vga_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_vga_connector_funcs = {
-- 
2.46.0

