Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C987B15298C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 12:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226816F549;
	Wed,  5 Feb 2020 11:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B376F547
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580900408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=ZE9yzcYAG7jYkbRuqwJpp4ye+y4wCXZsK9HIcU0xUu8=;
 b=dyOcs1retUtjLo7N+lLe/WppzZ97g9oDfFD2GuHntieDozfywVCob68jXk0hdT5kvUz/LT
 z+X2YFAy0IBFTFvfsGxvnVoQKQvY28wbeQg/FJpuD1tR6YfZk2e8XvESTonYn/dAm7Uqzv
 KaEmwdSgt745Sqed4qt5HMA/5P0C0c0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-TYOJ46MHP0-fl3NOX5-Kfg-1; Wed, 05 Feb 2020 06:00:04 -0500
X-MC-Unique: TYOJ46MHP0-fl3NOX5-Kfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B375C800D55;
 Wed,  5 Feb 2020 10:59:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 110F7859A0;
 Wed,  5 Feb 2020 10:59:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 61DA49CAF; Wed,  5 Feb 2020 11:59:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/virtio: simplify virtio_gpu_alloc_cmd
Date: Wed,  5 Feb 2020 11:59:52 +0100
Message-Id: <20200205105955.28143-2-kraxel@redhat.com>
In-Reply-To: <20200205105955.28143-1-kraxel@redhat.com>
References: <20200205105955.28143-1-kraxel@redhat.com>
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

Just call virtio_gpu_alloc_cmd_resp with some fixed args
instead of duplicating most of the function body.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5914e79d3429..6d6d55dc384e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -109,23 +109,6 @@ virtio_gpu_get_vbuf(struct virtio_gpu_device *vgdev,
 	return vbuf;
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
@@ -161,6 +144,14 @@ static void *virtio_gpu_alloc_cmd_resp(struct virtio_gpu_device *vgdev,
 	return (struct virtio_gpu_command *)vbuf->buf;
 }
 
+static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
+				  struct virtio_gpu_vbuffer **vbuffer_p,
+				  int size)
+{
+	return virtio_gpu_alloc_cmd_resp(vgdev, NULL, vbuffer_p, size,
+					 sizeof(struct virtio_gpu_ctrl_hdr), NULL);
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
