Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A42944C4C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 15:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134C10E96B;
	Thu,  1 Aug 2024 13:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="inrd5q6R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B5uiytVY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Upnr259K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m4r9pP7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396910E96B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 13:04:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10FA321B6F;
 Thu,  1 Aug 2024 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722517494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/vk/D3zb2dfTMzGfsu63xbO4Go9J+M4udjDERwpOVao=;
 b=inrd5q6RApgN9GDwtaBoC5B0AVtLSZzEriMhc6EX6YN9QT8xTtaRcmWsZLlhHbQc8FzYGx
 HUTxlb1i0DKtp31bv9K/5kJGaE1mEo6ptucn9KjyEHvYmLjmqgSESJPBQzJ0F6VaMDrNqE
 xqNZ0UeK6eGT3dSL0gzK9sIkJEZtc30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722517494;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/vk/D3zb2dfTMzGfsu63xbO4Go9J+M4udjDERwpOVao=;
 b=B5uiytVYOBBYfABqM5mJl+TIGhWgmPwMvxCS3gYYWvZcXjrcLOh5dj+G5Fo7sbMlXVv8GL
 hQMtrGKcLCNU4FBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Upnr259K;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m4r9pP7h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722517493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/vk/D3zb2dfTMzGfsu63xbO4Go9J+M4udjDERwpOVao=;
 b=Upnr259K7k1c/hA5Nh49d828N3lXY6H72jvhKyADybGe/vac7kBBFHVhCBVA/OFUzjui7T
 c39JP0MNtxX3atMB39lj+0lskoFuM/MUmq6nnbXvUjZMvdObI/L6C/LskT2hlFdds+/qgP
 vlK6Csvem+SA7dDE9YmL1FA4rlbpNwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722517493;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/vk/D3zb2dfTMzGfsu63xbO4Go9J+M4udjDERwpOVao=;
 b=m4r9pP7h4nO0mtK4/qsMqzzN0O9BSndCSL8l23FdmJ+R3bqQGgbaoBGz2bG8fHuwnYYPeO
 K8i3RP4KisWrzVCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6EAF136CF;
 Thu,  1 Aug 2024 13:04:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8u4nM/SHq2YLaQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Aug 2024 13:04:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/client: Use common display mode for cloned outputs
Date: Thu,  1 Aug 2024 15:04:36 +0200
Message-ID: <20240801130449.104645-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.81 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -1.81
X-Rspamd-Queue-Id: 10FA321B6F
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

For cloned outputs, don't pick a default resolution of 1024x768 as
most hardware can do better. Instead look through the modes of all
connectors to find a common mode for all of them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client_modeset.c | 54 +++++++++++++++++-----------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 31af5cf37a09..67b422dc8e7f 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -266,7 +266,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 {
 	int count, i, j;
 	bool can_clone = false;
-	struct drm_display_mode *dmt_mode, *mode;
+	struct drm_display_mode *mode, *common_mode = NULL;
 
 	/* only contemplate cloning in the single crtc case */
 	if (dev->mode_config.num_crtc > 1)
@@ -309,35 +309,49 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 		return true;
 	}
 
-	/* try and find a 1024x768 mode on each connector */
-	can_clone = true;
-	dmt_mode = drm_mode_find_dmt(dev, 1024, 768, 60, false);
-
-	if (!dmt_mode)
-		goto fail;
+	/* try and find a mode common among connectors */
 
+	can_clone = false;
 	for (i = 0; i < connector_count; i++) {
 		if (!enabled[i])
 			continue;
 
-		list_for_each_entry(mode, &connectors[i]->modes, head) {
-			if (drm_mode_match(mode, dmt_mode,
-					   DRM_MODE_MATCH_TIMINGS |
-					   DRM_MODE_MATCH_CLOCK |
-					   DRM_MODE_MATCH_FLAGS |
-					   DRM_MODE_MATCH_3D_FLAGS))
-				modes[i] = mode;
+		list_for_each_entry(common_mode, &connectors[i]->modes, head) {
+			can_clone = true;
+
+			for (j = 1; j < connector_count; j++) {
+				if (!enabled[i])
+					continue;
+
+				can_clone = false;
+				list_for_each_entry(mode, &connectors[j]->modes, head) {
+					can_clone = drm_mode_match(common_mode, mode,
+								   DRM_MODE_MATCH_TIMINGS |
+							    DRM_MODE_MATCH_CLOCK |
+							    DRM_MODE_MATCH_FLAGS |
+							    DRM_MODE_MATCH_3D_FLAGS);
+					if (can_clone)
+						break; // found common mode on connector
+				}
+				if (!can_clone)
+					break; // try next common mode
+			}
+			if (can_clone)
+				break; // found common mode among all connectors
 		}
-		if (!modes[i])
-			can_clone = false;
+		break;
 	}
-	kfree(dmt_mode);
-
 	if (can_clone) {
-		drm_dbg_kms(dev, "can clone using 1024x768\n");
+		for (i = 0; i < connector_count; i++) {
+			if (!enabled[i])
+				continue;
+			modes[i] = common_mode;
+
+		}
+		drm_dbg_kms(dev, "can clone using" DRM_MODE_FMT "\n", DRM_MODE_ARG(common_mode));
 		return true;
 	}
-fail:
+
 	drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n");
 	return false;
 }
-- 
2.45.2

