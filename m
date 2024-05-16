Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BB8C734B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4623A10EAB1;
	Thu, 16 May 2024 08:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/ispkTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E455610EAB1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715849657; x=1747385657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fP4NKzC2aG67DdePUMpLYHiqwHRI4vt+/BJotmd6ZwQ=;
 b=J/ispkTN7Dh0WLsEtARqVOqnrLTIm9Jg+OnGApfHJYg1j6ZZvGlpxQAO
 QsyRGORZaX5EpClorjx7+KyAoXUGnMXL8Qp25Ck9Bw3nvK4MiBJIgTSzO
 5WTTTVO9nWKAUYBlKeO0e6z9nUkxAlMrlFah0ZrxlI1Vie4rQnylwkp6K
 KKzDLho1OMF89m1viJw4hA1kokqMQUQbzlla9jxOpQjXHKspU1gUId1AQ
 6id+igSElqCNCwtg08WeUcp5Qja5y+uzwhx+8VQeM6eLYSR9AXr+EIBcn
 37a7q2v6JHncbyaIpw9Bp9CE3fTPAoWBMuYyB6sjJ8PNlbgvKReJebWGG Q==;
X-CSE-ConnectionGUID: 20Xy5MnLS8KpZXAg0MdHSQ==
X-CSE-MsgGUID: wdeJJBh5RGOUwwARP5JuWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11794404"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="11794404"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:54:17 -0700
X-CSE-ConnectionGUID: hMgQIyNkSbCCYJzuoxWzzw==
X-CSE-MsgGUID: o3BPIYwxT/K3eVqHrGhRvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="36233531"
Received: from tlonnber-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.211.12])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:54:15 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 02/17] drm/panel replay: Add edp1.5 Panel Replay bits and
 register
Date: Thu, 16 May 2024 11:53:41 +0300
Message-Id: <20240516085342.1559562-1-jouni.hogander@intel.com>
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

Add PANEL_REPLAY_CONFIGURATION_2 register and some missing Panel Replay
bits.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 906949ca3cee..79bde372b152 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -544,9 +544,10 @@
 /* DFP Capability Extension */
 #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
 
-#define DP_PANEL_REPLAY_CAP                 0x0b0  /* DP 2.0 */
-# define DP_PANEL_REPLAY_SUPPORT            (1 << 0)
-# define DP_PANEL_REPLAY_SU_SUPPORT         (1 << 1)
+#define DP_PANEL_REPLAY_CAP				0x0b0  /* DP 2.0 */
+# define DP_PANEL_REPLAY_SUPPORT			(1 << 0)
+# define DP_PANEL_REPLAY_SU_SUPPORT			(1 << 1)
+# define DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT	(1 << 2) /* eDP 1.5 */
 
 #define DP_PANEL_PANEL_REPLAY_CAPABILITY		0xb1
 # define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
@@ -734,11 +735,20 @@
 
 #define PANEL_REPLAY_CONFIG                             0x1b0  /* DP 2.0 */
 # define DP_PANEL_REPLAY_ENABLE                         (1 << 0)
+# define DP_PANEL_REPLAY_VSC_SDP_CRC_EN                 (1 << 1) /* eDP 1.5 */
 # define DP_PANEL_REPLAY_UNRECOVERABLE_ERROR_EN         (1 << 3)
 # define DP_PANEL_REPLAY_RFB_STORAGE_ERROR_EN           (1 << 4)
 # define DP_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR_EN      (1 << 5)
 # define DP_PANEL_REPLAY_SU_ENABLE                      (1 << 6)
 
+#define PANEL_REPLAY_CONFIG2                                     0x1b1 /* eDP 1.5 */
+# define DP_PANEL_REPLAY_SINK_REFRESH_RATE_UNLOCK_GRANTED	 (1 << 0)
+# define DP_PANEL_REPLAY_CRC_VERIFICATION			 (1 << 1)
+# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_EN		 (1 << 2)
+# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_VAL_SEL_SHIFT 3
+# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_VAL_SEL_MASK  (0xf << 3)
+# define DP_PANEL_REPLAY_SU_REGION_SCANLINE_CAPTURE		 (1 << 7)
+
 #define DP_PAYLOAD_ALLOCATE_SET		    0x1c0
 #define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
 #define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
-- 
2.34.1

