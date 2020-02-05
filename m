Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700EB152679
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 07:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971686E946;
	Wed,  5 Feb 2020 06:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D499A6E946
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 06:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580885604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=d/H8Uw2fGE2aBzDIfMTx++ovLGWmzUssb90jy8x2c6E=;
 b=JrYwbnvgYPAe+VZ8+pc5UUk4oBPTpyGJJ4msYMO5GMhjy8rCiZxci5qs7gWkXyat4uEIsQ
 m0vwL71iJuImLAXQ3ti3WeqC36CQxRM9zpb/1YKoDkfoao6zLtwSP6NBqncuTufwO74Egl
 mGF82gD6jVhxxo/g3Kbmoiys0aLuWpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-Rxn7RGLHPnCfgZTy0C8iXw-1; Wed, 05 Feb 2020 01:53:17 -0500
X-MC-Unique: Rxn7RGLHPnCfgZTy0C8iXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B93CD8010FE;
 Wed,  5 Feb 2020 06:53:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD4C460BF7;
 Wed,  5 Feb 2020 06:53:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 105AD9D1E; Wed,  5 Feb 2020 07:53:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix vblank handling
Date: Wed,  5 Feb 2020 07:53:11 +0100
Message-Id: <20200205065312.15790-1-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, gurchetansingh@chromium.org,
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio has its own commit fail function.  Add the
drm_atomic_helper_fake_vblank() call there.

Fixes: 2a735ad3d211 ("drm/virtio: Remove sending of vblank event")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ecf4ba7cc32b..7b0f0643bb2d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -324,6 +324,7 @@ static void vgdev_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_helper_commit_modeset_enables(dev, state);
 	drm_atomic_helper_commit_planes(dev, state, 0);
 
+	drm_atomic_helper_fake_vblank(state);
 	drm_atomic_helper_commit_hw_done(state);
 
 	drm_atomic_helper_wait_for_vblanks(dev, state);
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
