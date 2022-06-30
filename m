Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DC5623E0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE49412B1C9;
	Thu, 30 Jun 2022 20:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F5E12B1AC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:08:00 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C9AD66019E3;
 Thu, 30 Jun 2022 21:07:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619679;
 bh=mv/tj0+YDxNaJUXU178nX/xm0YQreC8O65A745IOwIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PcceCuOztM0G2p5mtXgLSnZuL0vqVoO9HS468cbI/zUsqJsb111UiJyKWU/6n3/dD
 n8vAPLjlaTGrpGLzefRX3y7UTpx24vQQFcViitSiqx69ckMSh/SQhDjAfNdaNLluyn
 buMkejUvIqGmzEc0l6ifMyX79sjctMpxWLlzyc5dbz3InTAciS4c/omInZmnJ57C1B
 XL5Af6dwF5ljhvMv+yKW3tBcumVmuL62RVmmxgWxELgSfLR3VFdLSM3WW8Ve5UDw1S
 wga3bPeXngP5q4vMNIOTMdPWB9C6yBXdEiY0E5rD9IHVWxiRTScoyKJwvLaPKHT5oc
 wZRiqGub5SMyw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v7 6/9] drm/virtio: Simplify error handling of
 virtio_gpu_object_create()
Date: Thu, 30 Jun 2022 23:07:23 +0300
Message-Id: <20220630200726.1884320-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the order of SHMEM initialization and reservation locking
to make code cleaner and to prepare for transitioning of the common
GEM SHMEM code to use the GEM's reservation lock instead of the
shmem.page_lock.

There is no need to lock reservation during allocation of the SHMEM pages
because the lock is needed only to avoid racing with the async host-side
allocation. Hence we can safely move the SHMEM initialization out of the
reservation lock.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 75a159df0af6..62b4d075cfac 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -235,6 +235,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	bo->dumb = params->dumb;
 
+	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	if (ret != 0)
+		goto err_put_id;
+
 	if (fence) {
 		ret = -ENOMEM;
 		objs = virtio_gpu_array_alloc(1);
@@ -247,15 +251,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			goto err_put_objs;
 	}
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
-	if (ret != 0) {
-		if (fence)
-			virtio_gpu_array_unlock_resv(objs);
-		virtio_gpu_array_put_free(objs);
-		virtio_gpu_free_object(&shmem_obj->base);
-		return ret;
-	}
-
 	if (params->blob) {
 		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
 			bo->guest_blob = true;
-- 
2.36.1

