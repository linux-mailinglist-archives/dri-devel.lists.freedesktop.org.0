Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23455A70E9B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 02:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7153910E04C;
	Wed, 26 Mar 2025 01:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="P3rn/UvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849FF10E04C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742953827; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=B1MLcSqipPQpu6A4nqcIb55jteYccNLAsMiJ5Tm0krkMD4eeUA9l1EpwhWzgV5eMBR6cRX6G37tBwlMxKzh33J59x8Butf7rmDwiZRVRljePoXRRXm1kfXu3cT2kF+CpGCBrdQ2n66556pb2rRIPlNeJk/leLgwiaBqCaxSuCPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742953827;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=l+DegcWS6jElhGW6hWqdl4HD0X6U581FmZGc7lb2pgs=; 
 b=MKIH0CDdScfMwytDkH8Yh9xtF4A1yNmeLFxj2WMam4fmmW1045zk/x8LyCcohfuWKoCjUCaGJ0Us0DE944sLGYVKgOSIbuG8OJg0qYs48aWV3I8fKVJ4eR3vfrik6yu6p+qWroUjYUWTl+FYteM1vblXkegd3dDGY8e8Ghs0xwg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742953827; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=l+DegcWS6jElhGW6hWqdl4HD0X6U581FmZGc7lb2pgs=;
 b=P3rn/UvGTsfPa3I9srK14xXOlrjke8z2UTnKfGYoVrZD5jolnGrtKYh3r8NWWuhj
 zZYF6Q3DdoT4OZdqvs8d/KODFHLWvOP8zbMMEf7sq2SYIV0MWtEDCkElAC/PWCaA1Nq
 i1CfbTgYm+PiEgXV6REa+/UbUvQq11BgGEcCffmM=
Received: by mx.zohomail.com with SMTPS id 1742953824533990.002553575539;
 Tue, 25 Mar 2025 18:50:24 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v1 2/2] drm/virtio: Fix missed dmabuf unpinning in error path
 of prepare_fb()
Date: Wed, 26 Mar 2025 04:49:02 +0300
Message-ID: <20250326014902.379339-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326014902.379339-1-dmitry.osipenko@collabora.com>
References: <20250326014902.379339-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unpin imported dmabuf on fence allocation failure in prepare_fb().

Fixes: 4a696a2ee646 ("drm/virtio: Add prepare and cleanup routines for imported dmabuf obj")
Cc: <stable@vger.kernel.org> # v6.14+
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a6f5a78f436a..dc1d91639931 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -342,6 +342,16 @@ static int virtio_gpu_prepare_imported_obj(struct drm_plane *plane,
 	return ret;
 }
 
+static void virtio_gpu_cleanup_imported_obj(struct drm_gem_object *obj)
+{
+	struct dma_buf_attachment *attach = obj->import_attach;
+	struct dma_resv *resv = attach->dmabuf->resv;
+
+	dma_resv_lock(resv, NULL);
+	dma_buf_unpin(attach);
+	dma_resv_unlock(resv);
+}
+
 static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 				       struct drm_plane_state *new_state)
 {
@@ -376,23 +386,16 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 		vgplane_st->fence = virtio_gpu_fence_alloc(vgdev,
 						     vgdev->fence_drv.context,
 						     0);
-		if (!vgplane_st->fence)
+		if (!vgplane_st->fence) {
+			if (obj->import_attach)
+				virtio_gpu_cleanup_imported_obj(obj);
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
 }
 
-static void virtio_gpu_cleanup_imported_obj(struct drm_gem_object *obj)
-{
-	struct dma_buf_attachment *attach = obj->import_attach;
-	struct dma_resv *resv = attach->dmabuf->resv;
-
-	dma_resv_lock(resv, NULL);
-	dma_buf_unpin(attach);
-	dma_resv_unlock(resv);
-}
-
 static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
-- 
2.49.0

