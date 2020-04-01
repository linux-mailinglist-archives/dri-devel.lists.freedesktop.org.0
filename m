Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB5719B86C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 00:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF656E9B3;
	Wed,  1 Apr 2020 22:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C576E9B1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 22:30:44 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id x1so559354plm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UHZr1S+fMBNzXGIHOSytKqVQfIbVK86FNZw2xQd4Xs=;
 b=LVJhJof6AoBPjSmf7zZoXWLZmrdSlhLf56OQMc6Y1/CLwjjS/elN7u5tUoRD8bBKuE
 IEIlvOp4/L4IqYhkk3zf+HrG1LfLFJeoELd4IToKggOhV7v9e8CgolsAwYUbD9IbyyRj
 Uc4mFd58EiNqOI2pQkROX7DeFUKnn1aSGGoew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UHZr1S+fMBNzXGIHOSytKqVQfIbVK86FNZw2xQd4Xs=;
 b=MTh5NhFWbo9PeNeJsNxq8lbt+YXUNAGZIEYQ0yIlYBUi2mi6nzevjNMJdeUZx8TC+K
 BIfOTyAy/WCu7+Wk7qNxDtY4AcxgyenI1tQ/uYTmslmEx0w7RO0UNEX7Atjw9aWtTEFz
 4vZDhucl8ZRnnnLdx3Ir+ZNj55dZHGSut4tjsL7l7WCW4bkWd1IrLXEkhQS7N4JbLaLo
 6ZeY8k5BQfCDwbqHmWrZ1I/QeBbUfhdsw/jy5X206bnDk1y2PL7LBizTBDUVVOdBe31T
 yYshbr5LERyhL9f3562KbBS6+GiriYRiO4dgVoIBHd0ajvuA3tJ8J7dQQqbxlU3iTl64
 wmkQ==
X-Gm-Message-State: AGi0PuYKTS+e3sBAf3z8drnB3GcCUD5SC5SUt6weOE5G5gsIwK6WpESn
 UY5qz7B4gwFpd3mzOjMNTT3myjkQSB8=
X-Google-Smtp-Source: APiQypJWoNgD7b/tMvLGBUpmY/QXewjzjlztnCExcYOerpPSdA6RgTVe+cMTI6jO6Pco2qGMEtwHzg==
X-Received: by 2002:a17:90b:24c:: with SMTP id
 fz12mr232075pjb.85.1585780243432; 
 Wed, 01 Apr 2020 15:30:43 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w29sm2167311pge.25.2020.04.01.15.30.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 01 Apr 2020 15:30:42 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/virtio: delete notify in virtio_gpu_object_create
Date: Wed,  1 Apr 2020 15:30:37 -0700
Message-Id: <20200401223039.2860-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200401223039.2860-1-gurchetansingh@chromium.org>
References: <20200401223039.2860-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For 3D buffers, virtio_gpu_gem_object_open notifies.
We can have the same behavior for dumb buffer.

v2: virtio_gpu_gem_object_open always notifies
v3: avoid boolean variable

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 3 ++-
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 90c0a8ea1708c..1025658be4df2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -114,7 +114,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 	struct virtio_gpu_object_array *objs;
 
 	if (!vgdev->has_virgl_3d)
-		return 0;
+		goto out_notify;
 
 	objs = virtio_gpu_array_alloc(1);
 	if (!objs)
@@ -123,6 +123,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 
 	virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
 					       objs);
+out_notify:
 	virtio_gpu_notify(vgdev);
 	return 0;
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d9039bb7c5e37..51a8da7d5ef3b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -241,7 +241,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
-	virtio_gpu_notify(vgdev);
 	*bo_ptr = bo;
 	return 0;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
