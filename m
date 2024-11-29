Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA29DE9FF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 16:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D277810E4F1;
	Fri, 29 Nov 2024 15:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="jStDHHxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C88D10E4F1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:56:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732895794; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IqLUoYyKTo3n0TGyZeEphOuMc+1H8wvqeyrcWo+gSs3aYmKMCBa5EvAYzrhuj3/WOka/+8veIgW/duf33PodGWATC1OMesNXBRLVzccu/Nv8f2vdHYQonO5gRRuodtbh4GmzWfTuSmwuqhrZ79DVBf/UFha0QPUDNWvFHGUHCjc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732895794;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=L1n0P1PyrA42r5RgU2rWlUpygAiAbYbhSvSFfsMFi7Y=; 
 b=hmsYM/ZEylEpWoNJHDAbxBkaaxgen9SdqsBBQqua4fq2cFnI7dhoUW/q6mJvMmLKLLZ0L9IlF49kKciXdAH5CZiIzoyoMRUAATqC4zqRXcTUM5eEDzsl+BLDKBpqlnMyrwsYDZsTDKDXZlThKli8WZnlvyGGsYWDBRJXxXHsghQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732895794; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=L1n0P1PyrA42r5RgU2rWlUpygAiAbYbhSvSFfsMFi7Y=;
 b=jStDHHxRGzpaSWiQJPPb2SKgDWfFEgt9l38M1M8ATPfgt4/3d3iJh8zH0IW3GPya
 tj5YZS6Fch/B48tXbyBJph2ZADHeBEy8HZ2QMcPUKYhulgFT9GoPVXjbj2WjtKEOJlt
 nydq1c0t3OEEtqJ4+lcf2M6RFiTeuC3QE0868x6I=
Received: by mx.zohomail.com with SMTPS id 1732895792071583.5803474673253;
 Fri, 29 Nov 2024 07:56:32 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Kim Dongwon <dongwon.kim@intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v1] drm/virtio: Set missing bo->attached flag
Date: Fri, 29 Nov 2024 18:53:57 +0300
Message-ID: <20241129155357.2265357-1-dmitry.osipenko@collabora.com>
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

VirtIO-GPU driver now supports detachment of shmem BOs from host, but
doing it only for imported dma-bufs. Mark all shmem BOs as attached, not
just dma-bufs. This is a minor correction since detachment of a non-dmabuf
BOs not supported today.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 1 -
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 688810d1b611..33084ce1d01d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -249,7 +249,6 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
 	virtio_gpu_cmd_resource_create_blob(vgdev, bo, &params,
 					    ents, nents);
 	bo->guest_blob = true;
-	bo->attached = true;
 
 	dma_buf_unpin(attach);
 	dma_resv_unlock(resv);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index ad91624df42d..062639250a4e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1300,6 +1300,9 @@ virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 	bo->created = true;
+
+	if (nents)
+		bo->attached = true;
 }
 
 void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
-- 
2.47.0

