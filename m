Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51373CB874
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FD46E998;
	Fri, 16 Jul 2021 14:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4406E992
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:08:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0306A1FEB4;
 Fri, 16 Jul 2021 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626444486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9iaCnCfrhzHX/qILqLVT6nTtxWWY+WLd8oOVbl2JD88=;
 b=yBmGNsCjGYee5vhrrOJGKUKdv+xAvw8IvEbhMGoDa3QMY8GSrz8i27wi7E9lkljHd8wmoZ
 vPBoYIy96n4DEfai8nMeiDzSSLiSbblxRxeV7j2+Z1LbNoDVadyKkVo5JWB03A+TyR3sGF
 7+FBbTDC1KuLD/sIHcLF5qjDmm10wzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626444486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9iaCnCfrhzHX/qILqLVT6nTtxWWY+WLd8oOVbl2JD88=;
 b=oneU5IS19pIE6yUcA7W9PMYA3nMWbK8wjsGiKgEwfHV/ugUZ4O6EJ/RRq8Q7Rk0D5PffSG
 Wvu1iWk5EskYbkBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1A9513C76;
 Fri, 16 Jul 2021 14:08:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kMp/KsWS8WBTSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 14:08:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 david@lechnology.com, airlied@redhat.com, sean@poorly.run
Subject: [PATCH 1/7] drm/gem: Provide drm_gem_fb_{begin,
 end}_cpu_access() helpers
Date: Fri, 16 Jul 2021 16:07:55 +0200
Message-Id: <20210716140801.1215-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716140801.1215-1-tzimmermann@suse.de>
References: <20210716140801.1215-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement helpers drm_gem_fb_begin_cpu_access() and _end_cpu_access(),
which call the rsp dma-buf functions for all GEM BOs of the given
framebuffer.

Calls to dma_buf_end_cpu_access() can return an error code on failure,
while drm_gem_fb_end_cpu_access() does not. The latter runs during DRM's
atomic commit or during cleanup. Both cases don't allow for errors, so
leave out the return value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 89 ++++++++++++++++++++
 include/drm/drm_gem_framebuffer_helper.h     |  6 ++
 2 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index e2c68822e05c..94a1c0b0edfd 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -306,6 +306,95 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
 
+/**
+ * drm_gem_fb_begin_cpu_access - prepares GEM buffer objects for CPU access
+ * @fb: the framebuffer
+ * @dir: access mode
+ *
+ * Prepares a framebuffer'S GEM buffer objects for CPU access. This function
+ * must be called before accessing the BO data within the kernel. For imported
+ * BOs, the function calls dma_buf_begin_cpu_access().
+ *
+ * See drm_gem_fb_end_cpu_access() for signalling the end of CPU access.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
+{
+	struct dma_buf_attachment *import_attach;
+	struct drm_gem_object *obj;
+	size_t i;
+	int ret, ret2;
+
+	for (i = 0; i < ARRAY_SIZE(fb->obj); ++i) {
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		import_attach = obj->import_attach;
+		if (!import_attach)
+			continue;
+		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, dir);
+		if (ret)
+			goto err_dma_buf_end_cpu_access;
+	}
+
+	return 0;
+
+err_dma_buf_end_cpu_access:
+	while (i) {
+		--i;
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		import_attach = obj->import_attach;
+		if (!import_attach)
+			continue;
+		ret2 = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
+		if (ret2) {
+			drm_err(fb->dev,
+				"dma_buf_end_cpu_access() failed during error handling: %d\n",
+				ret2);
+		}
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_fb_begin_cpu_access);
+
+/**
+ * drm_gem_fb_end_cpu_access - signals end of CPU access to GEM buffer objects
+ * @fb: the framebuffer
+ * @dir: access mode
+ *
+ * Signals the end of CPU access to the given framebuffer'S GEM buffer objects. This
+ * function must be paired with a corresponding call to drm_gem_fb_begin_cpu_access().
+ * For imported BOs, the function calls dma_buf_end_cpu_access().
+ *
+ * See also drm_gem_fb_begin_cpu_access().
+ */
+void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
+{
+	size_t i = ARRAY_SIZE(fb->obj);
+	struct dma_buf_attachment *import_attach;
+	struct drm_gem_object *obj;
+	int ret;
+
+	while (i) {
+		--i;
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		import_attach = obj->import_attach;
+		if (!import_attach)
+			continue;
+		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
+		if (ret)
+			drm_err(fb->dev, "dma_buf_end_cpu_access() failed: %d\n", ret);
+	}
+}
+EXPORT_SYMBOL(drm_gem_fb_end_cpu_access);
+
 static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
 				  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 6bdffc7aa124..5705722f0855 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -1,6 +1,9 @@
 #ifndef __DRM_GEM_FB_HELPER_H__
 #define __DRM_GEM_FB_HELPER_H__
 
+#include <linux/dma-buf.h>
+#include <linux/dma-buf-map.h>
+
 struct drm_afbc_framebuffer;
 struct drm_device;
 struct drm_fb_helper_surface_size;
@@ -34,6 +37,9 @@ struct drm_framebuffer *
 drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd);
 
+int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
+void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
+
 #define drm_is_afbc(modifier) \
 	(((modifier) & AFBC_VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))
 
-- 
2.32.0

