Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C046EEF9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9310E9E4;
	Thu,  9 Dec 2021 16:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443A489A72;
 Thu,  9 Dec 2021 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639046895; x=1670582895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0qwuMU1+ShCnCFqCOhdeQPqaCkYWO3mE3ynbdPPhrB8=;
 b=fQIIncHkCDaX8XraO2KHcAfOEbNWiQv1StZwNZxLnjMR/EDnGlktJzeS
 cOQL+rCbjVO0IfgAA1XPKwVGEIIbA3yWcbxlWqKlKgXHbFLxqEBoZ8Xwl
 dtoI9VSKv96VkkiHMGIPa7CrK7EechNYUTLFOFcLdYGpUQROyGfsQ+lNB
 MkQP6ZVgCtSEY1IyHJFObg60EpsjxMGLlOF0FeH/8gdb+8t3Fi2r84Ypb
 pYhBiMcYM7F6PEm3xxXeCUfDPvvffqoJKiPtnPry5vh5k1goqFGh2wHx2
 gGu78KJnhK845Ouo9f5zfsKo//JpZWxoj7CfYP2tupUCsb5HOYSAL4hGB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="218761062"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="218761062"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 02:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="680287460"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.167])
 by orsmga005.jf.intel.com with ESMTP; 09 Dec 2021 02:47:12 -0800
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Introduce new Tile 4 format
Date: Thu,  9 Dec 2021 12:47:10 +0200
Message-Id: <20211209104711.14790-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
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
Cc: nanley.g.chery@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This tiling layout uses 4KB tiles in a row-major layout. It has the same
shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
only differs from Tile Y at the 256B granularity in between. At this
granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
of 64B x 8 rows.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 7f652c96845b..a146c6df1066 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -565,6 +565,17 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
 
+/*
+ * Intel Tile 4 layout
+ *
+ * This is a tiled layout using 4KB tiles in a row-major layout. It has the same
+ * shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
+ * only differs from Tile Y at the 256B granularity in between. At this
+ * granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
+ * of 64B x 8 rows.
+ */
+#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.24.1.485.gad05a3d8e5

