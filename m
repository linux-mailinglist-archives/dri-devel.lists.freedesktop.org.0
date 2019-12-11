Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3F11A5BD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 09:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B2E6EA91;
	Wed, 11 Dec 2019 08:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA496EA8D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576052299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvtkLdUSetwh2LM7748b/AtFetYeaJ3ZQNHZjoVf5YE=;
 b=RWgqfe6aYpQGw+kaQO9KjXjfwVsH4c1+5hlkWagoLvUf+A6NLrx10/ZvoFjo6oS4r+CjHS
 ETBPVuGk3zz310F5Pliuw0zpLVL6QZhivPWJqiHFzYccup1v1GLZWFCODqEyCW+yxf5yOq
 qTewbsi1STlRj9c/fX+FpU/7ZwnVVQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-Cbc1t8c6NBaxf1aZQKiJ0A-1; Wed, 11 Dec 2019 03:18:15 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2631801E72;
 Wed, 11 Dec 2019 08:18:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89C7410013A1;
 Wed, 11 Dec 2019 08:18:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D8E871747D; Wed, 11 Dec 2019 09:18:10 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/virtio: fix mmap page attributes
Date: Wed, 11 Dec 2019 09:18:10 +0100
Message-Id: <20191211081810.20079-3-kraxel@redhat.com>
In-Reply-To: <20191211081810.20079-1-kraxel@redhat.com>
References: <20191211081810.20079-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Cbc1t8c6NBaxf1aZQKiJ0A-1
X-Mimecast-Spam-Score: 0
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
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio-gpu uses cached mappings, set shmem->caching accordingly.

Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb..a0b5e5195816 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -118,6 +118,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	shmem_obj = drm_gem_shmem_create(vgdev->ddev, params->size);
 	if (IS_ERR(shmem_obj))
 		return PTR_ERR(shmem_obj);
+	shmem_obj->caching = DRM_GEM_SHMEM_CACHED;
 	bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
 
 	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
