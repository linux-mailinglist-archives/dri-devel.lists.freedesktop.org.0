Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC2F1258F7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 01:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6571B6EAB1;
	Thu, 19 Dec 2019 00:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28326EAB2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 00:57:50 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x8so2181415pgk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=txgoTj/hvhqafyOwdlyw8+Qqb1qSPjhEmKhqkZOZsYA=;
 b=SywG7pyOvilRSvv71U0sHaE25nXMZtFqvkh+waAkOkIqgFZ1SsGOaJxGYjKfJJIj0Z
 PC2CCaj7XTjgMZO0KRym6S6ZDIXjobeA5OWLzzN8n+CYPF97i1lpdW4E2r8JVjA0ev94
 SlBjAJ6fDL4oZNBjdJC5UXN3OpVLiQTeoFRbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=txgoTj/hvhqafyOwdlyw8+Qqb1qSPjhEmKhqkZOZsYA=;
 b=X+GPNXzm0g4PA3WbX2lfgjp2GzFU5a0RH8EkZuNKbtn4OlWz5xpz2RqrC3Cpysk4fw
 PrrE5vKYi5wu1wYkbsENLZOqQHUHR+pDNtRnnAUN34j2KACCzhJvkWgyk3579vakfFP7
 SdC0f9MQzE4VLMyMuk8RQ2fF//vdZvQHXYfhwDoxUjWTtV6BzCiO2+VH0CKSOhdo+q/Y
 FRF2TM3IaSg2uSRz/bA4xfg2/SHyVV3pVvB0e85jWufa3GZqxcUDBQS9/5P/nqKIf2qA
 sz+HwKLgF12yQV5gCwClnTHLDbiOgWT+aLr0d54jxPSzw3/GpXJfz5uczWxCFVfkCa/X
 VY3w==
X-Gm-Message-State: APjAAAWMrT14CAR+gbpmi6hFa2qB+4X8k4OsRPXLqV5/W59B7dISOQ/S
 dMicRTn65av+asE0Ndku66vRjfnmpCg=
X-Google-Smtp-Source: APXvYqxBxxOBUaC4QlURSKuNfs7JWsqHQOZ5PYGrJR0AX/rhHV/2MuhCDP9qhtsJypM0xm2HZ5ni6g==
X-Received: by 2002:a63:4d5e:: with SMTP id n30mr6163069pgl.275.1576717070277; 
 Wed, 18 Dec 2019 16:57:50 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id f23sm4651553pgj.76.2019.12.18.16.57.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Dec 2019 16:57:49 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/virtio: move drm_connector_to_virtio_gpu_output to
 virtgpu_display
Date: Wed, 18 Dec 2019 16:57:33 -0800
Message-Id: <20191219005733.18960-6-gurchetansingh@chromium.org>
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
 drivers/gpu/drm/virtio/virtgpu_display.c | 3 +++
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index c76d69fecfeb..0966208ec30d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -43,6 +43,9 @@
 #define XRES_MAX  8192
 #define YRES_MAX  8192
 
+#define drm_connector_to_virtio_gpu_output(x) \
+	container_of(x, struct virtio_gpu_output, conn)
+
 static const struct drm_crtc_funcs virtio_gpu_crtc_funcs = {
 	.set_config             = drm_atomic_helper_set_config,
 	.destroy                = drm_crtc_cleanup,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b16e04bd67b7..7e69c06e168e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -133,8 +133,6 @@ struct virtio_gpu_output {
 };
 #define drm_crtc_to_virtio_gpu_output(x) \
 	container_of(x, struct virtio_gpu_output, crtc)
-#define drm_connector_to_virtio_gpu_output(x) \
-	container_of(x, struct virtio_gpu_output, conn)
 
 struct virtio_gpu_framebuffer {
 	struct drm_framebuffer base;
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
