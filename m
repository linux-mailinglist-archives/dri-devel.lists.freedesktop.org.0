Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0902123C21
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E13A6E1FB;
	Wed, 18 Dec 2019 00:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9AF6E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:59:47 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y8so163508pll.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TBFjUWm46buk8vUV/NxlMxl8UOi4x3APdXMTOIFgTM8=;
 b=GRwte4OzKZi/whsg2HodWLfiXlJcX7CuoTATGWP6mM36XzAgZEtjnU3oMef2m6T5U3
 5t2z2+d2uC5teSVaYHCZ3qhlVklm8yj8yaQ8MZAony2ApuEVu6RhC3Wm1kHfoX+z3WFy
 YQiX2QHGmQCFBJu8/JIm6WJNba8zrNxPFcwMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TBFjUWm46buk8vUV/NxlMxl8UOi4x3APdXMTOIFgTM8=;
 b=eu84FJFvIIg3TEUeWzVngzJxhnxHnFzByLV7wJlJDfch9LeNpI9kNz8RoBnTnI9Jqv
 OX/mp1IMnlY7/aH+h/VmNptHowSPFowzqmNqJJqFb7O2aG0Wl9L8eGNPcT5okqc1XQA/
 4M/kMuZlunBwzP/tEulJTkN+gPxh9MAKOVljQqydIPmpMjqfkN6Q9n+hgyqozSlqtRmT
 a7RuS3Q+XSSeuYE56rYI1vwk4oJQLifMLdUX2OIQSlbI4GV0f+sAesfgcKSDfZ9cr8FF
 y4uNXbjgiQKROHot72JfD+tmsJ1izFd+RoIDD8kP8EZ0v9hiusBK6/XEkx2M7lbpBREJ
 p4eQ==
X-Gm-Message-State: APjAAAXC7ETbdrNRoNW+7xPZcLyNSjGkhx9om4zFujHkwYwEKxLYf6xv
 YtYZTS0S1EWHC9oZFMFqHLQ7sNvaK0g=
X-Google-Smtp-Source: APXvYqydfV7sfBmnSS2yRGJ+GfGrmkF6S4TIBB3ssFmgQLpj8zIwTtJodWmpNGzMDrbKxMaZKxFhBA==
X-Received: by 2002:a17:90a:c593:: with SMTP id
 l19mr255774pjt.110.1576630786883; 
 Tue, 17 Dec 2019 16:59:46 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.16.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 16:59:46 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/virtio: static-ify virtio_gpu_framebuffer_init
Date: Tue, 17 Dec 2019 16:59:22 -0800
Message-Id: <20191218005929.6709-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
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

Not used anywhere else.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index e622485ae826..c76d69fecfeb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -59,7 +59,7 @@ static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs = {
 	.dirty = drm_atomic_helper_dirtyfb,
 };
 
-int
+static int
 virtio_gpu_framebuffer_init(struct drm_device *dev,
 			    struct virtio_gpu_framebuffer *vgfb,
 			    const struct drm_mode_fb_cmd2 *mode_cmd,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 6b3f1551a2f1..b2270153528c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -336,10 +336,6 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
 void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
 /* virtio_gpu_display.c */
-int virtio_gpu_framebuffer_init(struct drm_device *dev,
-				struct virtio_gpu_framebuffer *vgfb,
-				const struct drm_mode_fb_cmd2 *mode_cmd,
-				struct drm_gem_object *obj);
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
