Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473C881AA9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 02:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A009B10EE5A;
	Thu, 21 Mar 2024 01:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uuX8gpio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7039710EE5A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 01:32:01 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d228a132acso7256571fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710984719; x=1711589519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+yNspNFtlhVf7RzI544PQpDbUEB4B2uGhhyKSlBWhtg=;
 b=uuX8gpioJ3I4GqAM9F5OGYVHeisqWAJl1/AIshtiwEVlREUpW6pdZf28fORa+qobET
 UiAGur7iVohTnireVrJdd6fG/7GuH+7k/eWdgB5jKNpdB01iGn1JNypmLGqZV8TZMoy/
 zx0Rk1FKOW8VRhFdeM8XioF27nuMCvDIHaXwo+1zFtnz/MdK8zQHm5gWR+QJzYznnTAG
 6D8iAh5JMcaQhQA2cekOFeeZk5Vq75voM4x3+l+/KC4iP3dE9XpS9J9DEYS5KYK0FP1n
 4Y9M3D8a02+TDXSVmJB5J7PqzGkr+UWP3aPrCTugACSeX1lh/CvevZLeuga1L35Tkeew
 Dt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710984719; x=1711589519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+yNspNFtlhVf7RzI544PQpDbUEB4B2uGhhyKSlBWhtg=;
 b=o1HDg40iCPIbySXUqrRMmrMrTeqxxiKkB+7x1+Ne9wIdOlKzGQ5mp6iDJ92iwAmwgH
 5zX2pwpxRaw0IDnmnl28pJbxiNgeJUXyg/RiJP5yVexcHDtfIZq2C2SR3i87y5/qPH7w
 kNhE5WvYqAMDxGyn9dcgh1D4yLdcsVFfZYuo2bSCFBQGwt6b4HTlJiotXtNdSjOTutXw
 FZHxIGZHt9Zztlog23FE9Ty9shExP8j4yogrGBLqFnXaTH/WeMs/MCjPZ7r2p9uSTr1l
 iFhn8K0gbTTjGSSdiuxQDCUwQvS4qR1RbtXalTGCeO043kNFNedKQN9gb0nYJLRcXAPv
 zuRA==
X-Gm-Message-State: AOJu0YzNgWXXdsWpJU1+/FWcqSd+dMrBHZasJu2HLYqEdnqCUcP6pnor
 AR3f3Ud+np/rYnB1JewznlnAXJM5kVrUzuKLPEeMQpHclMnlEfmSYI+TYMcifjP3F5Q30duJb4d
 N
X-Google-Smtp-Source: AGHT+IFCdE05Lfk0yELdV9YqUZl/nProdzIEP5pVz7ie8NNrNZ9toP3sX8bgDJrZ6Lw+NFiVoA83nw==
X-Received: by 2002:a2e:824f:0:b0:2d4:744c:24ab with SMTP id
 j15-20020a2e824f000000b002d4744c24abmr4934513ljh.27.1710984718543; 
 Wed, 20 Mar 2024 18:31:58 -0700 (PDT)
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300::227]) by smtp.gmail.com with ESMTPSA id
 p10-20020a2e804a000000b002d0bf097af1sm2254508ljg.123.2024.03.20.18.31.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 18:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] modetest: add support for YUV422 and YUV444 plane
 format
Date: Thu, 21 Mar 2024 03:31:57 +0200
Message-ID: <20240321013157.1194777-1-dmitry.baryshkov@linaro.org>
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

