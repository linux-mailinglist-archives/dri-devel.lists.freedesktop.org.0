Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E352ABE135
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108C310E5E9;
	Tue, 20 May 2025 16:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cW9x5hqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2764610E5DB;
 Tue, 20 May 2025 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747760026; x=1779296026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iNgbNn1RIsNn5cN2bMGJZYTe7IT2J4mx1VNd/fvis7k=;
 b=cW9x5hqWT/VY6K/w+K4EV857LUgh0L73aUGxaehGhZ3Fs0+t+0YpVF+Z
 sr2ZlIMc3WLnFAjv8fF4n9zG7QXfiHryIadQ35zQ/cO/lhWOsAdubPlbL
 Uzqo/fl/yWQg7PKm2ynjcF4+XEtpD/KnmVRCIXvsWLOveHpHZkKKIOzNm
 aSnRaxZpiTn5aQW7M049MbcnhubE487qTN/ZNtSnxVJFipAC78IanCrvr
 EyUC6RmOhRI3MObdBhVCU7JXBwpa9Lda0IxfcDLcShysJnHN2M9jAj2E4
 oFbdPSukjr+X52iFFqHCnepP4rbhE5m6QCM8jVkRHEhPpRrctvlih6UyF w==;
X-CSE-ConnectionGUID: GzwPgSBpSkSOK3X3lq90AA==
X-CSE-MsgGUID: ytSsHbvXTxWC9qxwGENDrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37322169"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="37322169"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 09:53:45 -0700
X-CSE-ConnectionGUID: fu3Iv5/DQbiYY4ByTj62zw==
X-CSE-MsgGUID: +XWV+lHsSomXNPGM23gr6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="163038123"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.130])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 09:53:44 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 02/12] drm/dp: Add Panel Replay capability bits from DP2.1
 specification
Date: Tue, 20 May 2025 19:53:16 +0300
Message-ID: <20250520165326.1631330-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520165326.1631330-1-jouni.hogander@intel.com>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
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
index 3371e2edd9e9..91ee4c0ef0cd 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -554,8 +554,14 @@
 
 #define DP_PANEL_REPLAY_CAP_SIZE	7
 
-#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
-# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+#define DP_PANEL_REPLAY_CAP_CAPABILITY					0xb1
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT			1 /* DP 2.1 */
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK			(3 << 1)
+# define DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR			(1 << 3)
+# define DP_PANEL_REPLAY_DSC_CRC_OF_MULTIPLE_SUS_SUPPORTED			(1 << 4)
+# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED				(1 << 5)
+# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_CAPABILITY_SUPPORTED		(1 << 6)
+# define DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP	(1 << 7)
 
 #define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
 #define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
-- 
2.43.0

