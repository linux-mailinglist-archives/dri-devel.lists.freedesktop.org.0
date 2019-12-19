Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900621258F2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 01:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDA86EAAE;
	Thu, 19 Dec 2019 00:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAB06EAAE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 00:57:44 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id a33so2190776pgm.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ei8xOVvBixG0rPjLYnrpJihmHBppCFxJAv0s6xjhaRg=;
 b=EBehqQL+rLLkKNPYqnqyrY4qenst51roeMN2RTR5+PlrAYknlZ6nAZk1yvScbuH/lO
 xNuiA2qrKWDGPOGCDTWKmw/4CWpLuLKdL2BHP535SuI/lSSF8O7lZNrIkvKFx+b3VQMA
 GY6mm6BujXR+UoT0hwmJ+ehTTRmXvlKbQ10mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ei8xOVvBixG0rPjLYnrpJihmHBppCFxJAv0s6xjhaRg=;
 b=oWKVvLj6DDvSQl4wf3sHRgEVdtu2r2Ixf9Dg3gvt1lkURVjtVhGUxVfFVD8MafOHQT
 IZ+MoYwkfx1wOUDYW1/6AilDeI6VODCOcvJYr6E+9XZpGJvDA/ngkHRu+cvFphZo+31i
 DIqUuaKjSc923Pb5o7uX/M6OyLv+8MuSSeSc3FJodxbaAZMEzxgrOd74mE7+3xF8xDAv
 qqZdD5lnm/8ErU4Eqv2ChWd38BdatE+LxPflofPWBttd+sUQzM6YmW6PRne3v8QIzFFa
 O7bTqBe5l0eG8iDJ3Z/m3lAYHoKTEF7uiSekSgQ6ty0Prutn2kBJ2/tzagkBBmG6pMS3
 S43g==
X-Gm-Message-State: APjAAAV9YJFj6XjNiR+0izKXc9IYwt0/m+KmMcjEyEBLgf7V5yCtWftV
 52wOGD18eecWSVwWZwCiX+envWHZgxc=
X-Google-Smtp-Source: APXvYqwJyDaSZfKe8efKEcJFgv5a2S+wds06O1Cl5IOu2sPUJCiPnwO8zvX+wVGTy8iavKJaAzrPkw==
X-Received: by 2002:aa7:90c4:: with SMTP id k4mr6472491pfk.216.1576717064422; 
 Wed, 18 Dec 2019 16:57:44 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id f23sm4651553pgj.76.2019.12.18.16.57.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Dec 2019 16:57:43 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/virtio: static-ify virtio_gpu_framebuffer_init
Date: Wed, 18 Dec 2019 16:57:29 -0800
Message-Id: <20191219005733.18960-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219005733.18960-1-gurchetansingh@chromium.org>
References: <20191219005733.18960-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
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
index 349c1dea61c7..cf09e4af2fc5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -342,10 +342,6 @@ void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
 void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
 
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
