Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A44FBF32
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E6810E122;
	Mon, 11 Apr 2022 14:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3AB10E122;
 Mon, 11 Apr 2022 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649687652; x=1681223652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lItut8wC09zvQNp4BsvHe8AcS3UoYs3jNbnKCKLrCA4=;
 b=EBWnkB+h0yZeutGVwRk39p8M+ua0NkpxCPUHPtm+dHkYJ8PKTXMsGDXE
 akSkx12Q6xiVpuMOs9HcY0lTyedWNNCjbMEZqFdaqaEvAyAK40YyjCk7x
 EjrDa5I3myc1c+qh1+BaB/tclWGpArbZoHHZ0ZOEvV7eGArhaGt2UxyGm
 2+rmvHnRWynxmSRS8ZfDMYZXQnXOjFDuNZ41UyKdkJ0kw+7td+c+UZuaE
 LIuD9C2wfyTbHYIqnoaUIo59yS4UXAGw/iyl+N/eumurVGebrqsNcDfbN
 lOUVJvvuE2bhA2C/KLyKI+wTcpqg4AX7Baz7EXUK/gOjBCj8vUq17UefQ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="348568494"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="348568494"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:34:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="525999813"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:34:10 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/fourcc: Introduce format modifiers for DG2 render
 and media compression
Date: Mon, 11 Apr 2022 17:34:02 +0300
Message-Id: <20220411143405.1073845-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411143405.1073845-1-imre.deak@intel.com>
References: <20220411143405.1073845-1-imre.deak@intel.com>
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
Cc: Nanley Chery <nanley.g.chery@intel.com>, dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220404133846.131401-2-imre.deak@intel.com
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

