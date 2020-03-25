Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC4192811
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 13:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3F16E848;
	Wed, 25 Mar 2020 12:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF62F6E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 10:41:06 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id ng8so867614pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0w5nM8eEqQa+r3KlscSzF1yUgJx8tEKgLzGL8Rz2s0c=;
 b=cQv7O1va/xcwK7waoRTXeVhcaoVWq8hoqVkL6LPFOmaBXH+Jcx6Al9s3vOweh9wfJ3
 0Yo8eflvHHdMQ8NqCZvE5sEO5fUj2qneXFO6UM4ZYsPFERzadTXE1scBIGUndu7hE9AB
 EUEuxkknO1/HEBYO2WEDvpi9o3y07FjqRmXts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0w5nM8eEqQa+r3KlscSzF1yUgJx8tEKgLzGL8Rz2s0c=;
 b=dQke9EFmtTb/OOjAX3rN+kChzx2e9Ja/316gFG7DVyQXP1gSwZz89pGp5WbhXsHwYa
 KjJgoirhuQH+7rAn+N2foCgfhSCC0+6ZvMATWP9gOjcQDRS/4AOClYlx0phT83Zngu3A
 YEOzqrVoqVQ0c7m3DX0UMBr9xiKWoUDSx/MbjHSEllozP1ok9JnuX1rceFyHpIYb/kr7
 1Ve80zeYafvGwpHEXNN2d72yzvCmKwyhYmqVqtUFa27K7fWiMBTbYMp0u+4wxRdnrDno
 Yifs/dmFODZWZej/zg7vzQYzbu3Ge8r2AReNq8utuv0mBT08Gc2ww3cHZMroA/jHTNml
 /65A==
X-Gm-Message-State: ANhLgQ1CXxa/j4nZg1rrTRHDRv6xvDF5ycp8FoTeCA8Np4iEWLgyZJBB
 JpJDS6zh3DkW0AKRdXMvl34nTA==
X-Google-Smtp-Source: ADFU+vtpgOPhDFufb83T8XOKlz0DNGzZV4YgUxIRZNF/9L2mB+aQZoPRmc8JxyykyPk7MxVy2t7DMA==
X-Received: by 2002:a17:90a:af81:: with SMTP id
 w1mr3017572pjq.14.1585132866277; 
 Wed, 25 Mar 2020 03:41:06 -0700 (PDT)
Received: from keiichiw1.tok.corp.google.com
 ([2401:fa00:8f:203:863a:e217:a16c:53f2])
 by smtp.gmail.com with ESMTPSA id v26sm5150320pfn.51.2020.03.25.03.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:41:05 -0700 (PDT)
From: Keiichi Watanabe <keiichiw@chromium.org>
To: virtio-dev@lists.oasis-open.org,
	linux-media@vger.kernel.org
Subject: [PATCH RFC 1/1] drivers: media: virtio: Support virtio objects in
 virtio-video driver
Date: Wed, 25 Mar 2020 19:40:39 +0900
Message-Id: <20200325104039.196058-2-keiichiw@chromium.org>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
In-Reply-To: <20200325104039.196058-1-keiichiw@chromium.org>
References: <20200325104039.196058-1-keiichiw@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Mar 2020 12:19:30 +0000
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
Cc: Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
 linaro-mm-sig@lists.linaro.org, alexlau@chromium.org, tfiga@chromium.org,
 Kiran Pawar <Kiran.Pawar@opensynergy.com>, acourbot@chromium.org,
 "Michael S . Tsirkin" <mst@redhat.com>, egranata@google.com,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>,
 Keiichi Watanabe <keiichiw@chromium.org>, kraxel@redhat.com,
 hverkuil@xs4all.nl, Dmitry Sepp <dmitry.sepp@opensynergy.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 virtualization@lists.linux-foundation.org, posciak@chromium.org,
 stevensd@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch makes the virtio-video driver use virtio objects as DMA buffers.
So, users will beable to import resources exported by other virtio devices
such as virtio-gpu.

Currently, we assumes that only one virtio object for each v4l2_buffer
format even if it's for a multiplanar format.

Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
---
 drivers/media/virtio/virtio_video.h        |  26 +++-
 drivers/media/virtio/virtio_video_dec.c    |   1 +
 drivers/media/virtio/virtio_video_device.c | 131 ++++++++++++++++++++-
 drivers/media/virtio/virtio_video_driver.c |  25 +++-
 drivers/media/virtio/virtio_video_vq.c     |  81 ++++++++++---
 include/uapi/linux/virtio_video.h          |  15 ++-
 6 files changed, 243 insertions(+), 36 deletions(-)

diff --git a/drivers/media/virtio/virtio_video.h b/drivers/media/virtio/virtio_video.h
index c5a5704326c0..b74e5a06753f 100644
--- a/drivers/media/virtio/virtio_video.h
+++ b/drivers/media/virtio/virtio_video.h
@@ -25,6 +25,7 @@
 #include <linux/virtio_config.h>
 #include <linux/virtio_video.h>
 #include <linux/list.h>
+#include <media/videobuf2-core.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ctrls.h>
@@ -123,10 +124,17 @@ struct virtio_video_queue {
 	struct work_struct dequeue_work;
 };

+enum virtio_video_resource_type {
+	RESOURCE_TYPE_GUEST_PAGES = 0,
+	RESOURCE_TYPE_VIRTIO_OBJECT,
+};
+
 struct virtio_video {
 	struct v4l2_device v4l2_dev;
 	int instance;

+	enum virtio_video_resource_type res_type;
+
 	struct virtio_device *vdev;
 	struct virtio_video_queue commandq;
 	struct virtio_video_queue eventq;
@@ -207,6 +215,9 @@ struct virtio_video_buffer {
 	struct v4l2_m2m_buffer v4l2_m2m_vb;
 	uint32_t resource_id;
 	bool queued;
+
+	/* Only for virtio object buffer */
+	uuid_t uuid;
 };

 static inline gfp_t
@@ -300,12 +311,14 @@ int virtio_video_cmd_stream_create(struct virtio_video *vv, uint32_t stream_id,
 int virtio_video_cmd_stream_destroy(struct virtio_video *vv,
 				    uint32_t stream_id);
 int virtio_video_cmd_stream_drain(struct virtio_video *vv, uint32_t stream_id);
-int virtio_video_cmd_resource_create(struct virtio_video *vv,
-				     uint32_t stream_id, uint32_t resource_id,
-				     uint32_t queue_type,
-				     struct virtio_video_mem_entry *ents,
-				    unsigned int num_planes,
-				     unsigned int *num_entry);
+int virtio_video_cmd_resource_create_page(
+	struct virtio_video *vv, uint32_t stream_id, uint32_t resource_id,
+	uint32_t queue_type, unsigned int num_planes, unsigned int *num_entries,
+	struct virtio_video_mem_entry *ents);
+int virtio_video_cmd_resource_create_object(
+	struct virtio_video *vv, uint32_t stream_id, uint32_t resource_id,
+	uint32_t queue_type, unsigned int num_planes, struct vb2_plane *planes,
+	struct virtio_video_object_entry *ents);
 int virtio_video_cmd_resource_destroy_all(struct virtio_video *vv,
 					  struct virtio_video_stream *stream,
 					  uint32_t queue_type);
@@ -354,6 +367,7 @@ void virtio_video_mark_drain_complete(struct virtio_video_stream *stream,
 int virtio_video_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
 			     unsigned int *num_planes, unsigned int sizes[],
 			     struct device *alloc_devs[]);
+int virtio_video_buf_prepare(struct vb2_buffer *vb);
 int virtio_video_buf_init(struct vb2_buffer *vb);
 void virtio_video_buf_cleanup(struct vb2_buffer *vb);
 int virtio_video_querycap(struct file *file, void *fh,
diff --git a/drivers/media/virtio/virtio_video_dec.c b/drivers/media/virtio/virtio_video_dec.c
index 4b85337bb9f3..5d763191f436 100644
--- a/drivers/media/virtio/virtio_video_dec.c
+++ b/drivers/media/virtio/virtio_video_dec.c
@@ -122,6 +122,7 @@ static void virtio_video_dec_stop_streaming(struct vb2_queue *vq)
 static const struct vb2_ops virtio_video_dec_qops = {
 	.queue_setup	 = virtio_video_queue_setup,
 	.buf_init	 = virtio_video_buf_init,
+	.buf_prepare	 = virtio_video_buf_prepare,
 	.buf_cleanup	 = virtio_video_buf_cleanup,
 	.buf_queue	 = virtio_video_dec_buf_queue,
 	.start_streaming = virtio_video_dec_start_streaming,
diff --git a/drivers/media/virtio/virtio_video_device.c b/drivers/media/virtio/virtio_video_device.c
index 8e6bc317339b..e91107082d97 100644
--- a/drivers/media/virtio/virtio_video_device.c
+++ b/drivers/media/virtio/virtio_video_device.c
@@ -17,6 +17,7 @@
  * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */

+#include <linux/dma-buf.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-sg.h>
@@ -49,7 +50,47 @@ int virtio_video_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
 	return 0;
 }

-int virtio_video_buf_init(struct vb2_buffer *vb)
+static int virtio_video_get_dma_buf_id(struct virtio_video_device *vvd,
+			  struct vb2_buffer *vb, uuid_t *uuid)
+{
+	/**
+	 * For multiplanar formats, we assume all planes are on one DMA buffer.
+	 */
+	struct dma_buf *dma_buf = dma_buf_get(vb->planes[0].m.fd);
+
+	return dma_buf_get_uuid(dma_buf, uuid);
+}
+
+static int virtio_video_send_resource_create_object(struct vb2_buffer *vb,
+						    uint32_t resource_id,
+						    uuid_t uuid)
+{
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video *vv = to_virtio_vd(stream->video_dev)->vv;
+	struct virtio_video_object_entry *ent;
+	int queue_type;
+	int ret;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+		queue_type = VIRTIO_VIDEO_QUEUE_TYPE_INPUT;
+	else
+		queue_type = VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT;
+
+	ent = kcalloc(1, sizeof(*ent), GFP_KERNEL);
+	uuid_copy((uuid_t *) &ent->uuid, &uuid);
+
+	ret = virtio_video_cmd_resource_create_object(vv, stream->stream_id,
+						      resource_id,
+						      queue_type,
+						      vb->num_planes,
+						      vb->planes, ent);
+	if (ret)
+		kfree(ent);
+
+	return ret;
+}
+
+static int virtio_video_buf_init_guest_pages(struct vb2_buffer *vb)
 {
 	int ret = 0;
 	unsigned int i, j;
@@ -109,11 +150,10 @@ int virtio_video_buf_init(struct vb2_buffer *vb)
 					ents[i].addr, ents[i].length);
 	}

-	ret = virtio_video_cmd_resource_create(vv, stream->stream_id,
-					       resource_id,
-					       to_virtio_queue_type(queue_type),
-					       ents, vb->num_planes,
-					       num_ents);
+	ret = virtio_video_cmd_resource_create_page(
+		vv, stream->stream_id, resource_id,
+		to_virtio_queue_type(queue_type), vb->num_planes, num_ents,
+		ents);
 	if (ret) {
 		virtio_video_resource_id_put(vvd->vv, resource_id);
 		kfree(ents);
@@ -127,6 +167,85 @@ int virtio_video_buf_init(struct vb2_buffer *vb)
 	return 0;
 }

+static int virtio_video_buf_init_virtio_object(struct vb2_buffer *vb)
+{
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	int ret;
+	uint32_t resource_id;
+	uuid_t uuid;
+
+	ret = virtio_video_get_dma_buf_id(vvd, vb, &uuid);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to get DMA-buf handle");
+		return ret;
+	}
+	virtio_video_resource_id_get(vv, &resource_id);
+
+	ret = virtio_video_send_resource_create_object(vb, resource_id, uuid);
+	if (ret) {
+		virtio_video_resource_id_put(vv, resource_id);
+		return ret;
+	}
+
+	virtio_vb->queued = false;
+	virtio_vb->resource_id = resource_id;
+	virtio_vb->uuid = uuid;
+
+	return 0;
+}
+
+int virtio_video_buf_init(struct vb2_buffer *vb)
+{
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+
+	switch (vv->res_type) {
+	case RESOURCE_TYPE_GUEST_PAGES:
+		return virtio_video_buf_init_guest_pages(vb);
+	case RESOURCE_TYPE_VIRTIO_OBJECT:
+		return virtio_video_buf_init_virtio_object(vb);
+	default:
+		return -EINVAL;
+	}
+}
+
+int virtio_video_buf_prepare(struct vb2_buffer *vb)
+{
+	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
+	struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
+	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
+	struct virtio_video *vv = vvd->vv;
+	uuid_t uuid;
+	int ret;
+
+	if (vv->res_type != RESOURCE_TYPE_VIRTIO_OBJECT)
+		return 0;
+
+	ret = virtio_video_get_dma_buf_id(vvd, vb, &uuid);
+	if (ret) {
+		v4l2_err(&vv->v4l2_dev, "failed to get DMA-buf handle");
+		return ret;
+	}
+
+	/**
+	 * If a user gave a different object as a buffer from the previous
+	 * one, send RESOURCE_CREATE again to register the object.
+	 */
+	if (!uuid_equal(&uuid, &virtio_vb->uuid)) {
+		ret = virtio_video_send_resource_create_object(
+			vb, virtio_vb->resource_id, uuid);
+		if (ret)
+			return ret;
+		virtio_vb->uuid = uuid;
+	}
+
+	return ret;
+}
+
 void virtio_video_buf_cleanup(struct vb2_buffer *vb)
 {
 	struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
diff --git a/drivers/media/virtio/virtio_video_driver.c b/drivers/media/virtio/virtio_video_driver.c
index 2d4fd7671f4f..f01b744587c8 100644
--- a/drivers/media/virtio/virtio_video_driver.c
+++ b/drivers/media/virtio/virtio_video_driver.c
@@ -171,16 +171,27 @@ static int virtio_video_probe(struct virtio_device *vdev)
 		virtio_video_cmd_ack,
 		virtio_video_event_ack
 	};
-
-	if (!virtio_has_feature(vdev, VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES)) {
-		dev_err(dev, "device must support guest allocated buffers\n");
-		return -ENODEV;
-	}
-
 	vv = devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
 	if (!vv)
 		return -ENOMEM;

+	/**
+	 * RESOURCE_GUEST_PAGES is prioritized when both resource type is
+	 * supported.
+	 * TODO: Can we provide users with a way of specifying a
+	 *  resource type when both are supported?
+	 */
+	if (virtio_has_feature(vdev, VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES)) {
+		vv->res_type = RESOURCE_TYPE_GUEST_PAGES;
+	} else if (virtio_has_feature(vdev,
+				      VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT)) {
+		vv->res_type = RESOURCE_TYPE_VIRTIO_OBJECT;
+	} else {
+		dev_err(dev, "device must support guest allocated buffers or virtio objects\n");
+		ret = -ENODEV;
+		goto err_res_type;
+	}
+
 	vv->vdev = vdev;
 	vv->debug = debug;
 	vv->use_dma_mem = use_dma_mem;
@@ -267,6 +278,7 @@ static int virtio_video_probe(struct virtio_device *vdev)
 err_vqs:
 	v4l2_device_unregister(&vv->v4l2_dev);
 err_v4l2_reg:
+err_res_type:
 	devm_kfree(&vdev->dev, vv);

 	return ret;
@@ -292,6 +304,7 @@ static struct virtio_device_id id_table[] = {
 static unsigned int features[] = {
 	VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES,
 	VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG,
+	VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT,
 };

 static struct virtio_driver virtio_video_driver = {
diff --git a/drivers/media/virtio/virtio_video_vq.c b/drivers/media/virtio/virtio_video_vq.c
index 4679e6b49cf3..dc5e1b7a320e 100644
--- a/drivers/media/virtio/virtio_video_vq.c
+++ b/drivers/media/virtio/virtio_video_vq.c
@@ -411,6 +411,18 @@ int virtio_video_cmd_stream_create(struct virtio_video *vv, uint32_t stream_id,
 {
 	struct virtio_video_stream_create *req_p;
 	struct virtio_video_vbuffer *vbuf;
+	int resource_type;
+
+	switch (vv->res_type) {
+	case RESOURCE_TYPE_GUEST_PAGES:
+		resource_type = VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES;
+		break;
+	case RESOURCE_TYPE_VIRTIO_OBJECT:
+		resource_type = VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT;
+		break;
+	default:
+		return -EINVAL;
+	}

 	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
 	if (IS_ERR(req_p))
@@ -418,9 +430,10 @@ int virtio_video_cmd_stream_create(struct virtio_video *vv, uint32_t stream_id,

 	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_STREAM_CREATE);
 	req_p->hdr.stream_id = cpu_to_le32(stream_id);
-	req_p->in_mem_type = cpu_to_le32(VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES);
-	req_p->out_mem_type = cpu_to_le32(VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES);
 	req_p->coded_format = cpu_to_le32(format);
+	req_p->in_mem_type = cpu_to_le32(resource_type);
+	req_p->out_mem_type = cpu_to_le32(resource_type);
+
 	strncpy(req_p->tag, tag, sizeof(req_p->tag) - 1);
 	req_p->tag[sizeof(req_p->tag) - 1] = 0;

@@ -457,30 +470,38 @@ int virtio_video_cmd_stream_drain(struct virtio_video *vv, uint32_t stream_id)
 	return virtio_video_queue_cmd_buffer(vv, vbuf);
 }

-int virtio_video_cmd_resource_create(struct virtio_video *vv,
-				     uint32_t stream_id, uint32_t resource_id,
-				     uint32_t queue_type,
-				     struct virtio_video_mem_entry *ents,
-				     unsigned int num_planes,
-				     unsigned int *num_entry)
+static void virtio_video_cmd_resource_create_core(
+	struct virtio_video *vv, struct virtio_video_resource_create *req_p,
+	uint32_t stream_id, uint32_t resource_id, uint32_t queue_type,
+	unsigned int num_planes)
+{
+	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_RESOURCE_CREATE);
+	req_p->hdr.stream_id = cpu_to_le32(stream_id);
+	req_p->resource_id = cpu_to_le32(resource_id);
+	req_p->queue_type = cpu_to_le32(queue_type);
+	req_p->num_planes = cpu_to_le32(num_planes);
+}
+
+int virtio_video_cmd_resource_create_page(
+	struct virtio_video *vv, uint32_t stream_id, uint32_t resource_id,
+	uint32_t queue_type, unsigned int num_planes, unsigned int *num_entries,
+	struct virtio_video_mem_entry *ents)
 {
-	unsigned int i = 0, nents = 0;
 	struct virtio_video_resource_create *req_p;
 	struct virtio_video_vbuffer *vbuf;
+	unsigned int nents = 0;
+	int i;

 	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
 	if (IS_ERR(req_p))
 		return PTR_ERR(req_p);

-	req_p->hdr.type = cpu_to_le32(VIRTIO_VIDEO_CMD_RESOURCE_CREATE);
-	req_p->hdr.stream_id = cpu_to_le32(stream_id);
-	req_p->resource_id = cpu_to_le32(resource_id);
-	req_p->queue_type = cpu_to_le32(queue_type);
-	 req_p->num_planes = cpu_to_le32(num_planes);
+	virtio_video_cmd_resource_create_core(vv, req_p, stream_id, resource_id,
+					      queue_type, num_planes);

 	for (i = 0; i < num_planes; i++) {
-		nents += num_entry[i];
-		req_p->num_entries[i] = cpu_to_le32(num_entry[i]);
+		nents += num_entries[i];
+		req_p->num_entries[i] = cpu_to_le32(num_entries[i]);
 	}

 	vbuf->data_buf = ents;
@@ -489,6 +510,33 @@ int virtio_video_cmd_resource_create(struct virtio_video *vv,
 	return virtio_video_queue_cmd_buffer(vv, vbuf);
 }

+int virtio_video_cmd_resource_create_object(
+	struct virtio_video *vv, uint32_t stream_id, uint32_t resource_id,
+	uint32_t queue_type, unsigned int num_planes, struct vb2_plane *planes,
+	struct virtio_video_object_entry *ents)
+{
+	struct virtio_video_resource_create *req_p;
+	struct virtio_video_vbuffer *vbuf;
+	int i;
+
+	req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
+	if (IS_ERR(req_p))
+		return PTR_ERR(req_p);
+
+	virtio_video_cmd_resource_create_core(vv, req_p, stream_id, resource_id,
+					      queue_type, num_planes);
+
+	req_p->planes_layout =
+		cpu_to_le32(VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER);
+	for (i = 0; i < num_planes; i++)
+		req_p->plane_offsets[i] = planes[i].data_offset;
+
+	vbuf->data_buf = ents;
+	vbuf->data_size = sizeof(*ents);
+
+	return virtio_video_queue_cmd_buffer(vv, vbuf);
+}
+
 int virtio_video_cmd_resource_destroy_all(struct virtio_video *vv,
 					  struct virtio_video_stream *stream,
 					  enum virtio_video_queue_type qtype)
@@ -1009,4 +1057,3 @@ int virtio_video_cmd_set_control(struct virtio_video *vv, uint32_t stream_id,

 	return virtio_video_queue_cmd_buffer(vv, vbuf);
 }
-
diff --git a/include/uapi/linux/virtio_video.h b/include/uapi/linux/virtio_video.h
index 0dd98a2237c6..f7b3f94f9dbb 100644
--- a/include/uapi/linux/virtio_video.h
+++ b/include/uapi/linux/virtio_video.h
@@ -49,6 +49,8 @@
  * scatter-gather lists.
  */
 #define VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG 1
+/* Objects exported by another virtio device can be used for video buffers */
+#define VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT 2

 /*
  * Image formats
@@ -240,6 +242,7 @@ struct virtio_video_query_capability_resp {
 /* VIRTIO_VIDEO_CMD_STREAM_CREATE */
 enum virtio_video_mem_type {
 	VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES,
+	VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT,
 };

 struct virtio_video_stream_create {
@@ -268,6 +271,10 @@ struct virtio_video_mem_entry {
 	__u8 padding[4];
 };

+struct virtio_video_object_entry {
+	__u8 uuid[16];
+};
+
 #define VIRTIO_VIDEO_MAX_PLANES 8

 struct virtio_video_resource_create {
@@ -278,7 +285,13 @@ struct virtio_video_resource_create {
 	__le32 num_planes;
 	__le32 plane_offsets[VIRTIO_VIDEO_MAX_PLANES];
 	__le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
-	/* Followed by struct virtio_video_mem_entry entries[] */
+	/**
+	 * Followed by either
+	 * - struct virtio_video_mem_entry entries[]
+	 *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
+	 * - struct virtio_video_object_entry entries[]
+	 *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT
+	 */
 };

 /* VIRTIO_VIDEO_CMD_RESOURCE_QUEUE */
--
2.25.1.696.g5e7596f4ac-goog
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
