Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B368DABF36C
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD83112E5B;
	Wed, 21 May 2025 11:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtIFliOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AACA112E56;
 Wed, 21 May 2025 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828424; x=1779364424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H1a9jQIXs96Q0w4TDT803ob1+msFN65JiJ2nG6enZ8k=;
 b=VtIFliOyI+g2O8xw7MRtKNHWnDfzV33FIab4F4hfFNLpJmjOpoS6PSG7
 bK/yMjEy8qVLozFhGca7YUu8+GDnrLq0P7izygLD5XYclqegO3HpZqPyF
 s5rB/uivlm/W4RuT9zym2wVKHY3QF7y8bw5ApCogi8y1nQV2WKXfjYJ8n
 eUz3OOJ5dZ2zh5x/8lETdDd4zs19I3AS1bSAUHizPgJaLLOObG8VUDNOd
 P4QdgkEVmFWUp7vJBqEuyo4th9b7AkkX0YAYzlND11GVRqHooi0XkefsC
 xE2S4uOvj7TiAEvab0x3Bm/zX0wqBUqrRsov/iCOAS//yC1r14sgDIveT g==;
X-CSE-ConnectionGUID: R4aOSmwuSKe9hF8znBtKzA==
X-CSE-MsgGUID: PvQPsgHkSM6ijdLgOxmK5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67217789"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="67217789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:43 -0700
X-CSE-ConnectionGUID: 8Buut/IzTXuUqg1EbMqhdA==
X-CSE-MsgGUID: AhYOvYanTMqBeNmAsbZ+4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140452865"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:41 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 02/12] drm/dp: Add Panel Replay capability bits from DP2.1
 specification
Date: Wed, 21 May 2025 14:53:09 +0300
Message-ID: <20250521115319.2380655-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521115319.2380655-1-jouni.hogander@intel.com>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
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

v3:
  - added DP_DSC_DECODE_CAPABILITY definitions
  - use defined shift instead of hardcoded value
v2: comment about DP2.1 changed as DP2.1a

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 3371e2edd9e9..811e9238a77c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -554,8 +554,18 @@
 
 #define DP_PANEL_REPLAY_CAP_SIZE	7
 
-#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
-# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+#define DP_PANEL_REPLAY_CAP_CAPABILITY					0xb1
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT			1 /* DP 2.1a */
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK			(3 << DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT)
+# define DP_DSC_DECODE_CAPABILITY_IN_PR_SUPPORTED				0x00
+# define DP_DSC_DECODE_CAPABILITY_IN_PR_FULL_FRAME_ONLY				0x01
+# define DP_DSC_DECODE_CAPABILITY_IN_PR_NOT_SUPPORTED				0x02
+# define DP_DSC_DECODE_CAPABILITY_IN_PR_RESERVED				0x03
+# define DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR			(1 << 3)
+# define DP_PANEL_REPLAY_DSC_CRC_OF_MULTIPLE_SUS_SUPPORTED			(1 << 4)
+# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED				(1 << 5)
+# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_CAPABILITY_SUPPORTED		(1 << 6)
+# define DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP	(1 << 7)
 
 #define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
 #define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
-- 
2.43.0

