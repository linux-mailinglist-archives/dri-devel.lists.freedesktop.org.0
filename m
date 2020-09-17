Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CB226CFC7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E126EB50;
	Thu, 17 Sep 2020 00:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC146EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:51 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so301829pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fKpQR63Na8jJbJnL8hjl5PeqAwZSPyFZ5TFGGP+fpN0=;
 b=TjeABrdZxlNTd+EFKufb7bESCciSnLrrDCYgH34rwZ8OHVUBYOkznNbFvZ+COZgcGZ
 j9VdMVtznrYvc6IwU0wqHoKj2Pt6U2mCSl7NuSJx7IjmgQuBfWuNl8609Cq5GtQ+c6G0
 JWc0Ec/gFJIEqcOceOBavtsP9uFBnfNMQt+bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fKpQR63Na8jJbJnL8hjl5PeqAwZSPyFZ5TFGGP+fpN0=;
 b=rqRWsCYzX0IbUDc72MGikKX9rjnBhyRLCU9f85jxPS7Pera8hd8vy9sdleJHoLhprW
 PIoavHcAIAsuw3KSo98/5+Dk4/xeMR6YSao7829rZclr0zgqe6fTkVs++KrABWma3YBs
 rHu0WYEgSpN80SuzBeOTLBZCU/yAQbhkDiJfJa0I11v8zdmP5ePVSUYxOVur2JLJigwg
 1+EUF68m8i7kOE+9JhT9mGEmheZHrNjBgi75ZPUKpCdXVgjWT5IxfhAaXnNpLEGL4fWo
 qk9906iiqi7A08s59kORrxijfnd7cffV86Uuh6RD+GcGzpr5Nfo6aKsHigbNug94w7RZ
 cL4w==
X-Gm-Message-State: AOAM530600YkVEPkCvdRnon1hINZbR2hqk380czsJ6mOJMdvKlrtZTeu
 BvbFZzyet1d79WjbLelBEGlDU52BvwBZ5g==
X-Google-Smtp-Source: ABdhPJwDj+RY+NWGiWivpyFCRsi+xzSYKXZVj3XhR0Zv4LxNU9YZQOXW5CfgMBCCrQmotmnqyeni1A==
X-Received: by 2002:a17:902:fe94:b029:d1:e5e7:bddd with SMTP id
 x20-20020a170902fe94b02900d1e5e7bdddmr8430252plm.61.1600301330723; 
 Wed, 16 Sep 2020 17:08:50 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:50 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/19] drm/virtio: implement blob resources: expose
 virtio_gpu_resource_id_get
Date: Wed, 16 Sep 2020 17:08:29 -0700
Message-Id: <20200917000838.735-10-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917000838.735-1-gurchetansingh@chromium.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
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

VRAM object will need it.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 2 ++
 drivers/gpu/drm/virtio/virtgpu_object.c | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 391637f0b362d..674a525df9bcc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -384,6 +384,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
+int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
+			       uint32_t *resid);
 /* virtgpu_prime.c */
 struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 					 int flags);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 4c107b53e81a0..9469ddda523e9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -31,8 +31,7 @@
 static int virtio_gpu_virglrenderer_workaround = 1;
 module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
 
-static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
-				       uint32_t *resid)
+int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
 {
 	if (virtio_gpu_virglrenderer_workaround) {
 		/*
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
