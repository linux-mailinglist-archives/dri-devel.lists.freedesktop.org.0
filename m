Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA3A276527
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999736EA2E;
	Thu, 24 Sep 2020 00:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CCC6EA24
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:27 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id n14so749776pff.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fKpQR63Na8jJbJnL8hjl5PeqAwZSPyFZ5TFGGP+fpN0=;
 b=kAvYLdL8i8ULQ3HM1g5icSO8pa0H/b6ZI01XrObHpZTw/5Y4/katGgMvpSyj34PGe9
 Ls0C5iby7Jjsn9AoCxxibJEUdFoSPWPWbVzzv5bUcw0G30fcX+JK2JPeeJsku+jdnSfd
 QgjBcSDnmnizUkiMbbnOBf2mTzQtSA5cA7K5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fKpQR63Na8jJbJnL8hjl5PeqAwZSPyFZ5TFGGP+fpN0=;
 b=Lxut16kILSHvtStXKMrE0dTMNX7DvLST3WIoOGhJbSwsKh9Y/IB5fAVYVXPRqFhFqt
 VyTIo8px3Z2unyEGHzmj22v1yilYdmPAff/sZOn2rr1xtukeX+h0RbaLZMkz88R/Wg9g
 GK9AMzsEFp3quSHDyQJVa4UlPvpezI5WBbZ70hrtvzC+TOCv24y9FnB5YyKPuQXZQ3HY
 EUyvFHqLiklPDocW1QG5+2+Gx5TSqAB8TmUm3RIU2lz5P6VGDwyENggc15dKuGhkdxi3
 HsmAKkva2a88OLjOdO30L6LT/6qvr8DUIQartDijrG0+ui5ywjmfz9PUgLWhbBxEUYop
 D7UA==
X-Gm-Message-State: AOAM532DjsVsHIKcICTxQNPsYsneBRN6w1TTjKxOhXEdU77CClv6ERMF
 iVrzkMaq7Jq3GTfoZerr3ueIeBEc3J9Kdg==
X-Google-Smtp-Source: ABdhPJzaWUMH04sChCg2aksO1rXYwtdIXXQZnvSsLPQSrKFfvxdABi7CraCLepgmjnhQ6E/8H5aO+Q==
X-Received: by 2002:a62:7c82:0:b029:13c:1611:66b9 with SMTP id
 x124-20020a627c820000b029013c161166b9mr2146235pfc.4.1600907546606; 
 Wed, 23 Sep 2020 17:32:26 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:26 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/19] drm/virtio: implement blob resources: expose
 virtio_gpu_resource_id_get
Date: Wed, 23 Sep 2020 17:32:05 -0700
Message-Id: <20200924003214.662-10-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
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
