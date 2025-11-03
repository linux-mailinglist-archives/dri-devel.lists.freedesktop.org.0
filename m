Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E2EC2E49D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B84610E4E9;
	Mon,  3 Nov 2025 22:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4fd4kms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9BD10E4E9;
 Mon,  3 Nov 2025 22:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209463; x=1793745463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ZfnXODM6Sn4h8xdkC5jpLXJxtJDF8RHCEAa32MR9+M=;
 b=D4fd4kmssJFs64RiM3tn1RPPOt3X6jGHF7XaCbLROSLB48z81Pu1UFZL
 JHcU8LCCksG2YYMi+9FaDkdyUjLhRGTbKYPEC2OtZj5fRO7hZvyh8pUp+
 BXOHbmfTdBm20f2t8JrP4nG9BKZ+b6XALQ945YGIuxgISwuIJ4dtGiyd8
 ihiu/agH9fwhbviV3dZyuvdm0r+OiPkNtzT9visRw2YNYPfSfUDSlk/3Z
 A+f+W1xWykGKlHLIR+YvA4f0Zlh+qQRELSFPJc1Ft8N3mIgJ0KfqFHDyr
 YdGg9QUZZCewFRAotEj0hW3G/PRKC45MlsY3pBXkAczPBlXX0Y1vqV9PJ A==;
X-CSE-ConnectionGUID: d2dwAXWUSF+mZRT0KVgj2g==
X-CSE-MsgGUID: bkapCiXoSd+AFxOM0DiPeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899628"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899628"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:42 -0800
X-CSE-ConnectionGUID: vRjUyOuMS+Ghjf9d84moOQ==
X-CSE-MsgGUID: Kx8pGCF2TJqzi0c3rIUJKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707531"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:41 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 07/10] drm/i915/alpm: Program lttpr count for DP 2.1 alpm
Date: Tue,  4 Nov 2025 03:39:54 +0530
Message-Id: <20251103220957.1229608-8-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251103220957.1229608-1-animesh.manna@intel.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
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

Issue a aux write transaction to dpcd 0xf000a with total number of lttpr
before link traning.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index aad5fe14962f..cf25fd51f452 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1624,6 +1624,16 @@ intel_dp_128b132b_link_train(struct intel_dp *intel_dp,
 	return passed;
 }
 
+static void intel_dp_update_lttpr_count(struct intel_dp *intel_dp,
+					int lttpr_count)
+{
+	if (!intel_dp_is_edp(intel_dp) ||
+	    intel_dp->lttpr_common_caps[0] <= 0x20)
+		return;
+
+	drm_dp_dpcd_writeb(&intel_dp->aux, DP_TOTAL_LTTPR_CNT, lttpr_count);
+}
+
 /**
  * intel_dp_start_link_train - start link training
  * @state: Atomic state
@@ -1660,6 +1670,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 
 	intel_dp_prepare_link_train(intel_dp, crtc_state);
 
+	intel_dp_update_lttpr_count(intel_dp, lttpr_count);
+
 	if (intel_dp_is_uhbr(crtc_state))
 		passed = intel_dp_128b132b_link_train(intel_dp, crtc_state, lttpr_count);
 	else
-- 
2.29.0

