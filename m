Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A4B193438
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 00:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395C6E85F;
	Wed, 25 Mar 2020 23:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347EC6E85F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 23:10:14 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b9so1396152pls.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 16:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y8RqWNUTngyM8MEFWiqK7zyZOoUT4GfpFXs1H7nRI3Q=;
 b=UnUEirQlrS6dSx36cGHWzGvsArYnO8Jfg3L7G+BxJt2Mj06DR7Me3Uu8JA8NBMudVC
 U1r0M8iwbiasLmMUrrrrMYvRPHzKKrGM3RNzBnOvh0X5+IrwJ9QpQLBqNkFU4jkWJ/N1
 PB7EumcCqVuM1pyhLtUWli2J+sw8ZikCxIX9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8RqWNUTngyM8MEFWiqK7zyZOoUT4GfpFXs1H7nRI3Q=;
 b=QIvgsiBWWzI4k6dXZ2KnqZKVXLIC4/5ujn2D9HIuc3B9krB08E5vJ9tPjo72D74/j3
 1CuovUnggPHWXBhJ/T9LKuje6O8ogFoi7PXnr/JhIN2Id7NatQr5ZUCOXezQm+FdUbtm
 65p0X99hvvvLGXeltjLPVl9jcWbvV2Lc4MWqSdxCsSlEWKKbmRBrVP28sWHgtn2Dyeoy
 dwitN/JDy/gaYQL8Ik7RmPllvYWPsrWUauAqTslL3qoV7qppz7UZ2cU3j5FsAQYnJGpr
 L0JZec9VIMeK+CTJahsFDaspTLO1D+patDXGXaXykDBCLwe7Zg7A6DMuUJLeuyGQDIG3
 eV3g==
X-Gm-Message-State: ANhLgQ3b+9XqOYzVIfEsTp+YOK/nMGBWz55BbPrWEOFtft/jvTGXgM1s
 fy8HLYkmDFTtwtH4vo3IxZDZg9m6LEk=
X-Google-Smtp-Source: ADFU+vu3o/jYafsPlcXis4X6ceCt0lrj4i2X7Nm5a0acEIW349jE6LV8rFeRAkOZOx7xzdcrInFcKA==
X-Received: by 2002:a17:90a:9409:: with SMTP id
 r9mr6184516pjo.39.1585177813423; 
 Wed, 25 Mar 2020 16:10:13 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id p1sm175151pfq.114.2020.03.25.16.10.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 25 Mar 2020 16:10:12 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: delete notify in virtio_gpu_object_create
Date: Wed, 25 Mar 2020 16:10:09 -0700
Message-Id: <20200325231009.41152-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <CAPaKu7ScaEefALSxqqugaUT+pLdQXcH5KupgqH1ZH5kzNJn3Vw@mail.gmail.com>
References: <CAPaKu7ScaEefALSxqqugaUT+pLdQXcH5KupgqH1ZH5kzNJn3Vw@mail.gmail.com>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For 3D buffers, virtio_gpu_gem_object_open notifies.
We can have the same behavior for dumb buffer.

v2: virtio_gpu_gem_object_open always notifies
v3: avoid boolean variable

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
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
