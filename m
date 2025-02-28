Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A51A495C4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56B210EC50;
	Fri, 28 Feb 2025 09:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D406610EC50
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:48:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 876231F394;
 Fri, 28 Feb 2025 09:48:47 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3221A137AC;
 Fri, 28 Feb 2025 09:48:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MFtvCn+GwWfKVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Feb 2025 09:48:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] drm/prime: Support dedicated DMA device for dma-buf
 imports
Date: Fri, 28 Feb 2025 10:32:51 +0100
Message-ID: <20250228094457.239442-2-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 876231F394
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

Importing dma-bufs via PRIME requires a DMA-capable device. Devices on
peripheral busses, such as USB, often cannot perform DMA by themselves.
Without DMA-capable device PRIME import fails. DRM drivers for USB
devices already use a separate DMA device for dma-buf imports. Make the
mechanism generally available.

Add the field dma_dev to struct drm_device to refer to the device's DMA
device. For USB this should be the USB controller. Use dma_dev in the
PRIME import helpers, if set.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_drv.c   |  2 ++
 drivers/gpu/drm/drm_prime.c |  2 +-
 include/drm/drm_device.h    | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..f8c3c9f77d22 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -654,6 +654,8 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 {
 	drm_fs_inode_free(dev->anon_inode);
 
+	put_device(dev->dma_dev);
+	dev->dma_dev = NULL;
 	put_device(dev->dev);
 	/* Prevent use-after-free in drm_managed_release when debugging is
 	 * enabled. Slightly awkward, but can't really be helped. */
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..258858f2f8dd 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -1004,7 +1004,7 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf)
 {
-	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
+	return drm_gem_prime_import_dev(dev, dma_buf, drm_dev_dma_dev(dev));
 }
 EXPORT_SYMBOL(drm_gem_prime_import);
 
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 6ea54a578cda..a24cac4b2077 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -64,6 +64,23 @@ struct drm_device {
 	/** @dev: Device structure of bus-device */
 	struct device *dev;
 
+	/**
+	 * @dma_dev:
+	 *
+	 * Device for DMA operations. Only required if the device @dev
+	 * cannot perform DMA by itself. Should be NULL otherwise.
+	 *
+	 * Devices on USB and other peripheral busses cannot perform DMA
+	 * by themselves. The @dma_dev field should point the bus controller
+	 * that does DMA on behalve of such a device. Required for importing
+	 * buffers via dma-buf.
+	 *
+	 * If set, the DRM driver has to acquire a reference on the DMA
+	 * device, which will be owned and released automatically by the
+	 * DRM core.
+	 */
+	struct device *dma_dev;
+
 	/**
 	 * @managed:
 	 *
@@ -327,4 +344,24 @@ struct drm_device {
 	struct dentry *debugfs_root;
 };
 
+/**
+ * drm_dev_dma_dev - returns the DMA device for a DRM device
+ * @dev: DRM device
+ *
+ * Returns the DMA device of the given DRM device. This is usually
+ * the same as the DRM device's parent. Devices on some peripheral
+ * busses, such as USB, are incapable of performing DMA by themselves.
+ * Drivers should set struct &drm_device.dma_dev to the bus controller
+ * to make DMA work. Required for PRIME buffer import.
+ *
+ * Returns:
+ * A DMA-capable device for the DRM device.
+ */
+static inline struct device *drm_dev_dma_dev(struct drm_device *dev)
+{
+	if (dev->dma_dev)
+		return dev->dma_dev;
+	return dev->dev;
+}
+
 #endif
-- 
2.48.1

