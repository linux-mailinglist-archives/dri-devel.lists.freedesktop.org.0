Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C303176A1A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 02:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1D16E49F;
	Tue,  3 Mar 2020 01:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C856E49F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 01:40:20 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 2so599268pfg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 17:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=twJLbEY2CTV2ZptEkSn1nrF2oPOLw64y/IW42OxRCQs=;
 b=eKi5/RDH9i8dqelWrXe97pqpsAvNKiNrJPCcObudDcMxHgjw3W3ix72rGPirrSt+nE
 dVhuSOj0oCAbKxOzbK3JyHZ5MyaX9Eq79FqYr3OzaimqWRId0l2Z5wANAn3S+0BURu+c
 005bFm8BsJTlAwvJpv01l4XqlPCnogc78++Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=twJLbEY2CTV2ZptEkSn1nrF2oPOLw64y/IW42OxRCQs=;
 b=fn0qznWp+5vwrhGnoPlZ+f9HCN3p/ADSq/eXMmCmiRinNGUxVddyb8OVAKrD1PB0hD
 YPswl6GuYWM4DcX0JuajRmprTQ8l+xbPN4ggl4D8D4gQSFIRR7ct8w1hWX1+jQqV3oUb
 McF5EuywDwxpalmilOUM6yTu8UnsG2C4vbxe0pXCJHfrcHgGMeL6wmYmhbgRqiHly9C4
 IejoWxeUoh2x5QSFHabQVliMBOjLhbt4Nxc/LWXoAPbsODjviduB0abfvmY//gDlnq56
 bm89WomLVCwRQSPdweJT/KiawTHmwUKtADklalIiizh6Ci+Hok8TO3Ir+YuQhlpUv4MK
 rwOQ==
X-Gm-Message-State: ANhLgQ1TzE7ioWgNkv35HElBWsZPj91UgdLfRBXBkB/RaAdvIf8LBypk
 JyrutGnVff03rXPOvrF5tL33oA7M9oc=
X-Google-Smtp-Source: ADFU+vvpHQrNkfRciINcO/LbSw0RrWPAU9SvNlMheUItK41k0NU4Wyv8yDbqADKaP9aii277UKY0pw==
X-Received: by 2002:a63:24c6:: with SMTP id k189mr1714502pgk.436.1583199619644; 
 Mon, 02 Mar 2020 17:40:19 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id q9sm22058074pgs.89.2020.03.02.17.40.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Mar 2020 17:40:19 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/virtio: make sure virtio_gpu_cleanup_object(..) only
 happens on shmem objects
Date: Mon,  2 Mar 2020 17:40:10 -0800
Message-Id: <20200303014010.418-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200303014010.418-1-gurchetansingh@chromium.org>
References: <20200303014010.418-1-gurchetansingh@chromium.org>
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

This function won't be useable for hostmem objects.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 595b5f3dc105..014a0c1f21b1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -371,7 +371,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 
-bool virtio_gpu_is_shmem(struct drm_gem_object *obj);
+bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 /* virtgpu_prime.c */
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index a7d4d871431e..11f0d4548613 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -110,9 +110,9 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.mmap = drm_gem_shmem_mmap,
 };
 
-bool virtio_gpu_is_shmem(struct drm_gem_object *obj)
+bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
 {
-	return obj->funcs == &virtio_gpu_shmem_funcs;
+	return bo->base.base.funcs == &virtio_gpu_shmem_funcs;
 }
 
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 73854915ec34..a44261ba1c5d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -526,7 +526,8 @@ static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
 	bo = vbuf->resp_cb_data;
 	vbuf->resp_cb_data = NULL;
 
-	virtio_gpu_cleanup_object(bo);
+	if (bo && virtio_gpu_is_shmem(bo))
+		virtio_gpu_cleanup_object(bo);
 }
 
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
