Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15FFA4AE12
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 23:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B174010E04B;
	Sat,  1 Mar 2025 22:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="wwlElTJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3588810E04B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 22:01:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1740866503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NzgP9Go8f8M9k87tjvCXZYqbhq/8HV1+vOpCDpxZLk8=;
 b=wwlElTJ/WgWWArcHqdGT3eO7GxDglBTSwBFHI3sbu+Tr8PMtUsjfzvVHTOZGQj3XA+mw5f
 RauGy+mjkdkYiypBIgCydNh3+Bfz4fm6TeMXXvoYTKn6lY4I+hmzrW6osl8jJMzy31J/FI
 9PJukWt88K9ASJIh3v9nSj/k7ACvyiWm+J2YUF0uBPblQtOcWjYbJiZQnYd35zwIhz8Fvr
 dblWzkzW1zgSMF8ZahKq6m/g5C4MQkR1VZyTsVdoMtEVJkMmmODpL7615l1GL8tRQvi7GX
 dsB227gOfcuwWXDMWcNg4taLVVmxaNfBPOZKQYx/0D776xVZcx6t1ZgCYyMD0w==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Sat, 01 Mar 2025 17:01:30 -0500
Subject: [PATCH v3] drm: add modifiers for Apple GPU layouts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-apple-twiddled-modifiers-v3-1-4b9bb79825fe@rosenzweig.io>
X-B4-Tracking: v=1; b=H4sIALmDw2cC/43NTQ6CMBCG4auYrq1ph39X3sO4KHQKkyAlLSkq4
 e4WVsaFcfl+yTyzMI+O0LPzYWEOA3myQ4zkeGBNp4YWOenYDARkAmTJ1Tj2yKeZtO5R87vVZAi
 d50ajVLlJEyEaFs9Hh4YeO329xe7IT9Y9909BbusfaJBc8jLLZK3qNAFpLs56HF4zUnsiyzY4w
 AcG2Q8MItaYvCqgwrIw+Te2rusbMlbWmhEBAAA=
X-Change-ID: 20250218-apple-twiddled-modifiers-fde1a6f4300c
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4853; i=alyssa@rosenzweig.io; 
 h=from:subject:message-id;
 bh=CNmPzzKSc1/mFhUIp7M01VBpwaXdcPou0HFNFhd3+9Y=; 
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnw4PEq4UjR7nsEHxIRJuvr58MdwYdytNM9IyL/
 IRFXF2WgamJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ8ODxAAKCRD+/lBaCvVY
 DRZND/4gKkshoHPmOK939roaIwD2ai07mX/g+62B1U0O/4h9ZI0+Yt6VsY/j1FlZpbaJQJWfCsM
 o9Oz4PahtH2FmMrDggqDxUm3v2NyiEo+hlr6R96pwPtsDIyTa65/Cd6kEWLnJskANcTT1eN+5EU
 cVF2FA8+NRqTqO7wZXCDNG9Qy/WtujdShOB83tsqX0DGD7G1PinLAZKwMQc6/MME2LYxukgb2bR
 SiBReyfkYzbQtKXUrzR4pMGJ1J5epB21I4jAPsFS0+HNkNVup7ofGHcqQsDE756S3Vl37nxS+Yk
 pmtSzJ1gPfNFtz5lj/rn8uaJ3RrFg2kzfYx+SE8VBIxXvV0OvDzcAwoqM3VkAEzbfe5K7rBYe5m
 z5BMFsvdLC7v4OXqk/Btl0U1muzH8Ne5LvLeq2P0zjzJ6LefrRauotqXnYATQbTN3HLMZWr97R1
 PepLP5hUSXWefT4nfMWnbZN+KTmCWIVSB1SV4AFkwB0D7y86wQNErstfqm/u4JP7XMh/eqoiZNI
 Ft7g3baZV4/8ta6+gt5JaJIWHjBsC10d0RmKw3wu8okr692ECDkxxHizG9DA8ADNS1AmDCS2wQn
 MMb0UBsMbT21IIfe9GHq5P6x6vagS5OK+dSLeqhu/16xxgqGTisqzse6MVJ0AT83oNWsinp4+QF
 EW4Cbzo1ADaKAMQ==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
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

Apple GPUs support various non-linear image layouts. Add modifiers for
these layouts. Mesa requires these modifiers to share non-linear buffers
across processes, but no other userspace or kernel support is
required/expected.

These layouts are notably not used for interchange across hardware
blocks (e.g. with the display controller). There are other layouts for
that but we don't support them either in userspace or kernelspace yet
(even downstream), so we don't add modifiers here.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
Changes in v3:
- Condense comments for clarity and concision.
- Add text explaining strides and planes with justification.
- Add table giving tile sizes for GPU tiled images.
- Tighten up wording.
- Link to v2: https://lore.kernel.org/r/20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io

Changes in v2:
- Rename "Twiddled" to "GPU-tiled" to match what I now believe is the canonical name.
- Add modifiers for the actual "Twiddled" layouts.
- Clarify that the body of compressed images are laid out like their
  uncompressed counterparts.
- Link to v1: https://lore.kernel.org/r/20250218-apple-twiddled-modifiers-v1-1-8551bab4321f@rosenzweig.io
---
 include/uapi/drm/drm_fourcc.h | 63 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9ed18760f3b0c88ba437c9aba3dd4f..2e21f71c500ec96b55abb04967f20630963f59f8 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -422,6 +422,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 #define DRM_FORMAT_MOD_VENDOR_MTK     0x0b
+#define DRM_FORMAT_MOD_VENDOR_APPLE   0x0c
 
 /* add more to the end as needed */
 
@@ -1494,6 +1495,68 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 /* alias for the most common tiling format */
 #define DRM_FORMAT_MOD_MTK_16L_32S_TILE  DRM_FORMAT_MOD_MTK(MTK_FMT_MOD_TILE_16L32S)
 
+/*
+ * Apple GPU layouts.
+ *
+ * Apple GPUs support nonlinear tilings with optional lossless compression.
+ *
+ * Compressed images pad the body to 128-bytes and are immediately followed by a
+ * metadata section. The metadata section rounds the image dimensions to
+ * powers-of-two and contains 8 bytes for each 16x16 compression subtile.
+ * Subtiles are interleaved (Morton order).
+ *
+ * All images are 16-byte aligned.
+ *
+ * These layouts fundamentally do not have meaningful strides. No matter how we
+ * specify strides for these layouts, userspace unaware of Apple image layouts
+ * will be unable to use correctly the specified stride for any purpose.
+ * Userspace aware of the image layouts do not use strides. The most "correct"
+ * convention would be setting the image stride to 0. Unfortunately, some
+ * software assumes the stride is at least (width * bytes per pixel). We
+ * therefore require that stride equals (width * bytes per pixel). Since the
+ * stride is arbitrary here, we pick the simplest convention.
+ *
+ * Although containing two sections, compressed image layouts are treated in
+ * software as a single plane. This is modelled after AFBC, a similar
+ * scheme. Attempting to separate the sections to be "explicit" in DRM would
+ * only generate more confusion, as software does not treat the image this way.
+ *
+ * For detailed information on the hardware image layouts, see
+ * https://docs.mesa3d.org/drivers/asahi.html#image-layouts
+ */
+
+/*
+ * Apple GPU-tiled layouts.
+ *
+ * GPU-tiled images are divided into 16KiB tiles:
+ *
+ *     Bytes per pixel  Tile size
+ *     ---------------  ---------
+ *                   1  128x128
+ *                   2  128x64
+ *                   4  64x64
+ *                   8  64x32
+ *                  16  32x32
+ *
+ * Tiles are raster-order. Pixels within a tile are interleaved (Morton order).
+ *
+ * GPU-tiled is the preferred layout (compressed if possible).
+ */
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2)
+
+/*
+ * Apple twiddled layouts.
+ *
+ * Twiddled images are padded to power-of-two dimensions. Pixels are interleaved
+ * (Morton order).
+ *
+ * Twiddled layouts are useful for sparse images due to limitation of the
+ * hardware PBE unit.
+ */
+#define DRM_FORMAT_MOD_APPLE_TWIDDLED fourcc_mod_code(APPLE, 3)
+#define DRM_FORMAT_MOD_APPLE_TWIDDLED_COMPRESSED fourcc_mod_code(APPLE, 4)
+
 /*
  * AMD modifiers
  *

---
base-commit: 0ed1356af8f629ae807963b7db4e501e3b580bc2
change-id: 20250218-apple-twiddled-modifiers-fde1a6f4300c

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

