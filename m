Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE937557E2C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 16:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B7A10E532;
	Thu, 23 Jun 2022 14:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA01D10E532;
 Thu, 23 Jun 2022 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655995799; x=1687531799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ki7Y0SsA8LAKpSXWlCc55TG+Zsm48GYgNs7tvupks+A=;
 b=HOV1ZRxkn7OAOxW2XfUtL1KY4p7+lM5TODAJSz2tP2Tj8gXp1HWFy0xA
 wb1T31SJOuz/u+rIBq8S/xu5UXmJ+EvVQa44Fb3Y4jD5wWMa3+nHpfrAV
 uDJEHHw95yN9fKImux7RGKl9aQMV1WQ3lGmEQtHydQBzJ7cTTVeFqo6Mv
 IHl+oW33J+ms16IOgfpeotyd3KVG40QDmIje1j1S12RGXsmdyk36lqpEf
 RMrFHvsOwWSgNNLnmz31vvlsL4DJbHzPxC5F02L93V1tQMvSP0+lZGbTw
 xQwCaJh3qcD+xfgWMJbEd/R37XKl2uSQ5fPcwuLAu/AwlaV5UYTsnBac2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="278288046"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="278288046"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 07:49:59 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="730885990"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 07:49:58 -0700
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/fourcc: Document the Intel CCS modifiers' CC plane
 expected pitch
Date: Thu, 23 Jun 2022 17:49:55 +0300
Message-Id: <20220623144955.2486736-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: intel-gfx@lists.freedesktop.org, Nanley Chery <nanley.g.chery@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver expects the pitch of the Intel CCS CC color planes to be
64 bytes aligned, adjust the modifier descriptions accordingly.

Cc: Nanley Chery <nanley.g.chery@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f1972154a5940..c1b4cfda75075 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -559,7 +559,7 @@ extern "C" {
  *
  * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
  * and at index 1. The clear color is stored at index 2, and the pitch should
- * be ignored. The clear color structure is 256 bits. The first 128 bits
+ * be 64 bytes aligned. The clear color structure is 256 bits. The first 128 bits
  * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
  * by 32 bits. The raw clear color is consumed by the 3d engine and generates
  * the converted clear color of size 64 bits. The first 32 bits store the Lower
@@ -612,9 +612,9 @@ extern "C" {
  * outside of the GEM object in a reserved memory area dedicated for the
  * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
  * main surface pitch is required to be a multiple of four Tile 4 widths. The
- * clear color is stored at plane index 1 and the pitch should be ignored. The
- * format of the 256 bits of clear color data matches the one used for the
- * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
+ * clear color is stored at plane index 1 and the pitch should be 64 bytes
+ * aligned. The format of the 256 bits of clear color data matches the one used
+ * for the I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
  * for details.
  */
 #define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
-- 
2.30.2

