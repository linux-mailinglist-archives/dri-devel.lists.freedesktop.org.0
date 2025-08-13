Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8A2B25111
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAC410E7AA;
	Wed, 13 Aug 2025 17:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="HaOemuHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D171210E7AA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755104790; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IPr9BQbjT582abQPTKeRbwU+8EDAOYMtoVQt3wICUBwikEPBKVcR3HDjbxzf9lzd7xRR/4sSCAcZjskBshWxURCUYngM6mYsME2rn8M0zm9KqHvk+V0Et2pTCexpgDc0gkdb/1UQ9aupqZouwg3OP8NtFDg/IzTjeIFVp8ATyto=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755104790;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aROFIPi75gku39iQmDIufpppaMAHfUhGSZDA6uRGmYY=; 
 b=kNnMJnhVKChTfQ0aV9Z32p01muZEw61me0VdzCj+6m4FL+eE4fIQS0vWzvCxUapbe58EhRC7tAkB3Pq/gOiwqv3nN1of0CgGzzPkZP4Eqp34HtmxaPfdMBQUVlxW1dBB2hYs4ew+jOIdFR2pa50i1Uz3HBllyaOylFqsNaPYFAw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755104790; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aROFIPi75gku39iQmDIufpppaMAHfUhGSZDA6uRGmYY=;
 b=HaOemuHU3oB+V1nLaZK0UmfYc1n4oZZ5uFyCMcpAxjqrr/pwC66ernZMfSApOtB9
 Gyj8tgUAV4h4fMBK2qKhRH2P9FY7FQcwbCvDvqK7NI3C9mMsM/StfXT63Esfgoq+od7
 FhyqKSdSnWq/tuv0MVIqhrgbNOQoBIoyc8EVs7wg=
Received: by mx.zohomail.com with SMTPS id 175510478947899.26788251586981;
 Wed, 13 Aug 2025 10:06:29 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <melissa.srw@gmail.com>,
 Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v1 2/5] drm/vkms: Add RGB to YUV conversion matrices
Date: Wed, 13 Aug 2025 19:05:39 +0200
Message-ID: <20250813170542.331206-3-robert.mader@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813170542.331206-1-robert.mader@collabora.com>
References: <20250813170542.331206-1-robert.mader@collabora.com>
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

In preparation for YUV/YCbCr pixel format support in the writeback
connector. The implementation is meant to mirror the existing
get_conversion_matrix_to_argb_u16() as close as possible.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 153 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h |   4 +
 2 files changed, 157 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index dfb8e13cba87..560b56fbf4fb 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -787,6 +787,20 @@ static const struct conversion_matrix yuv_bt601_full = {
 	.y_offset = 0,
 };
 
+/*
+ * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+ *                                                   is_legal = False,
+ *                                                   bits = 8)) * 2**32).astype(int)
+ */
+static const struct conversion_matrix rgb_to_yuv_bt601_full = {
+	.matrix = {
+		{ 1284195222, 2521145803,  489626272 },
+		{ -724715136, -1422768512, 2147483648 },
+		{ 2147483648, -1798249503, -349234145 },
+	},
+	.y_offset = 0,
+};
+
 /*
  * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
  *                                  is_legal = True,
@@ -801,6 +815,20 @@ static const struct conversion_matrix yuv_bt601_limited = {
 	.y_offset = 16,
 };
 
+/*
+ * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+ *                                                   is_legal = True,
+ *                                                   bits = 8)) * 2**32).astype(int)
+ */
+static const struct conversion_matrix rgb_to_yuv_bt601_limited = {
+	.matrix = {
+		{ 1102897073, 2165219336,  420502563 },
+		{ -636612512, -1249804497, 1886417008 },
+		{ 1886417008, -1579638779, -306778230 },
+	},
+	.y_offset = 16,
+};
+
 /*
  * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
  *                                  is_legal = False,
@@ -815,6 +843,20 @@ static const struct conversion_matrix yuv_bt709_full = {
 	.y_offset = 0,
 };
 
+/*
+ * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+ *                                                   is_legal = False,
+ *                                                   bits = 8)) * 2**32).astype(int)
+ */
+static const struct conversion_matrix rgb_to_yuv_bt709_full = {
+	.matrix = {
+		{ 913110047,  3071760610,  310096639 },
+		{ -492083449, -1655400199, 2147483648 },
+		{ 2147483648, -1950571889, -196911759 },
+	},
+	.y_offset = 0,
+};
+
 /*
  * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
  *                                  is_legal = True,
@@ -829,6 +871,20 @@ static const struct conversion_matrix yuv_bt709_limited = {
 	.y_offset = 16,
 };
 
+/*
+ * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+ *                                                   is_legal = True,
+ *                                                   bits = 8)) * 2**32).astype(int)
+ */
+static const struct conversion_matrix rgb_to_yuv_bt709_limited = {
+	.matrix = {
+		{ 784200393,  2638100289,  266318290 },
+		{ -432261539, -1454155469, 1886417008 },
+		{ 1886417008, -1713443541, -172973467 },
+	},
+	.y_offset = 16,
+};
+
 /*
  * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
  *                                  is_legal = False,
@@ -843,6 +899,20 @@ static const struct conversion_matrix yuv_bt2020_full = {
 	.y_offset = 0,
 };
 
+/*
+ * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+ *                                                   is_legal = False,
+ *                                                   bits = 8)) * 2**32).astype(int)
+ */
+static const struct conversion_matrix rgb_to_yuv_bt2020_full = {
+	.matrix = {
+		{ 1128287909, 2911987827,  254691561 },
+		{ -599706553, -1547777095, 2147483648 },
+		{ 2147483648, -1974764564, -172719084 },
+	},
+	.y_offset = 0,
+};
+
 /*
  * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
  *                                  is_legal = True,
@@ -857,6 +927,20 @@ static const struct conversion_matrix yuv_bt2020_limited = {
 	.y_offset = 16,
 };
 
+/*
+ * numpy.around(numpy.linalg.inv(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+ *                                                   is_legal = True,
+ *                                                   bits = 8)) * 2**32).astype(int)
+ */
+static const struct conversion_matrix rgb_to_yuv_bt2020_limited = {
+	.matrix = {
+		{ 969000204,  2500883663,  218735105 },
+		{ -526801050, -1359615958, 1886417008 },
+		{ 1886417008, -1734695147, -151721862 },
+	},
+	.y_offset = 16,
+};
+
 /**
  * swap_uv_columns() - Swap u and v column of a given matrix
  *
@@ -869,6 +953,18 @@ static void swap_uv_columns(struct conversion_matrix *matrix)
 	swap(matrix->matrix[2][2], matrix->matrix[2][1]);
 }
 
+/**
+ * swap_uv_columns_transposed() - Swap u and v column of a given matrix
+ *
+ * @matrix: Matrix in which column are swapped
+ */
+static void swap_uv_columns_transposed(struct conversion_matrix *matrix)
+{
+	swap(matrix->matrix[1][0], matrix->matrix[2][0]);
+	swap(matrix->matrix[1][1], matrix->matrix[2][1]);
+	swap(matrix->matrix[1][2], matrix->matrix[2][2]);
+}
+
 /**
  * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb conversion matrix for a
  * given encoding and range.
@@ -935,6 +1031,63 @@ void get_conversion_matrix_to_argb_u16(u32 format,
 }
 EXPORT_SYMBOL(get_conversion_matrix_to_argb_u16);
 
+void get_conversion_matrix_from_argb_u16(u32 format,
+					 enum drm_color_encoding encoding,
+					 enum drm_color_range range,
+					 struct conversion_matrix *matrix)
+{
+	const struct conversion_matrix *matrix_to_copy;
+	bool limited_range;
+
+	switch (range) {
+	case DRM_COLOR_YCBCR_LIMITED_RANGE:
+		limited_range = true;
+		break;
+	case DRM_COLOR_YCBCR_FULL_RANGE:
+		limited_range = false;
+		break;
+	case DRM_COLOR_RANGE_MAX:
+		limited_range = false;
+		WARN_ONCE(true, "The requested range is not supported.");
+		break;
+	}
+
+	switch (encoding) {
+	case DRM_COLOR_YCBCR_BT601:
+		matrix_to_copy = limited_range ? &rgb_to_yuv_bt601_limited :
+						 &rgb_to_yuv_bt601_full;
+		break;
+	case DRM_COLOR_YCBCR_BT709:
+		matrix_to_copy = limited_range ? &rgb_to_yuv_bt709_limited :
+						 &rgb_to_yuv_bt709_full;
+		break;
+	case DRM_COLOR_YCBCR_BT2020:
+		matrix_to_copy = limited_range ? &rgb_to_yuv_bt2020_limited :
+						 &rgb_to_yuv_bt2020_full;
+		break;
+	case DRM_COLOR_ENCODING_MAX:
+		matrix_to_copy = &no_operation;
+		WARN_ONCE(true, "The requested encoding is not supported.");
+		break;
+	}
+
+	memcpy(matrix, matrix_to_copy, sizeof(*matrix_to_copy));
+
+	switch (format) {
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
+		swap_uv_columns_transposed(matrix);
+		break;
+	default:
+		break;
+	}
+}
+EXPORT_SYMBOL(get_conversion_matrix_from_argb_u16);
+
 /**
  * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
  * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index eeb208cdd6b1..9367672b6b43 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -13,6 +13,10 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
 				       enum drm_color_range range,
 				       struct conversion_matrix *matrix);
 
+void get_conversion_matrix_from_argb_u16(u32 format, enum drm_color_encoding encoding,
+					 enum drm_color_range range,
+					 struct conversion_matrix *matrix);
+
 #if IS_ENABLED(CONFIG_KUNIT)
 struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
 					      u16 y, u16 channel_1, u16 channel_2);
-- 
2.50.1

