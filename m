Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F1159059
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 14:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357C46EA6E;
	Tue, 11 Feb 2020 13:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFE66EA6B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581429057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=S+mwJdJVy8UUeEbXPovOpoMig4tdZvTNhvh0a+GkyOI=;
 b=e5Hu8ndvdrhGe8NLgTqwnF80H//ZdHXHvfX+jefvg/aJuqGZOfCa5sXRrmamja33cUo+kN
 Yqs9XfUqOxLAGopVWrQLY/mYwKb4eNX19zxmKgMjyHb0Bw/PGNmr07HgDJ7PkFfUlNV3s4
 EovTnal0483ehK5qTqRjWH+vTDz+Iu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-u1_3pVzhMP65uv71nLedkg-1; Tue, 11 Feb 2020 08:50:53 -0500
X-MC-Unique: u1_3pVzhMP65uv71nLedkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E7418CA241;
 Tue, 11 Feb 2020 13:50:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C11EE5C1D6;
 Tue, 11 Feb 2020 13:50:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0856717448; Tue, 11 Feb 2020 14:50:48 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/virtio: fix virtio_gpu_execbuffer_ioctl locking
Date: Tue, 11 Feb 2020 14:50:46 +0100
Message-Id: <20200211135047.22261-2-kraxel@redhat.com>
In-Reply-To: <20200211135047.22261-1-kraxel@redhat.com>
References: <20200211135047.22261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Lockdep says we can't call vmemdup() while having objects reserved
because it needs the mmap semaphore.  So reorder the calls reserve
the objects later.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 205ec4abae2b..0477d1250f2d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -126,22 +126,22 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		bo_handles = NULL;
 	}
 
-	if (buflist) {
-		ret = virtio_gpu_array_lock_resv(buflist);
-		if (ret)
-			goto out_unused_fd;
-	}
-
 	buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
 	if (IS_ERR(buf)) {
 		ret = PTR_ERR(buf);
-		goto out_unresv;
+		goto out_unused_fd;
+	}
+
+	if (buflist) {
+		ret = virtio_gpu_array_lock_resv(buflist);
+		if (ret)
+			goto out_memdup;
 	}
 
 	out_fence = virtio_gpu_fence_alloc(vgdev);
 	if(!out_fence) {
 		ret = -ENOMEM;
-		goto out_memdup;
+		goto out_unresv;
 	}
 
 	if (out_fence_fd >= 0) {
@@ -160,11 +160,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			      vfpriv->ctx_id, buflist, out_fence);
 	return 0;
 
-out_memdup:
-	kvfree(buf);
 out_unresv:
 	if (buflist)
 		virtio_gpu_array_unlock_resv(buflist);
+out_memdup:
+	kvfree(buf);
 out_unused_fd:
 	kvfree(bo_handles);
 	if (buflist)
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
