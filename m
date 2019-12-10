Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A472119375
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77386E948;
	Tue, 10 Dec 2019 21:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191DD6E948
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:12:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 252F820828;
 Tue, 10 Dec 2019 21:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576011846;
 bh=i9Qf3dkL+Sk4F1NH9W9U/zrqOPyWV6AW4NuExNBI0I8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pct4bTmYJtTMY7Ugt+9I/IlYJy6tUvWkhldTlwPzFr0l2URDlzCsjSVA2V4du/iDk
 BsF2zLOiqOURKhYSo75rS/KrpB4/KaqvmNMB097c9mIourAgW/42X1mRrYyz6Y5UAM
 QQRJSJm/W5VgsNvFpXbtwUhnNYl24buXujJ0fBCw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 002/350] drm/virtio: switch
 virtio_gpu_wait_ioctl() to gem helper.
Date: Tue, 10 Dec 2019 15:58:14 -0500
Message-Id: <20191210210402.8367-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210402.8367-1-sashal@kernel.org>
References: <20191210210402.8367-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gerd Hoffmann <kraxel@redhat.com>

[ Upstream commit 29cf12394c0565d7eb1685bf0c1b4749aa6a8b66 ]

Use drm_gem_reservation_object_wait() in virtio_gpu_wait_ioctl().
This also makes the ioctl run lockless.

v9: fix return value.
v5: handle lookup failure.
v2: use reservation_object_test_signaled_rcu for VIRTGPU_WAIT_NOWAIT.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20190829103301.3539-3-kraxel@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 28 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0a88ef11b9d3f..a662394f68921 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -463,25 +463,29 @@ out:
 }
 
 static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
-			    struct drm_file *file)
+				 struct drm_file *file)
 {
 	struct drm_virtgpu_3d_wait *args = data;
-	struct drm_gem_object *gobj = NULL;
-	struct virtio_gpu_object *qobj = NULL;
+	struct drm_gem_object *obj;
+	long timeout = 15 * HZ;
 	int ret;
-	bool nowait = false;
 
-	gobj = drm_gem_object_lookup(file, args->handle);
-	if (gobj == NULL)
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (obj == NULL)
 		return -ENOENT;
 
-	qobj = gem_to_virtio_gpu_obj(gobj);
-
-	if (args->flags & VIRTGPU_WAIT_NOWAIT)
-		nowait = true;
-	ret = virtio_gpu_object_wait(qobj, nowait);
+	if (args->flags & VIRTGPU_WAIT_NOWAIT) {
+		ret = dma_resv_test_signaled_rcu(obj->resv, true);
+	} else {
+		ret = dma_resv_wait_timeout_rcu(obj->resv, true, true,
+						timeout);
+	}
+	if (ret == 0)
+		ret = -EBUSY;
+	else if (ret > 0)
+		ret = 0;
 
-	drm_gem_object_put_unlocked(gobj);
+	drm_gem_object_put_unlocked(obj);
 	return ret;
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
