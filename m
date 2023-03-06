Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29D6AC854
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA0F89FF7;
	Mon,  6 Mar 2023 16:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327AB89FF7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:39:39 +0000 (UTC)
Received: from workpc.. (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C67DD6602EE4;
 Mon,  6 Mar 2023 16:39:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678120777;
 bh=2qF0hUp8glqDQ1ktUcSd1pu0qhpff4ScS2Sp+BIuEaU=;
 h=From:To:Cc:Subject:Date:From;
 b=W+n6JtB8n30LcsAnOQBmt8DYkHssmRq4ybXRTK7ze63cYN5xZJVUlMFV3qx9bXVTD
 j/CIjJklOkgonUVbISB8pOqdQEyWUu916qZ7CzRH2fhoF61YjwPEgGXK2OXIjhFTRY
 MWIWty2OOEVJhkVzLYE0AAlqTGLuMApawktqS9i+kgx30nBKcAwwPXvvWTslHqSIPe
 jeeB88G3cA2qFqS9DNK7JjeF0WesAtmsy0Q5hJFEBoimyQ1y9wsfEGpR7kxmj9mK2D
 Hs1sK++8a8NiSh0iTCT8DTOhKx14TKSHD7ldpt7Bvk+DdnbmGngXx3FKYedRZ/PpV6
 RY8KK9bD0cOiQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH v3] drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS option
Date: Mon,  6 Mar 2023 19:39:16 +0300
Message-Id: <20230306163916.1595961-1-dmitry.osipenko@collabora.com>
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

Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Fixes: 72122c69d717 ("drm/virtio: Add option to disable KMS support")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

Changelog:

v3: - Moved another similar "has_edid" occurence under the "num_scanouts"
      condition in virtio_gpu_init(), like was suggested by Emil Velikov.

    - Added ack from Gerd Hoffmann.

v2: - Moved the "has_edid" under the "num_scanouts" condition, like was
      suggested by Gerd Hoffmann.

 drivers/gpu/drm/virtio/virtgpu_kms.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 874ad6c2621a..43e237082cec 100644
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
@@ -253,9 +255,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 
 	if (num_capsets)
 		virtio_gpu_get_capsets(vgdev, num_capsets);
-	if (vgdev->has_edid)
-		virtio_gpu_cmd_get_edids(vgdev);
 	if (vgdev->num_scanouts) {
+		if (vgdev->has_edid)
+			virtio_gpu_cmd_get_edids(vgdev);
 		virtio_gpu_cmd_get_display_info(vgdev);
 		virtio_gpu_notify(vgdev);
 		wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
-- 
2.39.2

