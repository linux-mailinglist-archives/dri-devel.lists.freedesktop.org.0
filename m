Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20746654D0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 07:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7902710E05A;
	Wed, 11 Jan 2023 06:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401DF10E075
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673419758; x=1704955758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QH6wl2WvuQxWG6zFVwNMvAWuUvMZBOzngipF6B3uQac=;
 b=bHy5j18ElYvDRtwFrRmnJBHS0wWU+E5C7cOw2vKmv5NUUysBBN9iMilO
 QmRCcpZvbz4jPJ1S5/L6Q4gbEbSLTeLa/ThLTqWTMW9OqfJyjXjVEpyHd
 wZeJ74cgSLOD1+4tRMnFE9mMshIcdwjC17i4oQDpyYMBl/7sjYhdmbeHM
 fpbTuDbiw+wH60pwx5hm3iJD+uC5LfHC2UDG5DUMZFg6dhHNvLuANIEDX
 lx403pYGbvQ2VdK4dc4fHdInOYlg4Tt7g78NMOaCfRGw6IOpgpJwIkiwV
 ANtPZZAwkxLdbEHSkFuKPnUjXQw0jZSc8rsacNDhjnI1ccjUCJzph+wnZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="385650607"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="385650607"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 22:49:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746056697"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="746056697"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 22:49:17 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/virtio: Attach and set suggested_x/y properties
 for the connector (v2)
Date: Tue, 10 Jan 2023 22:29:35 -0800
Message-Id: <20230111062936.909330-2-vivek.kasireddy@intel.com>
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

These properties provide a way to suggest to the userspace the preferred
positions for the outputs. Mutter already uses these properties to
determine the best positions for the outputs.

v2: Fix the sparse check warnings by wrapping the x and y values with
    le32_to_cpu().

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c |  5 +++++
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 9ea7611a9e0f..868b0183c6df 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -282,6 +282,10 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	drm_connector_helper_add(connector, &virtio_gpu_conn_helper_funcs);
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.suggested_x_property, 0);
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.suggested_y_property, 0);
 
 	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
@@ -350,6 +354,7 @@ int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 	vgdev->ddev->mode_config.max_height = YRES_MAX;
 
 	vgdev->ddev->mode_config.fb_modifiers_not_supported = true;
+	drm_mode_create_suggested_offset_properties(vgdev->ddev);
 
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		vgdev_output_init(vgdev, i);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index a04a9b20896d..1fa431ff972e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -645,6 +645,19 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
+static void virtio_gpu_update_output_position(struct virtio_gpu_output *output)
+{
+	struct drm_connector *connector = &output->conn;
+	struct drm_device *dev = connector->dev;
+
+	drm_object_property_set_value(&connector->base,
+				      dev->mode_config.suggested_x_property,
+				      le32_to_cpu(output->info.r.x));
+	drm_object_property_set_value(&connector->base,
+				      dev->mode_config.suggested_y_property,
+				      le32_to_cpu(output->info.r.y));
+}
+
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf)
 {
@@ -655,6 +668,7 @@ static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 	spin_lock(&vgdev->display_info_lock);
 	for (i = 0; i < vgdev->num_scanouts; i++) {
 		vgdev->outputs[i].info = resp->pmodes[i];
+		virtio_gpu_update_output_position(&vgdev->outputs[i]);
 		if (resp->pmodes[i].enabled) {
 			DRM_DEBUG("output %d: %dx%d+%d+%d", i,
 				  le32_to_cpu(resp->pmodes[i].r.width),
-- 
2.37.2

