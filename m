Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15073659D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B96510E28A;
	Tue, 20 Jun 2023 08:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AA110E286
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 08:03:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E558218B1;
 Tue, 20 Jun 2023 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687248179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npUtIajuihUPxtiqHNp587wUCYsHyKV+46U5vEmlIFM=;
 b=E7mouFeb1lxq0ul7GoXeNJk14dUmOfWWKuO1nn8SI+0zuCvdnkASHFi37JCGm3PpdwSTKz
 8Uj+z/NW2GpruMieBHOpZ8s3PooSxBf0PrnGekcsfp5Z6MQkFSlZrcKtVN2vj0036mU3Ha
 PJVQLOeCDFbJA/pLq6JwW4Qg53dtl08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687248179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npUtIajuihUPxtiqHNp587wUCYsHyKV+46U5vEmlIFM=;
 b=I28jG4V1mlSLha/wRdYUjK/rQI+xZbFlaagqMhp761HKucJ6vuPIz7rAbWvF90rNOFnqHN
 fqZOimM9zZRNEmCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24C88139C7;
 Tue, 20 Jun 2023 08:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gBcVCDNdkWRQEAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 08:02:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, contact@emersion.fr,
 linux-graphics-maintainer@vmware.com, alexdeucher@gmail.com,
 quic_jhugo@quicinc.com
Subject: [PATCH v2 1/3] drm: Enable PRIME import/export for all drivers
Date: Tue, 20 Jun 2023 09:59:57 +0200
Message-ID: <20230620080252.16368-2-tzimmermann@suse.de>
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

v2:
	* clean up docs and TODO comments (Simon, Zack)
	* clean up style in drm_getcap()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/20230302143502.500661-1-contact@emersion.fr/ # 1
Reviewed-by: Simon Ser <contact@emersion.fr>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/drm_ioctl.c |  3 +--
 drivers/gpu/drm/drm_prime.c | 21 ++++++++++++---------
 include/drm/drm_drv.h       | 12 ++----------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 7c9d66ee917de..8e9afe7af19c9 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -245,8 +245,7 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 		req->value = 1;
 		return 0;
 	case DRM_CAP_PRIME:
-		req->value |= dev->driver->prime_fd_to_handle ? DRM_PRIME_CAP_IMPORT : 0;
-		req->value |= dev->driver->prime_handle_to_fd ? DRM_PRIME_CAP_EXPORT : 0;
+		req->value = DRM_PRIME_CAP_IMPORT | DRM_PRIME_CAP_EXPORT;
 		return 0;
 	case DRM_CAP_SYNCOBJ:
 		req->value = drm_core_check_feature(dev, DRIVER_SYNCOBJ);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 6bcf324ef81c9..27a41d5e11d75 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -372,11 +372,12 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_prime_handle *args = data;
 
-	if (!dev->driver->prime_fd_to_handle)
-		return -ENOSYS;
+	if (dev->driver->prime_fd_to_handle) {
+		return dev->driver->prime_fd_to_handle(dev, file_priv, args->fd,
+						       &args->handle);
+	}
 
-	return dev->driver->prime_fd_to_handle(dev, file_priv,
-			args->fd, &args->handle);
+	return drm_gem_prime_fd_to_handle(dev, file_priv, args->fd, &args->handle);
 }
 
 static struct dma_buf *export_and_register_object(struct drm_device *dev,
@@ -518,15 +519,17 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
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
index 870278ecd8ba9..b77f2c7275b76 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -304,22 +304,14 @@ struct drm_driver {
 	/**
 	 * @prime_handle_to_fd:
 	 *
-	 * Main PRIME export function. Should be implemented with
-	 * drm_gem_prime_handle_to_fd() for GEM based drivers.
-	 *
-	 * For an in-depth discussion see :ref:`PRIME buffer sharing
-	 * documentation <prime_buffer_sharing>`.
+	 * PRIME export function. Only used by vmwgfx.
 	 */
 	int (*prime_handle_to_fd)(struct drm_device *dev, struct drm_file *file_priv,
 				uint32_t handle, uint32_t flags, int *prime_fd);
 	/**
 	 * @prime_fd_to_handle:
 	 *
-	 * Main PRIME import function. Should be implemented with
-	 * drm_gem_prime_fd_to_handle() for GEM based drivers.
-	 *
-	 * For an in-depth discussion see :ref:`PRIME buffer sharing
-	 * documentation <prime_buffer_sharing>`.
+	 * PRIME import function. Only used by vmwgfx.
 	 */
 	int (*prime_fd_to_handle)(struct drm_device *dev, struct drm_file *file_priv,
 				int prime_fd, uint32_t *handle);
-- 
2.41.0

