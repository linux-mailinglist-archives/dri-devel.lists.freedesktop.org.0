Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F49155330
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 08:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F4C6E9B9;
	Fri,  7 Feb 2020 07:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D289B6E9B3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581061607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=SUzQd6LFEwB3hirjXChHgZ4lmXv/SBqu0oNtoi7asxQ=;
 b=cN2l2gdfDZztakdcI8UajXsqgingrac770s7KWARvcx3d6xP5L62bs1aaTg0OFZ0VOZXwn
 iZPACAW5JfRXoSrkbo/gUeydU5I1DW6QmmaywwmiST0U39nXXe2MoKb6RUXN+U7M/OzkTd
 gvCmsG1HD4cK62ew29el0bcW/sdnSsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-Ase0DdZMOJG3dMa_il8VyA-1; Fri, 07 Feb 2020 02:46:43 -0500
X-MC-Unique: Ase0DdZMOJG3dMa_il8VyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D64DB60;
 Fri,  7 Feb 2020 07:46:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16B4B60C05;
 Fri,  7 Feb 2020 07:46:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6C06431F39; Fri,  7 Feb 2020 08:46:38 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/virtio: simplify virtio_gpu_alloc_cmd
Date: Fri,  7 Feb 2020 08:46:35 +0100
Message-Id: <20200207074638.26386-2-kraxel@redhat.com>
In-Reply-To: <20200207074638.26386-1-kraxel@redhat.com>
References: <20200207074638.26386-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Just call virtio_gpu_alloc_cmd_resp with some fixed args
instead of duplicating most of the function body.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 41e475fbd67b..df499fb64ac7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -120,23 +120,6 @@ virtio_gpu_vbuf_ctrl_hdr(struct virtio_gpu_vbuffer *vbuf)
 	return (struct virtio_gpu_ctrl_hdr *)vbuf->buf;
 }
 
-static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
-				  struct virtio_gpu_vbuffer **vbuffer_p,
-				  int size)
-{
-	struct virtio_gpu_vbuffer *vbuf;
-
-	vbuf = virtio_gpu_get_vbuf(vgdev, size,
-				   sizeof(struct virtio_gpu_ctrl_hdr),
-				   NULL, NULL);
-	if (IS_ERR(vbuf)) {
-		*vbuffer_p = NULL;
-		return ERR_CAST(vbuf);
-	}
-	*vbuffer_p = vbuf;
-	return vbuf->buf;
-}
-
 static struct virtio_gpu_update_cursor*
 virtio_gpu_alloc_cursor(struct virtio_gpu_device *vgdev,
 			struct virtio_gpu_vbuffer **vbuffer_p)
@@ -172,6 +155,15 @@ static void *virtio_gpu_alloc_cmd_resp(struct virtio_gpu_device *vgdev,
 	return (struct virtio_gpu_command *)vbuf->buf;
 }
 
+static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
+				  struct virtio_gpu_vbuffer **vbuffer_p,
+				  int size)
+{
+	return virtio_gpu_alloc_cmd_resp(vgdev, NULL, vbuffer_p, size,
+					 sizeof(struct virtio_gpu_ctrl_hdr),
+					 NULL);
+}
+
 static void free_vbuf(struct virtio_gpu_device *vgdev,
 		      struct virtio_gpu_vbuffer *vbuf)
 {
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
