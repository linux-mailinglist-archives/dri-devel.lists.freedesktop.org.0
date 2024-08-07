Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B594E94A339
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8527B10E472;
	Wed,  7 Aug 2024 08:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mA4jZuuQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZiJBPqzw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mA4jZuuQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZiJBPqzw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408F510E466;
 Wed,  7 Aug 2024 08:45:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB8D21FB90;
 Wed,  7 Aug 2024 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723020345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGsEaSxnixzB8ZMaOx0qc0Ki/EQVSPO9IKhWAD7O9ig=;
 b=mA4jZuuQT1EiSFpKS20WX2r3bld89k3AwflQBpxGtkXO8ISrUWF7w2aFaveq3gWONaQeO5
 rpjwll3hMWWDSzL3Qfr9ZR+yfUFvYxiPLb/GPF7HDen8oF6HldSayFarDBHd4tzf1n+M5a
 6Epxtnp26ijSGrXTaU5DVYuw7gfIwcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723020345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGsEaSxnixzB8ZMaOx0qc0Ki/EQVSPO9IKhWAD7O9ig=;
 b=ZiJBPqzwJ3xCV8Y9XsojXiOeTaUCmvkRT/qoqopIJF2zYDHLzr5xqjZAyvbpBX3v9V1sHa
 MxwDo1/YRuWmynCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723020345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGsEaSxnixzB8ZMaOx0qc0Ki/EQVSPO9IKhWAD7O9ig=;
 b=mA4jZuuQT1EiSFpKS20WX2r3bld89k3AwflQBpxGtkXO8ISrUWF7w2aFaveq3gWONaQeO5
 rpjwll3hMWWDSzL3Qfr9ZR+yfUFvYxiPLb/GPF7HDen8oF6HldSayFarDBHd4tzf1n+M5a
 6Epxtnp26ijSGrXTaU5DVYuw7gfIwcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723020345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGsEaSxnixzB8ZMaOx0qc0Ki/EQVSPO9IKhWAD7O9ig=;
 b=ZiJBPqzwJ3xCV8Y9XsojXiOeTaUCmvkRT/qoqopIJF2zYDHLzr5xqjZAyvbpBX3v9V1sHa
 MxwDo1/YRuWmynCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E58A13297;
 Wed,  7 Aug 2024 08:45:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qCSDGTk0s2ZmfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Aug 2024 08:45:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/8] drm: Remove struct
 drm_mode_config_funcs.output_poll_changed
Date: Wed,  7 Aug 2024 10:41:40 +0200
Message-ID: <20240807084539.304014-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807084539.304014-1-tzimmermann@suse.de>
References: <20240807084539.304014-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; REPLY(-4.00)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.80
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

