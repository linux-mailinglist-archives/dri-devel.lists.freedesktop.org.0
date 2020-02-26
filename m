Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC117030C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525226EA99;
	Wed, 26 Feb 2020 15:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D026EA96
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582732084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=0hBOHXRxGQzs7sC6MP4NSUkQgLwz4qRn+BWsljwDM7Q=;
 b=eDfIyeCdBgkGP/nzsUjHA0hDpt7lpso1EVy0fnI4aHgh5x46jdd2LsJYYwxkdOkpCk8RIA
 /9bJn2ZYnkCcG2E4WcyGeUAvPOpA5zkflJMUiMKEdZzdRRCJh1D3WtFOyqrBh2yPwL8Fth
 SkbkoqnwnuX9aIUL2WSh0wfEjCmWGYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-3H3FylnoMz6nWrRPDbsPGQ-1; Wed, 26 Feb 2020 10:47:59 -0500
X-MC-Unique: 3H3FylnoMz6nWrRPDbsPGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA4141137840;
 Wed, 26 Feb 2020 15:47:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10D1A60BE1;
 Wed, 26 Feb 2020 15:47:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2D95E1FCE8; Wed, 26 Feb 2020 16:47:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/3] drm/virtio: fix mmap page attributes
Date: Wed, 26 Feb 2020 16:47:51 +0100
Message-Id: <20200226154752.24328-3-kraxel@redhat.com>
In-Reply-To: <20200226154752.24328-1-kraxel@redhat.com>
References: <20200226154752.24328-1-kraxel@redhat.com>
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
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 gurchetansingh@chromium.org, Gerd Hoffmann <kraxel@redhat.com>,
 tzimmermann@suse.de,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio-gpu uses cached mappings, set
drm_gem_shmem_object.map_cached accordingly.

Cc: stable@vger.kernel.org
Fixes: c66df701e783 ("drm/virtio: switch from ttm to gem shmem helpers")
Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reported-by: Guillaume Gardet <Guillaume.Gardet@arm.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 3d2a6d489bfc..59319435218f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -119,6 +119,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 		return NULL;
 
 	bo->base.base.funcs = &virtio_gpu_gem_funcs;
+	bo->base.map_cached = true;
 	return &bo->base.base;
 }
 
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
