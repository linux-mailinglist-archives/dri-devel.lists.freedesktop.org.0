Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01BB4F1612
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 15:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDD810E0AE;
	Mon,  4 Apr 2022 13:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7112E10F5CF;
 Mon,  4 Apr 2022 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649079538; x=1680615538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+aL2KuJ6UEihn352iGjxL3BF6UK7i1fl8dUqaYgqzc=;
 b=fyQi0caPUoIgNg7KsGnVKCqfZg7EEMCvUloMj/GgDMI3SzvyDJwSBH8T
 XCxHLj/c+BHvTUeTzfCzkfAeyISzQ/a3SiYBr3A0fFw5EhHt58t08MJ2G
 ng0WGZsdUrGzsudUUIc9Wu9i2MMJCn/3CaNMfX23BK/roEx+4FD7bVKz1
 WM/OClqqOUqTuLVLhM1abWwdPtcGl+T92Fhn5XUtC9zkSzHor5cwQ/4gw
 S/s89Nk1ExlvthsA5D4uDVkQ+5dQWK4sCTnzLPnDwBh0u+ZKuOIxg+YFL
 h+YBPatkNMPQiWKkVHgAzvItqmjHcglw262q5Chmhb+2c8IAaRr5Ub82H w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="321210253"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="321210253"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 06:38:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="548656003"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 06:38:56 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/fourcc: Introduce format modifier for DG2 clear color
Date: Mon,  4 Apr 2022 16:38:45 +0300
Message-Id: <20220404133846.131401-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404133846.131401-1-imre.deak@intel.com>
References: <20220404133846.131401-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

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
---
 include/uapi/drm/drm_fourcc.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 4a5117715db3c..e5074162bcdd4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -605,6 +605,20 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
 
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
-- 
2.30.2

