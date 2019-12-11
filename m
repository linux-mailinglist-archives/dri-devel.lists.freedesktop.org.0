Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A2711BEBB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 22:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754D76EBC8;
	Wed, 11 Dec 2019 21:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2019 21:00:36 UTC
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7656EBC4;
 Wed, 11 Dec 2019 21:00:36 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df157b60000>; Wed, 11 Dec 2019 12:55:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 11 Dec 2019 12:55:25 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 11 Dec 2019 12:55:25 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 20:55:23 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Dec 2019 20:55:23 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.42.105]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df157bb0000>; Wed, 11 Dec 2019 12:55:23 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: [PATCH v3] drm: Generalized NV Block Linear DRM format mod
Date: Wed, 11 Dec 2019 12:55:47 -0800
Message-ID: <20191211205547.6907-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576097718; bh=yzvWtXMTPwuGzAIYFeDtmfVo9JtmlDx7Uohj82eFTLU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=mhzCCtxrTUR0GW1ZrDJKKjEdLbXvPdsTN0d/IaLPdNBPGOftSH4404gue3+S/MecC
 P4+rYTKZiovcIe5EsHZrBqutJOisAT+8WAM6fVMlxMJhsKedZPSp7OQm9BBtjl+rTw
 IIVMg84VhZ0DUN1n3fXKRm9SwKS+61lKavyyFOyiL1ggsRhMEW+Os6Hl71St73/CRR
 1Czmx0JnIlCm3vt1Gqfnnkvtl4fYbYfyzBvofRFa+ZQxZSsjfk8fUwQEvz20aP6HJ1
 cbQQJAMZA0xKJJM29XLIoSVUm9gHRrbcL24SnAlD4AhjrZcb5urQCXTej69i7630sY
 gucAZ5Ubat8Nw==
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
Cc: nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Builds upon the existing NVIDIA 16Bx2 block linear
format modifiers by adding more "fields" to the
existing parameterized
DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK format modifier
macro that allow fully defining a unique-across-
all-NVIDIA-hardware bit layout using a minimal
set of fields and values.  The new modifier macro
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D is
effectively backwards compatible with the existing
macro, introducing a superset of the previously
definable format modifiers.

Backwards compatibility has two quirks.  First,
the zero value for the "kind" field, which is
implied by the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK
macro, must be special cased in drivers and
assumed to map to the pre-Turing generic kind of
0xfe, since a kind of "zero" is reserved for
linear buffer layouts on all GPUs.

Second, it is assumed backwards compatibility
is only needed when running on Tegra GPUs, and
specifically Tegra GPUs prior to Xavier.  This
is based on two assertions:

-Tegra GPUs prior to Xavier used a slightly
 different raw bit layout than desktop GPUs,
 making it impossible to directly share block
 linear buffers between the two.

-Support for the existing block linear modifiers
 was incomplete, making them useful only for
 exporting buffers created by nouveau and
 importing them to Tegra DRM as framebuffers for
 scan out.  There was no support for adding
 framebuffers using format modifiers in nouveau,
 nor importing dma-buf/PRIME GEM objects into
 nouveau userspace drivers with modifiers in Mesa.

Hence it is assumed the prior modifiers were not
intended for use on desktop GPUs, and as a
corollary, were not intended to support sharing
block linear buffers across two different NVIDIA
GPUs.

v2:
  - Added canonicalize helper function

v3:
  - Added additional bit to compression field to
    support Tesla (NV5x,G8x,G9x,GT1xx,GT2xx) class
    chips.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 122 +++++++++++++++++++++++++++++++---
 1 file changed, 114 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 3feeaa3f987a..4330d930bdbb 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -497,7 +497,113 @@ extern "C" {
 #define DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED fourcc_mod_code(NVIDIA, 1)
 
 /*
- * 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1 and later
+ * Generalized Block Linear layout, used by desktop GPUs starting with NV50/G80,
+ * and Tegra GPUs starting with Tegra K1.
+ *
+ * Pixels are arranged in Groups of Bytes (GOBs).  GOB size and layout varies
+ * based on the architecture generation.  GOBs themselves are then arranged in
+ * 3D blocks, with the block dimensions (in terms of GOBs) always being a power
+ * of two, and hence expressible as their log2 equivalent (E.g., "2" represents
+ * a block depth or height of "4").
+ *
+ * Chapter 20 "Pixel Memory Formats" of the Tegra X1 TRM describes this format
+ * in full detail.
+ *
+ *       Macro
+ * Bits  Param Description
+ * ----  ----- -----------------------------------------------------------------
+ *
+ *  3:0  h     log2(height) of each block, in GOBs.  Placed here for
+ *             compatibility with the existing
+ *             DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()-based modifiers.
+ *
+ *  4:4  -     Must be 1, to indicate block-linear layout.  Necessary for
+ *             compatibility with the existing
+ *             DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()-based modifiers.
+ *
+ *  8:5  -     Reserved (To support 3D-surfaces with variable log2(depth) block
+ *             size).  Must be zero.
+ *
+ *             Note there is no log2(width) parameter.  Some portions of the
+ *             hardware support a block width of two gobs, but it is impractical
+ *             to use due to lack of support elsewhere, and has no known
+ *             benefits.
+ *
+ * 11:9  -     Reserved (To support 2D-array textures with variable array stride
+ *             in blocks, specified via log2(tile width in blocks)).  Must be
+ *             zero.
+ *
+ * 19:12 k     Page Kind.  This value directly maps to a field in the page
+ *             tables of all GPUs >= NV50.  It affects the exact layout of bits
+ *             in memory and can be derived from the tuple
+ *
+ *               (format, GPU model, compression type, samples per pixel)
+ *
+ *             Where compression type is defined below.  If GPU model were
+ *             implied by the format modifier, format, or memory buffer, page
+ *             kind would not need to be included in the modifier itself, but
+ *             since the modifier should define the layout of the associated
+ *             memory buffer independent from any device or other context, it
+ *             must be included here.
+ *
+ * 21:20 g     GOB Height and Page Kind Generation.  The height of a GOB changed
+ *             starting with Fermi GPUs.  Additionally, the mapping between page
+ *             kind and bit layout has changed at various points.
+ *
+ *               0 = Gob Height 8, Fermi - Volta, Tegra K1+ Page Kind mapping
+ *               1 = Gob Height 4, G80 - GT2XX Page Kind mapping
+ *               2 = Gob Height 8, Turing+ Page Kind mapping
+ *               3 = Reserved for future use.
+ *
+ * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there is a further
+ *             bit remapping step that occurs at an even lower level than the
+ *             page kind and block linear swizzles.  This causes the layout of
+ *             surfaces mapped in those SOC's GPUs to be incompatible with the
+ *             equivalent mapping on other GPUs in the same system.
+ *
+ *               0 = Tegra K1 - Tegra Parker/TX2 Layout.
+ *               1 = Desktop GPU and Tegra Xavier+ Layout
+ *
+ * 25:23 c     Lossless Framebuffer Compression type.
+ *
+ *               0 = none
+ *               1 = ROP/3D, layout 1, exact compression format implied by Page
+ *                   Kind field
+ *               2 = ROP/3D, layout 2, exact compression format implied by Page
+ *                   Kind field
+ *               3 = CDE horizontal
+ *               4 = CDE vertical
+ *               5 = Reserved for future use
+ *               6 = Reserved for future use
+ *               7 = Reserved for future use
+ *
+ * 55:25 -     Reserved for future use.  Must be zero.
+ */
+#define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
+	fourcc_mod_code(NVIDIA, (0x10 | \
+				 ((h) & 0xf) | \
+				 (((k) & 0xff) << 12) | \
+				 (((g) & 0x3) << 20) | \
+				 (((s) & 0x1) << 22) | \
+				 (((c) & 0x7) << 23)))
+
+/* To grandfather in prior block linear format modifiers to the above layout,
+ * the page kind "0", which corresponds to "pitch/linear" and hence is unusable
+ * with block-linear layouts, is remapped within drivers to the value 0xfe,
+ * which corresponds to the "generic" kind used for simple single-sample
+ * uncompressed color formats on Fermi - Volta GPUs.
+ */
+static inline __u64
+drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
+{
+	if (!(modifier & 0x10) || (modifier & (0xff << 12)))
+		return modifier;
+	else
+		return modifier | (0xfe << 12);
+}
+
+/*
+ * 16Bx2 Block Linear layout, used by Tegra K1 and later
  *
  * Pixels are arranged in 64x8 Groups Of Bytes (GOBs). GOBs are then stacked
  * vertically by a power of 2 (1 to 32 GOBs) to form a block.
@@ -518,20 +624,20 @@ extern "C" {
  * in full detail.
  */
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(v) \
-	fourcc_mod_code(NVIDIA, 0x10 | ((v) & 0xf))
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0, (v))
 
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_ONE_GOB \
-	fourcc_mod_code(NVIDIA, 0x10)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_TWO_GOB \
-	fourcc_mod_code(NVIDIA, 0x11)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_FOUR_GOB \
-	fourcc_mod_code(NVIDIA, 0x12)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_EIGHT_GOB \
-	fourcc_mod_code(NVIDIA, 0x13)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_SIXTEEN_GOB \
-	fourcc_mod_code(NVIDIA, 0x14)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_THIRTYTWO_GOB \
-	fourcc_mod_code(NVIDIA, 0x15)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5)
 
 /*
  * Some Broadcom modifiers take parameters, for example the number of
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
