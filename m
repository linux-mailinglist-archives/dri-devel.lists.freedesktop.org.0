Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FACBB0A3C6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3118010E98A;
	Fri, 18 Jul 2025 12:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTlW4WhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B1310E98A;
 Fri, 18 Jul 2025 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752840121; x=1784376121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MX8ynN4NcSPUJsYyVpKTm6ydst5DsWVGctRbM/Idkf8=;
 b=mTlW4WhQePqIxFu+6A9ELEU8Sz3sP/7AiIysjvdvIg5UIbSMMTLfOpsC
 jOWBF5d8yto3WT/lK0WP0mHvJXY2pzm7cGB2GiZWpz1tK3AGPnL6yysN6
 0bW5IDSZ64iYCfVryjcdaWvBQyVD9rXqtqbGnkYE3QJHL2ogVUOt0R12B
 FcC2A/gSILmSPYXpXEGnAMpviFZBqoWz8n26CMllkoC3aran8eq2PNGf8
 G9ODIJ4mmIQpHoYxdJ2e3hmmzdiMR3KcpIRXjcFBgPxnarGlIKBxLuczT
 ZFWHXvF1EnN0CIEpd3RrUBCSjh8ZXqvgyhH/dJP8XF2b8eG/s4WFFENLg g==;
X-CSE-ConnectionGUID: lE1PX2VjSJSkv4VZpxx1JQ==
X-CSE-MsgGUID: e4OoWcZJRYKrkUhLIYeDhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54345503"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54345503"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 05:02:01 -0700
X-CSE-ConnectionGUID: eYVX+w+0Rau0k7BaY3O8xQ==
X-CSE-MsgGUID: Thr2z+/ETBW9juJ0YAnVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="163674628"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.63])
 by orviesa005.jf.intel.com with SMTP; 18 Jul 2025 05:01:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Jul 2025 15:01:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 1/4] drm/dp: Add definitions for POST_LT_ADJ training
 sequence
Date: Fri, 18 Jul 2025 15:01:51 +0300
Message-ID: <20250718120154.15492-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250718120154.15492-1-ville.syrjala@linux.intel.com>
References: <20250718120154.15492-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add the bit definitions needed for POST_LT_ADJ sequence.

v2: DP_POST_LT_ADJ_REQ_IN_PROGRESS is bit 1 not 5 (Jani)

Tested-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 811e9238a77c..cf318e3ddb5c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -115,6 +115,7 @@
 
 #define DP_MAX_LANE_COUNT                   0x002
 # define DP_MAX_LANE_COUNT_MASK		    0x1f
+# define DP_POST_LT_ADJ_REQ_SUPPORTED	    (1 << 5) /* 1.3 */
 # define DP_TPS3_SUPPORTED		    (1 << 6) /* 1.2 */
 # define DP_ENHANCED_FRAME_CAP		    (1 << 7)
 
@@ -583,6 +584,7 @@
 
 #define DP_LANE_COUNT_SET	            0x101
 # define DP_LANE_COUNT_MASK		    0x0f
+# define DP_POST_LT_ADJ_REQ_GRANTED         (1 << 5) /* 1.3 */
 # define DP_LANE_COUNT_ENHANCED_FRAME_EN    (1 << 7)
 
 #define DP_TRAINING_PATTERN_SET	            0x102
@@ -800,6 +802,7 @@
 
 #define DP_LANE_ALIGN_STATUS_UPDATED                    0x204
 #define  DP_INTERLANE_ALIGN_DONE                        (1 << 0)
+#define  DP_POST_LT_ADJ_REQ_IN_PROGRESS                 (1 << 1) /* 1.3 */
 #define  DP_128B132B_DPRX_EQ_INTERLANE_ALIGN_DONE       (1 << 2) /* 2.0 E11 */
 #define  DP_128B132B_DPRX_CDS_INTERLANE_ALIGN_DONE      (1 << 3) /* 2.0 E11 */
 #define  DP_128B132B_LT_FAILED                          (1 << 4) /* 2.0 E11 */
-- 
2.49.0

