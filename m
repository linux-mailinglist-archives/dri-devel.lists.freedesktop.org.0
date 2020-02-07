Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CD155335
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 08:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFA26FB9C;
	Fri,  7 Feb 2020 07:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA176FB9C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581061611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=yTteDxCnygXV7ue1fdGcLu/2eGxPy4HYZGw41Ynn8wo=;
 b=LpLo5godY0FDIwpRgoXgPs0TcK52M2DiHI4OaQeBBz29dscs95B5D6JNHqwHfNp0HefyNt
 jYkveqAS75dHWuR79o2rZEWI6AYADEZKyeZo7YEjV55e9OorSmaX8T1SRDt8lwvrokuxEL
 JRfYk5djSgfer6S0z+VoRddIfgLKlgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-OYW8C9-CPEWWkP9OE0-TQg-1; Fri, 07 Feb 2020 02:46:44 -0500
X-MC-Unique: OYW8C9-CPEWWkP9OE0-TQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47F4CDB61;
 Fri,  7 Feb 2020 07:46:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69E0E1001B08;
 Fri,  7 Feb 2020 07:46:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE5C931F47; Fri,  7 Feb 2020 08:46:38 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/virtio: move mapping teardown to
 virtio_gpu_cleanup_object()
Date: Fri,  7 Feb 2020 08:46:37 +0100
Message-Id: <20200207074638.26386-4-kraxel@redhat.com>
In-Reply-To: <20200207074638.26386-1-kraxel@redhat.com>
References: <20200207074638.26386-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 gurchetansingh@chromium.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop sending DETACH_BACKING commands, that will happening anyway when
releasing resources via UNREF.  Handle guest-side cleanup in
virtio_gpu_cleanup_object(), called when the host finished processing
the UNREF command.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 --
 drivers/gpu/drm/virtio/virtgpu_object.c | 14 ++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 46 -------------------------
 3 files changed, 12 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 1bc13f6b161b..d37ddd7644f6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -281,8 +281,6 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object *obj,
 			     struct virtio_gpu_fence *fence);
-void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
-			      struct virtio_gpu_object *obj);
 int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
 int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 28a161af7503..bce2b3d843fe 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -23,6 +23,7 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/dma-mapping.h>
 #include <linux/moduleparam.h>
 
 #include "virtgpu_drv.h"
@@ -65,6 +66,17 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
+	if (bo->pages) {
+		if (bo->mapped) {
+			dma_unmap_sg(vgdev->vdev->dev.parent,
+				     bo->pages->sgl, bo->mapped,
+				     DMA_TO_DEVICE);
+			bo->mapped = 0;
+		}
+		sg_free_table(bo->pages);
+		bo->pages = NULL;
+		drm_gem_shmem_unpin(&bo->base.base);
+	}
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 	drm_gem_shmem_free_object(&bo->base.base);
 }
@@ -74,8 +86,6 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
-	if (bo->pages)
-		virtio_gpu_object_detach(vgdev, bo);
 	if (bo->created) {
 		virtio_gpu_cmd_unref_resource(vgdev, bo);
 		/* completion handler calls virtio_gpu_cleanup_object() */
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 4e22c3914f94..87c439156151 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -545,22 +545,6 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
-static void virtio_gpu_cmd_resource_inval_backing(struct virtio_gpu_device *vgdev,
-						  uint32_t resource_id,
-						  struct virtio_gpu_fence *fence)
-{
-	struct virtio_gpu_resource_detach_backing *cmd_p;
-	struct virtio_gpu_vbuffer *vbuf;
-
-	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
-	memset(cmd_p, 0, sizeof(*cmd_p));
-
-	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING);
-	cmd_p->resource_id = cpu_to_le32(resource_id);
-
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-}
-
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 				uint32_t scanout_id, uint32_t resource_id,
 				uint32_t width, uint32_t height,
@@ -1155,36 +1139,6 @@ int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
-void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
-			      struct virtio_gpu_object *obj)
-{
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
-
-	if (WARN_ON_ONCE(!obj->pages))
-		return;
-
-	if (use_dma_api && obj->mapped) {
-		struct virtio_gpu_fence *fence = virtio_gpu_fence_alloc(vgdev);
-		/* detach backing and wait for the host process it ... */
-		virtio_gpu_cmd_resource_inval_backing(vgdev, obj->hw_res_handle, fence);
-		dma_fence_wait(&fence->f, true);
-		dma_fence_put(&fence->f);
-
-		/* ... then tear down iommu mappings */
-		dma_unmap_sg(vgdev->vdev->dev.parent,
-			     obj->pages->sgl, obj->mapped,
-			     DMA_TO_DEVICE);
-		obj->mapped = 0;
-	} else {
-		virtio_gpu_cmd_resource_inval_backing(vgdev, obj->hw_res_handle, NULL);
-	}
-
-	sg_free_table(obj->pages);
-	obj->pages = NULL;
-
-	drm_gem_shmem_unpin(&obj->base.base);
-}
-
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output)
 {
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
