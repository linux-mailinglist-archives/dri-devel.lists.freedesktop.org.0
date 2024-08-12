Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3AB94E8AB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF0810E169;
	Mon, 12 Aug 2024 08:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o6Zm79/o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RXwyNH8R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o6Zm79/o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RXwyNH8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A29210E10F;
 Mon, 12 Aug 2024 08:30:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2128020245;
 Mon, 12 Aug 2024 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T63Nsa06BLsiBwDkwyuu5LGJrjtXArT4y5AP/sXfsYI=;
 b=o6Zm79/oSfxaQmJpGIs5yAd1rbCzIfSBG/C1Flw4aBac8qmCed2grnztd1Eu4h7ktciFfM
 vi3TTOKaOFS5HcC3revxad66HVMgAiRv6YXUHnNAKxtSOtTXgNXLAtgX6EzC4xT3b0JsNA
 MSzhrY/4bqqRKm3Syry9TAGGsvfLP/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T63Nsa06BLsiBwDkwyuu5LGJrjtXArT4y5AP/sXfsYI=;
 b=RXwyNH8RXeKeckALOOVkYFmecej3KkRbGxYQs+tjnBeAPFVRBuek3Pjqfva/OGTDQmf0QM
 unvLTU1zgHo9IFDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T63Nsa06BLsiBwDkwyuu5LGJrjtXArT4y5AP/sXfsYI=;
 b=o6Zm79/oSfxaQmJpGIs5yAd1rbCzIfSBG/C1Flw4aBac8qmCed2grnztd1Eu4h7ktciFfM
 vi3TTOKaOFS5HcC3revxad66HVMgAiRv6YXUHnNAKxtSOtTXgNXLAtgX6EzC4xT3b0JsNA
 MSzhrY/4bqqRKm3Syry9TAGGsvfLP/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T63Nsa06BLsiBwDkwyuu5LGJrjtXArT4y5AP/sXfsYI=;
 b=RXwyNH8RXeKeckALOOVkYFmecej3KkRbGxYQs+tjnBeAPFVRBuek3Pjqfva/OGTDQmf0QM
 unvLTU1zgHo9IFDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B87B413A3D;
 Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cPTiKxDIuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 9/9] drm: Remove struct
 drm_mode_config_funcs.output_poll_changed
Date: Mon, 12 Aug 2024 10:28:30 +0200
Message-ID: <20240812083000.337744-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812083000.337744-1-tzimmermann@suse.de>
References: <20240812083000.337744-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: 0.20
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

The output_poll_changed hook in struct drm_mode_config_funcs is
unused. Remove it. The helper drm_client_dev_hotplug() implements
the callback's functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_probe_helper.c | 10 +---------
 include/drm/drm_mode_config.h      | 16 ----------------
 2 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 285290067056..92f21764246f 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -714,7 +714,7 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
  * @dev: drm_device whose connector state changed
  *
  * This function fires off the uevent for userspace and also calls the
- * output_poll_changed function, which is most commonly used to inform the fbdev
+ * client hotplug function, which is most commonly used to inform the fbdev
  * emulation code and allow it to update the fbcon output configuration.
  *
  * Drivers should call this from their hotplug handling code when a change is
@@ -730,11 +730,7 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
  */
 void drm_kms_helper_hotplug_event(struct drm_device *dev)
 {
-	/* send a uevent + call fbdev */
 	drm_sysfs_hotplug_event(dev);
-	if (dev->mode_config.funcs->output_poll_changed)
-		dev->mode_config.funcs->output_poll_changed(dev);
-
 	drm_client_dev_hotplug(dev);
 }
 EXPORT_SYMBOL(drm_kms_helper_hotplug_event);
@@ -750,11 +746,7 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 
-	/* send a uevent + call fbdev */
 	drm_sysfs_connector_hotplug_event(connector);
-	if (dev->mode_config.funcs->output_poll_changed)
-		dev->mode_config.funcs->output_poll_changed(dev);
-
 	drm_client_dev_hotplug(dev);
 }
 EXPORT_SYMBOL(drm_kms_helper_connector_hotplug_event);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index ab0f167474b1..271765e2e9f2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -97,22 +97,6 @@ struct drm_mode_config_funcs {
 	 */
 	const struct drm_format_info *(*get_format_info)(const struct drm_mode_fb_cmd2 *mode_cmd);
 
-	/**
-	 * @output_poll_changed:
-	 *
-	 * Callback used by helpers to inform the driver of output configuration
-	 * changes.
-	 *
-	 * Drivers implementing fbdev emulation use drm_kms_helper_hotplug_event()
-	 * to call this hook to inform the fbdev helper of output changes.
-	 *
-	 * This hook is deprecated, drivers should instead implement fbdev
-	 * support with struct drm_client, which takes care of any necessary
-	 * hotplug event forwarding already without further involvement by
-	 * the driver.
-	 */
-	void (*output_poll_changed)(struct drm_device *dev);
-
 	/**
 	 * @mode_valid:
 	 *
-- 
2.46.0

