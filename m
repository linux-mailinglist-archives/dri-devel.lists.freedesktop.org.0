Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482E0244324
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3156EACE;
	Fri, 14 Aug 2020 02:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05BF6EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:21 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id c10so5031520pjn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEhXmYksZ3dGd3UFrdyR/Xf7RWBi1/NoKRzRoErAr0k=;
 b=cymqipQS73HydTu9Z/SupAEJVkDbUf/YSOxeXrzh0o5LRLK0Ek7Rd9F8uPxQhXeSx1
 yHYkkgF1xxmu/tOfSWMav1umf/UNVjFwsQzZ/tTPOienhvCqmzy4PHJshnrJWetLF/zw
 05VoLpPxOyGP5OVaakE8LLjPDq2eH7TVzaAnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEhXmYksZ3dGd3UFrdyR/Xf7RWBi1/NoKRzRoErAr0k=;
 b=gfYWNRwvpFtLS4fKpoCknpKPYiHd6D7DH8tyqo9Tspjk6g35pyz9EYKnCMycGNbFlP
 j6itkZOo0XHr9qrkSfZHnF1vrGYourgq4/A/gtmRaSfUuTt6bOiPAPFRJRiBwBwp0TD9
 nfazOZji57pYoH+l8+oWo2LojeOpK9/yxtpR5VlUpyq2nDu6VXFo6kdjUpxJadVDWFrB
 dtCAHlSk/hD3S/y0KGuiz6jAJaLwF3y4bZo6537/7lnmiBeLmxmOs8Fijs0aaUJ/ofnd
 8jvY85kOCfu78xpzTLYZDtofGPXhfmNYvX6gq+bJ9VocET9I+DA/FkeC2wa/SF35hs8L
 YBHw==
X-Gm-Message-State: AOAM530A+/nwqhuXbhksJTllTrZEhX5IfcnxX4Bk6NsS9Kq/YzVy2HBM
 KsM140if1cXP34Vq1sG1uKxJSeIIuU0TaA==
X-Google-Smtp-Source: ABdhPJw7gk4G5oenPIbcm5NkMVD3ulMY94E5QczW9UMzhTH2mjo0nHIhFkLFOtELNt2HCWkS12k+eA==
X-Received: by 2002:a17:90a:fd81:: with SMTP id
 cx1mr534029pjb.90.1597372821172; 
 Thu, 13 Aug 2020 19:40:21 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:20 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 15/24] drm/virtio: implement blob resources: expose
 virtio_gpu_resource_id_get
Date: Thu, 13 Aug 2020 19:39:51 -0700
Message-Id: <20200814024000.2485-16-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
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
index c8405449c4a3..71743916300d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -383,6 +383,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
+int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
+			       uint32_t *resid);
 /* virtgpu_prime.c */
 struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 					 int flags);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 9d68f260d998..792a2ae1bf97 100644
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
