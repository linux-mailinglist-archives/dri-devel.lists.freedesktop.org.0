Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7D6674CFD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 07:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B94010EA4B;
	Fri, 20 Jan 2023 06:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F183210EA49;
 Fri, 20 Jan 2023 06:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674194684; x=1705730684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AASS0FwnVNe/OPJgQFOtVGbVsH7cgW31yZ998Bbq/EI=;
 b=U7reOrVpObiyYul9SZAksZdDXSbzFKp4S7QiUnFRrTLxB5PwIbmG+WLD
 RtqS6RzgOgQIpCHFzZPGPM8DSg+fXNGScQKeaH+TIJrfBrRbid6bGehOy
 8YYcPk99w5ZyhGjmwHt+YfBE3t6kvILFtLUBe+ZTzQfJa6tsYMnRrsjDT
 rtMqERWwxJE7HwbPJL6LJl5XvXqQ+vlCGqE3s1IKiSxaRBzSiiUiCVnvO
 vnCP8dvJyVR2jL3WCP8oCvStZUyVb0xdT+FG/A4rCk8LeAXYwR+w4BN8d
 aUr+x6Oi/QfQfIbgh1jENtHo7lEuIQ996cbFyC/YQE6tacIrLkDDiT7Ei Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305880035"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="305880035"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 22:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784408771"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="784408771"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 22:04:41 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCHv2 1/2] drm: Add SDP Error Detection Configuration Register
Date: Fri, 20 Jan 2023 11:29:11 +0530
Message-Id: <20230120055912.1450647-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113043653.795183-1-arun.r.murthy@intel.com>
References: <20230113043653.795183-1-arun.r.murthy@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP2.0 E11 defines a new register to facilitate SDP error detection by a
128B/132B capable DPRX device.

v2: Update the macro name to reflect the DP spec(Harry)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 632376c291db..358db4a9f167 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -692,6 +692,9 @@
 # define DP_FEC_LANE_2_SELECT		    (2 << 4)
 # define DP_FEC_LANE_3_SELECT		    (3 << 4)
 
+#define DP_SDP_ERROR_DETECTION_CONFIGURATION	0x121	/* DP 2.0 E11 */
+#define DP_SDP_CRC16_128B132B_EN		BIT(0)
+
 #define DP_AUX_FRAME_SYNC_VALUE		    0x15c   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_VALID	    (1 << 0)
 
-- 
2.25.1

