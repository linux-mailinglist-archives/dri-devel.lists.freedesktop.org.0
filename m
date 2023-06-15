Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F073143F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5E510E4AF;
	Thu, 15 Jun 2023 09:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB8110E4B2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:42:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E2CC223E7;
 Thu, 15 Jun 2023 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686822129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZV2kV+vrbOYP5OfwZGbHzoMJpb2jOgLZWdj0HsXbcoo=;
 b=rsVJaMI3ym7aWPld7YQlVeUSeaqgJDK2gScs3YHiudDAer6CP3KzWZcp/20E/FDihK80jI
 zPeKrnKMO9R8DJL57pB/iFMRURe4443U0MORyccoqGbY6e4jhLV2gN9CQi92Jvy0qqztQ8
 iRbwZDdmYV4pDUE6qmgxVuR51rlpf6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686822129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZV2kV+vrbOYP5OfwZGbHzoMJpb2jOgLZWdj0HsXbcoo=;
 b=zlyFlOyxkkBmDMAw9i8FFdn5YosZ0hoA4oPkGcr0bXgJAY2HjcwwztdbAO481uxKhX9O/i
 o0td9BrBEeLchFAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFB4713A63;
 Thu, 15 Jun 2023 09:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GPe5MfDcimQ+WQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jun 2023 09:42:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, contact@emersion.fr,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH 3/3] drm/prime: Unexport helpers for fd/handle conversion
Date: Thu, 15 Jun 2023 11:31:44 +0200
Message-ID: <20230615094206.4424-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615094206.4424-1-tzimmermann@suse.de>
References: <20230615094206.4424-1-tzimmermann@suse.de>
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

Unexport drm_gem_prime_fd_to_handle() and drm_gem_prime_handle_to_fd().
Both are only used internally within the PRIME code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_prime.c | 20 +++++++++-----------
 include/drm/drm_prime.h     |  7 -------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index b857a45a29553..2b11fc2444cff 100644
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
@@ -413,7 +412,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
 	return dmabuf;
 }
 
-/**
+/*
  * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
  * @dev: dev to export the buffer from
  * @file_priv: drm file-private structure
@@ -426,10 +425,10 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
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
@@ -511,7 +510,6 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
 
 int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
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

