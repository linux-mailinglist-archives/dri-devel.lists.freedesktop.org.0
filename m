Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E4123C28
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F30B6E20A;
	Wed, 18 Dec 2019 01:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3807A6E202
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:00:04 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b137so270959pga.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 17:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a5B/ewjZpS/rPe+WDo9lDC1NlwyJ98tG2eeZPdSkLKI=;
 b=aSqrzXSNWOGtnC9y5qX7kEaJ7KC6M4Iow9E6fbnDFmAs2vfuHUcI6rNjgCUy0ejubn
 cUc3qbbFt+ge6uts3f6gzYJbCq+fHisoXU9cVg0+FCR8wriEw5+tsKs3/+YUsEsNJgGE
 0RmVAJpCoHOrHrO1gQsWpuW5hsLo7MSAoekes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a5B/ewjZpS/rPe+WDo9lDC1NlwyJ98tG2eeZPdSkLKI=;
 b=eiYAf1RJM23yP3RXSwKDHwhzB/4QlbSPqNaPxee5SmKqbOsjwSGh1XFpvNLcaiZz4R
 Ik8eme26uu21g2ofYRjHHFSwMJO1fcfhNQx3fHvKMvzN4KscybjtXUwv9RFealQhK24X
 ZtqpWoG2UILnVuUyn6D6prXsAME5O/cP1pSFgFXnfXPvLpswr3y1vkQ3oJTrqBPfyMcM
 U1G/Lxh29b+/BZnEz1A9HQp6H2mVF0ypfz2IpVUGlYoXv3KWPPA97xmKIbeV0JXwowlQ
 Af1szPLxfZazzT/YgpQEPFWXVmvFuKtmIJ7Yhyt5c8dIveBTdJpEJ2JvUGttGzFxdx98
 fVfg==
X-Gm-Message-State: APjAAAV5xWoOwPZT226EYKb+oT6GjM4jYiuQSLGRfqcP4P4u57ngvsHg
 kc/4zpJMzaewhDUlO0AG14S8XnDAeUg=
X-Google-Smtp-Source: APXvYqzIfo8gj7NH0PhfzPDIPRy6SxwMBqtX41MAxiro/kY4a7QWIjY8894khDOyj8znWp6q0wte0Q==
X-Received: by 2002:a65:408d:: with SMTP id t13mr292972pgp.441.1576630803618; 
 Tue, 17 Dec 2019 17:00:03 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.17.00.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 17:00:03 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/virtio: move drm_connector_to_virtio_gpu_output to
 virtgpu_display
Date: Tue, 17 Dec 2019 16:59:27 -0800
Message-Id: <20191218005929.6709-8-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
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
index 4ec80563d1ca..7e447784e493 100644
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
