Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC544152915
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 11:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B221D6F52A;
	Wed,  5 Feb 2020 10:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6536F52A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580898363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=ty2qopoz5uFvayM3OqAA/q+IIy2XgdQGOmBn5/Sdrz8=;
 b=hpYIBxFCmOO90E6shfbuz+a/ZKC7CJMgQZWmV2BSDXVlgkV+SCZzg46qlaS07uAxsk9Aom
 BhrZztJhHv5a/JWjeWjcGiLuaDEnH9GtfVZYe7YImVc+AOWB37FLdwAYBOu1+RKs1NZrad
 6r9Ydu9sReSg5PDvzqFNpM+IUyRy7MY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-vJRFFA-wOqCyJns9a-gY-g-1; Wed, 05 Feb 2020 05:25:58 -0500
X-MC-Unique: vJRFFA-wOqCyJns9a-gY-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EB471075920;
 Wed,  5 Feb 2020 10:25:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8441E2135;
 Wed,  5 Feb 2020 10:25:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BCD69A1E0; Wed,  5 Feb 2020 11:25:52 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: ratelimit error logging
Date: Wed,  5 Feb 2020 11:25:52 +0100
Message-Id: <20200205102552.21409-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Avoid flooding the log in case we screw up badly.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5914e79d3429..83f22933c3bb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -212,9 +212,9 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 			if (resp->type >= cpu_to_le32(VIRTIO_GPU_RESP_ERR_UNSPEC)) {
 				struct virtio_gpu_ctrl_hdr *cmd;
 				cmd = (struct virtio_gpu_ctrl_hdr *)entry->buf;
-				DRM_ERROR("response 0x%x (command 0x%x)\n",
-					  le32_to_cpu(resp->type),
-					  le32_to_cpu(cmd->type));
+				DRM_ERROR_RATELIMITED("response 0x%x (command 0x%x)\n",
+						      le32_to_cpu(resp->type),
+						      le32_to_cpu(cmd->type));
 			} else
 				DRM_DEBUG("response 0x%x\n", le32_to_cpu(resp->type));
 		}
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
