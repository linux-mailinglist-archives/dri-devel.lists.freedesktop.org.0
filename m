Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF8A44EFC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B6310E7FE;
	Tue, 25 Feb 2025 21:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="NXNBRF3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B484610E7F7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:35:45 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1740519340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SQB6S+lh0hzINQjumNTIEedaSDDvME+crToOT8AlV2s=;
 b=NXNBRF3ciaiAgahfJskC2owN0RJ208InN9vyPrDN/99bHUMcg+F7Y18W+SSC8c3ymk8Wzq
 HQNxApnYwinlC0ByDlAdjSx3nNHDnA28eDZYHGT1/uQa3grlk58C6luKBAoob7rJdYhTGg
 PK3/5HuMSXHYKOHzCAmXv352eDFBAO1OLxTI7gXxYvMugMVJ5l8d6JxZUUxm6mVc/6ESrj
 g08Rrf/rBBOEAc7+izEwLGOuu3rsnOE6ZcSlM917qbwnWC+lX/IJkNxiTGivyTJyEKkVhc
 TTFhy6JXj/O9GYj/hWUh/lU/fHzwYVMKqn1dwz+Gc+I/zbaXCgBoL0EG3pgh8w==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 25 Feb 2025 16:35:36 -0500
Subject: [PATCH v2] drm: add modifiers for Apple GPU layouts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io>
X-B4-Tracking: v=1; b=H4sIAKc3vmcC/42NQQ6CMBBFr0Jm7ZhOAUNceQ/CotApTIKUtARUw
 t2tnMDle8l/f4fIQTjCPdsh8CpR/JRAXzLoBjP1jGITg1a6VJoqNPM8Mi6bWDuyxae34oRDRGe
 ZzM0VuVIdpPkc2MnrTNdN4kHi4sP7fFrpZ/+IroSEVVlSa9oi1+QewUeePhtLfxUPzXEcXzcg6
 3XEAAAA
X-Change-ID: 20250218-apple-twiddled-modifiers-fde1a6f4300c
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985; i=alyssa@rosenzweig.io; 
 h=from:subject:message-id;
 bh=FUaTnXw8Eh9mm3P9QBYvD2GKvGuQyztGJ7YcatN8jbg=; 
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnvjerxYTOPrAVSscpy1D7BqUFO3V2fZ1m7eL8g
 kPjZrBe/CGJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ743qwAKCRD+/lBaCvVY
 DTF5D/4osviRwizOiiPhiA2bg5pZ10GBDMFUCxokWl6xikeoD6uJT6LZYDm4Dou3M7xVdQ6iFl9
 HAY2H6r/CzPV0tkQ6nRAta/z6wu0YcUBV4RGYYOthIiWmfp7V8KZK9aCubUEW7lMEiWuntBeNo0
 kJNii0XMKO8J6DyDWw88IFtVUki3hPqv6WhQ0G/RLEbESNYRsk/oI4Z9W1r0kkDvg4aIOaPZUwF
 stbz+hVEZ+5IaY6JrUjciuLq2zMYGzrQjDf2ItZSRuKW1HCV7nSEs2VbiXE95fNE0C54NNZAV6Q
 zAWtIC1cuuFKpEJ3hGZpKU7fWeLSBBQ8wsZLCkFmQneT1wRC07dJChYSnEnR8WYMCUk3CUik/Z3
 HvBvIbnTXnKi3yaOLrlf55StzhdZbn3yzFOHj3+a5eTxrsogxiZUW8/oNJOfcIS2UShhR498WVY
 O8jhao7CE5A7+np03TZK+xMSqMDGE3CppY7OG7GVHp0PKsGn9nFCfo84aM84wXVNC26SNSlc1t4
 kpzRqS/lCoxKq+F6U7gwlKyCNrvyFBNa+K49T/YKuHOwzOLN6iHZWApBkN+8YAEpIHoQgHHhAMM
 cwKd5n0RMX/KgR1UV5A6P/gbWU7JBqgYd95Q2KofilFSl84HNJWV88rJc2xdDAE9cWEiTD04GIJ
 7MmoebZFT0srwcA==
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
Changes in v2:
- Rename "Twiddled" to "GPU-tiled" to match what I now believe is the canonical name.
- Add modifiers for the actual "Twiddled" layouts.
- Clarify that the body of compressed images are laid out like their
  uncompressed counterparts.
- Link to v1: https://lore.kernel.org/r/20250218-apple-twiddled-modifiers-v1-1-8551bab4321f@rosenzweig.io
---
 include/uapi/drm/drm_fourcc.h | 58 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9ed18760f3b0c88ba437c9aba3dd4f..8668c0275677bbc0a82a1028f122bacfb44a867b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -422,6 +422,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 #define DRM_FORMAT_MOD_VENDOR_MTK     0x0b
+#define DRM_FORMAT_MOD_VENDOR_APPLE   0x0c
 
 /* add more to the end as needed */
 
@@ -1494,6 +1495,63 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 /* alias for the most common tiling format */
 #define DRM_FORMAT_MOD_MTK_16L_32S_TILE  DRM_FORMAT_MOD_MTK(MTK_FMT_MOD_TILE_16L32S)
 
+/*
+ * Apple GPU-tiled layout.
+ *
+ * GPU-tiled images are divided into tiles. Tiles are always 16KiB, with
+ * dimensions depending on the base-format. Within a tile, pixels are fully
+ * interleaved (Morton order). Tiles themselves are raster-order.
+ *
+ * Images must be 16-byte aligned.
+ *
+ * For more information see
+ * https://docs.mesa3d.org/drivers/asahi.html#image-layouts
+ *
+ * When lossless compression is impossible, this is the preferred layout.
+ */
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)
+
+/*
+ * Apple compressed GPU-tiled layout.
+ *
+ * Compressed GPU-tiled images contain a body laid out like
+ * DRM_FORMAT_MOD_APPLE_GPU_TILED followed by a metadata section.
+ *
+ * The metadata section contains 8 bytes for each 16x16 compression subtile. The
+ * metadata section pads the image to power-of-two dimensions, and compression
+ * subtiles are interleaved (Morton order). By convention, the metadata
+ * immediately follows the body, after padding the body to 128-bytes.
+ *
+ * Images must be 16-byte aligned.
+ *
+ * This is the preferred layout.
+ */
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2)
+
+/*
+ * Apple twiddled layout.
+ *
+ * Twiddled images are padded to power-of-two dimensions, with pixels fully
+ * interleaved (Morton order).
+ *
+ * Images must be 16-byte aligned.
+ *
+ * GPU-tiling is preferred to twiddling. Twiddled images are mainly useful for
+ * sparse images, due to a limitation of the PBE unit.
+ */
+#define DRM_FORMAT_MOD_APPLE_TWIDDLED fourcc_mod_code(APPLE, 3)
+
+/*
+ * Apple compressed twiddled layout.
+ *
+ * Compressed twiddled images contain a body laid out like
+ * DRM_FORMAT_MOD_APPLE_TWIDDLED layout followed by metadata laid out like
+ * DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED metadata.
+ *
+ * Images must be 16-byte aligned.
+ */
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

