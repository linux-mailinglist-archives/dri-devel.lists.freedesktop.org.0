Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E615763CC3D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 01:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BD210E3ED;
	Wed, 30 Nov 2022 00:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615A910E3ED
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 00:08:44 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id w129so15291120pfb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 16:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1uNcYpPMrI5BUKS+4cI51gDVBMIA/yEg/AUAY95wTKw=;
 b=e/AzuKdsYAHWb3FkvHU4t2hkVxTQgkWyNmOJcccAWQKcQNHjzJPNvB3Cnkq5ORn7v1
 OsHP3UW2UdgIK3u6lfFonG9+MPSdES8+DKsxsJPDdmjmHwN6YlezNNl7FvGJAi8fMrZn
 4fJdUwmF2yZArXNGkx+dWVyyK3xIOBDOzhL5Ew3IMw4uEHbVj2zk7Z13XXR3bEfkorbp
 qQDO9pjAjjvgEVIuu8rcP3lfePEHPerKjqj81D3U8onXLsYHRz83qDSCS14MLk2AKWOW
 bviWwz9juRxi2LQopPz3D3oAFbJnPjsNq0Ulu+AwV5JXmvYfPF8FtdDda6iSN+vZYyH3
 NR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1uNcYpPMrI5BUKS+4cI51gDVBMIA/yEg/AUAY95wTKw=;
 b=F46CzqgOlaCQg497jSHnzjm1UY2VKlRUeKnv+8DPwq37EihO8y+hOOMdWONnXWG7N6
 upxwHQol9G9xkc79JvlbHg3AhmKNuoxx1DrCrsC1cKNFJiGScMXHqghiDlPyAkexUvEg
 7moEqO2Clb8j0iQ5z6ws2tMaC6S4cClj68QHR4z0jp8AjlSC9FRj5h7DiOk1o3YJkivM
 yBy3I2wSZ/Ca83emSixnrpHwbCyIlu5IeqFKZU9kOBke4dChJePQ8mATNa9PNVZ6JuxB
 FH1kk+VF93KYspV1hCWhb3+LBg/J4ANdhP6+URlUssURbr5l3Xln5pEmBNMBUO8vFydD
 syJg==
X-Gm-Message-State: ANoB5plFxb+lg+Zq8alA4pbDqGGfMKedAKzqkxDdhYs9Tpphconb3Opk
 kySkKmS2iuR0k57Bk7+a2q4/omtTWzY=
X-Google-Smtp-Source: AA0mqf6wrXy3pUVubbhsCKYanMOJSCDsa/HXBw7jsyjID2CJl9LuFqBBXRKBhg86aaf6OtYN8bcpSA==
X-Received: by 2002:a05:6a00:1812:b0:575:19b6:dfe9 with SMTP id
 y18-20020a056a00181200b0057519b6dfe9mr14574544pfa.16.1669766923741; 
 Tue, 29 Nov 2022 16:08:43 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020aa78f08000000b005745eb7ecc3sm38261pfr.209.2022.11.29.16.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 16:08:43 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/virtio: Spiff out cmd queue/response traces
Date: Tue, 29 Nov 2022 16:08:41 -0800
Message-Id: <20221130000841.318037-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a sequence # for more easily matching up cmd/resp, and the # of free
slots in the virtqueue to more easily see starvation issues.

v2: Fix handling of string fields as well

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
 drivers/gpu/drm/virtio/virtgpu_trace.h | 26 +++++++++++++++-----------
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 13 ++++++++++---
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9b98470593b0..cdc208d9238c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -166,6 +166,8 @@ struct virtio_gpu_vbuffer {
 
 	struct virtio_gpu_object_array *objs;
 	struct list_head list;
+
+	uint32_t seqno;
 };
 
 struct virtio_gpu_output {
@@ -195,6 +197,7 @@ struct virtio_gpu_queue {
 	spinlock_t qlock;
 	wait_queue_head_t ack_queue;
 	struct work_struct dequeue_work;
+	uint32_t seqno;
 };
 
 struct virtio_gpu_drv_capset {
diff --git a/drivers/gpu/drm/virtio/virtgpu_trace.h b/drivers/gpu/drm/virtio/virtgpu_trace.h
index 711ecc2bd241..031bc77689d5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_trace.h
+++ b/drivers/gpu/drm/virtio/virtgpu_trace.h
@@ -9,40 +9,44 @@
 #define TRACE_INCLUDE_FILE virtgpu_trace
 
 DECLARE_EVENT_CLASS(virtio_gpu_cmd,
-	TP_PROTO(struct virtqueue *vq, struct virtio_gpu_ctrl_hdr *hdr),
-	TP_ARGS(vq, hdr),
+	TP_PROTO(struct virtqueue *vq, struct virtio_gpu_ctrl_hdr *hdr, u32 seqno),
+	TP_ARGS(vq, hdr, seqno),
 	TP_STRUCT__entry(
 			 __field(int, dev)
 			 __field(unsigned int, vq)
-			 __field(const char *, name)
+			 __string(name, vq->name)
 			 __field(u32, type)
 			 __field(u32, flags)
 			 __field(u64, fence_id)
 			 __field(u32, ctx_id)
+			 __field(u32, num_free)
+			 __field(u32, seqno)
 			 ),
 	TP_fast_assign(
 		       __entry->dev = vq->vdev->index;
 		       __entry->vq = vq->index;
-		       __entry->name = vq->name;
+		       __assign_str(name, vq->name);
 		       __entry->type = le32_to_cpu(hdr->type);
 		       __entry->flags = le32_to_cpu(hdr->flags);
 		       __entry->fence_id = le64_to_cpu(hdr->fence_id);
 		       __entry->ctx_id = le32_to_cpu(hdr->ctx_id);
+		       __entry->num_free = vq->num_free;
+		       __entry->seqno = seqno;
 		       ),
-	TP_printk("vdev=%d vq=%u name=%s type=0x%x flags=0x%x fence_id=%llu ctx_id=%u",
-		  __entry->dev, __entry->vq, __entry->name,
+	TP_printk("vdev=%d vq=%u name=%s type=0x%x flags=0x%x fence_id=%llu ctx_id=%u num_free=%u seqno=%u",
+		  __entry->dev, __entry->vq, __get_str(name),
 		  __entry->type, __entry->flags, __entry->fence_id,
-		  __entry->ctx_id)
+		  __entry->ctx_id, __entry->num_free, __entry->seqno)
 );
 
 DEFINE_EVENT(virtio_gpu_cmd, virtio_gpu_cmd_queue,
-	TP_PROTO(struct virtqueue *vq, struct virtio_gpu_ctrl_hdr *hdr),
-	TP_ARGS(vq, hdr)
+	TP_PROTO(struct virtqueue *vq, struct virtio_gpu_ctrl_hdr *hdr, u32 seqno),
+	TP_ARGS(vq, hdr, seqno)
 );
 
 DEFINE_EVENT(virtio_gpu_cmd, virtio_gpu_cmd_response,
-	TP_PROTO(struct virtqueue *vq, struct virtio_gpu_ctrl_hdr *hdr),
-	TP_ARGS(vq, hdr)
+	TP_PROTO(struct virtqueue *vq, struct virtio_gpu_ctrl_hdr *hdr, u32 seqno),
+	TP_ARGS(vq, hdr, seqno)
 );
 
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9ff8660b50ad..a04a9b20896d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -215,7 +215,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 	list_for_each_entry(entry, &reclaim_list, list) {
 		resp = (struct virtio_gpu_ctrl_hdr *)entry->resp_buf;
 
-		trace_virtio_gpu_cmd_response(vgdev->ctrlq.vq, resp);
+		trace_virtio_gpu_cmd_response(vgdev->ctrlq.vq, resp, entry->seqno);
 
 		if (resp->type != cpu_to_le32(VIRTIO_GPU_RESP_OK_NODATA)) {
 			if (le32_to_cpu(resp->type) >= VIRTIO_GPU_RESP_ERR_UNSPEC) {
@@ -261,6 +261,10 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
 	spin_unlock(&vgdev->cursorq.qlock);
 
 	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
+		struct virtio_gpu_ctrl_hdr *resp =
+			(struct virtio_gpu_ctrl_hdr *)entry->resp_buf;
+
+		trace_virtio_gpu_cmd_response(vgdev->cursorq.vq, resp, entry->seqno);
 		list_del(&entry->list);
 		free_vbuf(vgdev, entry);
 	}
@@ -353,7 +357,8 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
 	WARN_ON(ret);
 
-	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
+	vbuf->seqno = ++vgdev->ctrlq.seqno;
+	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
 
 	atomic_inc(&vgdev->pending_commands);
 
@@ -465,8 +470,10 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 		spin_lock(&vgdev->cursorq.qlock);
 		goto retry;
 	} else {
+		vbuf->seqno = ++vgdev->cursorq.seqno;
 		trace_virtio_gpu_cmd_queue(vq,
-			virtio_gpu_vbuf_ctrl_hdr(vbuf));
+			virtio_gpu_vbuf_ctrl_hdr(vbuf),
+			vbuf->seqno);
 
 		notify = virtqueue_kick_prepare(vq);
 	}
-- 
2.38.1

