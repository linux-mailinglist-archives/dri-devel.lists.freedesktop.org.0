Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC2FA5624E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D8D10E0DE;
	Fri,  7 Mar 2025 08:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Qgieqlur";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A7yXngn+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qgieqlur";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A7yXngn+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC24710E0DA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 08:12:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 781002118C;
 Fri,  7 Mar 2025 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4M5YwryipHk+meja5A4yiiuUtWO/jzt5GbiRTj5eCqU=;
 b=QgieqlurksOcQO2KiniJLgm071JqEilu4XfWrDCVg5qaI5Mt/2ildeQr8mmXhheebTBYiF
 +RAyLtq25r6NJ/0ijUKs4Rx1IdFsJPUXf2eoeAskg0Da+J/AmYOzQwDqYED1SPnqTGn3lU
 nozscETun4BlHkkAR+rkI5PR++VKHro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4M5YwryipHk+meja5A4yiiuUtWO/jzt5GbiRTj5eCqU=;
 b=A7yXngn+K6ntVo1JYhHommkAgAcNFSXg3cGyLk5T7qESFwmXiEr4+F63rYglGR3E6xYTKS
 +wYUWu23K0txuSDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Qgieqlur;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=A7yXngn+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4M5YwryipHk+meja5A4yiiuUtWO/jzt5GbiRTj5eCqU=;
 b=QgieqlurksOcQO2KiniJLgm071JqEilu4XfWrDCVg5qaI5Mt/2ildeQr8mmXhheebTBYiF
 +RAyLtq25r6NJ/0ijUKs4Rx1IdFsJPUXf2eoeAskg0Da+J/AmYOzQwDqYED1SPnqTGn3lU
 nozscETun4BlHkkAR+rkI5PR++VKHro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4M5YwryipHk+meja5A4yiiuUtWO/jzt5GbiRTj5eCqU=;
 b=A7yXngn+K6ntVo1JYhHommkAgAcNFSXg3cGyLk5T7qESFwmXiEr4+F63rYglGR3E6xYTKS
 +wYUWu23K0txuSDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1460513A53;
 Fri,  7 Mar 2025 08:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2FaqA1SqymftLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Mar 2025 08:12:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com, admin@kodeit.net, gargaditya08@live.com,
 jani.nikula@intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/5] drm/prime: Support dedicated DMA device for dma-buf
 imports
Date: Fri,  7 Mar 2025 09:03:59 +0100
Message-ID: <20250307080836.42848-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307080836.42848-1-tzimmermann@suse.de>
References: <20250307080836.42848-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 781002118C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,poorly.run,linaro.org,amd.com,kodeit.net,live.com,intel.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLau4tukfh38qp3nirdnk14qe9)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Importing dma-bufs via PRIME requires a DMA-capable device. Devices on
peripheral busses, such as USB, often cannot perform DMA by themselves.
Without DMA-capable device PRIME import fails. DRM drivers for USB
devices already use a separate DMA device for dma-buf imports. Make the
mechanism generally available.

Besides the case of USB, there are embedded DRM devices without DMA
capability. DMA is performed by a separate controller. DRM drivers should
set this accordingly.

Add the field dma_dev to struct drm_device to refer to the device's DMA
device. For USB this should be the USB controller. Use dma_dev in the
PRIME import helpers, if set.

v2:
- acquire internal reference on dma_dev (Jani)
- add DMA-controller usecase to docs (Maxime)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_drv.c   | 21 +++++++++++++++++++
 drivers/gpu/drm/drm_prime.c |  2 +-
 include/drm/drm_device.h    | 41 +++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..c9487bc88624 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -500,6 +500,25 @@ void drm_dev_unplug(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_unplug);
 
+/**
+ * drm_dev_set_dma_dev - set the DMA device for a DRM device
+ * @dev: DRM device
+ * @dma_dev: DMA device or NULL
+ *
+ * Sets the DMA device of the given DRM device. Only required if
+ * the DMA device is different from the DRM device's parent. After
+ * calling this function, the DRM device holds a reference on
+ * @dma_dev. Pass NULL to clear the DMA device.
+ */
+void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev)
+{
+	dma_dev = get_device(dma_dev);
+
+	put_device(dev->dma_dev);
+	dev->dma_dev = dma_dev;
+}
+EXPORT_SYMBOL(drm_dev_set_dma_dev);
+
 /*
  * Available recovery methods for wedged device. To be sent along with device
  * wedged uevent.
@@ -654,6 +673,8 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 {
 	drm_fs_inode_free(dev->anon_inode);
 
+	put_device(dev->dma_dev);
+	dev->dma_dev = NULL;
 	put_device(dev->dev);
 	/* Prevent use-after-free in drm_managed_release when debugging is
 	 * enabled. Slightly awkward, but can't really be helped. */
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index bdb51c8f262e..ed4e5f06b79d 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -998,7 +998,7 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf)
 {
-	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
+	return drm_gem_prime_import_dev(dev, dma_buf, drm_dev_dma_dev(dev));
 }
 EXPORT_SYMBOL(drm_gem_prime_import);
 
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 6ea54a578cda..e2f894f1b90a 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -64,6 +64,28 @@ struct drm_device {
 	/** @dev: Device structure of bus-device */
 	struct device *dev;
 
+	/**
+	 * @dma_dev:
+	 *
+	 * Device for DMA operations. Only required if the device @dev
+	 * cannot perform DMA by itself. Should be NULL otherwise. Call
+	 * drm_dev_dma_dev() to get the DMA device instead of using this
+	 * field directly. Call drm_dev_set_dma_dev() to set this field.
+	 *
+	 * DRM devices are sometimes bound to virtual devices that cannot
+	 * perform DMA by themselves. Drivers should set this field to the
+	 * respective DMA controller.
+	 *
+	 * Devices on USB and other peripheral busses also cannot perform
+	 * DMA by themselves. The @dma_dev field should point the bus
+	 * controller that does DMA on behalve of such a device. Required
+	 * for importing buffers via dma-buf.
+	 *
+	 * If set, the DRM core automatically releases the reference on the
+	 * device.
+	 */
+	struct device *dma_dev;
+
 	/**
 	 * @managed:
 	 *
@@ -327,4 +349,23 @@ struct drm_device {
 	struct dentry *debugfs_root;
 };
 
+void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);
+
+/**
+ * drm_dev_dma_dev - returns the DMA device for a DRM device
+ * @dev: DRM device
+ *
+ * Returns the DMA device of the given DRM device. By default, this
+ * the DRM device's parent. See drm_dev_set_dma_dev().
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

