Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9E163A0D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 03:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39193899C7;
	Wed, 19 Feb 2020 02:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC3899C7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:08 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id j15so11924989pgm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 18:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZNJEt6yj/GGHl6HuTnyWkX+8LhCyEYZPq0uREyoYJY=;
 b=XK/Ocbbu3Dp0qH+vP7RVqbjDVd4W9YGtEiJkHsMYF18AjIY3Oy/qIIDBhcseaK3apQ
 B4yF8k9PqnsaWy4Yi4g/0Mj9YbqGteRNi3eJEdiv+1GDl7CVqbyYvmux4qdU6NnEKTP4
 DG3eOtDE1WhM42NYvXJpxNypg7o/OJbBjSp1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZNJEt6yj/GGHl6HuTnyWkX+8LhCyEYZPq0uREyoYJY=;
 b=p1Zg1ouHvzYC1Bj4mI638IsdMvuvVj74P4/vBNj0VIAKzUdQslOF1s93SqrbcsXvZC
 Itmmv+OMvgbaoeohpBOGK3xbIiDnGmzrzm0U2mb/tdAzePK22uZCjJwPLLFaqwhQqb6Q
 YeyskareUqgxSTc+PbsS7PvBHCPPBsAhxuL1ei91bWJKtZejKXdFWoerPOBGkR3OvrI6
 Bjs58Iufx6XIjVCFvjtzfyZSN1UJT7NtXj91jHysL1G1Yee/TCrl7Jw/ynZJh0RqrZhO
 3C3O1nJ2O2vbQEmaV6c+TrI52VTH/b6CFqyaox7m3559FphHw5Q2/cBExpfduiSAerKi
 S7Wg==
X-Gm-Message-State: APjAAAW2g0Llmk7rkXFLnTU5H3p0FhpvFQ3q8g0kco0VgoZGKSQH+N9v
 T1O8e7ZMDn35cVxijsiN24c9FPq0u+c=
X-Google-Smtp-Source: APXvYqwvukoGyAfvyMol3rGoxiPK6ycUkWtQG7asRQdw8+xogWt8iL1Q3H0dWSH1oQ6CDOOBRJXT1w==
X-Received: by 2002:a65:404d:: with SMTP id h13mr24821270pgp.156.1582078867777; 
 Tue, 18 Feb 2020 18:21:07 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id n2sm335481pfq.50.2020.02.18.18.21.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Feb 2020 18:21:07 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5 v4] drm/virtio: track whether or not a context has been
 initiated
Date: Tue, 18 Feb 2020 18:21:02 -0800
Message-Id: <20200219022102.1750-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219020301.1424-3-gurchetansingh@chromium.org>
References: <20200219020301.1424-3-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use a boolean variable to track whether a context has been
initiated.

v3: Fix possible race via spinlock (@olv)
v4: Fix commit message

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 8 ++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 72c1d9b59dfe..99d94a87c28b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -209,6 +209,8 @@ struct virtio_gpu_device {
 
 struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
+	bool context_initiated;
+	spinlock_t context_lock;
 };
 
 /* virtio_ioctl.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index de04f80f737d..82312664f2e4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -44,10 +44,18 @@ void virtio_gpu_create_context(struct drm_device *dev,
 	if (!vgdev->has_virgl_3d)
 		return;
 
+	spin_lock(&vfpriv->context_lock);
+	if (vfpriv->context_initiated)
+		goto out_unlock;
+
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
 	virtio_gpu_notify(vgdev);
+	vfpriv->context_initiated = true;
+
+out_unlock:
+	spin_unlock(&vfpriv->context_lock);
 }
 
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index f7e3712502ca..f4a9aa0048d2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -258,6 +258,8 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	if (!vfpriv)
 		return -ENOMEM;
 
+	spin_lock_init(&vfpriv->context_lock);
+
 	handle = ida_alloc(&vgdev->ctx_id_ida, GFP_KERNEL);
 	if (handle < 0) {
 		kfree(vfpriv);
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
