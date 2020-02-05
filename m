Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39140153773
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033F06F928;
	Wed,  5 Feb 2020 18:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497B36F924
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:17 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id y8so1196218pll.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3xz12wqoLJgJ3jWkSnEVpo+RAYySs+cnFEeiTl/b54=;
 b=Me0vDa+U2zTFdUZBlIeKb3B3fi6TlUjIEYn9U/sjmPuItmkO96MyZIYnlgJ2Za5J/K
 VxTd7fbZgri74huUWXvBaVE+SlVLlVCYWxw4XTxffSOOseVv+aQRAv1Wq8p/ymMDcQ7m
 JA3eKlkCzu8QkqnKW1UKiYhSXOX8WnFijwwIG4YDf/LhMtZHFQoP9FGulhUSh+qZeeHa
 p2er1TCrITqf0kXgMqiVNDKJm0ZQoUNKtu9ah01kOfUsEW6qbdl4wB6qK8xpUdcqXcxk
 GTOAaLUc42PyVdj3A7JYiWobaKSoBowo/R9VNocdScGxBPEQcaHDZUF+AdmDlmPu4V//
 RTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3xz12wqoLJgJ3jWkSnEVpo+RAYySs+cnFEeiTl/b54=;
 b=oTUoDABn4Uw91EZWvEfUdkPv4rygOmz2jIYVr9UBC76TWiMJMYN4eStFi068LmE+uA
 hlFohGfkCxnxdRQC9tqfGuuC/qm0GfGHpTxcWtRpkF1MFXEgSRHkwI+EwaW9SZmWoyeN
 W3uBUJhFIrD02a0a5GdGf5iobYogfaWzzXtJx66j2Zy9Nh3VQdIXg0JQjYfDa8hA1QEj
 IzTqjcU65kqK1EUF1i4Yy3fJVVZCqBaLSDKAIY1HU85lE0eoosLCS3d5aaD9vw+CIeix
 aeNqHhFG46tA7kE/LlEOmtOPyE4rIB0Ob2Gi81Jct6WfIs2VXLRuQlWnYCNni0AUz2zD
 0yHA==
X-Gm-Message-State: APjAAAXdVCJjNcJpEVjlS8C1Ph27tUXBXvpRm3X504M9zx91fHzmw7QN
 PAGtoXPMXm8qExFpoHGlk8sTz4qi
X-Google-Smtp-Source: APXvYqyNgXU/eRgqUTHmp3wohalEF/0CAHpf9g69ThL0LQ78o6F7myK1lwjjnapYasBqryUvH8SrPg==
X-Received: by 2002:a17:90a:9dc3:: with SMTP id
 x3mr6985725pjv.45.1580926816467; 
 Wed, 05 Feb 2020 10:20:16 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:15 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] drm/virtio: avoid an infinite loop
Date: Wed,  5 Feb 2020 10:19:53 -0800
Message-Id: <20200205181955.202485-10-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205181955.202485-1-olvaffe@gmail.com>
References: <20200205181955.202485-1-olvaffe@gmail.com>
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure elemcnt does not exceed the maximum element count in
virtio_gpu_queue_ctrl_sgs.  We should improve our error handling or
impose a size limit on execbuffer, which are TODOs.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 2 +-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7e69c06e168ea..f7520feb39d4b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -143,6 +143,7 @@ struct virtio_gpu_framebuffer {
 
 struct virtio_gpu_queue {
 	struct virtqueue *vq;
+	unsigned int max_free;
 	spinlock_t qlock;
 	wait_queue_head_t ack_queue;
 	struct work_struct dequeue_work;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 205ec4abae2b9..0954f61d2000f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -132,6 +132,9 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			goto out_unused_fd;
 	}
 
+	/* XXX virtio_gpu_cmd_submit may fail silently when exbuf->size is
+	 * huge
+	 */
 	buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
 	if (IS_ERR(buf)) {
 		ret = PTR_ERR(buf);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 2f5773e43557c..e7d5840e432dc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -170,7 +170,9 @@ int virtio_gpu_init(struct drm_device *dev)
 		goto err_vqs;
 	}
 	vgdev->ctrlq.vq = vqs[0];
+	vgdev->ctrlq.max_free = vqs[0]->num_free;
 	vgdev->cursorq.vq = vqs[1];
+	vgdev->cursorq.max_free = vqs[1]->num_free;
 	ret = virtio_gpu_alloc_vbufs(vgdev);
 	if (ret) {
 		DRM_ERROR("failed to alloc vbufs\n");
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0bf82cff8da37..725cfe93bcef8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -333,7 +333,7 @@ static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 again:
 	spin_lock(&vgdev->ctrlq.qlock);
 
-	if (!vgdev->vqs_ready) {
+	if (unlikely(!vgdev->vqs_ready || elemcnt > vgdev->ctrlq.max_free)) {
 		spin_unlock(&vgdev->ctrlq.qlock);
 
 		if (fence && vbuf->objs)
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
