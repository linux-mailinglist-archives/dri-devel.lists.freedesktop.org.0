Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498DD1258F1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 01:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15EF6EAAC;
	Thu, 19 Dec 2019 00:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9036EAAC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 00:57:41 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id p14so2183754pfn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/0Dzr7PF0Px4YDySXnEaL6pzzJBHGGWbHw/Hy/gm5g=;
 b=GrmauL5TW0SHH02xERA94xKLmxVOKSMPCkdS3p2vjwbbHxKumGjANYT0xdpBy5WKNS
 9S40lWuNKhDtUqBMgAzhHXMWH+0/vbLD9FmRMpVsCLVMINI3u4kd+RIvf7vED/nQJNzt
 D10HW1OJ0gPltwJ0VXjC48f7iW2zuzprer4hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d/0Dzr7PF0Px4YDySXnEaL6pzzJBHGGWbHw/Hy/gm5g=;
 b=BbTC3bqrjxPdWax2uOjKqS4FbqDHIkUBLttpH8GYYAWEjK6z8di8WAerBf+SOLxqFz
 aUNXXM+SYRJ0REk3HsFWJNOf+oZca7BiV9cUxXM/uhpENcgS50ji9FF9exvhFFIEBO3s
 xN7jK02MxMZ/EAGurFEy/GHSRABPCEaivD7xe5JsI/uM2YgvH/lulqeA4NvlzpxGVksD
 xY/9jB8NRwjIRN496J0KSlHs6ttgI4YMl++bcvnnnzPMMjVWKN74XVebt8BznYsJs8MG
 Sk5qOlsT2K3fVeU3fjxYMYGtQf094J2EKpZeJYnda4MOMRiGefX9tViYrDXtBIkYKPxb
 fIRQ==
X-Gm-Message-State: APjAAAVQQ9+6NL9MSwajtq9aCWdq6e4WRdNckPWRGx/BGQrdJhTREEHc
 9XXVQVQEfhRMBnXdguA+AMalKYlaPys=
X-Google-Smtp-Source: APXvYqxJO0zmUFI5UcCcQ4ZnhxPv7WFmQkLqu5lNBrNT5cYAFgDk78I0fKxRED1UeXtlfTfoKZNqVg==
X-Received: by 2002:a63:950c:: with SMTP id p12mr6233792pgd.85.1576717061084; 
 Wed, 18 Dec 2019 16:57:41 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id f23sm4651553pgj.76.2019.12.18.16.57.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Dec 2019 16:57:40 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/virtio: static-ify virtio_fence_signaled
Date: Wed, 18 Dec 2019 16:57:28 -0800
Message-Id: <20191219005733.18960-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used anywhere else.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 -
 drivers/gpu/drm/virtio/virtgpu_fence.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 29cf005ed6b9..349c1dea61c7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -356,7 +356,6 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 					int index);
 
 /* virtio_gpu_fence.c */
-bool virtio_fence_signaled(struct dma_fence *f);
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(
 	struct virtio_gpu_device *vgdev);
 void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index a4b9881ca1d3..5466aab7d39a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -37,7 +37,7 @@ static const char *virtio_get_timeline_name(struct dma_fence *f)
 	return "controlq";
 }
 
-bool virtio_fence_signaled(struct dma_fence *f)
+static bool virtio_fence_signaled(struct dma_fence *f)
 {
 	struct virtio_gpu_fence *fence = to_virtio_fence(f);
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
