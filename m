Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D4A495C8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466210EC55;
	Fri, 28 Feb 2025 09:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EE010EC51
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:49:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E6172116F;
 Fri, 28 Feb 2025 09:48:48 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C8621344A;
 Fri, 28 Feb 2025 09:48:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gB1bEYCGwWfKVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Feb 2025 09:48:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/4] drm/udl: Set struct drm_device.dma_dev
Date: Fri, 28 Feb 2025 10:32:54 +0100
Message-ID: <20250228094457.239442-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228094457.239442-1-tzimmermann@suse.de>
References: <20250228094457.239442-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9E6172116F
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
 drivers/gpu/drm/udl/udl_drv.c  | 17 -----------------
 drivers/gpu/drm/udl/udl_drv.h  |  1 -
 drivers/gpu/drm/udl/udl_main.c |  9 ++-------
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 05b3a152cc33..3b56ca2f6eb8 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -49,22 +49,6 @@ static int udl_usb_reset_resume(struct usb_interface *interface)
 	return drm_mode_config_helper_resume(dev);
 }
 
-/*
- * FIXME: Dma-buf sharing requires DMA support by the importing device.
- *        This function is a workaround to make USB devices work as well.
- *        See todo.rst for how to fix the issue in the dma-buf framework.
- */
-static struct drm_gem_object *udl_driver_gem_prime_import(struct drm_device *dev,
-							  struct dma_buf *dma_buf)
-{
-	struct udl_device *udl = to_udl(dev);
-
-	if (!udl->dmadev)
-		return ERR_PTR(-ENODEV);
-
-	return drm_gem_prime_import_dev(dev, dma_buf, udl->dmadev);
-}
-
 DEFINE_DRM_GEM_FOPS(udl_driver_fops);
 
 static const struct drm_driver driver = {
@@ -73,7 +57,6 @@ static const struct drm_driver driver = {
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
-	.gem_prime_import = udl_driver_gem_prime_import,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index be00dc1d87a1..e67e7e2e6f1f 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -51,7 +51,6 @@ struct urb_list {
 struct udl_device {
 	struct drm_device drm;
 	struct device *dev;
-	struct device *dmadev;
 
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce55dfd..45b745241de6 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -311,8 +311,8 @@ int udl_init(struct udl_device *udl)
 
 	DRM_DEBUG("\n");
 
-	udl->dmadev = usb_intf_get_dma_device(to_usb_interface(dev->dev));
-	if (!udl->dmadev)
+	dev->dma_dev = usb_intf_get_dma_device(to_usb_interface(dev->dev));
+	if (!dev->dma_dev)
 		drm_warn(dev, "buffer sharing not supported"); /* not an error */
 
 	mutex_init(&udl->gem_lock);
@@ -343,18 +343,13 @@ int udl_init(struct udl_device *udl)
 err:
 	if (udl->urbs.count)
 		udl_free_urb_list(dev);
-	put_device(udl->dmadev);
 	DRM_ERROR("%d\n", ret);
 	return ret;
 }
 
 int udl_drop_usb(struct drm_device *dev)
 {
-	struct udl_device *udl = to_udl(dev);
-
 	udl_free_urb_list(dev);
-	put_device(udl->dmadev);
-	udl->dmadev = NULL;
 
 	return 0;
 }
-- 
2.48.1

