Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D53815CE93
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC46E425;
	Thu, 13 Feb 2020 23:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BBD6E429
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 23:18:26 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id dw13so3033141pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 15:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=68RJR195cXG/OJoShqYYXCW3gJOrA7bpW+d05EruekI=;
 b=U3oFkLMz0HbhdXTDYATDbnK2nY4Lh52DvT+urxHFL7FbwB/O63H+psUcwKZtjXS4au
 Al6chTDvMHdboZR3DGo4a3nDQc0LAJX+8YEuZBnYdy7ZLzAVrQkJLtqRD8sCnJVUXybp
 hbgpOak3WfnlMf81gT9YDnK2ZKCeErr2L897Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=68RJR195cXG/OJoShqYYXCW3gJOrA7bpW+d05EruekI=;
 b=BtHahfZwaOY7b+kPpulHZSK+thPShmcYOc4vJ6AD2lCoJL5xXQ2NR9T2PNeHvxSp0K
 4VVS5mG080zoLCYnfqZU/FI1IG+YPCJMBLW98c9osWZkCCOVBThFfkij27KzQyJ62wWb
 U7/wIqwtRFtpogdFFIbPhEqdo0WIKQQfq2DXXxNQ/Qh5NCqOcDWap7sk8fmAt4qTdTiK
 MfLVajbxAa2Uy5nppVbKKpURl4plfHWaeR949BTgzli8d6FMDda/rBcLL7yVFUECeiJb
 Hx7mqZB4eM1GZ60fY/8sCz7JyCnaxrC4teucgolDctUrdTsM/lXXRGLsdlahfGXrp2Ve
 AsvQ==
X-Gm-Message-State: APjAAAVJmf5q8KukDWTAXPMKlxCcb/+LorQVakve7RWyRf+Q07F4/n/p
 7QnzWYPC57QymcHYDyjBa3OlUxBEX8Y=
X-Google-Smtp-Source: APXvYqxMblNGYwRerEkpwSXsFnLVgnk27GSkqeUKS5/AvyYHfuwONtOpZPHvOiZM1lGkPLwpzd0O+Q==
X-Received: by 2002:a17:902:a514:: with SMTP id
 s20mr295733plq.300.1581635905870; 
 Thu, 13 Feb 2020 15:18:25 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w17sm4253495pfi.56.2020.02.13.15.18.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Feb 2020 15:18:25 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/virtio: track whether or not a context has been
 initiated
Date: Thu, 13 Feb 2020 15:18:03 -0800
Message-Id: <20200213231805.622-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213231805.622-1-gurchetansingh@chromium.org>
References: <20200213231805.622-1-gurchetansingh@chromium.org>
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

v2: Fix possible race (@olv)

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 72c1d9b59dfe..ca505984f8ab 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -209,6 +209,7 @@ struct virtio_gpu_device {
 
 struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
+	atomic_t context_initiated;
 };
 
 /* virtio_ioctl.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 896c3f419a6d..a98884462944 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -44,6 +44,9 @@ void virtio_gpu_create_context(struct drm_device *dev,
 	if (!vgdev->has_virgl_3d)
 		return;
 
+	if (!atomic_add_unless(&vfpriv->context_initiated, 1, 1))
+		return;
+
 	get_task_comm(dbgname, current);
 	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
 				      strlen(dbgname), dbgname);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 282558576527..25248bad3fc4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -263,6 +263,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	}
 
 	vfpriv->ctx_id = handle + 1;
+	atomic_set(&vfpriv->context_initiated, 0);
 	file->driver_priv = vfpriv;
 	virtio_gpu_create_context(dev, file);
 	return 0;
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
