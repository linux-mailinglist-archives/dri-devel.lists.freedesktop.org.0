Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E42C164D19
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115526E850;
	Wed, 19 Feb 2020 17:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CDF6EC63
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:56:53 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 2so420107pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LS8qmGyVh5Fd+keBmVNR9chtGvlexGyC6FGXOnZ78ks=;
 b=S/c52A3aon46BEARNoSaEjcPS60T8GBkmOpaZ2hbCGea3yHP8c7DTZxnQdZiElTcUe
 vtsFe07RDUphYLph1Nbdp8CWatxhHwMMXD8bI3E/rkyiNoGTwnIai/QDpp10wcI+G3I4
 WH1xQnS1PGrNiczB01aKPGhHNS05vSFXTymKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LS8qmGyVh5Fd+keBmVNR9chtGvlexGyC6FGXOnZ78ks=;
 b=pTrBqfe/KcjEaIlQFcjlccIH28adoATFRKzQtjUBdKtnI38A+DVwwYwrptfLUXBAvq
 ZZ/bPNqz4BY5uITqpVc7O0EERY7kjCqMAQfnMyrbikNuLxl9wzE5uiqMDVWK6SMrIl/5
 /hOQw8HPT0amVnXb9AGKPYXOVgvlYnDoz4vip6iLpnJ4QcN9lJwLBM9JBgY+H/pOMAm0
 wy9TVQBNALc3gdajoKDxs8OJmJy1ieG7iJWbS98hjvxAWA9wwmm24JliCAvxM93/9o+g
 thlhbKWysJEolIzSPUwcQi7RzzLvfx7k841cITQAVG3Y2/IJV11wZpUo9LeLJATk7wVc
 wLfw==
X-Gm-Message-State: APjAAAUlP++rfjZYZS/MW8L4zbhxAcdkk0Za7kNAmFnVkcxFofVVpnsM
 x4l7hH8rINbwy4yIKcvRVk6bUK5h6Yw=
X-Google-Smtp-Source: APXvYqyAiN4Hf2M9eQZrDEZoP8AWafzlduVzc3MEmyCaqoSHUbQFPLqwzEB8OxGjf6cvDazw2xKGsQ==
X-Received: by 2002:a63:1555:: with SMTP id 21mr2481985pgv.348.1582135012908; 
 Wed, 19 Feb 2020 09:56:52 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id b6sm286930pfg.17.2020.02.19.09.56.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 09:56:52 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5 v5] drm/virtio: track whether or not a context has been
 initiated
Date: Wed, 19 Feb 2020 09:56:38 -0800
Message-Id: <20200219175640.809-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219175640.809-1-gurchetansingh@chromium.org>
References: <20200219175640.809-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an atomic variable to track whether a context has been
initiated.

v5: Fix possible race and sleep via mutex (@olv)

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 8 ++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 72c1d9b59dfe..0596d9618554 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -209,6 +209,8 @@ struct virtio_gpu_device {
 
 struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
+	bool context_initiated;
+	struct mutex context_lock;
 };
 
 /* virtio_ioctl.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index de04f80f737d..c1a6cb4ec375 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -44,10 +44,18 @@ void virtio_gpu_create_context(struct drm_device *dev,
 	if (!vgdev->has_virgl_3d)
 		return;
 
+	mutex_lock(&vfpriv->context_lock);
+	if (vfpriv->context_initiated)
+		goto out_unlock;
+
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
 	virtio_gpu_notify(vgdev);
+	vfpriv->context_initiated = true;
+
+out_unlock:
+	mutex_unlock(&vfpriv->context_lock);
 }
 
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index f7e3712502ca..424729cb81d1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -258,6 +258,8 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	if (!vfpriv)
 		return -ENOMEM;
 
+	mutex_init(&vfpriv->context_lock);
+
 	handle = ida_alloc(&vgdev->ctx_id_ida, GFP_KERNEL);
 	if (handle < 0) {
 		kfree(vfpriv);
@@ -281,6 +283,7 @@ void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file)
 	vfpriv = file->driver_priv;
 
 	virtio_gpu_context_destroy(vgdev, vfpriv->ctx_id);
+	mutex_destroy(&vfpriv->context_lock);
 	kfree(vfpriv);
 	file->driver_priv = NULL;
 }
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
