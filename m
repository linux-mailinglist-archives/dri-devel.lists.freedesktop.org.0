Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28B890911
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 20:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388F110F8BE;
	Thu, 28 Mar 2024 19:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PRz1eN6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE25B10ED9B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 13:44:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-515c3eeea5dso899044e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711633489; x=1712238289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S0ld9ottGtMP3PSLHeDCuhhunV2RKSWGGUbt6pNFLTE=;
 b=PRz1eN6cHv/aa0HccdV1ClMjmJ0a2WLBBHttHGy0UEz5h+AIJsSX+RierjPztulYlc
 It+kxB/8JBH9DZWoi/+plGCAiCiXIDFp38mUER4x0XgGQw9ewfe35x9uW3IdSYsMcoGW
 3GKlvK2P0w4oAbLgaFqUxnhONcX4+k49qgzHr07pN4NCbmQJMeI9DV/uLIa/jlH9cGF5
 sdNAFWC3d5tZYWQ2lDVFIuxJFZgZi4xkgfLCYaceP1mfdTagQBxsz8zLlFiedmxAl9mD
 ycXBzivk7yKMfERBFXiiTnV2c2tT19iqk2LM0at1+Qx50dZgs4IUXfPYt4WbKhLXU2wG
 oREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711633489; x=1712238289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0ld9ottGtMP3PSLHeDCuhhunV2RKSWGGUbt6pNFLTE=;
 b=LJJzAwJzBOgMCi4NQaNyFv5pG+kwjoB18QnN+SzlIM7xGHjh4rmYufWTnrXw5jGfRN
 Up//Wfqs87xnPS6pziONaksXueASFrALzdrASOPBDgcjVU/6KEjfZ/GukEQ2eAHC7Auq
 9hFG/MrFRrEG1rrfqzUn0Bn1gdw9h5Sb9Q1Szt7ScU3SRN1iPI6puO2sbuUyZh1ywhF+
 0NH7S+inFsZXIzjlEhRaO/HRPUIbVl+veA37TaXNruJvIXx+1Urbi3H4UClZ1kMd67de
 j7tfH5sRRdAgB1CN1Hz+FOPdfzjmhVqJvbT4lzYZ/r1u1z5NjYmT+DEId6yHDcQCz4Gn
 8kGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV80QX7vhmEPGALWhFLIb/FvEO8xjRb9dsTD51TQPhlI/mIoHTOS9KWPfgYhmmvYPd2ri3O8dtKz2Q/90w+bUo6FEALHhp6DM0S7ss0Gy9N
X-Gm-Message-State: AOJu0Yw4fjXF8+kN0zA5HFtqYeflIpdQ4AktJJJAFm9nuk+AER5Xk0d8
 7LBCQex3hsyD0MFBiU50BBli+4c1N/SJSw4vTWXZzaUTR5Auufvu
X-Google-Smtp-Source: AGHT+IGgUYdZXvk1Jxa+qm2IRi+ZxbQKQ2cbC6z+k22XLHpAg517MrIY7J9tdrqnczVNq3X2Isc3Jw==
X-Received: by 2002:ac2:4642:0:b0:513:bf6e:bf05 with SMTP id
 s2-20020ac24642000000b00513bf6ebf05mr1858320lfo.14.1711633487520; 
 Thu, 28 Mar 2024 06:44:47 -0700 (PDT)
Received: from localhost.localdomain ([212.22.67.162])
 by smtp.gmail.com with ESMTPSA id
 b26-20020ac247fa000000b005159b7007aesm212501lfp.153.2024.03.28.06.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 06:44:47 -0700 (PDT)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: David Airlie <airlied@redhat.com>
Cc: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emil Velikov <emil.velikov@collabora.com>,
 Ivan Kapranov <i.kapranov@securitycode.ru>, lvc-project@linuxtesting.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/virtio: add driver_priv validation in
 virtio_gpu_create_context
Date: Thu, 28 Mar 2024 16:43:51 +0300
Message-Id: <20240328134351.298050-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Mar 2024 19:21:35 +0000
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

The pointer file->driver_priv was dereferenced without checking
against NULL, but in the "virtio_gpu_transfer_to_host_ioctl" function
it was checked against NULL after calling virtio_gpu_create_context
function.

Found by Security Code and Linux Verification Center(linuxtesting.org)
Fixes: 72b48ae800da ("drm/virtio: enqueue virtio_gpu_create_context after the first 3D ioctl")
Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index e4f76f315550..98fe9ad4ed15 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -64,6 +64,9 @@ void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file)
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 
+	if (!vfpriv)
+		return;
+
 	mutex_lock(&vfpriv->context_lock);
 	if (vfpriv->context_created)
 		goto out_unlock;
-- 
2.34.1

