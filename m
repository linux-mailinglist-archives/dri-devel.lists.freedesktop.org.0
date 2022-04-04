Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EDB4F160D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 15:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AAA10E00B;
	Mon,  4 Apr 2022 13:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE0E10E00B;
 Mon,  4 Apr 2022 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649079533; x=1680615533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UMpeyKNRrKSm3EcvkXoFnlv4prmjWPgpum12xxlp/D0=;
 b=RtHIGwEfO4pwT/cbx8PnlnTxzN126LWudKFScj8oTZHPsIWk237Z/cEQ
 3vOVKArCP8qSpXRRdSErzVI3U+wS0CCQHm1b+XC967RvfLMCsujj7ELRt
 T24ESIDASGPWVa65LjpvzHkjURn7nJwTkhLmIilBXZH9llhXDrqygWR9a
 akL4lQcNZmi+2scui9bUAa4NYv2DhUOdGlZSlByt4osVFdZP4RqxmGse0
 ELjJWxdEZq6XeLMCbTynjjbRMhGZ044nWKlSoo5a29H7rJUyCjLgqwnRs
 J/oVmwhu4rwgLA7pTvKRxY3iPJYpdAO+NEVDZNI9Mz37qDolTU9Kuntde A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="321210209"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="321210209"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 06:38:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="548655969"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 06:38:51 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/fourcc: Introduce format modifiers for DG2 render and
 media compression
Date: Mon,  4 Apr 2022 16:38:43 +0300
Message-Id: <20220404133846.131401-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404133846.131401-1-imre.deak@intel.com>
References: <20220404133846.131401-1-imre.deak@intel.com>
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
Cc: Nanley Chery <nanley.g.chery@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

The render/media engines on DG2 unify render compression and media
compression into a single format for the first time, using the Tile 4
layout for main surfaces. The compression algorithm is different from
any previous platform and the display engine must still be configured to
decompress either a render or media compressed surface; as such, we
need new RC and MC framebuffer modifiers to represent buffers in this
format.

v2: Clarify modifier layout description.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Acked-by: Nanley Chery <nanley.g.chery@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index b73fe6797fc37..4a5117715db3c 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -583,6 +583,28 @@ extern "C" {
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
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.30.2

