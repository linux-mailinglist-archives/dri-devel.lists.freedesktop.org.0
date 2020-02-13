Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE48715BF1E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 14:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EF96F5D0;
	Thu, 13 Feb 2020 13:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2E6F5D0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581600133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=S8oMA3dbZ9PZ2qH9++a4yIYp8Bp72YzZjfbG2aqd8HQ=;
 b=Y1z+r6crJ8xXtpnIKYztYXJARiIpU61kT5R59gOdq2h5kOLYjLFPyfZQ5l46gOskOelLEg
 S7Zld4AVOo1eoEW+/KLOjqb8yzOpUGOX1TvjRL2/IDYKXxUarDykcBg19DHFZplRkVQOcA
 APEaMz61EguCQ9QZftSR89XcL1cUbo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-k0jWBOdrMVGi2IjdGIphWw-1; Thu, 13 Feb 2020 08:22:09 -0500
X-MC-Unique: k0jWBOdrMVGi2IjdGIphWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD716801E74;
 Thu, 13 Feb 2020 13:22:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 358F08AC36;
 Thu, 13 Feb 2020 13:22:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7846D3EC24; Thu, 13 Feb 2020 14:22:04 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/virtio: batch resource creation
Date: Thu, 13 Feb 2020 14:22:02 +0100
Message-Id: <20200213132203.23441-4-kraxel@redhat.com>
In-Reply-To: <20200213132203.23441-1-kraxel@redhat.com>
References: <20200213132203.23441-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Move virtio_gpu_notify() to higher-level functions for
virtio_gpu_cmd_create_resource(), virtio_gpu_cmd_resource_create_3d()
and virtio_gpu_cmd_resource_attach_backing().

virtio_gpu_object_create() will batch commands and notify only once when
creating a resource.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 8870ee23ff2b..65d6834d3c74 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -224,6 +224,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
+	virtio_gpu_notify(vgdev);
 	*bo_ptr = bo;
 	return 0;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9d4ca0fafa5f..778b7acf2f7f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -514,7 +514,6 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->height = cpu_to_le32(params->height);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 	bo->created = true;
 }
 
@@ -643,7 +642,6 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	vbuf->data_size = sizeof(*ents) * nents;
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 }
 
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
@@ -1010,7 +1008,6 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->flags = cpu_to_le32(params->flags);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 
 	bo->created = true;
 }
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
