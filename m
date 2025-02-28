Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE1A495C6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A877510EC4D;
	Fri, 28 Feb 2025 09:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4651110EC4D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:48:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 45DC81F38F;
 Fri, 28 Feb 2025 09:48:48 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7886137AC;
 Fri, 28 Feb 2025 09:48:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QB5CN3+GwWfKVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Feb 2025 09:48:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/gud: Set struct drm_device.dma_dev
Date: Fri, 28 Feb 2025 10:32:53 +0100
Message-ID: <20250228094457.239442-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228094457.239442-1-tzimmermann@suse.de>
References: <20250228094457.239442-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 45DC81F38F
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Set the dma_dev field provided by the DRM device. Required for PRIME
dma-buf import. Remove the driver's implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gud/gud_drv.c      | 26 +++-----------------------
 drivers/gpu/drm/gud/gud_internal.h |  1 -
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index cb405771d6e2..bf7d8cb17333 100644
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
@@ -609,17 +593,15 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	usb_set_intfdata(intf, gdrm);
 
-	gdrm->dmadev = usb_intf_get_dma_device(intf);
-	if (!gdrm->dmadev)
+	drm->dma_dev = usb_intf_get_dma_device(intf);
+	if (!drm->dma_dev)
 		dev_warn(dev, "buffer sharing not supported");
 
 	drm_debugfs_add_file(drm, "stats", gud_stats_debugfs, NULL);
 
 	ret = drm_dev_register(drm, 0);
-	if (ret) {
-		put_device(gdrm->dmadev);
+	if (ret)
 		return ret;
-	}
 
 	drm_kms_helper_poll_init(drm);
 
@@ -638,8 +620,6 @@ static void gud_disconnect(struct usb_interface *interface)
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

