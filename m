Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8AF6AC359
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 15:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3508510E255;
	Mon,  6 Mar 2023 14:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32510E255
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 14:33:07 +0000 (UTC)
Received: from workpc.. (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A553660220B;
 Mon,  6 Mar 2023 14:33:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678113186;
 bh=gJrshKNUaitWNWbqYmQJvTDpbgAcQ7xq5COOHL06j48=;
 h=From:To:Cc:Subject:Date:From;
 b=VGYL25Nk+XguA0di2RClfj+YaJ7Z/yUfecAaaKgHQlu2cWiveT+N/ZkiXqQZ7ZBfv
 66hnylM0mBMgus89gmzTNnWbJ5fzRbSOwmj3OvyO+r0TaunD8uhDqxKjtiKU8aSCfL
 84WVBND/GmoitV0965ylpRG9ZH5dUyvGdMHljXxFK0eFR6FeKjlR8VrZm9R5KcWZD5
 rwv5qfVlh7YdYgOVpo7N9mKKcxS18BDm4NUikrXb0kcpjV0XCmu9hNesHp+si7H06b
 xdi+mkCoOcffTEpKjTRORXPfUkLg5RgpVmdShpmTICo5TdD2fa/lvWmSEjPneOFf9t
 bnDfiWFXi1A1A==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2] drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS option
Date: Mon,  6 Mar 2023 17:32:34 +0300
Message-Id: <20230306143234.1561759-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VirtIO-GPU got a new config option for disabling KMS. There were two
problems left unnoticed during review when the new option was added:

1. The IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) check in the code was
inverted, hence KMS was disabled when it should be enabled and vice versa.

2. The disabled KMS crashed kernel with a NULL dereference in
drm_kms_helper_hotplug_event(), which shall not be invoked with a
disabled KMS.

Fix the inverted config option check in the code and skip handling the
VIRTIO_GPU_EVENT_DISPLAY sent by host when KMS is disabled in guest to fix
the crash.

Fixes: 72122c69d717 ("drm/virtio: Add option to disable KMS support")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

Changelog:

v2: - Moved the "has_edid" under the "num_scanouts" condition, like was
      suggested by Gerd Hoffmann.

 drivers/gpu/drm/virtio/virtgpu_kms.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 874ad6c2621a..15f2519988e7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -43,11 +43,13 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
 			events_read, &events_read);
 	if (events_read & VIRTIO_GPU_EVENT_DISPLAY) {
-		if (vgdev->has_edid)
-			virtio_gpu_cmd_get_edids(vgdev);
-		virtio_gpu_cmd_get_display_info(vgdev);
-		virtio_gpu_notify(vgdev);
-		drm_helper_hpd_irq_event(vgdev->ddev);
+		if (vgdev->num_scanouts) {
+			if (vgdev->has_edid)
+				virtio_gpu_cmd_get_edids(vgdev);
+			virtio_gpu_cmd_get_display_info(vgdev);
+			virtio_gpu_notify(vgdev);
+			drm_helper_hpd_irq_event(vgdev->ddev);
+		}
 		events_clear |= VIRTIO_GPU_EVENT_DISPLAY;
 	}
 	virtio_cwrite_le(vgdev->vdev, struct virtio_gpu_config,
@@ -224,7 +226,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
 				    VIRTIO_GPU_MAX_SCANOUTS);
 
-	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) || !vgdev->num_scanouts) {
+	if (!IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) || !vgdev->num_scanouts) {
 		DRM_INFO("KMS disabled\n");
 		vgdev->num_scanouts = 0;
 		vgdev->has_edid = false;
-- 
2.39.2

