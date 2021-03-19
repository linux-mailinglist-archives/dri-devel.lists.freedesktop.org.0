Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F934275B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 22:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDAF6EAB9;
	Fri, 19 Mar 2021 21:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785D06EAB8;
 Fri, 19 Mar 2021 21:03:40 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y6so12355533eds.1;
 Fri, 19 Mar 2021 14:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nM3vji+QulE5H2REqcmP5JukPTRDvwgC2zD3TX/FrjQ=;
 b=lUKDjb4oKIO6XHrpN9cD+BUbi0o6FaSXv54pmKUwR1OLNwJ4EpedrHKDnuzP/kSJQB
 wJsJ96TYiZUqWgjP5BMASRQwtYUGLvgyLoA6VnRA0znTKge1C+J6P2w9hY2KE52bt+4O
 lh+Xzq02ILKbET2VTMbpI9rIGA7ij7EszAuNgTjRdXAvq/o7Hpmo2zVVoZFvmjdacIZN
 NWwlm7bDxNdrBuyfZrGush45BBaPpINCa9rpaSTJ3hFY8qP1yyCaSdRbMNEuD/uzdwMJ
 9leb1sVGsvV6cyVqKn0JLRBxVYGFaqF0jj8R1vRdWPh9kSBh1zAW6cUQdnArqRQGP3cb
 ijmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nM3vji+QulE5H2REqcmP5JukPTRDvwgC2zD3TX/FrjQ=;
 b=UoKxWLk4p/X6faP1qoWzAFHXPjDUQBmUHzInSNzXUFbmnq4z1nIXbVkKMYRP1+3Ay+
 tXYPfuYoV2jMoFFudMOaO5a0jdqPqWn/PKJSU3/sz5tJTX+JTH1s60BUQZkH+0xqMznD
 8gYudaGYRjxAcrEqz5MHXiGZWUXYt8tqLIMuGJSTgyFGBq/2iCrDGHBcCPwkHV5mmNsy
 XPmoUuWqVXn72b1Iy2NzZQnPoquntiuBLnUEP0TMTP8+p6yBY5DIQz5k3IulNJMs8wuJ
 9LpxXq1yaTo824Ir85M3NRJc+Fp0/TgnYbUbtQJfrZclfJqJAab4vyJCTwmTd9AGaWmM
 plbQ==
X-Gm-Message-State: AOAM5324ggPIQcQsqosoCfwM2946bs+S3Ybg8RCF0nwKr4cHClZpIPvB
 xdfp0rLol9NjQ9Ur7oQUprXQ0aB9D9k=
X-Google-Smtp-Source: ABdhPJyTtb1X5/asVdHp4pWzEKJKhs04ytNaWNswTxxftmnLr17g2w0g6vkYOyl/+/shmA6ugUsAGw==
X-Received: by 2002:aa7:c9d1:: with SMTP id i17mr11605870edt.46.1616187818989; 
 Fri, 19 Mar 2021 14:03:38 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-7833-6000-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:7833:6000:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id jj15sm4353122ejc.99.2021.03.19.14.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 14:03:38 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/fourcc: Add 16 bpc fixed point framebuffer formats.
Date: Fri, 19 Mar 2021 22:03:13 +0100
Message-Id: <20210319210317.32369-2-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are 16 bits per color channel unsigned normalized formats.
They are supported by at least AMD display hw, and suitable for
direct scanout of Vulkan swapchain images in the format
VK_FORMAT_R16G16B16A16_UNORM.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 4 ++++
 include/uapi/drm/drm_fourcc.h | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 03262472059c..ce13d2be5d7b 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -203,6 +203,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_ARGB16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_ABGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_AXBXGXRX106106106106, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_XRGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_XBGR16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_ARGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_ABGR16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_RGB888_A8,	.depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_BGR888_A8,	.depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_XRGB8888_A8,	.depth = 32, .num_planes = 2, .cpp = { 4, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f76de49c768f..f7156322aba5 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -168,6 +168,13 @@ extern "C" {
 #define DRM_FORMAT_RGBA1010102	fourcc_code('R', 'A', '3', '0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
 #define DRM_FORMAT_BGRA1010102	fourcc_code('B', 'A', '3', '0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
 
+/* 64 bpp RGB */
+#define DRM_FORMAT_XRGB16161616	fourcc_code('X', 'R', '4', '8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
+#define DRM_FORMAT_XBGR16161616	fourcc_code('X', 'B', '4', '8') /* [63:0] x:B:G:R 16:16:16:16 little endian */
+
+#define DRM_FORMAT_ARGB16161616	fourcc_code('A', 'R', '4', '8') /* [63:0] A:R:G:B 16:16:16:16 little endian */
+#define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
+
 /*
  * Floating point 64bpp RGB
  * IEEE 754-2008 binary16 half-precision float
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
