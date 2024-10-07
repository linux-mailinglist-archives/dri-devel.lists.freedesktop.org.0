Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D9F992F30
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454EA10E168;
	Mon,  7 Oct 2024 14:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="keCOGBQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3AF10E168
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:28:19 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7a99fd0535bso372161985a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728311299; x=1728916099;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1LA5wp7wY9EnYR0wffKkFRyZlwphXjrwb9T4JcZsBRE=;
 b=keCOGBQPVGjrdyHsXd+jlQUFZHEFEPs5G/ZgOCbU9sGORki1xhAC0QLp14hR0X2onC
 e7kAj/NVBlrChMWuOQi9EsI/ETIVp3tt3IXmaKc05kbinMXxIsfL8TEv2k583Fpvk62w
 eGVCXth/+qdizbl1BFayyeOOsGa+xSrxcVXuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728311299; x=1728916099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1LA5wp7wY9EnYR0wffKkFRyZlwphXjrwb9T4JcZsBRE=;
 b=tcepm/Cyi7+Uan/Kf+kxNClHox15CV1z3lopmXNQioPL4SRUvqg0djOpAatiVvD410
 mwyjw0KKRtpke8h6OtVKpA+z9Xfbinjg75tbGuea9qg0UvpnClgYly58TYvrmKCOAGIi
 sDP1hdIla0BnzhD3SMaX5+XCvMQYCL9ZgGzX/PXSjl/T/bH/pfoxbXtauU5xC4kPRXzK
 Z14Ae8JOoL4O71CFjjbGrQgF5YWaY+4xGB0zS327sxBSGAjOdz1BzgMJzl2A4oWbBP0u
 gczaxCt7FY0TCSNlrMgKltnGNgmV2KKjaYaEZepolj+Tky3buTEYIV+PAzhE8roeABmi
 bxLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs4CPsk6BA21yt8KL4hZ2A2sKW1F1qfSUwNEw4VvCff/b96Ls96tI7Q5jfaSjTI6rgGb1rMCZkioM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsX2w3GTrLUZPMTLkNY1izweYh0dOnY7Te/Kfdvht0y+uTJ6Wj
 7ezr447x5KqiiM3TS1xGooNcAo7ivZFTHwd4O7gSoiIHEbjAoKACO+BlKM3rqQ==
X-Google-Smtp-Source: AGHT+IF7NTCYDPLXALTaPLn1Gd4+/LPhLdFUnQc2796Ur6c8+if5rFGbd6etZoBpy3kFJvhzHTDLdg==
X-Received: by 2002:a05:620a:414c:b0:7a9:c333:c559 with SMTP id
 af79cd13be357-7ae6f4864c9mr2054356685a.48.1728311298917; 
 Mon, 07 Oct 2024 07:28:18 -0700 (PDT)
Received: from pazz.c.googlers.com.com
 (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae7562ad09sm260355885a.28.2024.10.07.07.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:28:18 -0700 (PDT)
From: Paz Zcharya <pazz@chromium.org>
X-Google-Original-From: Paz Zcharya <pazz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Paz Zcharya <pazz@google.com>, Paz Zcharya <pazz@chromium.org>,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vkms: Add support for ABGR8888 pixel format
Date: Mon,  7 Oct 2024 14:27:58 +0000
Message-ID: <20241007142814.4037157-1-pazz@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
MIME-Version: 1.0
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

Add support for pixel format ABGR8888, which is the default format
on Android devices. This will allow us to use VKMS as the default
display driver in Android Emulator (Cuttlefish) and increase VKMS
adoption.

Signed-off-by: Paz Zcharya <pazz@chromium.org>
---

 drivers/gpu/drm/vkms/vkms_formats.c   | 20 ++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  1 +
 drivers/gpu/drm/vkms/vkms_writeback.c |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 040b7f113a3b..9e9d7290388e 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -73,6 +73,14 @@ static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
 	out_pixel->b = (u16)src_pixels[0] * 257;
 }
 
+static void ABGR8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
+{
+	out_pixel->a = (u16)src_pixels[3] * 257;
+	out_pixel->b = (u16)src_pixels[2] * 257;
+	out_pixel->g = (u16)src_pixels[1] * 257;
+	out_pixel->r = (u16)src_pixels[0] * 257;
+}
+
 static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	__le16 *pixels = (__force __le16 *)src_pixels;
@@ -176,6 +184,14 @@ static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
 	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
+static void argb_u16_to_ABGR8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
+{
+	dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
+	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
+	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
+	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
+}
+
 static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
 	__le16 *pixels = (__force __le16 *)dst_pixels;
@@ -234,6 +250,8 @@ void *get_pixel_conversion_function(u32 format)
 		return &ARGB8888_to_argb_u16;
 	case DRM_FORMAT_XRGB8888:
 		return &XRGB8888_to_argb_u16;
+	case DRM_FORMAT_ABGR8888:
+		return &ABGR8888_to_argb_u16;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_to_argb_u16;
 	case DRM_FORMAT_XRGB16161616:
@@ -252,6 +270,8 @@ void *get_pixel_write_function(u32 format)
 		return &argb_u16_to_ARGB8888;
 	case DRM_FORMAT_XRGB8888:
 		return &argb_u16_to_XRGB8888;
+	case DRM_FORMAT_ABGR8888:
+		return &argb_u16_to_ABGR8888;
 	case DRM_FORMAT_ARGB16161616:
 		return &argb_u16_to_ARGB16161616;
 	case DRM_FORMAT_XRGB16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e5c625ab8e3e..8efd585fc34c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -15,6 +15,7 @@
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index bc724cbd5e3a..04cb9c58e7ad 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -17,6 +17,7 @@
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565
-- 
2.47.0.rc0.187.ge670bccf7e-goog

