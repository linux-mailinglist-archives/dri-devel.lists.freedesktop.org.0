Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B9136A21
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCAB6E0CB;
	Fri, 10 Jan 2020 09:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C26E0CB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578649546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=3Bjxye7nXEN8DZWgb9uCaUhoYDYYa6n7XP6x/kFHIr4=;
 b=PvGh297b7mpKpynE4WVLwUHbDGfe5aJ5tiCm6llf3WUh8qvoZKE3Wra6vnPyPt7NPgg9MO
 7Qm5YNSaI+BK368fQfLrNYz4x69O52VCwFIoG+baBPgspN+nEFqvCTgXzr23W2oForyKS6
 Ge1Viy43oZmvAbQZAMKhzxVVPP1n6Ys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-meg9DrUpPZmOGRGq3eT1tA-1; Fri, 10 Jan 2020 04:45:41 -0500
X-MC-Unique: meg9DrUpPZmOGRGq3eT1tA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FA36800D41;
 Fri, 10 Jan 2020 09:45:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9715C1B5;
 Fri, 10 Jan 2020 09:45:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 773F048E0; Fri, 10 Jan 2020 10:45:35 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: add missing virtio_gpu_array_lock_resv call
Date: Fri, 10 Jan 2020 10:45:35 +0100
Message-Id: <20200110094535.23472-1-kraxel@redhat.com>
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
Cc: jannh@google.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, gurchetansingh@chromium.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When submitting a fenced command we must lock the object reservations
because virtio_gpu_queue_fenced_ctrl_buffer() unlocks after adding the
fence.

Reported-by: Jann Horn <jannh@google.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 390524143139..1635a9ff4794 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -232,6 +232,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 		if (!objs)
 			return;
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
+		virtio_gpu_array_lock_resv(objs);
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, 0,
 			 plane->state->crtc_w,
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
