Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E901639C7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 03:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD736EAFB;
	Wed, 19 Feb 2020 02:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665666EAFA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:03:11 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y5so11651275pfb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 18:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0c4EZlTw5QpZUw23jKFl/TjKgaMoAwFQY+84nYAo5Qw=;
 b=EvIhNvt+qZlNLgUuv5kuqGJlwWAnRwC+zBLrlnf+1whdN5k4souqtU20l6W1xAd90y
 XuJH4IeFeWQjKJlVzOEXu8Kjs+UH+7aoUCelmA8xG5zVKCi5SOrj0GU229HSV9PwNNxY
 5550tXY05ysh/9CVLtrq/bnKs1Be0kGj1AAfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0c4EZlTw5QpZUw23jKFl/TjKgaMoAwFQY+84nYAo5Qw=;
 b=MNCHrfANiPYK0rW1CqX1hcKgyE/wwokOC36vMiY+21ho46e3Eq0OKP28rhBSv12FSo
 Dj0e2kiYZAAJTafkR+WzF3qpn0Mu3Mg5AiaZH+PQAH6aOlWnPL69FWj2ntbI2bkJ6Tf8
 CHHOLiN8Ua42Eage7oXjlw7GyYfYhZdAtDUFGBbcMgIfzMiqLc5WfjXMdybe1fGko9Oy
 8z4We9+1LtzFe3IuaWIA9cicd3QTNbk6rO+khJcjLuHP26qfsbeZGM+JANkE8TpzJ3nY
 AthS4jbg7GDGceP4V6cgJT87xBUrDW05ms6749H5l/N6T5dyKxxhiHsPjMTnK90b6v/b
 L4Sg==
X-Gm-Message-State: APjAAAXkGXR+zUYIYAY3ksXhz9bqrZTZkSFUR5V+kLRuWVf6KTo106oz
 YUQ4ciRVY3e99inZ6leYWKbRnHyl9Qg=
X-Google-Smtp-Source: APXvYqyGpoHHI+Uvg/V2W3eMH7qmP6lIjsRSeYhUjVBX//0tEMzrcSZwGFdCrOKgUEAgkXpcY12gxg==
X-Received: by 2002:a62:188:: with SMTP id 130mr24761218pfb.249.1582077790722; 
 Tue, 18 Feb 2020 18:03:10 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 3sm216430pjg.27.2020.02.18.18.03.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Feb 2020 18:03:10 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5 v3] drm/virtio: track whether or not a context has been
 initiated
Date: Tue, 18 Feb 2020 18:02:59 -0800
Message-Id: <20200219020301.1424-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219020301.1424-1-gurchetansingh@chromium.org>
References: <20200219020301.1424-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an atomic variable to track whether a context has been
initiated.

v3: Fix possible race via spinlock (@olv)

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
