Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4053156111
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 23:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6CB6FDCE;
	Fri,  7 Feb 2020 22:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0BC6E129
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 22:14:06 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id z7so479398pgk.7
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 14:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ur/SzPw7VPp+Sa+NbQ1F+qItoizup1NgBtTWHGBliss=;
 b=lnQaTmPkTF07VABN5DeYMoE7tBzMmQ06awH2STNGjWvh4hzAMjPk7Um3Mn42zBDsQz
 9z50u29IJd1HvW5UfW+erknVPhLDwrOJPdM2k2MGg87JyQDeB2P9oj7YByRRNIs1CTDO
 oYjghMx1tfwt1/0Uk0A3tfy3A/PqEveqN3Zmo0lcahqsowvRjS678rEKNmnHTpqXdcqP
 L8mOgk+/x1tk3sdxOlVwxcbZnwxX/YgD/Q5meW6xEfhSSxUfMNLF9UxBHkAk0AxqOGyq
 DLnn5WF07RKG0KwTGv9T3ZgU+MJq6dd91BWMaJ6wsx8cIwiMR4gdqnp8aCjJo06Cbg1E
 qhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ur/SzPw7VPp+Sa+NbQ1F+qItoizup1NgBtTWHGBliss=;
 b=Ph6vkK/hNO1IP78JiKUxp//0Z/OlTgFKBzXmxUGwPSMxP0pZXNJSDvmJxixp5zZv8/
 MgwqgoCREPcCwbNrb3KmD5F4nkgSKGCo+90bXiLlgdLNroVj3G7beDO+qv8rlRuEAg26
 zs29neh+0yZgT+7XrTrKNOD1M0/roCo3a6+Zk84oMBDEaAKycfjxSEJ/RNaoW4ntX/Go
 E5N+FuJNE8XPb4CACCX+CJc2QQ03KxtJF7ZycWH6I4+qL+o3yNE6JzkalsKm0ZJB03x8
 UrfRUGVuIB8o70Z409HeaknVxKcQ3cyRIzVnNCUFjSt3OXsT8gwelGTKPORUGRyOLh68
 xMig==
X-Gm-Message-State: APjAAAUtZjD5n1x0jHvsf4an2pXIJyxGrR8O/P+DKZ0zhZo7NmRNKUL6
 gcOhkzZN1pe9CfQ75E+SA5+zKC1B
X-Google-Smtp-Source: APXvYqzKkjrRph2SqQ+rPy/sESNsoGIzbTKXvyIscKfs6ClKiUcwi/c8unypdRf8hwUwvc4aWV34xg==
X-Received: by 2002:a63:aa09:: with SMTP id e9mr1371686pgf.354.1581113645617; 
 Fri, 07 Feb 2020 14:14:05 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id t65sm3899043pfd.178.2020.02.07.14.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 14:14:04 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/virtio: never kick in virtio_gpu_queue_ctrl_sgs
Date: Fri,  7 Feb 2020 14:13:58 -0800
Message-Id: <20200207221359.187340-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207221359.187340-1-olvaffe@gmail.com>
References: <20200206192214.86818-1-olvaffe@gmail.com>
 <20200207221359.187340-1-olvaffe@gmail.com>
MIME-Version: 1.0
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio_gpu_queue_ctrl_sgs queues only.  virtio_gpu_commit_ctrl must
be explicitly called.  This however means that we need to grab the
spinlock twice.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0c9be2142ba1a..d76b24f2b2bff 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -367,13 +367,7 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
 
-	if (!vgdev->disable_notify)
-		notify = virtqueue_kick_prepare(vq);
-
 	spin_unlock(&vgdev->ctrlq.qlock);
-
-	if (notify)
-		virtqueue_notify(vq);
 }
 
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
@@ -434,6 +428,9 @@ static void virtio_gpu_commit_ctrl(struct virtio_gpu_device *vgdev)
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	bool notify;
 
+	if (vgdev->disable_notify)
+		return;
+
 	spin_lock(&vgdev->ctrlq.qlock);
 	notify = virtqueue_kick_prepare(vq);
 	spin_unlock(&vgdev->ctrlq.qlock);
@@ -525,6 +522,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->height = cpu_to_le32(params->height);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_commit_ctrl(vgdev);
 	bo->created = true;
 }
 
@@ -541,6 +539,7 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->resource_id = cpu_to_le32(resource_id);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 static void virtio_gpu_cmd_resource_inval_backing(struct virtio_gpu_device *vgdev,
@@ -557,6 +556,7 @@ static void virtio_gpu_cmd_resource_inval_backing(struct virtio_gpu_device *vgde
 	cmd_p->resource_id = cpu_to_le32(resource_id);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
@@ -579,6 +579,7 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
@@ -600,6 +601,7 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
@@ -632,6 +634,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 static void
@@ -655,6 +658,7 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	vbuf->data_size = sizeof(*ents) * nents;
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
@@ -787,6 +791,7 @@ int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 	vgdev->display_info_pending = true;
 	cmd_p->type = cpu_to_le32(VIRTIO_GPU_CMD_GET_DISPLAY_INFO);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 	return 0;
 }
 
@@ -810,6 +815,7 @@ int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx)
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_CAPSET_INFO);
 	cmd_p->capset_index = cpu_to_le32(idx);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 	return 0;
 }
 
@@ -885,6 +891,7 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 	cmd_p->capset_version = cpu_to_le32(version);
 	*cache_p = cache_ent;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 
 	return 0;
 }
@@ -912,6 +919,7 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
 		cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_EDID);
 		cmd_p->scanout = cpu_to_le32(scanout);
 		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+		virtio_gpu_commit_ctrl(vgdev);
 	}
 
 	return 0;
@@ -932,6 +940,7 @@ void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
 	strncpy(cmd_p->debug_name, name, sizeof(cmd_p->debug_name) - 1);
 	cmd_p->debug_name[sizeof(cmd_p->debug_name) - 1] = 0;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
@@ -946,6 +955,7 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DESTROY);
 	cmd_p->hdr.ctx_id = cpu_to_le32(id);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
@@ -964,7 +974,7 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
@@ -983,6 +993,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void
@@ -1014,6 +1025,7 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->flags = cpu_to_le32(params->flags);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_commit_ctrl(vgdev);
 	bo->created = true;
 }
 
@@ -1047,6 +1059,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
@@ -1073,6 +1086,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
@@ -1096,6 +1110,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 	cmd_p->size = cpu_to_le32(data_size);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
