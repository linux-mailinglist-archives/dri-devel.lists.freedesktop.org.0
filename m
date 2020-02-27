Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9E170D2C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6D36EBE1;
	Thu, 27 Feb 2020 00:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE876EBE1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:15 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id o24so345754pfp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9JwTG81Fxhynp2yLXNsAT5qck0+NMrQPvNxIskj61T4=;
 b=og0p/ivDO1NGeESeOqbHlMzLNkCcevZA29jmX0MsIy1u72+cMlvQz6s+39l0PBq1h/
 Lg+4AO3yGkaC0lMkuL4s7PeArDIlNGnMHK0Sc4CNIzoGg5ChqTmrrFAeGWF3InzELZ7z
 IoxJjBeiYiL5UrZ2hDmjtSt4nqfwUvydbVrVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JwTG81Fxhynp2yLXNsAT5qck0+NMrQPvNxIskj61T4=;
 b=AReYLL/Jf1WTkYzTlkULHgkUf66TKD4zACuDEGNixAGnaB2YekwdAB/Ahz3uWsTo8T
 hFx/4ixQwXi+1XN83PYCDiTcKfXI0p57VhDN7MEHd5fSW0vyI342vqF7Mbu+zKeKoDkY
 c6mdjD/X4jTSXxMdd4hVraSbmXkpbhxLuN7ksBaDXST7lQmWWo9H8xLKiAVcuvf0qR+i
 lPNcFQybg7c72opBgeimdFYBlRZwwsFSj1tpwDlgc3T3n8w3idPvZOLIxt1C49cV8wjo
 MFS0hNFriJ8K++WFSsN/ACuwIV74GN3t93Ie/oUy+xmyNycGwFoXrwX7Qjc+R78OsuMQ
 ZI1Q==
X-Gm-Message-State: APjAAAVFE6tljUFHLqc/lOgWRGh5H3BT9ilZVBK1LjnZW8Y6KDdMzjBQ
 TKSpYWxTT2kSVosCFbNF3JiyweUXqrc=
X-Google-Smtp-Source: APXvYqy2H+5P5stXrLb0Hw9J2HeSvL0MrRCiUfPD67Dr3TBdSnAJou2eizPV96j2Pr3OecE4iv7FCA==
X-Received: by 2002:a62:17c4:: with SMTP id 187mr1378488pfx.9.1582763174767;
 Wed, 26 Feb 2020 16:26:14 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:14 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 5/8] drm/virtio: make {ATTACH_RESOURCE,
 DETACH_RESOURCE} use virtio_gpu_get_handle(..)
Date: Wed, 26 Feb 2020 16:25:58 -0800
Message-Id: <20200227002601.745-6-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227002601.745-1-gurchetansingh@chromium.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These hypercalls are reusable by both shmem and (planned) vram
based virtio_gpu objects.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index feceda66da75..14e64c20eda4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -944,7 +944,7 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
 					    struct virtio_gpu_object_array *objs)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	uint32_t handle = virtio_gpu_get_handle(objs->objs[0]);
 	struct virtio_gpu_ctx_resource *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
@@ -954,7 +954,7 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->resource_id = cpu_to_le32(handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
@@ -962,7 +962,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 					    uint32_t ctx_id,
 					    struct virtio_gpu_object_array *objs)
 {
-	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	uint32_t handle = virtio_gpu_get_handle(objs->objs[0]);
 	struct virtio_gpu_ctx_resource *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
@@ -972,7 +972,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DETACH_RESOURCE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->resource_id = cpu_to_le32(handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
