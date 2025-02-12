Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2B7A32B56
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBD410E8FF;
	Wed, 12 Feb 2025 16:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mItAcNv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187EB89496;
 Wed, 12 Feb 2025 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739377073; x=1770913073;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XpJV35U97FhYK+AL8Yda+oOzRCN0Xjo9cKENv+kQkaA=;
 b=mItAcNv8mb3XVnqF/ax5sTlzG38N6j6qc1dfvx3ZY9YpcnhdPGm8NUwA
 P1nEkb/JIRdNHE1DxG599AA0wq9D50YIBAQOEJkt79yn8unyYPzwOl/sB
 pFV4OEGYPH/+2ibU34NC7sNCeNus0alKvwlxOmghDouofHt8Yw2czYI0M
 nYp07kBbaeUEnr0McgX1gbYAluTe++ur+N5JXwmZPuGEN1SB2flvXi8YK
 PJ2vdJoVuLOiugKOj4VSUVmrJ2Wejc7Up3NTkMQCNe+gH8A+njfmX2muX
 TYLfPMH/tB/KGLFKaGs72EtEHazoK6oh1OjDtEuuDFUxh7qptuuxWCiPK Q==;
X-CSE-ConnectionGUID: qWsGiV6FTq23qmOfR2nzzg==
X-CSE-MsgGUID: NuSsCd0OTFyis4O+onsxlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="57447435"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="57447435"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:17:53 -0800
X-CSE-ConnectionGUID: fL9VmUs1TwKdaDdQMd+ncw==
X-CSE-MsgGUID: LzubKaaIS+aLtDS0Qa40/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="143710438"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:17:51 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH] drm: Fix DSC BPP increment decoding
Date: Wed, 12 Feb 2025 18:18:51 +0200
Message-ID: <20250212161851.4007005-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

Starting with DPCD version 2.0 bits 6:3 of the DP_DSC_BITS_PER_PIXEL_INC
DPCD register contains the NativeYCbCr422_MAX_bpp_DELTA field, which can
be non-zero as opposed to earlier DPCD versions, hence decoding the
bit_per_pixel increment value at bits 2:0 in the same register requires
applying a mask, do so.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Fixes: 0c2287c96521 ("drm/display/dp: Add helper function to get DSC bpp precision")
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 include/drm/display/drm_dp.h            | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index c488d160a3c1f..f5c596234729d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2602,7 +2602,7 @@ u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 {
 	u8 bpp_increment_dpcd = dsc_dpcd[DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT];
 
-	switch (bpp_increment_dpcd) {
+	switch (bpp_increment_dpcd & DP_DSC_BITS_PER_PIXEL_MASK) {
 	case DP_DSC_BITS_PER_PIXEL_1_16:
 		return 16;
 	case DP_DSC_BITS_PER_PIXEL_1_8:
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 784a32bfbad8f..c413ef68f9a30 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -359,6 +359,7 @@
 # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
 # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
 # define DP_DSC_BITS_PER_PIXEL_1_1          0x4
+# define DP_DSC_BITS_PER_PIXEL_MASK         0x7
 
 #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
 # define DP_PSR_IS_SUPPORTED                1
-- 
2.44.2

