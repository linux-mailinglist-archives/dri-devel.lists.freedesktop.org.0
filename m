Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300979D95ED
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 12:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6DB10E12D;
	Tue, 26 Nov 2024 11:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Yvpa2j/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B8310E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 11:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732618963; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LnnPQQvjpJUPD6LPvXjuKmjdGaCVnmJphi5Rj6gLR5+Co44b1ceKuh15aFnGlcdsM9PzzgMaCWvdiKwfLP0vMubJExCBs7enPGNU/XkGxcpdFWcJEqBc6+tBP8XCOrmbD8hn5iWwUImougijU+fIQB4Jc6VPJ0XF7aljwI2LVRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732618963;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=S//v6td+TIQ+Xw3S7myoun/4CXwi3n7G+siZpAIpl6U=; 
 b=k0ISsywgMGKNsADZ2awE0nFvLhEfdRvgsWYAIrit/lPobseQ4JtKkN4bdRj6etscAYeRs2g8pT29bhRc7tt5b3dhNm0r74AdjmejmD3fyIgrCYvzhZttJSI4Dj93Z6rV+VRLMqNiVJJeZxBGUgi7ELpcT5BoP3Y7ZzglCpEJ6os=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732618963; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=S//v6td+TIQ+Xw3S7myoun/4CXwi3n7G+siZpAIpl6U=;
 b=Yvpa2j/7IslVwpe7hn75jXjMU//RM0MQjg3h2N428qn7U2nf3NDj8gqmHsf2g9BU
 H3UCcWNz2TBgEqARtZcIxkCTn7bTFVItzTq8DvkGv9WvtKd40JnXXamU5Rsw/5BGxDX
 A2T44GZ9aWq3kDng6ZY4N3QghO2V6RiDcWjd+VJw=
Received: by mx.zohomail.com with SMTPS id 1732618961309758.275153322656;
 Tue, 26 Nov 2024 03:02:41 -0800 (PST)
Message-ID: <658bff3c-2cda-4a8a-94fb-9a1737d71d68@collabora.com>
Date: Tue, 26 Nov 2024 14:02:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] drm/virtio: Import scanout buffers from other
 devices
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Koenig
 <christian.koenig@amd.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241126031643.3490496-1-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241126031643.3490496-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hello, Vivek

All patches applied to misc-next with a small modification, thanks!

Note: While verifying move_notify(), I noticed that AMD/TTM driver moves
same shared FB GEMs after each framebuffer update when it renders into
FB, despite of the 32GB BAR. This should be rather inefficient. I'd
expect dma-buf staying static if there is no need to evict it. Something
to check how it works with DG2.

Fix: I made this change to the "Import prime buffers" patch after
spotting possibility of having race condition between move_notify() and
freeing GEM:

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c
b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 8644b87d473d..688810d1b611 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -189,13 +189,18 @@ static void virtgpu_dma_buf_free_obj(struct
drm_gem_object *obj)
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 	struct dma_buf_attachment *attach = obj->import_attach;
+	struct dma_resv *resv = attach->dmabuf->resv;

 	if (attach) {
+		dma_resv_lock(resv, NULL);
+
 		virtio_gpu_detach_object_fenced(bo);

 		if (bo->sgt)
-			dma_buf_unmap_attachment_unlocked(attach, bo->sgt,
-							  DMA_BIDIRECTIONAL);
+			dma_buf_unmap_attachment(attach, bo->sgt,
+						 DMA_BIDIRECTIONAL);
+
+		dma_resv_unlock(resv);

 		dma_buf_detach(attach->dmabuf, attach);
 		dma_buf_put(attach->dmabuf);
@@ -268,7 +273,7 @@ static void virtgpu_dma_buf_move_notify(struct
dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->importer_priv;
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);

-	if (bo->created) {
+	if (bo->created && kref_read(&obj->refcount)) {
 		virtio_gpu_detach_object_fenced(bo);

 		if (bo->sgt)


-- 
Best regards,
Dmitry
