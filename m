Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F641A70DCD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7003E10E62D;
	Tue, 25 Mar 2025 23:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ftCzzsLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36D310E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 23:56:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F25B861126;
 Tue, 25 Mar 2025 23:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E300EC4CEED;
 Tue, 25 Mar 2025 23:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742946961;
 bh=gbQWs+XqUEguuUUQJu5BMH1eTiDw5cZcaoPqIr1wioM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ftCzzsLtW2wXoLPvOqYJ5ehUMVnLo5Rw+tZhgMLRHY9DnZakvPDSx8E/QxATVUR7D
 li4p+ec3+deOGBenRIqelpS3a5Ad812lSFw0VQVOaTWY5slB0DvjAfUqH8zs1D3S2R
 PQKoc0zxsiqRgPzvYVY9iSg8h6VMIiU7sANB/syynv6KjDEfNwyHsOfIlBS6IzefTG
 1cRVElpYdMsR6CPd1Vl1CV+Lz1uVV+lsI9qPsY9fAiRYozTB1L6pIzm50iUvu7IXm3
 Dh14EdX/sBGUWzT6MhdLZ6TKDsBVQX4gbC7OYmoo+mhAkrdwQJZk/yq/DWmF20glxP
 dCUCbAkq71XJA==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, lina@asahilina.net, daniel.almeida@collabora.com,
 j@jannau.net
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/8] drm: drv: implement __drm_dev_alloc()
Date: Wed, 26 Mar 2025 00:54:28 +0100
Message-ID: <20250325235522.3992-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325235522.3992-1-dakr@kernel.org>
References: <20250325235522.3992-1-dakr@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the Rust DRM device abstraction we need to allocate a struct
drm_device.

Currently, there are two options, the deprecated drm_dev_alloc() (which
does not support subclassing) and devm_drm_dev_alloc(). The latter
supports subclassing, but also manages the initial reference through
devres for the parent device.

In Rust we want to conform with the subclassing pattern, but do not want
to get the initial reference managed for us, since Rust has its own,
idiomatic ways to properly deal with it.

There are two options to achieve this.

  1) Allocate the memory ourselves with a KBox.
  2) Implement __drm_dev_alloc(), which supports subclassing, but is
     unmanged.

While (1) would be possible, it would be cumbersome, since it would
require exporting drm_dev_init() and drmm_add_final_kfree().

Hence, go with option (2) and implement __drm_dev_alloc().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 58 ++++++++++++++++++++++++++++-----------
 include/drm/drm_drv.h     |  5 ++++
 2 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3cf440eee8a2..6f8fcf0376ae 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -740,36 +740,62 @@ void *__devm_drm_dev_alloc(struct device *parent,
 EXPORT_SYMBOL(__devm_drm_dev_alloc);
 
 /**
- * drm_dev_alloc - Allocate new DRM device
- * @driver: DRM driver to allocate device for
+ * __drm_dev_alloc - Allocation of a &drm_device instance
  * @parent: Parent device object
+ * @driver: DRM driver
+ * @size: the size of the struct which contains struct drm_device
+ * @offset: the offset of the &drm_device within the container.
  *
- * This is the deprecated version of devm_drm_dev_alloc(), which does not support
- * subclassing through embedding the struct &drm_device in a driver private
- * structure, and which does not support automatic cleanup through devres.
+ * This should *NOT* be by any drivers, but is a dedicated interface for the
+ * corresponding Rust abstraction.
  *
- * RETURNS:
- * Pointer to new DRM device, or ERR_PTR on failure.
+ * This is the same as devm_drm_dev_alloc(), but without the corresponding
+ * resource management through the parent device, but not the same as
+ * drm_dev_alloc(), since the latter is the deprecated version, which does not
+ * support subclassing.
+ *
+ * Returns: A pointer to new DRM device, or an ERR_PTR on failure.
  */
-struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
-				 struct device *parent)
+void *__drm_dev_alloc(struct device *parent,
+		      const struct drm_driver *driver,
+		      size_t size, size_t offset)
 {
-	struct drm_device *dev;
+	void *container;
+	struct drm_device *drm;
 	int ret;
 
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (!dev)
+	container = kzalloc(size, GFP_KERNEL);
+	if (!container)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_dev_init(dev, driver, parent);
+	drm = container + offset;
+	ret = drm_dev_init(drm, driver, parent);
 	if (ret) {
-		kfree(dev);
+		kfree(container);
 		return ERR_PTR(ret);
 	}
+	drmm_add_final_kfree(drm, container);
 
-	drmm_add_final_kfree(dev, dev);
+	return container;
+}
+EXPORT_SYMBOL(__drm_dev_alloc);
 
-	return dev;
+/**
+ * drm_dev_alloc - Allocate new DRM device
+ * @driver: DRM driver to allocate device for
+ * @parent: Parent device object
+ *
+ * This is the deprecated version of devm_drm_dev_alloc(), which does not support
+ * subclassing through embedding the struct &drm_device in a driver private
+ * structure, and which does not support automatic cleanup through devres.
+ *
+ * RETURNS:
+ * Pointer to new DRM device, or ERR_PTR on failure.
+ */
+struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
+				 struct device *parent)
+{
+	return __drm_dev_alloc(parent, driver, sizeof(struct drm_device), 0);
 }
 EXPORT_SYMBOL(drm_dev_alloc);
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 9952b846c170..f4c02d018f98 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -473,6 +473,11 @@ drmm_cgroup_register_region(struct drm_device *dev,
 
 struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent);
+
+void *__drm_dev_alloc(struct device *parent,
+		      const struct drm_driver *driver,
+		      size_t size, size_t offset);
+
 int drm_dev_register(struct drm_device *dev, unsigned long flags);
 void drm_dev_unregister(struct drm_device *dev);
 
-- 
2.49.0

