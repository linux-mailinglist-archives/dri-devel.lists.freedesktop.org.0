Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C652B894C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 02:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6036E4EA;
	Thu, 19 Nov 2020 01:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C670A6E4EA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:08:19 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id b63so2799472pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 17:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFk5BmQRRvOORZDdtDt946VaDPG1yMYcu2bc7wF2+xc=;
 b=gfQyt5kbhhiaHuFCFVunnb4GVFvoxM0h0xtO+YFKB8QY60IUqWW1w04HqevjxO0j9o
 G+Gdgsnck7lZ2GzdrA7mpy3JYIuE8KQKYbI4OeKj0WvkxQ78W6K6Zo9hSvbQeDV5MSHK
 K8asQ4652TdbdICp9IhirSbxXkSlhdI3BhNmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vFk5BmQRRvOORZDdtDt946VaDPG1yMYcu2bc7wF2+xc=;
 b=NSxCoJtHgOIuSOOaEMQuy2NXDSjw3OVm50aocFDZ7TymrYxxyyuPsGVZvLEYt9QsgP
 so6pV+c1exw0/luh+dZiwZOKT5/rDvXGqOq8mYQcYWLRTAl8pybt55R9NxzhvrX2yyM1
 bRySyr+bXRZusJMZGfkoNTe5ntIyD0esnv7j6p/IFoTGEXpREzeokekpDK9Bw8xLd0/N
 Mb49I8Bx4/cbXJebTQmkFOJO6P5JNf1Q/IlS0saXcfWj/Z/vM03qoJ8bJg493sHvoTDl
 iFghO9d1MlL3FZ+gyevU7QCVI1kSIeoUisq4x1KCS+eLt1tJ/rMPekL0khGqeVsC33Jk
 M81g==
X-Gm-Message-State: AOAM5301qqcUYadKECdqIuVekWAg2jyU4rKFkJxBzQqq10p3crnwNA2O
 z6TYnwPn983Xp4tq+NOzz7z0/jK5tlz/0A==
X-Google-Smtp-Source: ABdhPJxdTVQyZG2WqIb0+W8/aZ+/aDnuP5iqH2M+Xntzd4UAkHOfYtWb3Jwulgsn9b/1L4/KI+X5mA==
X-Received: by 2002:a63:2ad0:: with SMTP id
 q199mr10962861pgq.257.1605748096218; 
 Wed, 18 Nov 2020 17:08:16 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m8sm24188574pgg.1.2020.11.18.17.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 17:08:15 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/virtio: use fence_id when processing fences
Date: Wed, 18 Nov 2020 17:08:08 -0800
Message-Id: <20201119010809.528-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119010809.528-1-gurchetansingh@chromium.org>
References: <20201119010809.528-1-gurchetansingh@chromium.org>
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

Currently, the fence ID, which can be used to identify a
virtgpu fence, is the same as the fence sequence number.

Let's use the fence_id name to clearly signal this.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index c94052376d18..7c7967a2eb84 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -420,7 +420,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
 			  struct virtio_gpu_fence *fence);
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
-				    u64 last_seq);
+				    u64 fence_id);
 
 /* virtgpu_object.c */
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 5b2a4146c5bd..2fe9c7ebcbd4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -112,16 +112,16 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 }
 
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
-				    u64 last_seq)
+				    u64 fence_id)
 {
 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
 	struct virtio_gpu_fence *fence, *tmp;
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	atomic64_set(&vgdev->fence_drv.last_seq, last_seq);
+	atomic64_set(&vgdev->fence_drv.last_seq, fence_id);
 	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
-		if (last_seq < fence->f.seqno)
+		if (fence_id < fence->f.seqno)
 			continue;
 		dma_fence_signal_locked(&fence->f);
 		list_del(&fence->node);
-- 
2.29.2.299.gdc1121823c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
