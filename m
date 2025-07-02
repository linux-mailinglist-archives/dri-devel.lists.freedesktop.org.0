Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F16AF6561
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 00:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927FE10E79D;
	Wed,  2 Jul 2025 22:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KD9uWAqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FC810E79D;
 Wed,  2 Jul 2025 22:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751495947; x=1783031947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pjykhfif8y9tFVBPxooC53qU3izjmsujNuxRvc5kALs=;
 b=KD9uWAqdym8kOZda4AuS5Tk6ICHdOw9nDQOm19Pcu1VaG1MuiGPoJB4g
 TBJcHCCHksS5JYspCcMY2wL/Y+k5x2DpvtK+314Y6U7ALajYGsGO+Gb23
 qEHdzO1/NTp9WKpuYciDOzF7bGDIxTbdxYvanhaLDRUEP1yjIc/k9bKZf
 KaoiEdQ/dhGnGPREMFXgv5U8RoawBpO8StoeTsPRtwR651V9XJpC5v1V7
 t9krZFTTu+vFdh/hh9Kk+KTT9SHw+3Zbtz+FcP5YPXMbnvkm0V7R+AXEl
 CgyCX5YOjnZpSAQETPLxxh/Bh2S80B/sfOIpp3wi14/JAXV8T1bs2F0fj Q==;
X-CSE-ConnectionGUID: JwMGyAwVRf6wqY4XLrPTWQ==
X-CSE-MsgGUID: xg7wGzRgQj6Kd/EeXzuZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71239206"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="71239206"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:39:06 -0700
X-CSE-ConnectionGUID: N5X7YkjgTHWHEyiGdYBn+Q==
X-CSE-MsgGUID: xFKqQ48XTvKFpjuxw8z8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154947398"
Received: from kialmah1-desk5.jf.intel.com ([10.23.33.174])
 by fmviesa010.fm.intel.com with ESMTP; 02 Jul 2025 15:39:05 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/display: Increase DP_RECEIVER_CAP_SIZE from 15 to 16 bytes
Date: Wed,  2 Jul 2025 15:39:03 -0700
Message-ID: <20250702223903.3801654-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several Link Layer tests (4.2.2.1-2, 4.2.2.7-9) fail because DPTX doesn't
read DPCD ADAPTER_CAP addresses (0x000F and 0x220F).

4.2.2.1 test states [1]:
"Fail1: Source DUT failed to read the DPCD Receiver Capability field
(DPCD:00000h:0000Fh) through AUX_CH before link training."

4.2.2.2 test states [1]:
"Fail2: Source DUT failed to read the DPCD Extended Receiver Capability
field (DPCD:02200h:0220Fh) through AUX_CH before link training."

Additionally, the spec [2] states:
"The Source device shall respond to Hot Plug event/Hot Re-plug event by
first reading DPCD Link/Sink Device Status registers at DPCD 00200h
through 00205h –or– DPCD 02002h through 0200Fh. If the link is unstable
or lost, the Source device then reads the DPCD Receiver Capabilities
registers at DPCD 00000h through 0000Fh to determine the appropriate
information needed to train the link. The Source device shall then
initiate link training."

Increasing DP_RECEIVER_CAP_SIZE by 1 byte ensures passing the test
conditions for these link layer tests.

[1]: DisplayPort v2.1 Link Layer Compliance Test Specification
sections 4.2.2.1 & 4.2.2.2
[2]: DisplayPort Standard v2.1 - Sec 5.1.4 Source Device Behavior
upon HPD Pulse Detection

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 include/drm/display/drm_dp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 811e9238a77c..960c9757ba76 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1681,7 +1681,7 @@ enum drm_dp_phy {
 #define DP_LINK_STATUS_SIZE	   6
 
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
-#define DP_RECEIVER_CAP_SIZE		0xf
+#define DP_RECEIVER_CAP_SIZE		0x10
 #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	5
-- 
2.43.0

