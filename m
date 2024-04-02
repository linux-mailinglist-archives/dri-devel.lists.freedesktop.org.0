Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC967895166
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D033910FC5E;
	Tue,  2 Apr 2024 11:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bnJIznv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CC710FC5E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 11:06:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513d247e3c4so4585970e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712055967; x=1712660767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+yNspNFtlhVf7RzI544PQpDbUEB4B2uGhhyKSlBWhtg=;
 b=bnJIznv/PWgG4INMHf066GkVNL4+G2oxQdghkgtxK3I+NPoVZgk8Ych9RkSyHPNO9+
 m9zPrKJjtwyTtJC9GYoF97A8qKGu3A97e1WeQlWLHvX1y8wA73gjYAUj2ccmAeFpHJkg
 l9oo2j+NHiRXTIRkZxB4C0mumecY1c4YtoSOSb8CPpBSZh8u2AhJ4/WBxcQXybYvph8N
 jQkOLFNdw23xxnsuMJmDifXOmWABXx40fF6aBp5ZfJFr3cY3R1dnovXF9ydUbPbyhhJa
 tfE5I4Oiivmy8ATK/nDfRdx4jpYHMXAMfiT+PxctWTJtyoOlqpZjWxZ6gHQgxFLAZVyR
 IfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712055967; x=1712660767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+yNspNFtlhVf7RzI544PQpDbUEB4B2uGhhyKSlBWhtg=;
 b=Rb6gZrkTupQdBSoyWG9hMgPrs/u6r6e4p9BXGWIWYiRXgQNintd1g0OHOcJvrMFviF
 WPKQ+bVdyzw1e/Rlm5SyRRRDcjPxDnwvgGIuPWR4u3N+ajH+fsS/zvog42dyPLsW2k7m
 taLR58z9dBGk2yZh93TMD+r42140ukZ0Jnfdg9CKK5r94gLa5myZK1f1xwxLWuSbFw/3
 pHVlWIqNGB8OKP2Rmg+tnR5jYve8Are8Iqx8+oexvLwSnuQV027KkggFtX9xVRaMRnpl
 r53iQcMdd+7j9YdLJn6MSYjn1YLL1s1dQiKqO4XQIEAzeWb31f7lqEkLiSfTZO56iG9i
 I1gA==
X-Gm-Message-State: AOJu0YxlW90hzDUVDunQlBLyX1fhCYjr1zCgC85EmCmE8GN+d7UwBa/0
 ln/Zix/H8SIW6Cb/w2hhnKmkvnyK4d2y25Czo4ooHFu8L8GONniyAKQaU9M1sbraIji4iGzLPnT
 M
X-Google-Smtp-Source: AGHT+IHa9BsBr4dIMKvIRyXUWHDzKJXA+5Klt68Gdmt/hITPjVU+UOEen8nLLH2lcKK4mPEWKji93Q==
X-Received: by 2002:a05:6512:613:b0:513:cf81:488b with SMTP id
 b19-20020a056512061300b00513cf81488bmr5346316lfe.25.1712055967527; 
 Tue, 02 Apr 2024 04:06:07 -0700 (PDT)
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300::227]) by smtp.gmail.com with ESMTPSA id
 u27-20020ac258db000000b00514b4d8906asm1696632lfo.196.2024.04.02.04.06.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 04:06:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm RESEND] modetest: add support for YUV422 and YUV444
 plane format
Date: Tue,  2 Apr 2024 14:06:06 +0300
Message-ID: <20240402110606.1033848-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
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

Currently modetest supports only the YUV420 and YVU420 planar YCbCr
plane formats (aka YV12 and YU12). Extend the code to add support for
YUV422 / YVU422 and YUV444 / YVU444 plane formats.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 tests/modetest/buffers.c | 42 ++++++++++++++++++++++++++++++++++++++++
 tests/util/format.c      |  4 ++++
 tests/util/pattern.c     |  8 ++++++++
 3 files changed, 54 insertions(+)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 576e2cc7fc95..9940ad444785 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -145,6 +145,10 @@ bo_create(int fd, unsigned int format,
 	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU444:
 		bpp = 8;
 		break;
 
@@ -229,12 +233,16 @@ bo_create(int fd, unsigned int format,
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_NV20:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YVU422:
 		virtual_height = height * 2;
 		break;
 
 	case DRM_FORMAT_NV24:
 	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_NV30:
+	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU444:
 		virtual_height = height * 3;
 		break;
 
@@ -318,6 +326,40 @@ bo_create(int fd, unsigned int format,
 		planes[2] = virtual + offsets[2];
 		break;
 
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YVU422:
+		offsets[0] = 0;
+		handles[0] = bo->handle;
+		pitches[0] = bo->pitch;
+		pitches[1] = pitches[0] / 2;
+		offsets[1] = pitches[0] * height;
+		handles[1] = bo->handle;
+		pitches[2] = pitches[1];
+		offsets[2] = offsets[1] + pitches[1] * height;
+		handles[2] = bo->handle;
+
+		planes[0] = virtual;
+		planes[1] = virtual + offsets[1];
+		planes[2] = virtual + offsets[2];
+		break;
+
+	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU444:
+		offsets[0] = 0;
+		handles[0] = bo->handle;
+		pitches[0] = bo->pitch;
+		pitches[1] = pitches[0];
+		offsets[1] = pitches[0] * height;
+		handles[1] = bo->handle;
+		pitches[2] = pitches[1];
+		offsets[2] = offsets[1] + pitches[1] * height;
+		handles[2] = bo->handle;
+
+		planes[0] = virtual;
+		planes[1] = virtual + offsets[1];
+		planes[2] = virtual + offsets[2];
+		break;
+
 	case DRM_FORMAT_C1:
 	case DRM_FORMAT_C2:
 	case DRM_FORMAT_C4:
diff --git a/tests/util/format.c b/tests/util/format.c
index eda3c671d7cf..c623544171de 100644
--- a/tests/util/format.c
+++ b/tests/util/format.c
@@ -62,6 +62,10 @@ static const struct util_format_info format_info[] = {
 	/* YUV planar */
 	{ DRM_FORMAT_YUV420, "YU12", MAKE_YUV_INFO(YUV_YCbCr, 2, 2, 1) },
 	{ DRM_FORMAT_YVU420, "YV12", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 1) },
+	{ DRM_FORMAT_YUV422, "YU16", MAKE_YUV_INFO(YUV_YCbCr, 2, 1, 1) },
+	{ DRM_FORMAT_YVU422, "YV16", MAKE_YUV_INFO(YUV_YCrCb, 2, 1, 1) },
+	{ DRM_FORMAT_YUV444, "YU24", MAKE_YUV_INFO(YUV_YCbCr, 1, 1, 1) },
+	{ DRM_FORMAT_YVU444, "YV24", MAKE_YUV_INFO(YUV_YCrCb, 1, 1, 1) },
 	/* RGB16 */
 	{ DRM_FORMAT_ARGB4444, "AR12", MAKE_RGB_INFO(4, 8, 4, 4, 4, 0, 4, 12) },
 	{ DRM_FORMAT_XRGB4444, "XR12", MAKE_RGB_INFO(4, 8, 4, 4, 4, 0, 0, 0) },
diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 2ff9c033495c..e5f20c50b5d8 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -1229,10 +1229,14 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 						   stride);
 
 	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 		return fill_smpte_yuv_planar(&info->yuv, planes[0], planes[1],
 					     planes[2], width, height, stride);
 
 	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 		return fill_smpte_yuv_planar(&info->yuv, planes[0], planes[2],
 					     planes[1], width, height, stride);
 
@@ -1646,10 +1650,14 @@ static void fill_tiles(const struct util_format_info *info, void *planes[3],
 						   width, height, stride);
 
 	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
 		return fill_tiles_yuv_planar(info, planes[0], planes[1],
 					     planes[2], width, height, stride);
 
 	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
 		return fill_tiles_yuv_planar(info, planes[0], planes[2],
 					     planes[1], width, height, stride);
 
-- 
2.43.0

