Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30173659C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AC810E288;
	Tue, 20 Jun 2023 08:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD2D10E288
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 08:03:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E8BBD218B8;
 Tue, 20 Jun 2023 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687248179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0V/sggmB50AaGpWkFM1KjJHBmuGjjTtbv3kTx452uc=;
 b=jFNMSpkTh/fQMJPRGZnV4cNEgKaI8Z3Y3aM3lXKDJKEe55elBl3rsNHcZHSaItUgLxnrvr
 RqoqWqjqdAWLFcfDADt4763BwXxRY6N7ulyjgu4qvmRJCoSg59mC7Hm4U+UyI4Wz7JAMxe
 nPNSk640jr1ovjC8l5SnA8DNY2n8Hf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687248179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0V/sggmB50AaGpWkFM1KjJHBmuGjjTtbv3kTx452uc=;
 b=YrrQJU6y7eQiRgn6oXaWRM9wrnorROxC0l6nPk5me+NE/QClUaQiNjMVwavFD1MzGlKns5
 J6eM8z4Lg6Lu1xBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABCE9139C7;
 Tue, 20 Jun 2023 08:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CI0PKTNdkWRQEAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 08:02:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, contact@emersion.fr,
 linux-graphics-maintainer@vmware.com, alexdeucher@gmail.com,
 quic_jhugo@quicinc.com
Subject: [PATCH v2 3/3] drm/prime: Unexport helpers for fd/handle conversion
Date: Tue, 20 Jun 2023 09:59:59 +0200
Message-ID: <20230620080252.16368-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620080252.16368-1-tzimmermann@suse.de>
References: <20230620080252.16368-1-tzimmermann@suse.de>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unexport drm_gem_prime_fd_to_handle() and drm_gem_prime_handle_to_fd().
Both are only used internally within the PRIME code.

v2:
	* reword docs as functions are now unexported (Simon)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Simon Ser <contact@emersion.fr>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 33 +++++++++++++++------------------
 include/drm/drm_prime.h     |  7 -------
 2 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 3d37ee4c4ea4f..63e2e1bc99876 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_release);
 
-/**
+/*
  * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
  * @dev: drm_device to import into
  * @file_priv: drm file-private structure
@@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
  *
  * Returns 0 on success or a negative error code on failure.
  */
-int drm_gem_prime_fd_to_handle(struct drm_device *dev,
-			       struct drm_file *file_priv, int prime_fd,
-			       uint32_t *handle)
+static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
+				      struct drm_file *file_priv, int prime_fd,
+				      uint32_t *handle)
 {
 	struct dma_buf *dma_buf;
 	struct drm_gem_object *obj;
@@ -360,7 +360,6 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 	dma_buf_put(dma_buf);
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
 
 int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
@@ -409,7 +408,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
 	return dmabuf;
 }
 
-/**
+/*
  * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
  * @dev: dev to export the buffer from
  * @file_priv: drm file-private structure
@@ -422,10 +421,10 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
  * The actual exporting from GEM object to a dma-buf is done through the
  * &drm_gem_object_funcs.export callback.
  */
-int drm_gem_prime_handle_to_fd(struct drm_device *dev,
-			       struct drm_file *file_priv, uint32_t handle,
-			       uint32_t flags,
-			       int *prime_fd)
+static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
+				      struct drm_file *file_priv, uint32_t handle,
+				      uint32_t flags,
+				      int *prime_fd)
 {
 	struct drm_gem_object *obj;
 	int ret = 0;
@@ -507,7 +506,6 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
 
 int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
@@ -868,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
  * @obj: GEM object to export
  * @flags: flags like DRM_CLOEXEC and DRM_RDWR
  *
- * This is the implementation of the &drm_gem_object_funcs.export functions for GEM drivers
- * using the PRIME helpers. It is used as the default in
- * drm_gem_prime_handle_to_fd().
+ * This is the implementation of the &drm_gem_object_funcs.export functions
+ * for GEM drivers using the PRIME helpers. It is used as the default for
+ * drivers that do not set their own.
  */
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 				     int flags)
@@ -966,10 +964,9 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
  * @dev: drm_device to import into
  * @dma_buf: dma-buf object to import
  *
- * This is the implementation of the gem_prime_import functions for GEM drivers
- * using the PRIME helpers. Drivers can use this as their
- * &drm_driver.gem_prime_import implementation. It is used as the default
- * implementation in drm_gem_prime_fd_to_handle().
+ * This is the implementation of the gem_prime_import functions for GEM
+ * drivers using the PRIME helpers. It is the default for drivers that do
+ * not set their own &drm_driver.gem_prime_import.
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
  * &drm_gem_object_funcs.free hook when using this function.
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 2a1d01e5b56b8..a7abf9f3e6972 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -60,19 +60,12 @@ enum dma_data_direction;
 
 struct drm_device;
 struct drm_gem_object;
-struct drm_file;
 
 /* core prime functions */
 struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
 				      struct dma_buf_export_info *exp_info);
 void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
 
-int drm_gem_prime_fd_to_handle(struct drm_device *dev,
-			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
-int drm_gem_prime_handle_to_fd(struct drm_device *dev,
-			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
-			       int *prime_fd);
-
 /* helper functions for exporting */
 int drm_gem_map_attach(struct dma_buf *dma_buf,
 		       struct dma_buf_attachment *attach);
-- 
2.41.0

