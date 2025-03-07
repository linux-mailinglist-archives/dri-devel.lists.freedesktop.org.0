Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B6A56DC5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4310710EBE9;
	Fri,  7 Mar 2025 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eIZFEelM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25ED10EBF8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:00 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so1125007f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365239; x=1741970039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDEi+IB29m5kaXCQs1Xh/NAR1EeJ74QIHesF2OX+9WQ=;
 b=eIZFEelMOz0AyhDPEGH3QIag+ztF7ZxQOjNmIpzwll299BYoE8ZwCvk1dXJQSZZ+Sv
 opvmWT0NapuashqHNjmyyKNAMtoInSM4CwAjXKxqNGXpcpawd0/G84ono5W5woDYk9/g
 6jpM4YSZ+XrsrZ+JNw/xniz/YEiPGfpyrLw18LJwq+DCex/V3t2hdSOocGrhCWlSjzYy
 5lcKIPoHJM/LTnB663lY78kYhbavZf1a+47u8gIDxH2ELPDWhHBsF0wElPyeOpt9bl8X
 Rryp3RnKn/VjRViOsO4pf6zM3OZBxDU5VHwblirLS5kq6kCww0r0pndB3Vb3SppYhJGC
 VIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365239; x=1741970039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDEi+IB29m5kaXCQs1Xh/NAR1EeJ74QIHesF2OX+9WQ=;
 b=Upf2Un28xFv3hHkXUzK5BcAbW6vA+tXt8a+4EaKOAtIKZLVMUkdyb/vWupl07Mokfh
 9H2nJbEQvOJDyYQY1O5tHBZ8ZcIOTqnlNwK8RhyURmI3V2qiY45o3CLCDexgzC5SOeOW
 9xt031EV5RKO9S7pG1pTZZMG0KLoB93GtvhVzie3gwFuxUhupCLse30YMbm71L9dpUkc
 OJfYJlTAMPagoJGzn+K5aE9rrahdfUMmRXsCliYALftJxJls47R/Uw1aQ0gf3nJBBlYk
 QbR5RpIxhCx9GujIy+8j62957RN4Rg5WjM6SYseRJJ737TmTnr24/GE3qV7fTfNKPky5
 /chA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFK1H2guVOYDI7en7j/TjJ64FBNXm9Gn2BeFsxN6AIe6f3w6H54AAkSmMXSjM2AYBq+l5Zt6aIjaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYZpk/Tt9Z4IXobMJSyNdE1HBCn2AzoXsi6SQHRFv/fnMNmoPi
 9wJGArDHfns1YWqtha9O+Nm5ewS/OXhXdb7XWPI/uk/w9IWzHtdB
X-Gm-Gg: ASbGncsSQiUYM7pMoqveuZ6DVQHLCHkl5eyB+zlH5jZ92GFT5kTtP5lhOgl9ujcnFiP
 hgoyWcwdtP1Uzsv16CDRITsoHMKDqyfsljMR/JDoJpGBFJmKLttxFtZ4tYZglSHIsIaIl4zq7Ye
 JGFNMLKrHQSt0SstcCTVHk/qaCr9Ih/QEJxVH4WMHkjPnaFMEa/Jw1nhosiOKfp4b9jcNM3JsxF
 gptH875YHAku3JFtwzPA5M3uR4fubry8qUFgmNE087Mg8LZK2lFqSbYmXf7gdXPT6fwDvUtlKCj
 63BM5Y2/6Km/mGInoxEcTuGjC5w2bgBnplJHZhygsJMxUJg=
X-Google-Smtp-Source: AGHT+IHvEOquRlRDE6sNgZzthTbLfd1K6H7yZoCbaCvUV5F730ddnKBLTzQkXWvjxk1UN7ARIK+LDA==
X-Received: by 2002:a5d:5987:0:b0:391:78a:33de with SMTP id
 ffacd0b85a97d-39132d1ca75mr2576203f8f.12.1741365239196; 
 Fri, 07 Mar 2025 08:33:59 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:33:58 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 01/16] drm/vkms: Expose device creation and destruction
Date: Fri,  7 Mar 2025 17:33:38 +0100
Message-ID: <20250307163353.5896-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307163353.5896-1-jose.exposito89@gmail.com>
References: <20250307163353.5896-1-jose.exposito89@gmail.com>
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

In preparation for configfs support, expose vkms_create() and
vkms_destroy().

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a24d1655f7b8..23817c7b997e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -146,7 +146,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
@@ -229,7 +229,7 @@ static int __init vkms_init(void)
 	return 0;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..2ad8e3da3b7b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -223,6 +223,26 @@ struct vkms_device {
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
+/**
+ * vkms_create() - Create a device from a configuration
+ * @config: Config used to configure the new device
+ *
+ * A pointer to the created vkms_device is stored in @config
+ *
+ * Returns:
+ * 0 on success or an error.
+ */
+int vkms_create(struct vkms_config *config);
+
+/**
+ * vkms_destroy() - Destroy a device
+ * @config: Config from which the device was created
+ *
+ * The device is completely removed, but the @config is not freed. It can be
+ * reused or destroyed with vkms_config_destroy().
+ */
+void vkms_destroy(struct vkms_config *config);
+
 /**
  * vkms_crtc_init() - Initialize a CRTC for VKMS
  * @dev: DRM device associated with the VKMS buffer
-- 
2.48.1

