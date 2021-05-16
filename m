Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F8A381D5B
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 09:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB896E49A;
	Sun, 16 May 2021 07:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
 [80.12.242.123])
 by gabe.freedesktop.org (Postfix) with ESMTP id D72786E49A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 07:51:54 +0000 (UTC)
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d54 with ME
 id 5KkN2500G21Fzsu03KkNnW; Sun, 16 May 2021 09:44:23 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 May 2021 09:44:23 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: airlied@linux.ie, kraxel@redhat.com, daniel@ffwll.ch,
 ezequiel@collabora.com
Subject: [PATCH] drm/virtgpu: Fix a resource leak in an error handling path
Date: Sun, 16 May 2021 09:44:21 +0200
Message-Id: <6486962009b4ef496feeca565f2b9376daebac32.1621150940.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If an error occurs after calling 'virtio_gpu_init()', 'virtio_gpu_deinit()'
must be called as already done in the remove function.

Fixes: d516e75c71c9 ("drm/virtio: Drop deprecated load/unload initialization")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 33bf5f53ae31..ca77edbc5ea0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -125,11 +125,13 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 
 	ret = drm_dev_register(dev, 0);
 	if (ret)
-		goto err_free;
+		goto err_deinit;
 
 	drm_fbdev_generic_setup(vdev->priv, 32);
 	return 0;
 
+err_deinit:
+	virtio_gpu_deinit(dev);
 err_free:
 	drm_dev_put(dev);
 	return ret;
-- 
2.30.2

