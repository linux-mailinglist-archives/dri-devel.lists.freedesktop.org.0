Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB901A56253
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEA510E340;
	Fri,  7 Mar 2025 08:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SLI6QDPk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kZV9k7i4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SLI6QDPk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kZV9k7i4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CCD10E340
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 08:12:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C272E211EE;
 Fri,  7 Mar 2025 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX72Ak+43yxbQ4EEcUwBQ3GlLlkbZJK3RuAO+77x0WE=;
 b=SLI6QDPkHHRrqeEL2axZHUJ8rZ6kuzDH1rY3917s9mYW/ZARiQ4MPOSXsyy9u1+INgDGp2
 3R4y2pA7/LCJCYpYU1feOQOevmBQAdaN8zkMgeefUNl5JHfcDURHPjejtHwgpTd+wXckM5
 ni3ygYwow3IldlCoElTZqoAAGaT8pzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX72Ak+43yxbQ4EEcUwBQ3GlLlkbZJK3RuAO+77x0WE=;
 b=kZV9k7i4PJERoQ24meLayMIoWw0tPMH5msakYjQD9XXmHlTCMSJ/TEo71cgvoD3epJQEdP
 d0oNxIGN98gmK0AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX72Ak+43yxbQ4EEcUwBQ3GlLlkbZJK3RuAO+77x0WE=;
 b=SLI6QDPkHHRrqeEL2axZHUJ8rZ6kuzDH1rY3917s9mYW/ZARiQ4MPOSXsyy9u1+INgDGp2
 3R4y2pA7/LCJCYpYU1feOQOevmBQAdaN8zkMgeefUNl5JHfcDURHPjejtHwgpTd+wXckM5
 ni3ygYwow3IldlCoElTZqoAAGaT8pzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX72Ak+43yxbQ4EEcUwBQ3GlLlkbZJK3RuAO+77x0WE=;
 b=kZV9k7i4PJERoQ24meLayMIoWw0tPMH5msakYjQD9XXmHlTCMSJ/TEo71cgvoD3epJQEdP
 d0oNxIGN98gmK0AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E34B13A22;
 Fri,  7 Mar 2025 08:12:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CPC1FVWqymftLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Mar 2025 08:12:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com, admin@kodeit.net, gargaditya08@live.com,
 jani.nikula@intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/5] drm/gud: Set struct drm_device.dma_dev
Date: Fri,  7 Mar 2025 09:04:02 +0100
Message-ID: <20250307080836.42848-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307080836.42848-1-tzimmermann@suse.de>
References: <20250307080836.42848-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,poorly.run,linaro.org,amd.com,kodeit.net,live.com,intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]
X-Spam-Score: -2.80
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

Set the dma_dev field provided by the DRM device. Required for PRIME
dma-buf import. Remove the driver's implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gud/gud_drv.c      | 33 ++++++++----------------------
 drivers/gpu/drm/gud/gud_internal.h |  1 -
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index cb405771d6e2..5385a2126e45 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -309,21 +309,6 @@ static int gud_get_properties(struct gud_device *gdrm)
 	return ret;
 }
 
-/*
- * FIXME: Dma-buf sharing requires DMA support by the importing device.
- *        This function is a workaround to make USB devices work as well.
- *        See todo.rst for how to fix the issue in the dma-buf framework.
- */
-static struct drm_gem_object *gud_gem_prime_import(struct drm_device *drm, struct dma_buf *dma_buf)
-{
-	struct gud_device *gdrm = to_gud_device(drm);
-
-	if (!gdrm->dmadev)
-		return ERR_PTR(-ENODEV);
-
-	return drm_gem_prime_import_dev(drm, dma_buf, gdrm->dmadev);
-}
-
 static int gud_stats_debugfs(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
@@ -376,7 +361,6 @@ static const struct drm_driver gud_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.fops			= &gud_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
-	.gem_prime_import	= gud_gem_prime_import,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name			= "gud",
@@ -434,6 +418,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	size_t max_buffer_size = 0;
 	struct gud_device *gdrm;
 	struct drm_device *drm;
+	struct device *dma_dev;
 	u8 *formats_dev;
 	u32 *formats;
 	int ret, i;
@@ -609,17 +594,19 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	usb_set_intfdata(intf, gdrm);
 
-	gdrm->dmadev = usb_intf_get_dma_device(intf);
-	if (!gdrm->dmadev)
-		dev_warn(dev, "buffer sharing not supported");
+	dma_dev = usb_intf_get_dma_device(intf);
+	if (dma_dev) {
+		drm_dev_set_dma_dev(drm, dma_dev);
+		put_device(dma_dev);
+	} else {
+		dev_warn(dev, "buffer sharing not supported"); /* not an error */
+	}
 
 	drm_debugfs_add_file(drm, "stats", gud_stats_debugfs, NULL);
 
 	ret = drm_dev_register(drm, 0);
-	if (ret) {
-		put_device(gdrm->dmadev);
+	if (ret)
 		return ret;
-	}
 
 	drm_kms_helper_poll_init(drm);
 
@@ -638,8 +625,6 @@ static void gud_disconnect(struct usb_interface *interface)
 	drm_kms_helper_poll_fini(drm);
 	drm_dev_unplug(drm);
 	drm_atomic_helper_shutdown(drm);
-	put_device(gdrm->dmadev);
-	gdrm->dmadev = NULL;
 }
 
 static int gud_suspend(struct usb_interface *intf, pm_message_t message)
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index 0d148a6f27aa..d6fb25388722 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -16,7 +16,6 @@
 struct gud_device {
 	struct drm_device drm;
 	struct drm_simple_display_pipe pipe;
-	struct device *dmadev;
 	struct work_struct work;
 	u32 flags;
 	const struct drm_format_info *xrgb8888_emulation_format;
-- 
2.48.1

