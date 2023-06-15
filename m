Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D773143E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF4D10E4AB;
	Thu, 15 Jun 2023 09:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7B110E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:42:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 88B41223BA;
 Thu, 15 Jun 2023 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686822128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKReObWwhdl1CMVWprPN1H1/4g1WNrPRam/AL2p1cFo=;
 b=XG6IHIF79b1baKxjxkNnJlmvM+2uohzEuxT1UrvtqYr//AT2mpG2DI7DRgcTrQ8jjj3hOO
 8BXtYG8iT7doZps4XdIa983HfTfxmTrh8Hp6Nl6YFWkmeTViiVRR1SZQ31ksycy1S7Kcsd
 Sz5d6OGOqDTBGBHSiugm3IMWwBnd4Mg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686822128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKReObWwhdl1CMVWprPN1H1/4g1WNrPRam/AL2p1cFo=;
 b=K4F7EZfGNDwa8FlKJgCZHC4CIBWHQVSwfUoSP+R2kdxhTUIBgtg5g9T1cQnolbCmB1AFPp
 eLZ+Je9NNUCvxjAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 553B713A63;
 Thu, 15 Jun 2023 09:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2LXME/DcimQ+WQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jun 2023 09:42:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, contact@emersion.fr,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH 1/3] drm: Enable PRIME import/export for all drivers
Date: Thu, 15 Jun 2023 11:31:42 +0200
Message-ID: <20230615094206.4424-2-tzimmermann@suse.de>
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

Call drm_gem_prime_handle_to_fd() and drm_gem_prime_fd_to_handle() by
default if no PRIME import/export helpers have been set. Both functions
are the default for almost all drivers.

DRM drivers implement struct drm_driver.gem_prime_import_sg_table
to import dma-buf objects from other drivers. Having the function
drm_gem_prime_fd_to_handle() functions set by default allows each
driver to import dma-buf objects to itself, even without support for
other drivers.

For drm_gem_prime_handle_to_fd() it is similar: using it by default
allows each driver to export to itself, even without support for other
drivers.

This functionality enables userspace to share per-driver buffers
across process boundaries via PRIME (e.g., wlroots requires this
functionality). The patch generalizes a pattern that has previously
been implemented by GEM VRAM helpers [1] to work with any driver.
For example, gma500 can now run the wlroots-based sway compositor.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/20230302143502.500661-1-contact@emersion.fr/
---
 drivers/gpu/drm/drm_ioctl.c |  4 ++--
 drivers/gpu/drm/drm_prime.c | 29 ++++++++++++++++++++---------
 include/drm/drm_drv.h       |  6 ++++++
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 7c9d66ee917de..faa7018bda0a3 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -245,8 +245,8 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 		req->value = 1;
 		return 0;
 	case DRM_CAP_PRIME:
-		req->value |= dev->driver->prime_fd_to_handle ? DRM_PRIME_CAP_IMPORT : 0;
-		req->value |= dev->driver->prime_handle_to_fd ? DRM_PRIME_CAP_EXPORT : 0;
+		req->value |= DRM_PRIME_CAP_IMPORT;
+		req->value |= DRM_PRIME_CAP_EXPORT;
 		return 0;
 	case DRM_CAP_SYNCOBJ:
 		req->value = drm_core_check_feature(dev, DRIVER_SYNCOBJ);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d29dafce9bb0a..36cecfc7c947b 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -372,11 +372,16 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_prime_handle *args = data;
 
-	if (!dev->driver->prime_fd_to_handle)
-		return -ENOSYS;
+	/*
+	 * TODO: Convert remaining drivers to drm_gem_prime_fd_to_handle()
+	 *       and remove this callback.
+	 */
+	if (dev->driver->prime_fd_to_handle) {
+		return dev->driver->prime_fd_to_handle(dev, file_priv, args->fd,
+						       &args->handle);
+	}
 
-	return dev->driver->prime_fd_to_handle(dev, file_priv,
-			args->fd, &args->handle);
+	return drm_gem_prime_fd_to_handle(dev, file_priv, args->fd, &args->handle);
 }
 
 static struct dma_buf *export_and_register_object(struct drm_device *dev,
@@ -518,15 +523,21 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_prime_handle *args = data;
 
-	if (!dev->driver->prime_handle_to_fd)
-		return -ENOSYS;
-
 	/* check flags are valid */
 	if (args->flags & ~(DRM_CLOEXEC | DRM_RDWR))
 		return -EINVAL;
 
-	return dev->driver->prime_handle_to_fd(dev, file_priv,
-			args->handle, args->flags, &args->fd);
+	/*
+	 * TODO: Convert remaining drivers to drm_gem_prime_handle_to_fd()
+	 *       and remove this callback.
+	 */
+	if (dev->driver->prime_handle_to_fd) {
+		return dev->driver->prime_handle_to_fd(dev, file_priv,
+						       args->handle, args->flags,
+						       &args->fd);
+	}
+	return drm_gem_prime_handle_to_fd(dev, file_priv, args->handle,
+					  args->flags, &args->fd);
 }
 
 /**
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 89e2706cac561..10af1899236a0 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -309,6 +309,9 @@ struct drm_driver {
 	 *
 	 * For an in-depth discussion see :ref:`PRIME buffer sharing
 	 * documentation <prime_buffer_sharing>`.
+	 *
+	 * TODO: Convert remaining drivers to drm_gem_prime_handle_to_fd()
+	 *       and remove this callback.
 	 */
 	int (*prime_handle_to_fd)(struct drm_device *dev, struct drm_file *file_priv,
 				uint32_t handle, uint32_t flags, int *prime_fd);
@@ -320,6 +323,9 @@ struct drm_driver {
 	 *
 	 * For an in-depth discussion see :ref:`PRIME buffer sharing
 	 * documentation <prime_buffer_sharing>`.
+	 *
+	 * TODO: Convert remaining drivers to drm_gem_prime_fd_to_handle()
+	 *       and remove this callback.
 	 */
 	int (*prime_fd_to_handle)(struct drm_device *dev, struct drm_file *file_priv,
 				int prime_fd, uint32_t *handle);
-- 
2.41.0

