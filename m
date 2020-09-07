Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F35525F330
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 08:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BA66E0B6;
	Mon,  7 Sep 2020 06:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59876E0B6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 06:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599460432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17hx+uQnRYN37kt9J2TS1rwaCj5ZQT0lilbznWEFqTQ=;
 b=fL3o6MyIcQsBrTwrd+aE403ajYSyNlvZYCDwbE+xFspZeP39onyqwmrzM+FlcnauDV4n3H
 I3xoFhfgsxD+Lc2Ko+bFSNPu0pVB7pv1x+JDEgn0ngVzXRUnw69ZKCPtOQH6xB/pXu6QoE
 CG27XknfRnjQz0UMxYNVEP1mkbV397M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-AZ6I_DA3P3amXemm0ORAjA-1; Mon, 07 Sep 2020 02:33:50 -0400
X-MC-Unique: AZ6I_DA3P3amXemm0ORAjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74DC480046B;
 Mon,  7 Sep 2020 06:33:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7101E805E0;
 Mon,  7 Sep 2020 06:33:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8C06F204A1; Mon,  7 Sep 2020 08:33:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/virtio: set max_segment
Date: Mon,  7 Sep 2020 08:33:43 +0200
Message-Id: <20200907063343.18097-3-kraxel@redhat.com>
In-Reply-To: <20200907063343.18097-1-kraxel@redhat.com>
References: <20200907063343.18097-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When initializing call virtio_max_dma_size() to figure the scatter list
limit.  Needed to make virtio-gpu work properly with SEV.

v2: place max_segment in drm driver not gem object.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 75d0dc2f6d28..151471acdfcf 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -167,6 +167,7 @@ int virtio_gpu_init(struct drm_device *dev)
 		DRM_ERROR("failed to alloc vbufs\n");
 		goto err_vbufs;
 	}
+	dev->max_segment = virtio_max_dma_size(vgdev->vdev);
 
 	/* get display info */
 	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
