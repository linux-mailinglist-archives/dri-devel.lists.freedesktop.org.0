Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B31CD54D
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBC56E40D;
	Mon, 11 May 2020 09:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32FA6E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:36:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d207so3443141wmd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0X0skQipwwu/MYr2+ovRTNBZcwuUbLOjMGRxojQ+/8=;
 b=S5C43F1s8M379cfRkakmxvK3avAmpeW4DZs5wVNHwPskshXKfMAm9GMHG2u0rDEBBl
 pXYaajCxsJl9MpU4Jrk2qBYfGK6PXFhzbmXXGJ1SkkwJUnaAWKEMt8hwAgMZXR6MBNC6
 z07MgT5CjiNkfphpnBCnAntDwXEm5TWExOVaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0X0skQipwwu/MYr2+ovRTNBZcwuUbLOjMGRxojQ+/8=;
 b=qsJ7ycTy5XAOKQPvt5nezgLKj0JN0P13vxS+fWQqke3qXVGnh23f9HGMVyDMSQHGTt
 L/lmPVjvdvdVYT+9tZv4B/IrZYEWZvRlpDI8KM9dHRlmjUa+tPX2cfsxxdwm+9aQ2PmH
 Ox4oKdhaU84/LLziwd0dYswC863RvK0GZgM+9Pwuq4gfob10g13pIrnVm5FRK++fplCc
 i1XFCv26lnMlbMpdT9iFP742ER/SCHypauvDAD4mXZEa8IAygUJo7JJX6PUwW1SfBw6U
 UuYPqnr6pYYSbijLMSRID6wje0slR/lYEHeMlXt64IqzpzFEXG3dUBr1YSgMuH77oAju
 4Wkg==
X-Gm-Message-State: AGi0PubV98jIUG5+Ml4PUbicwFRW8qX4y9LZCQ394KVqdkRxjztEXKR/
 ZFYhKELkYY9gksrtG/vAQbQnPg/hrM8=
X-Google-Smtp-Source: APiQypK2RGuKB4M48yS3I+tFBszsLZ1iQCZ3KihJ6U+IdRS5YIOSsz98h7iGrTA25CjEKuw0/oEsRw==
X-Received: by 2002:a1c:3d08:: with SMTP id k8mr20320037wma.16.1589189764098; 
 Mon, 11 May 2020 02:36:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:36:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/9] drm/virtio: Call the right shmem helpers
Date: Mon, 11 May 2020 11:35:49 +0200
Message-Id: <20200511093554.211493-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_shmem_get_sg_table is meant to implement
obj->funcs->get_sg_table, for prime exporting. The one we want is
drm_gem_shmem_get_pages_sgt, which also handles imported dma-buf, not
just native objects.

v2: Rebase, this stuff moved around in

commit 2f2aa13724d56829d910b2fa8e80c502d388f106
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Fri Feb 7 08:46:38 2020 +0100

    drm/virtio: move virtio_gpu_mem_entry initialization to new function

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 6ccbd01cd888..346cef5ce251 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -150,7 +150,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	if (ret < 0)
 		return -EINVAL;
 
-	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
+	shmem->pages = drm_gem_shmem_get_pages_sgt(&bo->base.base);
 	if (!shmem->pages) {
 		drm_gem_shmem_unpin(&bo->base.base);
 		return -EINVAL;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
