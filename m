Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37418FC921
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 12:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ABA10E207;
	Wed,  5 Jun 2024 10:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OA9IqIbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226CD10E207
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717583480; x=1749119480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jFo7kpJXGfTqa8iWiqRY084+wTPdTmXYf1osizthiFQ=;
 b=OA9IqIbfsrczQ5awi8PiBJPL2vUPp4tbx5cl7Zau8mOQjTXXE5GKzB2E
 XoU5a6apkkmTfDWkgmPeJuKxiGhTiGWOirRutpR8FhmMVYq7ESKaOxl3C
 hPk1PnQNWhbgQGRwajIUtoyK+tD4cuIMVONaw5zS9EfttGy1FNYr744re
 PH1VH9rJxuPPPQ9acgWLdSRvtw3ND0XGBhniCL5b0o/M6OKERoBF25M89
 5Uy8Qyzn9Rhb0Yr5wEkRNEvv3MkAGFUa5ixV0pEkxpANiAtO/BVRjRNxq
 p3m2nanfMikFnoyjDxKbDcI2gmD+QMbwQZgGNSpY5EbBvdyVCLJo6xgjJ w==;
X-CSE-ConnectionGUID: TJ5/ZOE4RLWYTUc4xSj3vg==
X-CSE-MsgGUID: +tb3UaIBRD+JYbw+4SHhAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="18024500"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="18024500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 03:31:19 -0700
X-CSE-ConnectionGUID: 50j08nVURx6ECGLg6XFemQ==
X-CSE-MsgGUID: Hko/ynCFR3CTl/6ZxaEWFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37426884"
Received: from amokrov-mobl1.ccr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.37.49])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 03:31:18 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v6 05/26] drm/display: Add missing Panel Replay Enable SU
 Region ET bit
Date: Wed,  5 Jun 2024 13:31:04 +0300
Message-Id: <20240605103104.190849-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add missing Panel Replay Enable SU Region ET bit defined in DP2.1
specification.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index f246fa03a3cb..173548c6473a 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -743,6 +743,7 @@
 # define DP_PANEL_REPLAY_RFB_STORAGE_ERROR_EN           (1 << 4)
 # define DP_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR_EN      (1 << 5)
 # define DP_PANEL_REPLAY_SU_ENABLE                      (1 << 6)
+# define DP_PANEL_REPLAY_ENABLE_SU_REGION_ET            (1 << 7) /* DP 2.1 */
 
 #define PANEL_REPLAY_CONFIG2                                     0x1b1 /* eDP 1.5 */
 # define DP_PANEL_REPLAY_SINK_REFRESH_RATE_UNLOCK_GRANTED	 (1 << 0)
-- 
2.34.1

