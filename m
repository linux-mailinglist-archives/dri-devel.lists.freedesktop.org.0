Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E8296856D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0678A10E28F;
	Mon,  2 Sep 2024 10:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SkQYBe+z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nPRRk98+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SkQYBe+z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nPRRk98+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4440A10E289
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:55:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 079211FBAA;
 Mon,  2 Sep 2024 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725274551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vixdsLS6nL2CgbRloqU2Dimld9jnbaBhGd1FicaZmw4=;
 b=SkQYBe+zOICjrRN6wHJrJRaj2XX/ttwt0oGl4P2fGSjtsbBIP5eAbdvjS3d/cVxXrMhKFC
 EbwOagCLT7dBEWMOV4AuDnN7MQitbihMNa+KpGl4Jt6ofwfab6IbgB1brDuunxWz3T2fsZ
 7o6b1yFBkMmluvisR2/YOyFDWUDsI8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725274551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vixdsLS6nL2CgbRloqU2Dimld9jnbaBhGd1FicaZmw4=;
 b=nPRRk98+h3VLq3S9JYhl51Jxcn4Mt/S0DiU8ojxeTzKmSyv6J9gCDVyIBd/iT2yMHYreTX
 nu2+Bl0FB/jqV5DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725274551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vixdsLS6nL2CgbRloqU2Dimld9jnbaBhGd1FicaZmw4=;
 b=SkQYBe+zOICjrRN6wHJrJRaj2XX/ttwt0oGl4P2fGSjtsbBIP5eAbdvjS3d/cVxXrMhKFC
 EbwOagCLT7dBEWMOV4AuDnN7MQitbihMNa+KpGl4Jt6ofwfab6IbgB1brDuunxWz3T2fsZ
 7o6b1yFBkMmluvisR2/YOyFDWUDsI8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725274551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vixdsLS6nL2CgbRloqU2Dimld9jnbaBhGd1FicaZmw4=;
 b=nPRRk98+h3VLq3S9JYhl51Jxcn4Mt/S0DiU8ojxeTzKmSyv6J9gCDVyIBd/iT2yMHYreTX
 nu2+Bl0FB/jqV5DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3FC113AE5;
 Mon,  2 Sep 2024 10:55:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mOSaLraZ1WZQcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Sep 2024 10:55:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/10] drm/bochs: Validate display modes against available
 video memory
Date: Mon,  2 Sep 2024 12:53:47 +0200
Message-ID: <20240902105546.792625-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902105546.792625-1-tzimmermann@suse.de>
References: <20240902105546.792625-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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

For each mode, test the required memory against the available video
memory. Filters out modes that do not fit into display memory.

Also remove the old test against the 4 MiB limit. It is now obsolete
and did not necessarily produce correct results.

v2:
- fix __udivdi3 linker error (kernel test robot)
- fix vdisplay and hdisplay usage

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/bochs.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index bde70a6075ec..69c5f65e9853 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -558,8 +558,28 @@ static const struct drm_connector_funcs bochs_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static enum drm_mode_status bochs_mode_config_mode_valid(struct drm_device *dev,
+							 const struct drm_display_mode *mode)
+{
+	struct bochs_device *bochs = to_bochs_device(dev);
+	const struct drm_format_info *format = drm_format_info(DRM_FORMAT_XRGB8888);
+	u64 pitch;
+
+	if (drm_WARN_ON(dev, !format))
+		return MODE_ERROR;
+
+	pitch = drm_format_info_min_pitch(format, 0, mode->hdisplay);
+	if (!pitch)
+		return MODE_BAD_WIDTH;
+	if (mode->vdisplay > DIV_ROUND_DOWN_ULL(bochs->fb_size, pitch))
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+
 static const struct drm_mode_config_funcs bochs_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
+	.mode_valid = bochs_mode_config_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -687,15 +707,8 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 {
 	struct bochs_device *bochs;
 	struct drm_device *dev;
-	unsigned long fbsize;
 	int ret;
 
-	fbsize = pci_resource_len(pdev, 0);
-	if (fbsize < 4 * 1024 * 1024) {
-		DRM_ERROR("less than 4 MB video memory, ignoring device\n");
-		return -ENOMEM;
-	}
-
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &bochs_driver);
 	if (ret)
 		return ret;
-- 
2.46.0

