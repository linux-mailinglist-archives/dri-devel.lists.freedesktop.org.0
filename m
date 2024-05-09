Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CD8C0B26
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 07:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA1510E2C7;
	Thu,  9 May 2024 05:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kw0oWiK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE6C10E244;
 Thu,  9 May 2024 05:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715233679; x=1746769679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KeNY3lnx+UHQDcoTB3ACEAUH9oN1ukBRejKjXq8LeW8=;
 b=Kw0oWiK6PfInkE/FEfmOdMRN1LFatQxv0rlhn2/hdgVHWoCC3HCaz3Ig
 4U1dIam7YCt4HhzCr8e7/SRWyoONzjU3mQKuo3bw3Rr+HtsHeh3yCmUYx
 0TgAbIByNR6d2pP9s5X3ClbNAVZBsBwIDPp5CNTyJrF7HkLH/LeC+LOG6
 CfrdZxt3TfGyI96uOJYhVIYp3905DV2JBYC1aJvuG2LGazCLA6cp03aMy
 ywIEvaYViCHH3s7rwZuCYZS059V6z8DLMzsY4A41d1tLddmhwy/MaeGgI
 6Wmv8jTh8LxrIBEoOSEqrifN86pIU4K0UnudWsCrTKuAe6SqtTRzFK51V g==;
X-CSE-ConnectionGUID: uylgWX7vQaOkXKT3Y2fyJw==
X-CSE-MsgGUID: kGQKhNNyQSKcI+MIarJKnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28645989"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="28645989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:47:58 -0700
X-CSE-ConnectionGUID: 6nXWzKvtSbKdNrM+xuSaJQ==
X-CSE-MsgGUID: k7Z0/9teQRizQP6Ur+jSxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33817629"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 08 May 2024 22:47:57 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com
Subject: [PATCH v4 3/6] drm/display: Add missing aux less alpm wake related
 bits
Date: Thu,  9 May 2024 11:01:52 +0530
Message-Id: <20240509053155.327071-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240509053155.327071-1-animesh.manna@intel.com>
References: <20240509053155.327071-1-animesh.manna@intel.com>
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

From: Jouni Högander <jouni.hogander@intel.com>

eDP1.5 adds some more bits into DP_RECEIVER_ALPM_CAP and
DP_RECEIVER_ALPM_CONFIG registers. Add definitions for these.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 0b032faa8cf2..ad0cb0a1de87 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -232,6 +232,8 @@
 
 #define DP_RECEIVER_ALPM_CAP		    0x02e   /* eDP 1.4 */
 # define DP_ALPM_CAP			    (1 << 0)
+# define DP_ALPM_PM_STATE_2A_SUPPORT	    (1 << 1) /* eDP 1.5 */
+# define DP_ALPM_AUX_LESS_CAP		    (1 << 2) /* eDP 1.5 */
 
 #define DP_SINK_DEVICE_AUX_FRAME_SYNC_CAP   0x02f   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_CAP		    (1 << 0)
@@ -677,7 +679,8 @@
 
 #define DP_RECEIVER_ALPM_CONFIG		    0x116   /* eDP 1.4 */
 # define DP_ALPM_ENABLE			    (1 << 0)
-# define DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE  (1 << 1)
+# define DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE  (1 << 1) /* eDP 1.5 */
+# define DP_ALPM_MODE_AUX_LESS		    (1 << 2) /* eDP 1.5 */
 
 #define DP_SINK_DEVICE_AUX_FRAME_SYNC_CONF  0x117   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_ENABLE	    (1 << 0)
-- 
2.29.0

