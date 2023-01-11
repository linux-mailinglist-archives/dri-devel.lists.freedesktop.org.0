Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717706654D5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 07:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F4610E135;
	Wed, 11 Jan 2023 06:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DF810E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673419758; x=1704955758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gV2EGEvI/1CDLFCn0FoG+4pyY+tBM1LOTfHHTpwEFKI=;
 b=AjOyM18ArE4op0/cWJ/1rTznzoIxhG5G2RkCnpYIc0LoAgDwyzymKHsC
 GEzJLIqczVnhD27XZquSdyhQ2smCLaDQIwML4NpJ/KCxZrooQF7HAt22Y
 EokM9zw7SkeVMOaGNRCrYYByYg+32O2EGrC0tDt4bRjW52Dl9Bi79I7RA
 GwrpIIW1CdcE43UbtDehtU1M0BLZfYypN26U54AID3l5YXQwmVpWj3dDI
 ERTNEeeT+dVzg8QNbwRjr4w4canEFrAqPvKtkG3qMc++Ow8NGqozbn0tK
 n8LlTDlixNuXKXntd/MsGyjdz31VSSWVSNK24MRSjvCRbVa5eUBdmYM3m g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="385650608"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="385650608"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 22:49:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746056699"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="746056699"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 22:49:17 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/virtio: Add hotplug_mode_update property to ensure
 position info is read (v2)
Date: Tue, 10 Jan 2023 22:29:36 -0800
Message-Id: <20230111062936.909330-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230111062936.909330-1-vivek.kasireddy@intel.com>
References: <20230111062936.909330-1-vivek.kasireddy@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some compositors (mainly Mutter) needs this property to be set in order
to read suggested_x/y values. This property, along with suggested_x/y
will be useful for virtual GPU drivers to share the Host output/window
layout with the Guest compositor.

v2: Improve the commit message.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 14 ++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 868b0183c6df..09a8089bb62a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -286,6 +286,8 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 				   dev->mode_config.suggested_x_property, 0);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
+	drm_object_attach_property(&connector->base,
+				   vgdev->hotplug_mode_update_property, 1);
 
 	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
@@ -336,6 +338,17 @@ static const struct drm_mode_config_funcs virtio_gpu_mode_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static void
+virtio_gpu_create_hotplug_mode_update_property(struct virtio_gpu_device *vgdev)
+{
+	if (vgdev->hotplug_mode_update_property)
+		return;
+
+	vgdev->hotplug_mode_update_property =
+		drm_property_create_range(vgdev->ddev, DRM_MODE_PROP_IMMUTABLE,
+					  "hotplug_mode_update", 0, 1);
+}
+
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 {
 	int i, ret;
@@ -355,6 +368,7 @@ int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 
 	vgdev->ddev->mode_config.fb_modifiers_not_supported = true;
 	drm_mode_create_suggested_offset_properties(vgdev->ddev);
+	virtio_gpu_create_hotplug_mode_update_property(vgdev);
 
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		vgdev_output_init(vgdev, i);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af6ffb696086..8689a589d3d2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -260,6 +260,8 @@ struct virtio_gpu_device {
 	uint64_t capset_id_mask;
 	struct list_head cap_cache;
 
+	struct drm_property *hotplug_mode_update_property;
+
 	/* protects uuid state when exporting */
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
-- 
2.37.2

