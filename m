Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0380999D4B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4767810EA52;
	Fri, 11 Oct 2024 06:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Vy603nhZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRB+PJ6Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vy603nhZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRB+PJ6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3D610EA4C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:57:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 060FA21A77;
 Fri, 11 Oct 2024 06:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728629831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gE50FJfPXUIe0AgbV2fCywiznOF8gGtDL3nanKch2OI=;
 b=Vy603nhZL0QNlGNpndcUZab8Vgx2xdXHePqv6OU0J9evrOkPijjJGrU3QGnu5+qUYVefOA
 wFadCI3O28mSCLslbkHqOY1ON3KP1MnVF25FrERKfPaMJNxGsL0aWZfVBUguIjkQvyBH0s
 gsqW5/ya5ybgQxgX+DAC0k+pAsfddwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728629831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gE50FJfPXUIe0AgbV2fCywiznOF8gGtDL3nanKch2OI=;
 b=ZRB+PJ6YyoFImDOreBHUJPh7eak9+YtBNzgylPp78iuEFuoDhiH5d4v5J16LmnRl/ZBw7z
 24sxqg8q6T6/vMCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728629831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gE50FJfPXUIe0AgbV2fCywiznOF8gGtDL3nanKch2OI=;
 b=Vy603nhZL0QNlGNpndcUZab8Vgx2xdXHePqv6OU0J9evrOkPijjJGrU3QGnu5+qUYVefOA
 wFadCI3O28mSCLslbkHqOY1ON3KP1MnVF25FrERKfPaMJNxGsL0aWZfVBUguIjkQvyBH0s
 gsqW5/ya5ybgQxgX+DAC0k+pAsfddwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728629831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gE50FJfPXUIe0AgbV2fCywiznOF8gGtDL3nanKch2OI=;
 b=ZRB+PJ6YyoFImDOreBHUJPh7eak9+YtBNzgylPp78iuEFuoDhiH5d4v5J16LmnRl/ZBw7z
 24sxqg8q6T6/vMCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BED2F13AB0;
 Fri, 11 Oct 2024 06:57:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KB5VLUbMCGcRfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 06:57:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, airlied@redhat.com,
 jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/7] drm/mgag200: Track physical connector status in struct
 drm_connector
Date: Fri, 11 Oct 2024 08:43:12 +0200
Message-ID: <20241011065705.6728-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011065705.6728-1-tzimmermann@suse.de>
References: <20241011065705.6728-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
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

Set bmc_attached for the VGA connector on servers and let DRM's
probe helpers track the physical and logical connector state. Remove
similar logic from mgag200.

Also resolve a design issue, where mgag200 uses the connector's
edid_blob_ptr. It is an internal value that drivers should not access
directly.

Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/87msjtxk8f.fsf@intel.com/raw
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 32 +++++------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
index a5a3ac108bd5..cff333572b29 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
@@ -54,9 +54,11 @@ static int mgag200_vga_bmc_connector_helper_get_modes(struct drm_connector *conn
 	const struct mgag200_device_info *minfo = mdev->info;
 	int count;
 
-	count = drm_connector_helper_get_modes(connector);
+	if (connector->physical_status == connector_status_connected) {
+		count = drm_connector_helper_get_modes(connector);
+	} else {
+		drm_edid_connector_update(connector, NULL);
 
-	if (!count) {
 		/*
 		 * There's no EDID data without a connected monitor. Set BMC-
 		 * compatible modes in this case. The XGA default resolution
@@ -70,32 +72,9 @@ static int mgag200_vga_bmc_connector_helper_get_modes(struct drm_connector *conn
 	return count;
 }
 
-/*
- * There's no monitor connected if the DDC did not return an EDID. Still
- * return 'connected' as there's always a BMC. Incrementing the connector's
- * epoch counter triggers an update of the related properties.
- */
-static int mgag200_vga_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
-						       struct drm_modeset_acquire_ctx *ctx,
-						       bool force)
-{
-	enum drm_connector_status old_status, status;
-
-	if (connector->edid_blob_ptr)
-		old_status = connector_status_connected;
-	else
-		old_status = connector_status_disconnected;
-
-	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
-
-	if (status != old_status)
-		++connector->epoch_counter;
-	return connector_status_connected;
-}
-
 static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
 	.get_modes = mgag200_vga_bmc_connector_helper_get_modes,
-	.detect_ctx = mgag200_vga_bmc_connector_helper_detect_ctx,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
 };
 
 static const struct drm_connector_funcs mgag200_vga_connector_funcs = {
@@ -143,6 +122,7 @@ int mgag200_vga_bmc_output_init(struct mga_device *mdev)
 	}
 	drm_connector_helper_add(connector, &mgag200_vga_connector_helper_funcs);
 
+	connector->bmc_attached = true;
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
 			    DRM_CONNECTOR_POLL_DISCONNECT;
 
-- 
2.46.0

