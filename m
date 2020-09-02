Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F5125B5A1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8086E56A;
	Wed,  2 Sep 2020 21:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152916E53E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:00 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id e33so347247pgm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74Ptbraf0CDp33BRA61dvT2Bl5/g0JXdYVq9cste7LY=;
 b=LMRi3NbxCrssnt0htZzhusi776WcCazGBEAIBZG8NyVu8vE4vPBS44KUuD/FigLpNw
 24neXe6zju6bYGREuGlSKEKbd4pEV80p21GVv096L/wXd0q9gYF9N/rWin5QG/EGHTib
 t/QrtBJkP9RNtxlgCcIVt/MOW/N081QTw6/bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74Ptbraf0CDp33BRA61dvT2Bl5/g0JXdYVq9cste7LY=;
 b=fISAmBMJqyn09wXPriTPt2buFNa6uiKInNmto9fEGiYBh5br67zEa4nnJCPWSX68L3
 ViPF43HdwqNWzni76kkny+068YsUdZOz0Y6QNHPkKkaJRxsLzzFoF6IrPEHgrh8g4ziT
 zg6H3F7oWtD86ji5zEaH2WniOMcZUCUxM28HY0V5zq41S8lWin8JX3gkv0hjhNStYPh5
 2HH96U5toOJfyTi3iq8FDnKirFw4dnXwNWk1BOOFhLeo2EIXVO+DIA8e+KgjmlzdHrX3
 2O61ohKHnITlPeZNHaFWrNiM2X1nHepvONfPnwH/11RZzcEYxWQyv44R/HYMTjTN6Cyn
 Jr4w==
X-Gm-Message-State: AOAM532h204mwCuzoB+YLtzQzp4TkUDjDkyfsHZpAvlX8Mjruj+q5k4s
 9LI0ezDFOjN6vk2RgzKIfarq6ws8fK0g5w==
X-Google-Smtp-Source: ABdhPJw4fZ+F1ktkYMsgfFX3k3WYPtt8j7b4/PNlxZaByX4kck3bcjRskMxrWFGGm2dFZ/DHHeQWow==
X-Received: by 2002:a17:902:ba8e:: with SMTP id
 k14mr303667pls.256.1599080939430; 
 Wed, 02 Sep 2020 14:08:59 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:08:58 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 07/23] drm/virtio: blob prep: refactor getting pages and
 attaching backing
Date: Wed,  2 Sep 2020 14:08:31 -0700
Message-Id: <20200902210847.2689-8-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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
index 729f98ad7c020..32e9eae73fc2c 100644
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
