Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908909581A7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0149D10E55D;
	Tue, 20 Aug 2024 09:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iKUxWZ6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3BF10E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724144966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUSPSFlfbnk2GBQn/hXYCEuTgzqE3rPm+JVguTpTv3E=;
 b=iKUxWZ6+xzgzAQCH+jwz30IcuuqO3UckmWHNf9cSeOsNMrKxBZabe00Op89kcQqO9Hz/de
 NNgCLKmAepTGvIt35WLHZSBZgO4Wd82ZX10fkwLNxo04Bncn0SfXkTHeWP/vUUhetd4N+I
 I64gB8dP7PG3+I2DXf6htfEEXng9ISA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-ZN5DTtbaMSSXzbIbgL6-eg-1; Tue,
 20 Aug 2024 05:09:25 -0400
X-MC-Unique: ZN5DTtbaMSSXzbIbgL6-eg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A4AD1955F4A; Tue, 20 Aug 2024 09:09:23 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.88])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 737AE1955F39; Tue, 20 Aug 2024 09:09:19 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 2/2] drm/virtio: Fix host color format for big endian guests
Date: Tue, 20 Aug 2024 11:07:41 +0200
Message-ID: <20240820090908.151042-2-jfalempe@redhat.com>
In-Reply-To: <20240820090908.151042-1-jfalempe@redhat.com>
References: <20240820090908.151042-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

The colors are inverted when testing a s390x VM on a s390x host.
Changing the conversion from DRM_FORMAT -> VIRTIO_GPU_FORMAT on big
endian guests fixes the colors. But it may break big-endian guest on
little-endian host. In this case, the fix should be in qemu, because
the host endianess is not known in the guest VM.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 860b5757ec3fc..0ec6ecc96eb13 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -37,16 +37,24 @@ static const uint32_t virtio_gpu_cursor_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
+#ifdef __BIG_ENDIAN
+#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM
+#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM
+#else
+#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM
+#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM
+#endif
+
 uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
 {
 	uint32_t format;
 
 	switch (drm_fourcc) {
 	case DRM_FORMAT_XRGB8888:
-		format = VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM;
+		format = VIRTIO_GPU_HOST_XRGB8888;
 		break;
 	case DRM_FORMAT_ARGB8888:
-		format = VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM;
+		format = VIRTIO_GPU_HOST_ARGB8888;
 		break;
 	default:
 		/*
-- 
2.46.0

