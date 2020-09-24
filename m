Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5971276510
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7066E067;
	Thu, 24 Sep 2020 00:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2EB6E067
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:17 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id z19so741215pfn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCeErYaYU/OrSRlMHth62JhyG2DwbGqcl8xZ6TAfBZs=;
 b=JcgK0TG2QFhnJcjddAuVYXwC9peg7zHnVdEq+LKYnj/R+UzPMllRU/D4UQbUYSI3J6
 +3lacNTePlukZXSG5H69vWYXIFKf2jX4B7v0Z1LRDrdQgbiQAMjf8Q9vEfrOiySEr0kr
 jdogWiQd1EJW6uDj705dUw+c0Yz1bVpR+QGnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCeErYaYU/OrSRlMHth62JhyG2DwbGqcl8xZ6TAfBZs=;
 b=OW6mOkvlScmwapcEI5jN7o9LV2+8YPbBVhPDBV3nMgIzaUDvj2+P/JpJAl0eDHp6th
 zL0zU2+2Z7C/0cBYG/KfmiMahpXuH6dbmOden/aSsmGnW/rZthhC0RuErVdpPNVJs/CJ
 DZ8F0jBxnzZ1U75hCaNQ1+kxwwge0gs3VD3+PJIOMMN430Jj2wiJYj3IK0x4ueqB8f8J
 Ask4Snyv++mAtP0UXuBjqDmlU0VJpFMVDT2oOjG5lV8pS3skGwkThslR6ijVSg0/U/aw
 8clsZ3Iw095kwdjLOoNBPbT2oqc2r/GU2isXstCmLLm8xAvufwkBY5gyLbvP5rmnT0CD
 2cPA==
X-Gm-Message-State: AOAM530kT/hpY1FVQZFjd1i3kJN4KV/+qc64m6tLSlFc3MyeQSXsO20C
 TrFcKyvQ5xLI98Rp7I1ynbf3TQTos7K+Sw==
X-Google-Smtp-Source: ABdhPJyFhmEFuvIzNCXQSCsAyUuYJYNanWSPTWeGBOS08sv0yOXCh9Bt1a9LqquTh+CeLnjDDKM9Rg==
X-Received: by 2002:a62:bd05:0:b029:142:2501:3a02 with SMTP id
 a5-20020a62bd050000b029014225013a02mr2037584pff.81.1600907537086; 
 Wed, 23 Sep 2020 17:32:17 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:16 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 01/19] drm/virtio: blob prep: refactor getting pages and
 attaching backing
Date: Wed, 23 Sep 2020 17:31:56 -0700
Message-Id: <20200924003214.662-1-gurchetansingh@chromium.org>
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
