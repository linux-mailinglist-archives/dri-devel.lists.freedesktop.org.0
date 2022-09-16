Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F85BA9F6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 12:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B73E10E3EF;
	Fri, 16 Sep 2022 10:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFD410E24E;
 Fri, 16 Sep 2022 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663322758; x=1694858758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6DHGceXRsrEIhrBXnrzVVtRwGuSN/qiddBCEPNwRHmY=;
 b=htQsOA58qCBWjqR5NQgL5op/UZgbWKebHvdxTqDtTp71AGvGC+KXbQfm
 xBVw4pKYoQIxI1zmV88kmp1dYjcjGSFuvxPUShuI8Zd8qsY1XCU7pJNzI
 Ik4nEYu7xsJdWWVcDOi/ZE/k92IvhPSYTxO1Oy0/n1hcpe2qpx/MrO4WN
 BcTvbtR908E+cZRNWr+57mgwfTJEGN4QQpGc8Tv4hsNJ1cbU6juOQlSSf
 g0L2XDFdQIvpKq0JNNgFTA3dWI3PBEyJIGBhz9TESesRjsUB1yZVExeYW
 QKwPzSyz7HvgV0zt4Hcn7cXxDopZW252PvZfFqc1c2dSLi2kOpD5mzFeW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="360698682"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="360698682"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 03:05:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="793051693"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 03:05:56 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/edid: Fix minimum bpc supported with DSC1.2 for
 HDMI sink
Date: Fri, 16 Sep 2022 15:35:48 +0530
Message-Id: <20220916100551.2531750-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916100551.2531750-1-ankit.k.nautiyal@intel.com>
References: <20220916100551.2531750-1-ankit.k.nautiyal@intel.com>
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
Cc: swati2.sharma@intel.com, intel-gfx@lists.freedesktop.org,
 uma.shankar@intel.com, maarten.lankhorst@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HF-VSDB/SCDB has bits to advertise support for 16, 12 and 10 bpc.
If none of the bits are set, the minimum bpc supported with DSC is 8.

This patch corrects the min bpc supported to be 8, instead of 0.

Fixes: 76ee7b905678 ("drm/edid: Parse DSC1.2 cap fields from HFVSDB block")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

v2: s/DSC1.2/DSC 1.2

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4005dab6147d..ebe02cf7cd95 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5819,7 +5819,8 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 			else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
 				hdmi_dsc->bpc_supported = 10;
 			else
-				hdmi_dsc->bpc_supported = 0;
+				/* Supports min 8 BPC if DSC 1.2 is supported*/
+				hdmi_dsc->bpc_supported = 8;
 
 			dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
 			drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
-- 
2.25.1

