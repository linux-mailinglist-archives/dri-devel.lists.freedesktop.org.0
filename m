Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD251C0D3
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC0610E079;
	Thu,  5 May 2022 13:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0396D10E079
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 13:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651757614; x=1683293614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=neIusl5FAfkPYwMM7bMt2d9+JDjvy8Kgq2GFZ7eDdMI=;
 b=be8ddF+HdVRPKjc6jvzlwaV13znq29dJS0kFxPS/keyqQVcfsQNuFxGJ
 3QuVglVzXxIOdm/qB2ydgqUxjyqcCQVBfyFs0e6m2BAaT7DCgOEmPIUDE
 uy0sKEtaraLpyO9emGwBUmnsIYABXcE91jbjEhP7GXDLDNNpu31mUBNLb
 Al+cCyFAYs+Jx9sklLy4IFHisS98wDSbYAJvicNDYz/3jOc7wkSSRUHal
 s9MRbUg6vpasQi1HESSf5GygZ2/eOjkk3tgev2n1iuIwyrDLmpSoXZeUG
 m1W98HEMzh4M3emZYfXoliApq0BAa0tGA4J4zCn6WD72MZZMu6l70Ncbu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="265702889"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="265702889"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 06:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="621296072"
Received: from sorvi2.fi.intel.com ([10.237.72.194])
 by fmsmga008.fm.intel.com with ESMTP; 05 May 2022 06:33:30 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: gfx-internal-devel@eclists.intel.com
Subject: [PATCH 1/2] drm/fourcc: Introduce format modifier for DG2 clear color
Date: Thu,  5 May 2022 16:30:56 +0300
Message-Id: <20220505133057.3003889-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220505133057.3003889-1-mika.kahola@intel.com>
References: <20220505133057.3003889-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Git-Pile: INTEL_DII
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
Cc: Nanley Chery <nanley.g.chery@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DG2 clear color render compression uses Tile4 layout. Therefore, we need
to define a new format modifier for uAPI to support clear color rendering.

v2:
  Display version is fixed. [Imre]
  KDoc is enhanced for cc modifier. [Nanley & Lionel]
v3:
  Split out the modifier addition to a separate patch.
  Clarify the modifier layout description.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Acked-by: Nanley Chery <nanley.g.chery@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220411143405.1073845-4-imre.deak@intel.com
(cherry picked from commit 9035039e1ed691cd893777a42e048003a2f349d6)
---
 include/uapi/drm/drm_fourcc.h | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0038aa01508a..b06840297cf0 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -557,6 +557,42 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
 
+/*
+ * Intel color control surfaces (CCS) for DG2 render compression.
+ *
+ * The main surface is Tile 4 and at plane index 0. The CCS data is stored
+ * outside of the GEM object in a reserved memory area dedicated for the
+ * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
+ * main surface pitch is required to be a multiple of four Tile 4 widths.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
+
+/*
+ * Intel color control surfaces (CCS) for DG2 media compression.
+ *
+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
+ * GEM object in a reserved memory area dedicated for the storage of the
+ * CCS data for all RC/RC_CC/MC compressible GEM objects. The main surface
+ * pitch is required to be a multiple of four Tile 4 widths.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
+
+/*
+ * Intel Color Control Surface with Clear Color (CCS) for DG2 render compression.
+ *
+ * The main surface is Tile 4 and at plane index 0. The CCS data is stored
+ * outside of the GEM object in a reserved memory area dedicated for the
+ * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
+ * main surface pitch is required to be a multiple of four Tile 4 widths. The
+ * clear color is stored at plane index 1 and the pitch should be ignored. The
+ * format of the 256 bits of clear color data matches the one used for the
+ * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
+ * for details.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
