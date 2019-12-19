Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DC1258F4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 01:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84A36EAB2;
	Thu, 19 Dec 2019 00:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D28B6EAAF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 00:57:50 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 6so2201823pgk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDWXZ2NbKqOL7mI4fNKRdpKEi06uiRE7+rS6LYZI8DA=;
 b=AT5qvl3Cd+V7CBFhw4dKcYkMp7u1uE3xy2cS57BoeBZz2+CiC/9VyxCH6U2rT7rSHR
 9+4Lq8KpZtqr+739WXBhJCKaVBj1Ze9p53qEYU7+xos8nGdSAMQBFzW8jKEZdjnyo8H+
 E6RbE9xeLI3u1La8A3muTqHO+lCxZ0b4SPzNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDWXZ2NbKqOL7mI4fNKRdpKEi06uiRE7+rS6LYZI8DA=;
 b=E6JTmlCQVSm6XqQxv2iunOGHaHoT3I5XXh7QytNGdA+49D558XZibJb2kVxriNMjYT
 zbF48Ey5oO4eUTx3qxSdKzAfa50txYnLTCqdUBtTbC6rg1Vrd7AtyZHRJFEaebUPcuXl
 JTKfiOqKRxegia3chi5C7W8Sc1gXGLA2l3V44/s39W9JjgVbRztpquwZT/quPIK7Fop1
 hV5wf3zNYEnBjY8ne0fHTdh7kIXf2uq0WOs1Y0q/Db5mkRQ5jxwpjLiCaXf61EJ6K0Kn
 992RnjhrU9x9krWhtCVBuGFDTxvUd2nyXBV8okIfm+I6bjrZjO7jBXSZDwcJnGVzARkM
 Pb6g==
X-Gm-Message-State: APjAAAUFnY3X2riIm3DyKi8YTm+3fI6efdSKg7WF4MW2tYyj6Q4XW4IY
 ww02ZTbrUU8RQ9LM/Mr+ca0osh+ynG0=
X-Google-Smtp-Source: APXvYqzwyy5Ip0rYyr1IMz4ZOjdzvylr+Ul+GxlXZRMQXTc/83pVNSmWN8yFLER/v45R80GFI8O2+g==
X-Received: by 2002:a63:1f16:: with SMTP id f22mr5938356pgf.2.1576717069384;
 Wed, 18 Dec 2019 16:57:49 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id f23sm4651553pgj.76.2019.12.18.16.57.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Dec 2019 16:57:48 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/virtio: move to_virtio_fence inside virtgpu_fence
Date: Wed, 18 Dec 2019 16:57:32 -0800
Message-Id: <20191219005733.18960-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219005733.18960-1-gurchetansingh@chromium.org>
References: <20191219005733.18960-1-gurchetansingh@chromium.org>
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

That's the only file that uses it.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 --
 drivers/gpu/drm/virtio/virtgpu_fence.c | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 578d5e42946e..b16e04bd67b7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -103,8 +103,6 @@ struct virtio_gpu_fence {
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
 };
-#define to_virtio_fence(x) \
-	container_of(x, struct virtio_gpu_fence, f)
 
 struct virtio_gpu_vbuffer {
 	char *buf;
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 5466aab7d39a..5b2a4146c5bd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -27,6 +27,9 @@
 
 #include "virtgpu_drv.h"
 
+#define to_virtio_fence(x) \
+	container_of(x, struct virtio_gpu_fence, f)
+
 static const char *virtio_get_driver_name(struct dma_fence *f)
 {
 	return "virtio_gpu";
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
