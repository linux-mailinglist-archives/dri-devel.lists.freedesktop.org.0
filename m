Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08647244318
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2BE6E5AE;
	Fri, 14 Aug 2020 02:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD0B6E5AE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:13 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id y6so3528498plt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gm+LAamyC2X0W7Z5wOebTtsHt6Sjfg2y2hu2uvYMdo0=;
 b=hgTBbwsKLEuY+dyWCpUkZGKBkENqMFfxTrALnECymriynT57f0Nh8R0OWgQkJ+UA1O
 AKMP+kj+D/DuHzSMXkr8dNDS7QRGSLLQK1KzIkKRrPnUPJNtPam6ib4P2dLQIgL3pSVi
 SqGhJxgNWydWnbgXjfQMCnjQQA/f1sKLJLc2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gm+LAamyC2X0W7Z5wOebTtsHt6Sjfg2y2hu2uvYMdo0=;
 b=D5b/F0hCMF+j5rpVCm8E+EM7wAeL0/vbVuRTy9aXYSiF3dJsrujffWIaMSKtsmc/9z
 4pHKAfebas62I7K0LUR5NQVRH7WsVqkVr1r9yaTwY18kHOrJdxZ/vwvJPccwP3vP0CNd
 hLqyD1vfqpMWWJj5KJxWwODpiEB0miAUY2OOWJ3o1bD+IItmlePCcPaZ7RwkOoGbt5Xf
 q5oL33+C0IoOehhk7+0kaQBu7MpkaAvBys5GnoqHToQC7jzoxzkFv2e4rUJvEC8IsVZ/
 gGuhzzytwLXGMkInmr7OMgPl+BI4/xpoWzEODV06qj7HhJe9nMcvQBI7hYw7p4g5EJo5
 1JPQ==
X-Gm-Message-State: AOAM533y5ByV7bnpZ0Vwq+4PyiHONuulKTGrvWDGW6OpxSZZbCyoP+Ma
 Ou/n6gUXuCA/PHYaJ/Xvi/TNk2nl/Dt7Kg==
X-Google-Smtp-Source: ABdhPJwCLxRkxgN+DXVZfHbGt+ir5+7JzG6QSXUNw0icAaxun6IlQdCn7pc0irWiIIyS8+7jJXiOpA==
X-Received: by 2002:a17:90a:ff07:: with SMTP id
 ce7mr526376pjb.192.1597372812599; 
 Thu, 13 Aug 2020 19:40:12 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:12 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 08/24] drm/virtio: blob prep: refactor getting pages and
 attaching backing
Date: Thu, 13 Aug 2020 19:39:44 -0700
Message-Id: <20200814024000.2485-9-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
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
index 1359eb8f1a02..9d68f260d998 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -227,22 +227,22 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
