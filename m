Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A644126CFC0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4976EB49;
	Thu, 17 Sep 2020 00:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574D76E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:42 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id n14so71046pff.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCeErYaYU/OrSRlMHth62JhyG2DwbGqcl8xZ6TAfBZs=;
 b=dTunetf5IMWJEAGSaRM5+MYwk6rWwI2DyvTK7iI6hPBAI8Aghcm1VlNMU7xgaa1IEa
 xPmu/3EfGjMUk8iPXWtWDyMhQUv0jXL/Ri6/+j2Wql/4r50OEhi+O0KAuSjIndimOC1R
 2sYFfU11BakWMeheC58wqNnZ4GYeF6HD33c+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCeErYaYU/OrSRlMHth62JhyG2DwbGqcl8xZ6TAfBZs=;
 b=e3aGLnMTV8ruA47QXzgqVs4Lndu2JGMBPrL6oZie/DackFzrIhDNPywI76VViiFgLH
 63H71WtkRFtTyo98QwP59CVGF0tQJl/JOvauElq18pUsQcM2vy6dqwc/BmKUJWsQREkr
 3SbV5w3bbHMaHxcKUdD/PKoHli9n8LeQRdMV4rGc9fHynOoQhGZk0/Kop2ITDtTJzOpJ
 pJ6P8H7NpKxy99e5PI4tS1wRt/7SA5QtQWwpShbYgH3UZGMV22jMjeqtIypryftskEdA
 jDJCCWJ0pDAhbu5nSoEzieK91Ia6wLqxXtHbkuysB1KPgWDbeNder3IfU7aiJ6JWmjlP
 x1ag==
X-Gm-Message-State: AOAM533zVOtD48MehD+OgTivHmCz6ioJoj01HAs/quODKnESu3IxjF/W
 mr6XPRnhoTdgoIHZhkyNK4/YxUi+PLfUng==
X-Google-Smtp-Source: ABdhPJysCy40TusKliIKGyih4zmLekhppvEmSKUypF5TtfDvkcnsdJX/cOkeBf1IyOAIMihdJYbeTg==
X-Received: by 2002:a63:ff06:: with SMTP id k6mr20272236pgi.321.1600301321667; 
 Wed, 16 Sep 2020 17:08:41 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:40 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/19] drm/virtio: blob prep: refactor getting pages and
 attaching backing
Date: Wed, 16 Sep 2020 17:08:20 -0700
Message-Id: <20200917000838.735-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
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

Useful for upcoming blob resources.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 842f8b61aa897..4c107b53e81a0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -228,22 +228,22 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			goto err_put_objs;
 	}
 
+	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	if (ret != 0) {
+		virtio_gpu_free_object(&shmem_obj->base);
+		return ret;
+	}
+
 	if (params->virgl) {
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
+		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	} else {
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
+		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
-	if (ret != 0) {
-		virtio_gpu_free_object(&shmem_obj->base);
-		return ret;
-	}
-
-	virtio_gpu_object_attach(vgdev, bo, ents, nents);
-
 	*bo_ptr = bo;
 	return 0;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
