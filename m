Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3B8AA5C9A
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 11:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C99F10E069;
	Thu,  1 May 2025 09:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="ks85nauZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B1D10E069
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 09:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746091355; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W3XjZxa1i4MQ/UCObv3/d6svGvDW8kWg87QRgseE0S7RBRoUJg37H2sIoVa1jXEsawbKbTP66WUZ5LmgxZDl0kRPKasAQ5KXlHQra5/NyVzkWUhe9vwThecboYuVEf/piZ+DZX67IFxvXmXq7B6uJkrATF1ktGyfveAW/LBEdIc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746091355;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HxG7XsHAz7vHjYi8rWPdj82Dhv83V6bwT5YbaVSliH8=; 
 b=h90NAtHQ2TmGfSMvazbkNnohaKIiSuHRalLkocdG3+t+11VlCFCxvxCSwiAFsbCAE05NAtHCYNhIdHoCcyeinu2stFlRtBImK3Uty2dxuDzOlQqTyFRDrHib6/BXrsmPSArrrUaHk+SJuQpkV+RRiPGG8Xh2lfAaIoZ2nwUphIE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746091355; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HxG7XsHAz7vHjYi8rWPdj82Dhv83V6bwT5YbaVSliH8=;
 b=ks85nauZh/RZLT7CTNH3uELnSG7k9ZxlCkv6hDVvULdGpfmYwhKXas8YRl/5OCtE
 Mw34qiAiMatRfx8Rphyxk9k5smKlV6cSxDUc6q7Mfm4rFHVO4nHIyQTlcoAsGsLaUqh
 ocLb0epeYgyXjlpSjWK5B3MTOQlpL8zG8NBiEycs=
Received: by mx.zohomail.com with SMTPS id 1746091353528312.8945522401059;
 Thu, 1 May 2025 02:22:33 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: tomi.valkeinen@ideasonboard.com, Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v2] drm: drm_fourcc: add 10/12/16bit software decoder YCbCr
 formats
Date: Thu,  1 May 2025 11:13:16 +0200
Message-ID: <20250501091315.247788-2-robert.mader@collabora.com>
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

This adds FOURCCs for 3-plane 10/12/16bit YCbCr formats used by software
decoders like ffmpeg, dav1d and libvpx. The intended use-case is buffer
sharing between decoders and GPUs by allocating buffers with udmabuf or
dma-heaps, avoiding unnecessary copies or format conversions.

Unlike formats typically used by hardware decoders the 10/12bit formats
use a LSB alignment. In order to allow fast implementations in GL
and Vulkan the padding must contain only zeros, so the float
representation can be calculated by multiplying with 2^6=64 or 2^4=16
respectively.

WIP MRs for Mesa, Vulkan and Gstreamer can be found at:
 - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34303
 - https://github.com/rmader/Vulkan-Docs/commits/ycbcr-16bit-lsb-formats/
 - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540

The naming scheme follows the 'P' and 'Q' formats. The 'S' stands for
'software' and was selected in order to make remembering easy.

The 'Sx16' formats could as well be 'Qx16'. We stick with 'S' as 16bit software
decoders are likely much more common than hardware ones for the foreseeable
future.

Signed-off-by: Robert Mader <robert.mader@collabora.com>

---

Changes in v2:
 - Added 16bit formats for completeness and because they are used by certain
   ffmpeg decoders
 - Changed the initial character to "S"
 - Some minor changes to the commit message

---
 drivers/gpu/drm/drm_fourcc.c  | 27 +++++++++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 3a94ca211f9c..55ddd99fd7f6 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -346,6 +346,33 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_S010,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_S210,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_S410,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_S012,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_S212,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_S412,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_S016,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_S216,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true},
+		{ .format = DRM_FORMAT_S416,            .depth = 0,  .num_planes = 3,
+		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true},
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9e..5ea4ff70b34c 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -377,6 +377,40 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/*
+ * 3 plane YCbCr LSB aligned
+ * In order to use these formats in a similar fashion to MSB aligned ones
+ * implementation can multiply the values by 2^6=64.
+ * index 0 = Y plane, [15:0] x:Y [6:10] little endian
+ * index 1 = Cr plane, [15:0] x:Cr [6:10] little endian
+ * index 2 = Cb plane, [15:0] x:Cb [6:10] little endian
+ */
+#define DRM_FORMAT_S010	fourcc_code('S', '0', '1', '0') /* 2x2 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+#define DRM_FORMAT_S210	fourcc_code('S', '2', '1', '0') /* 2x1 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+#define DRM_FORMAT_S410	fourcc_code('S', '4', '1', '0') /* non-subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+
+/*
+ * 3 plane YCbCr LSB aligned
+ * In order to use these formats in a similar fashion to MSB aligned ones
+ * implementation can multiply the values by 2^4=16.
+ * index 0 = Y plane, [15:0] x:Y [4:12] little endian
+ * index 1 = Cr plane, [15:0] x:Cr [4:12] little endian
+ * index 2 = Cb plane, [15:0] x:Cb [4:12] little endian
+ */
+#define DRM_FORMAT_S012	fourcc_code('S', '0', '1', '2') /* 2x2 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+#define DRM_FORMAT_S212	fourcc_code('S', '2', '1', '2') /* 2x1 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+#define DRM_FORMAT_S412	fourcc_code('S', '4', '1', '2') /* non-subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+
+/*
+ * 3 plane YCbCr
+ * index 0 = Y plane, [15:0] Y little endian
+ * index 1 = Cr plane, [15:0] Cr little endian
+ * index 2 = Cb plane, [15:0] Cb little endian
+ */
+#define DRM_FORMAT_S016	fourcc_code('S', '0', '1', '6') /* 2x2 subsampled Cb (1) and Cr (2) planes 16 bits per channel */
+#define DRM_FORMAT_S216	fourcc_code('S', '2', '1', '6') /* 2x1 subsampled Cb (1) and Cr (2) planes 16 bits per channel */
+#define DRM_FORMAT_S416	fourcc_code('S', '4', '1', '6') /* non-subsampled Cb (1) and Cr (2) planes 16 bits per channel */
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y
-- 
2.49.0

