Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424D15376C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D006F91C;
	Wed,  5 Feb 2020 18:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22496F91B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:12 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id p14so1630748pfn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nuDRUYblmVNgz6OAds6obhdyd2/H8B/Wptu9R/XCM90=;
 b=fiYk8LIizlKW0OuZpLkGKArjUW12ALV3fM/0XswaM9NclH5ZJmuCBdQ+JfecwV7NTC
 0UrbSz+X128Aqd4SxdCf9PEmuaHalEqhoWLnL5MqmdGU+vYCqg5wlYxVnWVkt1oWLnvV
 Mp0zEnk58DTvG5XJkv8xhVsAAsT0fedxTUrSo7onWLW9ybkLGvcSUb51CS7X/f7qAMY2
 8NtdofXXFqgScXyUTz5CsONTbQggy5nUKD8++6IvK1PIO55nXzzyih7oBkNbxL+H8TRm
 zEwvqkOPgOvYXtnutM3LAemLtAqB2Dlx3QrdMyplYZ4N+jvJklGK4PXMvPE9IrXj8HIV
 NuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuDRUYblmVNgz6OAds6obhdyd2/H8B/Wptu9R/XCM90=;
 b=J7HYR+cXv36aItqFG4kPfYvmIDj61dd0qspUMNF/hqouxwqSBEIg17JimQl9c3TA9o
 2/f/9pITVPzA5OWewHZgUkG9uadm0Acdc2/b9I6YBArCkpkUkKWk5PDv0lvz59CDU4lQ
 8573ZEI+wN4RsjTc7xTyZ07zAY/2B46mI1G5ohDHYHj80meXzUVQoxBesqvm5pZ6GWvy
 xLyBSIIBPPHWBi8lfvSaPSlsPgvHwhwk9NWTsagYSb/4YdZ8DfFlR34bwgw/QY0w3fgq
 WoEiFDEv3z0gOVztf3aSWEpfY5S06gPmETzrwQSOg6r1+7EZWJT6VBCzC3GTSDlotz72
 43hw==
X-Gm-Message-State: APjAAAURGJESkexuiECabzUyvO00dxSQfGygZL51h7MbZWm+PjYuYLl4
 8ZttJF2MmfXXZQdXxddsI+3aYsow
X-Google-Smtp-Source: APXvYqwZGkc+1TAIQT2uWZ7JOYju33UboZ5hvnCyU5wBUoU7uJbdKULZURFawwSndZmHTJb8/1b2cg==
X-Received: by 2002:a63:e007:: with SMTP id e7mr6778394pgh.414.1580926812023; 
 Wed, 05 Feb 2020 10:20:12 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:11 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/11] drm/virtio: add virtio_gpu_vbuf_ctrl_hdr
Date: Wed,  5 Feb 2020 10:19:47 -0800
Message-Id: <20200205181955.202485-4-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205181955.202485-1-olvaffe@gmail.com>
References: <20200205181955.202485-1-olvaffe@gmail.com>
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

It is a helper to return the virtio_gpu_ctrl_hdr in a vbuf.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 63d2df7fb0c98..312fd8a039a1e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -95,7 +95,8 @@ virtio_gpu_get_vbuf(struct virtio_gpu_device *vgdev,
 	if (!vbuf)
 		return ERR_PTR(-ENOMEM);
 
-	BUG_ON(size > MAX_INLINE_CMD_SIZE);
+	BUG_ON(size > MAX_INLINE_CMD_SIZE ||
+	       size < sizeof(struct virtio_gpu_ctrl_hdr));
 	vbuf->buf = (void *)vbuf + sizeof(*vbuf);
 	vbuf->size = size;
 
@@ -109,6 +110,16 @@ virtio_gpu_get_vbuf(struct virtio_gpu_device *vgdev,
 	return vbuf;
 }
 
+static struct virtio_gpu_ctrl_hdr *
+virtio_gpu_vbuf_ctrl_hdr(struct virtio_gpu_vbuffer *vbuf)
+{
+	/* this assumes a vbuf contains a command that starts with a
+	 * virtio_gpu_ctrl_hdr, which is true for both ctrl and cursor
+	 * virtqueues.
+	 */
+	return (struct virtio_gpu_ctrl_hdr *)vbuf->buf;
+}
+
 static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
 				  struct virtio_gpu_vbuffer **vbuffer_p,
 				  int size)
@@ -211,7 +222,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 		if (resp->type != cpu_to_le32(VIRTIO_GPU_RESP_OK_NODATA)) {
 			if (resp->type >= cpu_to_le32(VIRTIO_GPU_RESP_ERR_UNSPEC)) {
 				struct virtio_gpu_ctrl_hdr *cmd;
-				cmd = (struct virtio_gpu_ctrl_hdr *)entry->buf;
+				cmd = virtio_gpu_vbuf_ctrl_hdr(entry);
 				DRM_ERROR("response 0x%x (command 0x%x)\n",
 					  le32_to_cpu(resp->type),
 					  le32_to_cpu(cmd->type));
@@ -338,8 +349,7 @@ static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
 	WARN_ON(ret);
 
-	trace_virtio_gpu_cmd_queue(vq,
-		(struct virtio_gpu_ctrl_hdr *)vbuf->buf);
+	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
 
 	notify = virtqueue_kick_prepare(vq);
 
@@ -458,7 +468,7 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 		goto retry;
 	} else {
 		trace_virtio_gpu_cmd_queue(vq,
-			(struct virtio_gpu_ctrl_hdr *)vbuf->buf);
+			virtio_gpu_vbuf_ctrl_hdr(vbuf));
 
 		notify = virtqueue_kick_prepare(vq);
 	}
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
