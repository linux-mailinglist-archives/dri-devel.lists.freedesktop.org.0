Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763BF1B436E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 13:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D766E3E1;
	Wed, 22 Apr 2020 11:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD8F6E3E1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 11:42:43 +0000 (UTC)
IronPort-SDR: ooHsas5mq5/jrIgcpLmI3+0oejL471KHUZGN7Cjzqa2hLSx1W/3v1TGj9IGzpm3CxX/GGynftT
 EX1kUN+t8lrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 04:42:43 -0700
IronPort-SDR: 1Jh5nDALiAxpOTsxG8/NVfMmxvCzpECii/YefGsFkwbnevOrTAcSDrdwK0yDQMlswvSu6KlTb7
 oNdcsBHjQBOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="279988433"
Received: from brs2-z270m-d3h.iind.intel.com ([10.66.179.7])
 by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2020 04:42:41 -0700
From: binu.r.s@intel.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2] include/drm: sync up drm_fourcc.h
Date: Wed, 22 Apr 2020 17:06:05 +0530
Message-Id: <20200422113605.22340-1-binu.r.s@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Binu R S <binu.r.s@intel.com>, eric@engestrom.ch,
 dhinakaran.pandiyan@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Binu R S <binu.r.s@intel.com>

a) Adds new format modifiers for Intel Gen-12
	- I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS
	- I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS
b) Generated using make headers_install
c) Generated from drm-next

Signed-off-by: Binu R S <binu.r.s@intel.com>
---
 include/drm/drm_fourcc.h | 54 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 5c69090d505a..8bc0b31597d8 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -69,7 +69,7 @@ extern "C" {
 #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
 				 ((__u32)(c) << 16) | ((__u32)(d) << 24))
 
-#define DRM_FORMAT_BIG_ENDIAN (1<<31) /* format is big endian instead of little endian */
+#define DRM_FORMAT_BIG_ENDIAN (1U<<31) /* format is big endian instead of little endian */
 
 /* Reserve 0 for the invalid format specifier */
 #define DRM_FORMAT_INVALID	0
@@ -381,7 +381,7 @@ extern "C" {
  * This is a tiled layout using 4Kb tiles in row-major layout.
  * Within the tile pixels are laid out in 16 256 byte units / sub-tiles which
  * are arranged in four groups (two wide, two high) with column-major layout.
- * Each group therefore consists out of four 256 byte units, which are also laid
+ * Each group therefore consits out of four 256 byte units, which are also laid
  * out as 2x2 column-major.
  * 256 byte units are made out of four 64 byte blocks of pixels, producing
  * either a square block or a 2:1 unit.
@@ -410,6 +410,30 @@ extern "C" {
 #define I915_FORMAT_MOD_Y_TILED_CCS	fourcc_mod_code(INTEL, 4)
 #define I915_FORMAT_MOD_Yf_TILED_CCS	fourcc_mod_code(INTEL, 5)
 
+/*
+ * Intel color control surfaces (CCS) for Gen-12 render compression.
+ *
+ * The main surface is Y-tiled and at plane index 0, the CCS is linear and
+ * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
+ * main surface. In other words, 4 bits in CCS map to a main surface cache
+ * line pair. The main surface pitch is required to be a multiple of four
+ * Y-tile widths.
+ */
+#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS fourcc_mod_code(INTEL, 6)
+
+/*
+ * Intel color control surfaces (CCS) for Gen-12 media compression
+ *
+ * The main surface is Y-tiled and at plane index 0, the CCS is linear and
+ * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
+ * main surface. In other words, 4 bits in CCS map to a main surface cache
+ * line pair. The main surface pitch is required to be a multiple of four
+ * Y-tile widths. For semi-planar formats like NV12, CCS planes follow the
+ * Y and UV planes i.e., planes 0 and 1 are used for Y and UV surfaces,
+ * planes 2 and 3 for the respective CCS.
+ */
+#define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
@@ -648,7 +672,21 @@ extern "C" {
  * Further information on the use of AFBC modifiers can be found in
  * Documentation/gpu/afbc.rst
  */
-#define DRM_FORMAT_MOD_ARM_AFBC(__afbc_mode)	fourcc_mod_code(ARM, __afbc_mode)
+
+/*
+ * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
+ * modifiers) denote the category for modifiers. Currently we have only two
+ * categories of modifiers ie AFBC and MISC. We can have a maximum of sixteen
+ * different categories.
+ */
+#define DRM_FORMAT_MOD_ARM_CODE(__type, __val) \
+	fourcc_mod_code(ARM, ((__u64)(__type) << 52) | ((__val) & 0x000fffffffffffffULL))
+
+#define DRM_FORMAT_MOD_ARM_TYPE_AFBC 0x00
+#define DRM_FORMAT_MOD_ARM_TYPE_MISC 0x01
+
+#define DRM_FORMAT_MOD_ARM_AFBC(__afbc_mode) \
+	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_AFBC, __afbc_mode)
 
 /*
  * AFBC superblock size
@@ -742,6 +780,16 @@ extern "C" {
  */
 #define AFBC_FORMAT_MOD_BCH     (1ULL << 11)
 
+/*
+ * Arm 16x16 Block U-Interleaved modifier
+ *
+ * This is used by Arm Mali Utgard and Midgard GPUs. It divides the image
+ * into 16x16 pixel blocks. Blocks are stored linearly in order, but pixels
+ * in the block are reordered.
+ */
+#define DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED \
+	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 1ULL)
+
 /*
  * Allwinner tiled modifier
  *
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
