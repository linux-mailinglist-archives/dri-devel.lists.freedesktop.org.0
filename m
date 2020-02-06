Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DEB1542CA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 12:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4549F6EA29;
	Thu,  6 Feb 2020 11:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2E46EA29
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580987665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=DvLLg4UuoGdHXGuG+nzeqHRzHI50bo/L7oKt8I1bkY8=;
 b=J1n8l0MEAPCFem/tWgy/gxWL9YeWcpjiAoXrUfY/mtq7zXvsIn2qge5fPmglhMa5vGyXMn
 dH7a7TU8sahJWKflu0MUSGKp9lQvhaT1ImO4c6TNk3YeyrBljct37SVLRcOLzgTjfh/v9i
 WhMrNXDcv+VSqlSIQrLQnLnlq2uOn8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-SjDYNnCmM-ibN5OlXFyZpw-1; Thu, 06 Feb 2020 06:14:22 -0500
X-MC-Unique: SjDYNnCmM-ibN5OlXFyZpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 861D7DBA5;
 Thu,  6 Feb 2020 11:14:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB34187B09;
 Thu,  6 Feb 2020 11:14:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E5B9C1747D; Thu,  6 Feb 2020 12:14:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix ring free check
Date: Thu,  6 Feb 2020 12:14:16 +0100
Message-Id: <20200206111416.31269-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

If the virtio device supports indirect ring descriptors we need only one
ring entry for the whole command.  Take that into account when checking
whenever the virtqueue has enough free entries for our command.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 41e475fbd67b..a2ec09dba530 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -328,7 +328,8 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	bool notify = false;
-	int ret;
+	bool indirect;
+	int vqcnt, ret;
 
 again:
 	spin_lock(&vgdev->ctrlq.qlock);
@@ -341,9 +342,11 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 		return;
 	}
 
-	if (vq->num_free < elemcnt) {
+	indirect = virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC);
+	vqcnt = indirect ? 1 : elemcnt;
+	if (vq->num_free < vqcnt) {
 		spin_unlock(&vgdev->ctrlq.qlock);
-		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
+		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= vqcnt);
 		goto again;
 	}
 
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
