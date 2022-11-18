Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4362EB55
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 02:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4078910E6B1;
	Fri, 18 Nov 2022 01:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A351010E6B1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 01:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736285; x=1700272285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KvK2xGDc0kstgdhnUENokktqryJB57+x1oUrdtppFG4=;
 b=WQHmr19sioih02bGhf5G+XbzTu2yfUYJEW5gzz5OwB/kn7PSJSIMkYPA
 2vDD/7/J7mCU4UKYjKcmAEFscvgwi8x+XYE9pxWTf1tSp5rafO/avU3yY
 4FSEFvUvXpaSR8lzz1ls0SNPb012YnzSm3wUTe6QHTIX5lKIKrFz47ydo
 57OFWPaA3srqxHPFK7lr54kQBfgvW37JGURZD4zAC3/TN8rMn30UgSOfP
 517edtsd3zPkarwJPWlLctTmrJL+Q+bEnQQbrrGAdlir9LzFa66ZAiiNl
 RkfeKH6ATXUNsFiwawK6rFIxRQrZCR7xrFXNcBc4D3XZoF10b0HW3y6to Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="399313867"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="399313867"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:51:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="590843013"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="590843013"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:51:24 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property for
 rescanning of modes
Date: Thu, 17 Nov 2022 17:30:54 -0800
Message-Id: <20221118013054.182304-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118013054.182304-1-vivek.kasireddy@intel.com>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
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

Setting this property will allow the userspace to look for new modes or
position info when a hotplug event occurs. This is really helpful for
virtual GPU drivers to handle Host window resizing events which are
propogated as hotplug interrupts to the Guest drivers. Mutter already
uses this property while configuring the outputs.

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
index b7a64c7dcc2c..35f940302e24 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -257,6 +257,8 @@ struct virtio_gpu_device {
 	uint64_t capset_id_mask;
 	struct list_head cap_cache;
 
+	struct drm_property *hotplug_mode_update_property;
+
 	/* protects uuid state when exporting */
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
-- 
2.37.2

