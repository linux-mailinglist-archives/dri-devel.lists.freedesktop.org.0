Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3594E89D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B17710E158;
	Mon, 12 Aug 2024 08:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="S0H9JEDV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K1lfYO1B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S0H9JEDV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K1lfYO1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A2610E0DB;
 Mon, 12 Aug 2024 08:30:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04419224D5;
 Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y99DJDVu60Rzf3D8zFygx7kDvsJ56ct4DINPCt2VaAE=;
 b=S0H9JEDVZ2CsR8f+NWtyoF2LxXOsTLWTN7mkfNvbqxylQGhdD8y3ocw5Vl2WHReJYvoXqT
 zZyvE68zGxZ8tPufDavnPnqNTGQQolIoFIfryl/wdgbyvtgqiTq8ntyp1OTSJbWKPzQEgQ
 4NB9FthBRUVDF2lzBUvPJWmPvseO/AE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y99DJDVu60Rzf3D8zFygx7kDvsJ56ct4DINPCt2VaAE=;
 b=K1lfYO1BB1Dl9o/sTuq7SLL+ENnR/r8PhHZhCA5kioQ05SV0Vw14eqY+zjZi6OJ9JGdC0/
 5xm2XHQfvfV6VxBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S0H9JEDV;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=K1lfYO1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y99DJDVu60Rzf3D8zFygx7kDvsJ56ct4DINPCt2VaAE=;
 b=S0H9JEDVZ2CsR8f+NWtyoF2LxXOsTLWTN7mkfNvbqxylQGhdD8y3ocw5Vl2WHReJYvoXqT
 zZyvE68zGxZ8tPufDavnPnqNTGQQolIoFIfryl/wdgbyvtgqiTq8ntyp1OTSJbWKPzQEgQ
 4NB9FthBRUVDF2lzBUvPJWmPvseO/AE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y99DJDVu60Rzf3D8zFygx7kDvsJ56ct4DINPCt2VaAE=;
 b=K1lfYO1BB1Dl9o/sTuq7SLL+ENnR/r8PhHZhCA5kioQ05SV0Vw14eqY+zjZi6OJ9JGdC0/
 5xm2XHQfvfV6VxBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 970E313A23;
 Mon, 12 Aug 2024 08:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WLChIw/IuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 6/9] drm/fbdev-helper: Update documentation on obsolete
 callbacks
Date: Mon, 12 Aug 2024 10:28:27 +0200
Message-ID: <20240812083000.337744-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812083000.337744-1-tzimmermann@suse.de>
References: <20240812083000.337744-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.01
X-Rspamd-Queue-Id: 04419224D5
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[14]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

The old callbacks lastclose and output_poll_changed are deprecated and
unused. Remove them from the documentation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 3f7da78849e4..fe5667477839 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -89,14 +89,6 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
  * interfaces. Drivers that use one of the shared memory managers, TTM, SHMEM,
  * DMA, should instead use the corresponding fbdev emulation.
  *
- * Existing fbdev implementations should restore the fbdev console by using
- * drm_fb_helper_lastclose() as their &drm_driver.lastclose callback.
- * They should also notify the fb helper code from updates to the output
- * configuration by using drm_fb_helper_output_poll_changed() as their
- * &drm_mode_config_funcs.output_poll_changed callback. New implementations
- * of fbdev should be build on top of struct &drm_client_funcs, which handles
- * this automatically. Setting the old callbacks should be avoided.
- *
  * For suspend/resume consider using drm_mode_config_helper_suspend() and
  * drm_mode_config_helper_resume() which takes care of fbdev as well.
  *
@@ -260,12 +252,12 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
  * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configuration
  * @fb_helper: driver-allocated fbdev helper, can be NULL
  *
- * This should be called from driver's drm &drm_driver.lastclose callback
- * when implementing an fbcon on top of kms using this helper. This ensures that
- * the user isn't greeted with a black screen when e.g. X dies.
+ * This helper should be called from fbdev emulation's &drm_client_funcs.restore
+ * callback. It ensures that the user isn't greeted with a black screen when the
+ * userspace compositor releases the display device.
  *
- * RETURNS:
- * Zero if everything went ok, negative error code otherwise.
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
  */
 int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
 {
@@ -2003,8 +1995,8 @@ EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
  * drm_fb_helper_lastclose - DRM driver lastclose helper for fbdev emulation
  * @dev: DRM device
  *
- * This function can be used as the &drm_driver->lastclose callback for drivers
- * that only need to call drm_fb_helper_restore_fbdev_mode_unlocked().
+ * This function is obsolete. Call drm_fb_helper_restore_fbdev_mode_unlocked()
+ * instead.
  */
 void drm_fb_helper_lastclose(struct drm_device *dev)
 {
-- 
2.46.0

