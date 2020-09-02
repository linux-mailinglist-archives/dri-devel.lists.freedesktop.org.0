Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E95E125B5A8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944EC6E94B;
	Wed,  2 Sep 2020 21:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3AB6E94B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:11 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b124so358395pfg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZYU2vGY40/lCMofmakVbIqZAUSfRc24fDUmwZmP/u/k=;
 b=cqJg1ps6phZppiOQUCdT4qSXjML43k561qe3rtpAkIQPdHhRR7cDAkMSgoLUeBWXoE
 4h0NhEPW8CFOUR61Aa782/01PMdSxPCTYxyhf+PAJI256M2ZlFFHa3jAJoQ9+C7bgLBV
 wah9lGHP+mTt+l31zw7hMCwjKRBlfzQxfuBTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZYU2vGY40/lCMofmakVbIqZAUSfRc24fDUmwZmP/u/k=;
 b=XkUsopPoWNUasiBhsOIbDK0bvrNmAw0kSUk/RRlNmzKtRAuX2tCQ+to4JXOr1zmZ/1
 CzsXarG1hK31oCQv5FdNZUH5V2CrqINXEbteMXbG6JXSuOg0VvUoraQxeV40WiNa2OSt
 NR7CeEYSNTMFWEGGh3sSZLfTUlD6WfsPGeK0Iit15tAvOWHAkOn2+iU+F4eu3MhSE73U
 3tLpN4aVr7+X8uX3vgkJdGFxAejddIcdoNZV2sYRmIZ54EpInbt6lw7kXrRnWMsErps3
 Ux0eId8LoLjPmVF42pglJg97k6tK0G9RaM7Opgt9zFCZsKsbZO1egNVDnPSPzgaH8kn5
 UFOQ==
X-Gm-Message-State: AOAM531UpnHR5ZpJlcMuvtABJc9afYCujsqLyMmKBNcMvRMWyTAq8A4k
 OMfmuFdn9rdlEG0iTmLeK8Qcp3V8yFYprw==
X-Google-Smtp-Source: ABdhPJzdXAcvhBFoXTHWe2UaHLF0xVjK/nbYE6aHGFpkzUneZTmhyOPZDexsanMLta6D7Yhh1Q6XBw==
X-Received: by 2002:aa7:96f4:: with SMTP id i20mr305120pfq.312.1599080950670; 
 Wed, 02 Sep 2020 14:09:10 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:09 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 14/23] drm/virtio: implement blob resources: expose
 virtio_gpu_resource_id_get
Date: Wed,  2 Sep 2020 14:08:38 -0700
Message-Id: <20200902210847.2689-15-gurchetansingh@chromium.org>
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

VRAM object will need it.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 2 ++
 drivers/gpu/drm/virtio/virtgpu_object.c | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 72abeaa3c4872..bddc071c20bf5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -384,6 +384,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
+int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
+			       uint32_t *resid);
 /* virtgpu_prime.c */
 struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 					 int flags);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 32e9eae73fc2c..f7064c1c23fd9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -31,8 +31,7 @@
 static int virtio_gpu_virglrenderer_workaround = 1;
 module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
 
-static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
-				       uint32_t *resid)
+int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
 {
 	if (virtio_gpu_virglrenderer_workaround) {
 		/*
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
