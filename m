Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A245A7EC3E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 21:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB17D10E54C;
	Mon,  7 Apr 2025 19:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="Dn29TEJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E646310E54A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 19:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744053202; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QHYbOPzIexYLqJuuN4oqgnRC7OMShy3gXSfWAYmuwyB+2RgJ4oQw6PJOKwIApLuMp6aZ2dRjsws4GHwv61U5MmBx71+5V58CTtl9gbzddkAkUIbI1eejxfS39IUBlqq5K0Kl4kV+PW8yJBP8WlAGoki96Z+aFANRjhiD+6WIm6U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744053202;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Szn6fHCoARfehMla/Iz4sqwMq4+p7bFhYQCljEdazgM=; 
 b=CMgaJUi4hy/+RjoPwAZn41HdDn078s1CfEUWSEJjkNfPrcGsLNEXsgUsJTUK2dOLA2bjbqP3QmvO9oi393afFO6oA41Cj3bJuVF8WK1ncoAKrrS9QEDEbBkd/xnA9XgERI9ALCUU835qxvpqJ05e8Mz4KUyGDC4l5lRY48EJiOE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744053202; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Szn6fHCoARfehMla/Iz4sqwMq4+p7bFhYQCljEdazgM=;
 b=Dn29TEJ3q0QYt7EgqUhfaECRxYsO4SKvF28TaKgVyrAoGHZ04fS7fMUje47b4Xpu
 n0McfdrZhogPwkqz0J4NzXblpRV2gh+QT1rpUgQllQKnvrG18i4NSIlzBiG1vHDHjl1
 DK1BGXvuWkYY7Bd08iMCxQkwqpk0XJeKFHAWwbUw=
Received: by mx.zohomail.com with SMTPS id 1744053200244204.69512863686873;
 Mon, 7 Apr 2025 12:13:20 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Robert Mader <robert.mader@collabora.com>
Subject: [PATCH] drm: drm_fourcc: add 10/12bit software decoder YCbCr formats
Date: Mon,  7 Apr 2025 21:13:14 +0200
Message-ID: <20250407191314.500601-1-robert.mader@collabora.com>
X-Mailer: git-send-email 2.49.0
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

This adds FOURCCs for 10/12bit YCbCr formats used by software decoders
like ffmpeg, dav1d and libvpx. The intended use-case is buffer sharing
between SW-decoders and GPUs by allocating buffers with udmabuf or
dma-heaps, avoiding unnecessary copies or format conversions.

Unlike formats typically used by hardware decoders these formats
use a LSB alignment. In order to allow fast implementations in GL
and Vulkan the padding must contain only zeros, so the float
representation can calculated by simple multiplicating with 2^6=64
or 2^4=16.

WIP MRs for Mesa, Vulkan and Gstreamer can be found at:
 - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34303
 - https://github.com/rmader/Vulkan-Docs/commits/ycbcr-16bit-lsb-formats/
 - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540

The values where inspired by the corresponding VA_FOURCC_I010, however
suggestions are very welcome.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 18 ++++++++++++++++++
 include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 3a94ca211f9c..917f77703645 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -346,6 +346,24 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_I010,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_I210,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_I410,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_I012,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_I212,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_I412,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true},
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9e..f22c80031595 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -397,6 +397,26 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/*
+ * 3 plane YCbCr LSB aligned
+ * index 0 = Y plane, [15:0] x:Y [6:10] little endian
+ * index 1 = Cr plane, [15:0] x:Cr [6:10] little endian
+ * index 2 = Cb plane, [15:0] x:Cb [6:10] little endian
+ */
+#define DRM_FORMAT_I010	fourcc_code('I', '0', '1', '0') /* 2x2 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+#define DRM_FORMAT_I210	fourcc_code('I', '2', '1', '0') /* 2x1 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+#define DRM_FORMAT_I410	fourcc_code('I', '4', '1', '0') /* non-subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+
+/*
+ * 3 plane YCbCr LSB aligned
+ * index 0 = Y plane, [15:0] x:Y [4:12] little endian
+ * index 1 = Cr plane, [15:0] x:Cr [4:12] little endian
+ * index 2 = Cb plane, [15:0] x:Cb [4:12] little endian
+ */
+#define DRM_FORMAT_I012	fourcc_code('I', '0', '1', '2') /* 2x2 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+#define DRM_FORMAT_I212	fourcc_code('I', '2', '1', '2') /* 2x1 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+#define DRM_FORMAT_I412	fourcc_code('I', '4', '1', '2') /* non-subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+
 
 /*
  * Format Modifiers:
-- 
2.49.0

