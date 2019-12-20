Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD81279A1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 11:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A5F89E23;
	Fri, 20 Dec 2019 10:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7DF89D9A;
 Fri, 20 Dec 2019 10:50:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 02:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="218778115"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 20 Dec 2019 02:50:09 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/15] drm/framebuffer: Format modifier for Intel Gen 12
 render compression with Clear Color
Date: Fri, 20 Dec 2019 12:49:31 +0200
Message-Id: <20191220104931.12135-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218161105.30638-15-imre.deak@intel.com>
References: <20191218161105.30638-15-imre.deak@intel.com>
MIME-Version: 1.0
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
Cc: Nanley Chery <nanley.g.chery@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 dri-devel@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Kalyan Kondapally <kalyan.kondapally@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Gen12 display can decompress surfaces compressed by render engine with
Clear Color, add a new modifier as the driver needs to know the surface
was compressed by render engine.

V2: Description changes as suggested by Rafael.
V3: Mention the Clear Color size of 64 bits in the comments(DK)
v4: Fix trailing whitespaces
v5: Explain Clear Color in the documentation.
v6: Documentation Nitpicks(Nanley)

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: Kalyan Kondapally <kalyan.kondapally@intel.com>
Cc: Rafael Antognolli <rafael.antognolli@intel.com>
Cc: Nanley Chery <nanley.g.chery@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Mika Kahola <mika.kahola@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..1c9c3991cab6 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -434,6 +434,25 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
 
+/*
+ * Intel Color Control Surface with Clear Color (CCS) for Gen-12 render
+ * compression.
+ *
+ * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
+ * and at index 1. The clear color is stored at index 2, and the pitch should
+ * be ignored. The clear color structure is 256 bits. The first 128 bits
+ * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
+ * by 32 bits. The raw clear color is consumed by the 3d engine and generates
+ * the converted clear color of size 64 bits. The first 32 bits store the Lower
+ * Converted Clear Color value and the next 32 bits store the Higher Converted
+ * Clear Color value when applicable. The Converted Clear Color values are
+ * consumed by the DE. The last 64 bits are used to store Color Discard Enable
+ * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
+ * corresponds to an area of 4x1 tiles in the main surface. The main surface
+ * pitch is required to be a multiple of 4 tile widths.
+ */
+#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
