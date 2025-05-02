Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE8AA6E16
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 11:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926B310E8E2;
	Fri,  2 May 2025 09:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENCQu8Z6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DA410E8E2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746178005; x=1777714005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=74jUS30QYIsYKfFUH4do1WuJcfXFRt9F0b8n56/JNxU=;
 b=ENCQu8Z6uPFBTSLeCtjc/YvOEadNrVf51JfAsbzi3hdoL1V7KPwnRtVt
 a9XEEXlzr3HdY2cmbi3CvyptwCbvgpwiYddwVm115CCvzK4RgIe20Ajc4
 ZyteEMZqnvqcYmxgX7Em/1/sh3Qj1u+C9RdlrQBplW0x0NfLyT6FJXKk/
 OKbLq0aIWzDecHhukhL/n/s8rVCp82jtCbsy0m9R6w9qQumxtfVNC/sR4
 U6SF6NajuefDUNJsxlkCzkWttGhWeoAkotvCW2XD1VwNNv7EDSRM1mxu6
 8LAJ5vFabqShK9qlAJo/Mm+FQfvufEKMzsnQxpEkmUr2iqePLJKncyfZK A==;
X-CSE-ConnectionGUID: 4C3SkHdKQ7O88PYAmQMnTQ==
X-CSE-MsgGUID: u+4BZ8v2TkmZrSFP3aywkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47770556"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="47770556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 02:26:45 -0700
X-CSE-ConnectionGUID: XGYM0NaeSHOlULSP68SB/g==
X-CSE-MsgGUID: N4FwVpi9RIm24x/1VNaBJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="135575591"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.55])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 02:26:41 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 01/11] drm/dp: Add Panel Replay capability bits from DP2.1
 specification
Date: Fri,  2 May 2025 12:26:27 +0300
Message-ID: <20250502092627.172869-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add PANEL REPLAY CAPABILITY register (0xb1) bits.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 3001c0b6e7bb3..47e7d55e2803f 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -552,8 +552,14 @@
 # define DP_PANEL_REPLAY_SU_SUPPORT			(1 << 1)
 # define DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT	(1 << 2) /* eDP 1.5 */
 
-#define DP_PANEL_PANEL_REPLAY_CAPABILITY		0xb1
-# define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+#define DP_PANEL_PANEL_REPLAY_CAPABILITY					0xb1
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT			1 /* DP 2.1 */
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK			(3 << 1)
+# define DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR			(1 << 3)
+# define DP_PANEL_REPLAY_DSC_CRC_OF_MULTIPLE_SUS_SUPPORTED			(1 << 4)
+# define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED				(1 << 5)
+# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_CAPABILITY_SUPPORTED		(1 << 6)
+# define DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP	(1 << 7)
 
 #define DP_PANEL_PANEL_REPLAY_X_GRANULARITY		0xb2
 #define DP_PANEL_PANEL_REPLAY_Y_GRANULARITY		0xb4
-- 
2.43.0

