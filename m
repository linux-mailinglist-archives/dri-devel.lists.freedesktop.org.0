Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E38401F94
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 20:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5D389C03;
	Mon,  6 Sep 2021 18:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ECC89BFF;
 Mon,  6 Sep 2021 18:27:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="219713107"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="219713107"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 11:27:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="464124876"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 11:27:25 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Nanley G Chery <nanley.g.chery@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/fourcc: Add the ADL-P specific pitch requirements
 of CCS modifiers
Date: Mon,  6 Sep 2021 21:27:15 +0300
Message-Id: <20210906182715.3915100-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210906182715.3915100-1-imre.deak@intel.com>
References: <20210906182715.3915100-1-imre.deak@intel.com>
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

On Alderlake-P for all CCS modifiers the main surface pitch must be
either 8 Y-tile width or the multiple of 16 Y-tile widths. The CCS
surface pitch must be rounded up to power-of-two.

Adjust the modifier descriptions accordingly.

Cc: Nanley G Chery <nanley.g.chery@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 45a914850be0d..b63b7fa8bbac6 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -522,8 +522,16 @@ extern "C" {
  * The main surface is Y-tiled and at plane index 0, the CCS is linear and
  * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
  * main surface. In other words, 4 bits in CCS map to a main surface cache
- * line pair. The main surface pitch is required to be a multiple of four
- * Y-tile widths.
+ * line pair.
+ *
+ * The pitch of the main surface is required to be either 8 or a multiple of
+ * 16 Y-tile widths on Alderlake-P and a multiple of 4 Y-tile widths on other
+ * platforms.
+ *
+ * The pitch of the CCS surface must be calculated using the
+ *    ccs_surface_pitch=main_surface_pitch_in_bytes / 512 * 64.
+ * formula. On Alderlake-P this pitch must be rounded up to be power-of-two
+ * sized.
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS fourcc_mod_code(INTEL, 6)
 
@@ -533,10 +541,12 @@ extern "C" {
  * The main surface is Y-tiled and at plane index 0, the CCS is linear and
  * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
  * main surface. In other words, 4 bits in CCS map to a main surface cache
- * line pair. The main surface pitch is required to be a multiple of four
- * Y-tile widths. For semi-planar formats like NV12, CCS planes follow the
+ * line pair.  For semi-planar formats like NV12, CCS planes follow the
  * Y and UV planes i.e., planes 0 and 1 are used for Y and UV surfaces,
  * planes 2 and 3 for the respective CCS.
+ *
+ * About the requirement on the main and CCS surface pitches see the
+ * description for I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS.
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
 
@@ -554,8 +564,10 @@ extern "C" {
  * Clear Color value when applicable. The Converted Clear Color values are
  * consumed by the DE. The last 64 bits are used to store Color Discard Enable
  * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
- * corresponds to an area of 4x1 tiles in the main surface. The main surface
- * pitch is required to be a multiple of 4 tile widths.
+ * corresponds to an area of 4x1 tiles in the main surface.
+ *
+ * About the requirement on the main and CCS surface pitches see the
+ * description for I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS.
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
 
-- 
2.27.0

