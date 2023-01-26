Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92567C890
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 11:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DBF10E135;
	Thu, 26 Jan 2023 10:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3DB10E2BF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 10:28:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id m15so798248wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=0gxMKKY4YqMdYVm899Hlv4MXmrH1qi8FYcYKYXExf7M=;
 b=ZIvlC3TgtptfMZUkh9cbxfhxICLqehURU8nZW23cfdJ7mXgLwqfceLHVd07FtmFWUF
 BnaamAnXl8ztC2102J/ghzUaA0lekq1Go1nzhA6B4ACKY5xb2pwwX3EHU/BjmnRniNuc
 Rg6fYfb4ToBc2XYY/6dqcvY0THHfhV9SLbp8a35mR8ygzmuXNhvjGJu4b7/lDxfSeJwJ
 nIT6q/NRLDP3wVx8MmDCeh9IVYOInL0NkMiEJOzd4DfzfBm16di7CTBqYDoN93FbV+4U
 Jj220Kuji9+QeH7u8N306em71IdAikxQBVSuHzOHwFwxmo+LTqJZwo47mGCPi91yv1R5
 jNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0gxMKKY4YqMdYVm899Hlv4MXmrH1qi8FYcYKYXExf7M=;
 b=z54USfAXhsvJB+hq197F+28mj3vj/ei2Fjn2Sode901bB9F6r0X6q9SBDFMJVLi3WD
 HfWgnBhTr0u5KQSPIqYUY01soTRbiGFFTXkkaM/zLBTHZsekIXO9ziAsguPvvjqQu3Z1
 XgmFlTnWCTUt+j95nu3h+e1PCW9xqcHFzFRo2GI6r3qsFiYxJG0eg2Z4b5NMYICv5++5
 73Sxr7InVQs/1db17wlTKBINCLp0WDsKdtSNw0EQgYq46FX9SFRXvGWPVo34kXE5Bjtg
 Z7rolf5RGPalTG9Lqpki8ahlixgpE29Pdi+0U2Nva299glNbtyHo9C9ylRQIrBQsmSec
 ovwQ==
X-Gm-Message-State: AFqh2kqhZ/RR5DZgZqyF0aczCMaoij1gPtIM8izZ0J696/k7LQy2oHSy
 g2Mo28O+7FSD5jWdX2J8coc=
X-Google-Smtp-Source: AMrXdXuIrRPJzO7gySZovQQsDvFZ9kSj9jEEMTp2ZDhgi9E1AydEmV+mPzYJwRJ4C3iRuwS8CKo/cw==
X-Received: by 2002:a05:600c:34d1:b0:3db:1637:e415 with SMTP id
 d17-20020a05600c34d100b003db1637e415mr31004726wmq.22.1674728896542; 
 Thu, 26 Jan 2023 02:28:16 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c2e9400b003d9862ec435sm1040807wmn.20.2023.01.26.02.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:28:15 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tzimmermann@suse.de, noralf@tronnes.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/client: fix circular reference counting issue
Date: Thu, 26 Jan 2023 11:28:13 +0100
Message-Id: <20230126102814.8722-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We reference dump buffers both by their handle as well as their
object. The problem is now that when anybody iterates over the DRM
framebuffers and exports the underlying GEM objects through DMA-buf
we run into a circular reference count situation.

The result is that the fbdev handling holds the GEM handle preventing
the DMA-buf in the GEM object to be released. This DMA-buf in turn
holds a reference to the driver module which on unload would release
the fbdev.

Break that loop by releasing the handle as soon as the DRM
framebuffer object is created. The DRM framebuffer and the DRM client
buffer structure still hold a reference to the underlying GEM object
preventing its destruction.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: c76f0f7cb546 ("drm: Begin an API for in-kernel clients")
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/drm_client.c | 33 ++++++++++++++++++++-------------
 include/drm/drm_client.h     |  5 -----
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 009e7b10455c..f6292ba0e6fc 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -243,21 +243,17 @@ void drm_client_dev_restore(struct drm_device *dev)
 
 static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
-	struct drm_device *dev = buffer->client->dev;
-
 	if (buffer->gem) {
 		drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
 		drm_gem_object_put(buffer->gem);
 	}
 
-	if (buffer->handle)
-		drm_mode_destroy_dumb(dev, buffer->handle, buffer->client->file);
-
 	kfree(buffer);
 }
 
 static struct drm_client_buffer *
-drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
+drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
+			 u32 format, u32 *handle)
 {
 	const struct drm_format_info *info = drm_format_info(format);
 	struct drm_mode_create_dumb dumb_args = { };
@@ -279,16 +275,15 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
 	if (ret)
 		goto err_delete;
 
-	buffer->handle = dumb_args.handle;
-	buffer->pitch = dumb_args.pitch;
-
 	obj = drm_gem_object_lookup(client->file, dumb_args.handle);
 	if (!obj)  {
 		ret = -ENOENT;
 		goto err_delete;
 	}
 
+	buffer->pitch = dumb_args.pitch;
 	buffer->gem = obj;
+	*handle = dumb_args.handle;
 
 	return buffer;
 
@@ -375,7 +370,8 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
 }
 
 static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
-				   u32 width, u32 height, u32 format)
+				   u32 width, u32 height, u32 format,
+				   u32 handle)
 {
 	struct drm_client_dev *client = buffer->client;
 	struct drm_mode_fb_cmd fb_req = { };
@@ -387,7 +383,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 	fb_req.depth = info->depth;
 	fb_req.width = width;
 	fb_req.height = height;
-	fb_req.handle = buffer->handle;
+	fb_req.handle = handle;
 	fb_req.pitch = buffer->pitch;
 
 	ret = drm_mode_addfb(client->dev, &fb_req, client->file);
@@ -424,13 +420,24 @@ struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
 {
 	struct drm_client_buffer *buffer;
+	u32 handle;
 	int ret;
 
-	buffer = drm_client_buffer_create(client, width, height, format);
+	buffer = drm_client_buffer_create(client, width, height, format,
+					  &handle);
 	if (IS_ERR(buffer))
 		return buffer;
 
-	ret = drm_client_buffer_addfb(buffer, width, height, format);
+	ret = drm_client_buffer_addfb(buffer, width, height, format, handle);
+
+	/*
+	 * The handle is only needed for creating the framebuffer, destroy it
+	 * again to solve a circular dependency should anybody export the GEM
+	 * object as DMA-buf. The framebuffer and our buffer structure are still
+	 * holding references to the GEM object to prevent its destruction.
+	 */
+	drm_mode_destroy_dumb(client->dev, handle, client->file);
+
 	if (ret) {
 		drm_client_buffer_delete(buffer);
 		return ERR_PTR(ret);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 39482527a775..b5acdab73766 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -134,11 +134,6 @@ struct drm_client_buffer {
 	 */
 	struct drm_client_dev *client;
 
-	/**
-	 * @handle: Buffer handle
-	 */
-	u32 handle;
-
 	/**
 	 * @pitch: Buffer pitch
 	 */
-- 
2.34.1

