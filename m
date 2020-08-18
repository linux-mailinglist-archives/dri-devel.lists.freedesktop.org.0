Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23339247FBD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F4989C61;
	Tue, 18 Aug 2020 07:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C7F89C61
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597736916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=yo4kEY+qRk9I44ALuDXlR4fywd4izKlmhlTyX/YouR0=;
 b=ZNiV8PG5ekhk7Yj3e7k0C1HQrloW2wq2EIdpBrtVnz03L+DoW5a6BrQ1YKwlTHWgybhf8K
 RKSGwrdor8/gyMMMiX6ily9eMztTh6Q4JAkBGwP+5Gt6gDl1Zsc7aHya2GElqVM8snx56T
 yKk//BuNwP2ZDdPw4X7TgLs+S7F1PYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-wnVYBnzFPBOs3Ycc8Zs0ow-1; Tue, 18 Aug 2020 03:48:34 -0400
X-MC-Unique: wnVYBnzFPBOs3Ycc8Zs0ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA694185E52C;
 Tue, 18 Aug 2020 07:48:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C615261B7;
 Tue, 18 Aug 2020 07:48:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 76E519CA6; Tue, 18 Aug 2020 09:48:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/virtio: set max_segment
Date: Tue, 18 Aug 2020 09:48:28 +0200
Message-Id: <20200818074828.9509-3-kraxel@redhat.com>
In-Reply-To: <20200818074828.9509-1-kraxel@redhat.com>
References: <20200818074828.9509-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When initializing gem objects call virtio_max_dma_size() to figure the
scatter list limit.  Needed to make virtio-gpu work properly with SEV.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 1359eb8f1a02..26b608e2554e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -214,6 +214,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		goto err_free_gem;
 
 	bo->dumb = params->dumb;
+	shmem_obj->base.max_segment = virtio_max_dma_size(vgdev->vdev);
 
 	if (fence) {
 		ret = -ENOMEM;
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
