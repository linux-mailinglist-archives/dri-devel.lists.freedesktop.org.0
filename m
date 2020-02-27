Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A054170D27
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C1C6EBDE;
	Thu, 27 Feb 2020 00:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706E56EBDE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:12 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id n96so351186pjc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1/DEA8pMixhhG9B2DuXwvtkOgW46Ks/0YYN5Ky2wNRE=;
 b=MQ9wRR+JB1G4DSV23r3jqoqZalIBpDeAVMBTO1xH04hF5RJJ8wM2eUe9uurDUc/8q0
 hK+VkTyrxy/Gw9S03xi4AnRF4e+Wcl0R6ZYyafgJ3rHZR6CY/2zekAoyTjnXEu02WJm7
 XFViTbP/G7AB6EabaDOBG7oovGABRIa0CradQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/DEA8pMixhhG9B2DuXwvtkOgW46Ks/0YYN5Ky2wNRE=;
 b=h8KK/FH1gxq+7bVvX9T0mO/LZW02BR2qrO16ruhLPg3KlIliL4mnYRfNG18zJcmejv
 gCVYKD8laXCodHBejq1Z3UszCOTbrADFmmTqFeLEBsesUnDC/PZeV1ab5oxgsIMgspOS
 BXRzfAt9fcF23CQBvZl4DF9GkBRyfWdnVIcOMLPZW0M+ufCwn2WN/C77eGE3RnLoHUzA
 MniVQRAKVgcbqOzkSg/J25zjivVFZ9pxG8ek1HXbFe0QLd/r5aieaVf6+DpgP7le/ymc
 iXCL7QGdhUob4q3NhKrOBSj/v+G9wb+NtUbak0ZDdilzwCqgbK5sN9VWjOCjuM1kMURJ
 Bszw==
X-Gm-Message-State: APjAAAXCY1LoawMDGpSKn3UBAbB1Gbw6PJ2NO3xxSyORT8cNYBETzK/B
 fpwwMquFkASeueW7DL2AGa2Dyz/GhQc=
X-Google-Smtp-Source: APXvYqx1IP2ypc6JG2BRaMW7QdGJNQdvAnMSZglEBogR8YADkd+zlu282ZIvnOcuz6YOnDpM5xTWzQ==
X-Received: by 2002:a17:90a:17c5:: with SMTP id
 q63mr1783120pja.138.1582763171670; 
 Wed, 26 Feb 2020 16:26:11 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:11 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/8] drm/virtio: add virtio_gpu_get_handle function
Date: Wed, 26 Feb 2020 16:25:56 -0800
Message-Id: <20200227002601.745-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227002601.745-1-gurchetansingh@chromium.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whether the resource is a shmem based resource or a (planned)
vram based resource, it will have a resource handle associated
with it. Since the hypercall interface works on resource handles,
add a function that returns the handle given a GEM object.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  1 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index ce73895cf74b..48ca1316ef7b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -367,6 +367,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_fence *fence);
 
 bool virtio_gpu_is_shmem(struct drm_gem_object *obj);
+uint32_t virtio_gpu_get_handle(struct drm_gem_object *obj);
 
 /* virtgpu_prime.c */
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c5cad949eb8d..283b6dadd7c8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -62,6 +62,19 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 	}
 }
 
+uint32_t virtio_gpu_get_handle(struct drm_gem_object *obj)
+{
+	if (virtio_gpu_is_shmem(obj)) {
+		struct virtio_gpu_object *bo;
+
+		bo = gem_to_virtio_gpu_obj(obj);
+		return bo->hw_res_handle;
+	}
+
+	DRM_ERROR("resource handle not found\n");
+	return 0;
+}
+
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
