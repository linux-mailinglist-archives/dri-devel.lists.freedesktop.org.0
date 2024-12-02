Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F79DFA3C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 06:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2644510E3F9;
	Mon,  2 Dec 2024 05:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="S5MuBhtz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E00A10E1DA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 05:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733118009; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QAR6JFgo/352+alNXmaqH77g8AC1yEWIsCmeUkAhX/mOrWpqY9VrsUOt7tg41Jk9aggN90Aoagr3SzPBpUrllKeE+lqfEh+3KxiL/p926ArIS7h7GDgPyzIFQ7Wtq0P8EAlz7Ge2E3q+9/sqqa5IHlhxB6UAabjv5YDQWNKgfak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733118009;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/aDX0tKRf8MVvlCU/V5j9pdtLu3K1ygfZJBPnvcrZeU=; 
 b=g0zC5/OaIo+hCCMZhgLVMi2gdh/WyUF345STIKVnTrgXtEuMCkCAstlkmM/lr7bOqAuJ/YITJPj9ORl5y4ndhCwdy2t1JKVhKjym6zhS40ZSAaPVyy3HkSfTV/qDSlwGps62xgFE1+pNnWH5XKf152NP33bfq+m6G9EOv0X8RTU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733118009; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=/aDX0tKRf8MVvlCU/V5j9pdtLu3K1ygfZJBPnvcrZeU=;
 b=S5MuBhtzZybZlYXo9aaVZdZ6YDl7V/H3kjWbb8JlKAsQzCrKqNVa+87RPjOF6KMl
 tVCvOLoKlaFVDuPGddWdzSm+UY/18YpNorKNWq6nRvzwXmC+0yUn6bozRQurQtvO069
 LA6Ezb9ftBDjCF9ITS1KaRatRnW4zFj6bpPWDu48=
Received: by mx.zohomail.com with SMTPS id 1733118006843134.69938473813932;
 Sun, 1 Dec 2024 21:40:06 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Kim Dongwon <dongwon.kim@intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v1] drm/virtio: Factor out common dmabuf unmapping code
Date: Mon,  2 Dec 2024 08:39:55 +0300
Message-ID: <20241202053955.2451321-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.47.0
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

Move out dmabuf detachment and unmapping into separate function. This
removes duplicated code and there is no need to check the GEM's kref now,
since both bo->attached and bo->sgt are unset under held reservation lock.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 35 ++++++++++++++------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 33084ce1d01d..101d1a6517ae 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -184,22 +184,33 @@ int virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
 	return 0;
 }
 
-static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
+static void virtgpu_dma_buf_unmap(struct virtio_gpu_object *bo)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
-	struct dma_buf_attachment *attach = obj->import_attach;
-	struct dma_resv *resv = attach->dmabuf->resv;
+	struct dma_buf_attachment *attach = bo->base.base.import_attach;
 
-	if (attach) {
-		dma_resv_lock(resv, NULL);
+	dma_resv_assert_held(attach->dmabuf->resv);
 
+	if (bo->created) {
 		virtio_gpu_detach_object_fenced(bo);
 
 		if (bo->sgt)
 			dma_buf_unmap_attachment(attach, bo->sgt,
 						 DMA_BIDIRECTIONAL);
 
+		bo->sgt = NULL;
+	}
+}
+
+static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct dma_buf_attachment *attach = obj->import_attach;
+	struct dma_resv *resv = attach->dmabuf->resv;
+
+	if (attach) {
+		dma_resv_lock(resv, NULL);
+		virtgpu_dma_buf_unmap(bo);
 		dma_resv_unlock(resv);
 
 		dma_buf_detach(attach->dmabuf, attach);
@@ -272,15 +283,7 @@ static void virtgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->importer_priv;
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 
-	if (bo->created && kref_read(&obj->refcount)) {
-		virtio_gpu_detach_object_fenced(bo);
-
-		if (bo->sgt)
-			dma_buf_unmap_attachment(attach, bo->sgt,
-						 DMA_BIDIRECTIONAL);
-
-		bo->sgt = NULL;
-	}
+	virtgpu_dma_buf_unmap(bo);
 }
 
 static const struct dma_buf_attach_ops virtgpu_dma_buf_attach_ops = {
-- 
2.47.0

