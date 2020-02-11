Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74808159DBE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 00:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04436F45C;
	Tue, 11 Feb 2020 23:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D996F45C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 23:56:53 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i6so267665pfc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SEVsV9QzAbELxo472vv5tingI3HcdVfXCXHNr0ZOTOM=;
 b=JO4QjMG2bTo+Sr2KhiNYumZfjFSCyNKQxbYQbRugOt9nHz1Wwl7X3efIU/+7iIZ2bF
 iNR9cvhfB+kkIxovcTDG86C1FeqibLFBA4hIzcbw+KoDFcL2oH1uubTW6fqMKacd/nmH
 S+OB8nBWuYt2lPVeDBO9MnoOKKK8WvOuIAFiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEVsV9QzAbELxo472vv5tingI3HcdVfXCXHNr0ZOTOM=;
 b=oj4r2qAT3TNvwe+UIYzhBVGEmn1JoA8Rf5NYKAHmI/Vr4+o/JtIUYSZMYkXpp7oJbZ
 kbNuZBm6n/Iu1XeM6S2T7vRWnwdvWZOwx2zq9KlemGIA75TC/hdRws0rEbkfd8UTW5lX
 WhGkNKbel92yKg73zN72DZ/mWnqTmcjH47jCBxBiYVVcedP6NAO0SMOE3GFyM/dnRHRS
 NhxORkRMcNg7bIn9ckCD4kFfMKBcykm2OF4w7FVnL02IBo8k1wzhfKxAt6pc3B+BJlA/
 ylQ9aIvlLh7HxxIGOIZtyREIrCrds3d35qxdgAUWmnHFSrAu2jzKuYK7CqefDLAqGq9E
 4Agg==
X-Gm-Message-State: APjAAAXvUcVQAF7LGAUD8d0f/ZDT83xQ2lIxAlLBdejUF9Fv1ZuxkHIR
 Iuf0TiLXngMpYipNv/x0wXi9HTUqordAMQ==
X-Google-Smtp-Source: APXvYqwOy8iku1kKyoTmTKEfecE/Cku+KOcfRSKs7lFrkf3A3s79M8fidlofk1jtCM7zZXKp/cwhIw==
X-Received: by 2002:a63:e30e:: with SMTP id f14mr9933642pgh.260.1581465412693; 
 Tue, 11 Feb 2020 15:56:52 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id a13sm5816291pfg.65.2020.02.11.15.56.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Feb 2020 15:56:52 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/virtio: track whether or not a context has been
 initiated
Date: Tue, 11 Feb 2020 15:56:34 -0800
Message-Id: <20200211235635.488-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200211235635.488-1-gurchetansingh@chromium.org>
References: <20200211235635.488-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We only want create a new virglrenderer context after the first
3D ioctl.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index edaa7b8224a8..93ce69c0d9be 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -209,6 +209,7 @@ struct virtio_gpu_device {
 
 struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
+	atomic_t context_initiated;
 };
 
 /* virtio_ioctl.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index f1afabaa3a08..858ee153fb18 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -44,9 +44,14 @@ void virtio_gpu_create_context(struct drm_device *dev,
 	if (!vgdev->has_virgl_3d)
 		return;
 
+	if (atomic_read(&vfpriv->context_initiated))
+		return;
+
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
+
+	atomic_inc(&vfpriv->context_initiated);
 }
 
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index e1e1c0821a35..64fe5fcbedfd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -270,7 +270,9 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 		return id;
 	}
 
+
 	vfpriv->ctx_id = id;
+	atomic_set(&vfpriv->context_initiated, 0);
 	file->driver_priv = vfpriv;
 	virtio_gpu_create_context(dev, file);
 
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
