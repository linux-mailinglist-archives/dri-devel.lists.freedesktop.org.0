Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2211A61C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 09:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A746EA84;
	Wed, 11 Dec 2019 08:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9A36EA84
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576053744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9o29vWs9png9IbME4oN9NDlGatipOh6x0DCXnHJuIk=;
 b=NIGW18dNXPwodTeQlvFMXttrEa1AHZLHjUlfOWU4vJjPvj9ugp0kP2tWKVMPQy6C9pGlVP
 7LJeV3CxF9ynvax+NdDgheEGcg34SZWq/UMJm8KUo3SW1/EIb9v6O+IMS4U6hLwbmBM8vI
 qbLiLXxBBl3JFKdlxBMffV2yzwjWApQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-iPLJMWKoPZK38Zq5HMW8AQ-1; Wed, 11 Dec 2019 03:42:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88CDF18B9FC6;
 Wed, 11 Dec 2019 08:42:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 726F86364F;
 Wed, 11 Dec 2019 08:42:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 625F316E2D; Wed, 11 Dec 2019 09:42:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/virtio: skip set_scanout if framebuffer didn't change
Date: Wed, 11 Dec 2019 09:42:14 +0100
Message-Id: <20191211084216.25405-2-kraxel@redhat.com>
In-Reply-To: <20191211084216.25405-1-kraxel@redhat.com>
References: <20191211084216.25405-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: iPLJMWKoPZK38Zq5HMW8AQ-1
X-Mimecast-Spam-Score: 0
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 31 ++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index bc4bc4475a8c..a0f91658c2bc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -151,20 +151,23 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (bo->dumb)
 		virtio_gpu_update_dumb_bo(vgdev, bo, plane->state);
 
-	DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
-		  bo->hw_res_handle,
-		  plane->state->crtc_w, plane->state->crtc_h,
-		  plane->state->crtc_x, plane->state->crtc_y,
-		  plane->state->src_w >> 16,
-		  plane->state->src_h >> 16,
-		  plane->state->src_x >> 16,
-		  plane->state->src_y >> 16);
-	virtio_gpu_cmd_set_scanout(vgdev, output->index,
-				   bo->hw_res_handle,
-				   plane->state->src_w >> 16,
-				   plane->state->src_h >> 16,
-				   plane->state->src_x >> 16,
-				   plane->state->src_y >> 16);
+	if (plane->state->fb != old_state->fb) {
+		DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
+			  bo->hw_res_handle,
+			  plane->state->crtc_w, plane->state->crtc_h,
+			  plane->state->crtc_x, plane->state->crtc_y,
+			  plane->state->src_w >> 16,
+			  plane->state->src_h >> 16,
+			  plane->state->src_x >> 16,
+			  plane->state->src_y >> 16);
+		virtio_gpu_cmd_set_scanout(vgdev, output->index,
+					   bo->hw_res_handle,
+					   plane->state->src_w >> 16,
+					   plane->state->src_h >> 16,
+					   plane->state->src_x >> 16,
+					   plane->state->src_y >> 16);
+	}
+
 	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
 				      plane->state->src_x >> 16,
 				      plane->state->src_y >> 16,
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
