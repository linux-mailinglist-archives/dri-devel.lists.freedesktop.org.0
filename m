Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222831A2C52
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 01:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C526EB12;
	Wed,  8 Apr 2020 23:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45536EB12
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 23:29:42 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id c23so4070011pgj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 16:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HNFTPgOKLUhUiPHSKmGDV/Ral50BnnbkpyfPP6ol7M4=;
 b=SpL4J7JuraOQXb4EE0JnUIuUfB16rHQnhqO5OS9Q76BuUVMcINJj9SGzwGqX7Q2gx7
 JLxOvyj/iOHGMyV+EHuuaXZaMTVD1BPCzCIp4fLf9Zo7n56FxrmLf9rs8u2ZJ7h9dvpD
 2jW3go9OHTwzl8GMWYu+cfWViYvJOgwCnMLWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HNFTPgOKLUhUiPHSKmGDV/Ral50BnnbkpyfPP6ol7M4=;
 b=AeBR7eRBelmWYZoHgLUZfmvstwOwPgyOuLQlS1oIm9qZd11uJpndlaQ24uUp6mw0US
 A0ZRTFa60taAxvE1vHOFP9YRoOtawFNFbI1lO8Kd0gt/vFGK2kUm3Gs0Iysk4JHAmgFM
 asySVnejJrKT9d3LGacWK26Wh0BjHJ2HjIbfV8e1RLPLiM2GWnGX/vq9Trbm0JB7UMkc
 k2qE1J0fk3C9TTgrRw9KwihjuR5ToLGeZaJzsaQJEBAXrQ+/OP+tDA2kMYkY6wwQQT0R
 ccfYtCwvJWGVm7+26fOrficeBj91Q1QKYnMYJbs5uJhFXJDXIBC9NZnRKMKFBbLy3Ccu
 fSKQ==
X-Gm-Message-State: AGi0Pua0cQSoWJd3PUVw0ahECZ+1HWFK2Wv37poSvkNCh8MV5NiU2uK9
 KZanGGOd+BhF08zwpJR28s6bWS8wD5Y=
X-Google-Smtp-Source: APiQypLME6asWgdPXuFBWCR03YZZs9HWwbqueAkH3N3GhfHBK43Cdrm36TL1isFdHhI/Q/zOEpZrPA==
X-Received: by 2002:aa7:850f:: with SMTP id v15mr9922200pfn.119.1586388581632; 
 Wed, 08 Apr 2020 16:29:41 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w13sm94329pfd.101.2020.04.08.16.29.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 08 Apr 2020 16:29:41 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: only destroy created contexts
Date: Wed,  8 Apr 2020 16:29:38 -0700
Message-Id: <20200408232938.55816-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This can happen if userspace doesn't issue any 3D ioctls before
closing the DRM fd.

Fixes: 72b48ae800da ("drm/virtio: enqueue virtio_gpu_create_context
after the first 3D ioctl")
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 023a030ca7b99..a5038298c6ae3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -52,14 +52,6 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 		      events_clear, &events_clear);
 }
 
-static void virtio_gpu_context_destroy(struct virtio_gpu_device *vgdev,
-				      uint32_t ctx_id)
-{
-	virtio_gpu_cmd_context_destroy(vgdev, ctx_id);
-	virtio_gpu_notify(vgdev);
-	ida_free(&vgdev->ctx_id_ida, ctx_id - 1);
-}
-
 static void virtio_gpu_init_vq(struct virtio_gpu_queue *vgvq,
 			       void (*work_func)(struct work_struct *work))
 {
@@ -274,14 +266,17 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct virtio_gpu_fpriv *vfpriv;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 
 	if (!vgdev->has_virgl_3d)
 		return;
 
-	vfpriv = file->driver_priv;
+	if (vfpriv->context_created) {
+		virtio_gpu_cmd_context_destroy(vgdev, vfpriv->ctx_id);
+		virtio_gpu_notify(vgdev);
+	}
 
-	virtio_gpu_context_destroy(vgdev, vfpriv->ctx_id);
+	ida_free(&vgdev->ctx_id_ida, vfpriv->ctx_id - 1);
 	mutex_destroy(&vfpriv->context_lock);
 	kfree(vfpriv);
 	file->driver_priv = NULL;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
