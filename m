Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B94480D3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E3A6E095;
	Mon,  8 Nov 2021 14:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872D06E095
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636380428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQLIAbh+UwGTeTD7BCUD1byG8sr2htzPW9HYf/GbWOQ=;
 b=iB5geGdd6oscOpm0+9grzUvHL0oCyFhDrNzaN+3Jk8dKbvgR7XrOn6irbe/UktZ3NrbdPC
 2Hk4DU4W6Z8GbtCqkg7NvIX+DhsZsQb8UF0EaGPeOTZsrnRBncDoeBsF5TD24rM+pxv8Yi
 B0OhNrNIpTow79BCXkZ4QDuTEchiVe4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-j76dW-lGN6unKJ37nLQxDQ-1; Mon, 08 Nov 2021 09:07:05 -0500
X-MC-Unique: j76dW-lGN6unKJ37nLQxDQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so4098632wrc.22
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 06:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQLIAbh+UwGTeTD7BCUD1byG8sr2htzPW9HYf/GbWOQ=;
 b=iSV1KvLWpQd0G/mDwgTVwrwHLfCk4PSisyuKgkrOBqDPs8vX9v3sJOSw9SqykC6dUb
 dbqwk0qN7334pg2jWMFgYm7yl8meup7gRt3JU4gRqIdQFOimv4Sm2JJOu+8qOFEsbilO
 GIm/a3UYXXEkzsatuaI1403DzgIHRbv3LiXNcucrYVzkY4eL4wtebuAWEJAK1CpJhsgK
 zQvfV69+rZrK6ff+UKEmwvGXQIlz5RVdcvvYArkE2U56lLPjs9XjsHyIn9sj2uCZrJIk
 +09vOI1dSdL/6sqrPkNFB6Dt/I3C/QKSGLCpdSAUQim+2hQxYf9bm/w73X62iL1uEqwh
 V+mg==
X-Gm-Message-State: AOAM5331Xw+H73uy/wjgjBoiahXowhNoCc/zxMH3Py6fWlGeMRTSmm89
 pXaxxJpHgyZMadYOTT6PPmlkorlzXq8W1F0w+LZr0eXzjmqW6mIScv5LD3kMXiVp8ncXjr/2fqa
 HJGRpIWjmkoLYLjzpg3wBJS/TQK7h
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr47543278wmq.34.1636380424176; 
 Mon, 08 Nov 2021 06:07:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvtINAP8QSTe4tTfHVmZkm28rbBCr0xKoz60mO3RAPdu9pz4/mqVyT59DP/qN1jloJAVX4uA==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr47543247wmq.34.1636380423968; 
 Mon, 08 Nov 2021 06:07:03 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id m14sm10081696wrp.28.2021.11.08.06.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:07:03 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] drm: Don't print messages if drivers are disabled due
 nomodeset
Date: Mon,  8 Nov 2021 15:06:43 +0100
Message-Id: <20211108140648.795268-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108140648.795268-1-javierm@redhat.com>
References: <20211108140648.795268-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomodeset kernel parameter handler already prints a message that the
DRM drivers will be disabled, so there's no need for drivers to do that.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 +---
 drivers/gpu/drm/radeon/radeon_drv.c     | 8 ++------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c718fb5f3f8a..289d04999ced 100644
--- drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2514,10 +2514,8 @@ static int __init amdgpu_init(void)
 {
 	int r;
 
-	if (vgacon_text_force()) {
-		DRM_ERROR("VGACON disables amdgpu kernel modesetting.\n");
+	if (vgacon_text_force())
 		return -EINVAL;
-	}
 
 	r = amdgpu_sync_init();
 	if (r)
diff --git drivers/gpu/drm/radeon/radeon_drv.c drivers/gpu/drm/radeon/radeon_drv.c
index b74cebca1f89..380adc61e71c 100644
--- drivers/gpu/drm/radeon/radeon_drv.c
+++ drivers/gpu/drm/radeon/radeon_drv.c
@@ -637,15 +637,11 @@ static struct pci_driver radeon_kms_pci_driver = {
 
 static int __init radeon_module_init(void)
 {
-	if (vgacon_text_force() && radeon_modeset == -1) {
-		DRM_INFO("VGACON disable radeon kernel modesetting.\n");
+	if (vgacon_text_force() && radeon_modeset == -1)
 		radeon_modeset = 0;
-	}
 
-	if (radeon_modeset == 0) {
-		DRM_ERROR("No UMS support in radeon module!\n");
+	if (radeon_modeset == 0)
 		return -EINVAL;
-	}
 
 	DRM_INFO("radeon kernel modesetting enabled.\n");
 	radeon_register_atpx_handler();
-- 
2.33.1

