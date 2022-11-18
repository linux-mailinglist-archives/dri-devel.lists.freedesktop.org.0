Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6CD62EB54
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 02:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B9610E6AE;
	Fri, 18 Nov 2022 01:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886CC10E6AE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 01:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736285; x=1700272285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UY4RMOQYRZ+QpnW8EkQLHFp84upgR5hh8ZE/ZE9GDnw=;
 b=PzRaBcFsKA66inPlEiRZd8+3HH0dTomlIvMUf08jCuuC5Hg7bACqmxyi
 FlJUlTP3nQmhRAahs6Rfn7tZJ4415z2oWiiM0lKkVqtiX+J/vH5SIVF0O
 PhXtt+eyxlY9y16K0HxKtlchJNG6WuIKQ4YPfA8uxHcXbfYZKaT/noi7M
 s5ekyQ9O2zRQt9RkZeYjn+LsvFvNf7ja/0sysP3189L4JVG59LcGd271Z
 qFnknKlXoBSvgrC7zoV86HWS7dwV2n8HzEsDejJo8ZajrXV61GbfZXxlC
 Z3UPco3J+x5gGVpBMQ3f9GklELM9fK1hn6iy7LhfyFgMeA/0V3wmB8L/O w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="399313865"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="399313865"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:51:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="590843009"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="590843009"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:51:23 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/2] drm/virtio: Attach and set suggested_x/y properties
 for the connector
Date: Thu, 17 Nov 2022 17:30:53 -0800
Message-Id: <20221118013054.182304-2-vivek.kasireddy@intel.com>
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

These properties provide a way to suggest to the userspace the preferred
positions for the outputs. Mutter already uses these properties to
determine the best positions for the outputs.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c |  5 +++++
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 12 ++++++++++++
 2 files changed, 17 insertions(+)

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
index 9ff8660b50ad..8e2e512e7c4b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -638,6 +638,17 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
+static void virtio_gpu_update_output_position(struct virtio_gpu_output *output)
+{
+	struct drm_connector *connector = &output->conn;
+	struct drm_device *dev = connector->dev;
+
+	drm_object_property_set_value(&connector->base,
+		dev->mode_config.suggested_x_property, output->info.r.x);
+	drm_object_property_set_value(&connector->base,
+		dev->mode_config.suggested_y_property, output->info.r.y);
+}
+
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf)
 {
@@ -648,6 +659,7 @@ static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 	spin_lock(&vgdev->display_info_lock);
 	for (i = 0; i < vgdev->num_scanouts; i++) {
 		vgdev->outputs[i].info = resp->pmodes[i];
+		virtio_gpu_update_output_position(&vgdev->outputs[i]);
 		if (resp->pmodes[i].enabled) {
 			DRM_DEBUG("output %d: %dx%d+%d+%d", i,
 				  le32_to_cpu(resp->pmodes[i].r.width),
-- 
2.37.2

