Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F433C2E47C
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBA310E4D9;
	Mon,  3 Nov 2025 22:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRSN5G2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC3B10E4D4;
 Mon,  3 Nov 2025 22:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209447; x=1793745447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+HKk9ZADFgwOla3idsQwQ/rr8/DzB+VnpJERK1OCAPc=;
 b=jRSN5G2QCWnUSTIkkfqI267Iq8H1W6gJ2vLjuhuCjFi+J1pg+h/okTG6
 zF5rOWFv20yp36XsSb4JaTqWdhBOsytGEJFeYpGraAW5WXxZZ9bhW8P4H
 WvtrVRsGmnKTCuWE4C8nZk+ZXdulkbkZPVVPe0e7rd5xoD1Px1sQptpGN
 Vd9v15/JjTKRX2a/QA3zf5q+CNYEFB6eGGYCbYttZIdNp7bUNEU+cI/Cz
 0/J7OKDklqfSTHfMiEwGzxKDvBdDSCx1E/s4FBjgtDDHSX6989O+7pBuR
 MrQlGlIlIbTU+Ab/47nOHkyrmtEy9tq/Z+BjZgN6E0eiVPbTvppWCmR0o w==;
X-CSE-ConnectionGUID: v/2W7Gf3TXiRBGzqQYV8ow==
X-CSE-MsgGUID: 2BtQHkaIRQ+c6ujjhRzh6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899612"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899612"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:27 -0800
X-CSE-ConnectionGUID: agjDKTwrS1KrEQ8GJGg2kA==
X-CSE-MsgGUID: uAI+HGdkSM2hVne50arLKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707498"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:25 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 02/10] drm/i915/alpm: alpm_init() for DP2.1
Date: Tue,  4 Nov 2025 03:39:49 +0530
Message-Id: <20251103220957.1229608-3-animesh.manna@intel.com>
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

Initialize alpm for DP2.1 and separate out alpm mutex-init
from alpm-init.

v1: Initial version.
v2: Separate out mutex-init. [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c |  1 -
 drivers/gpu/drm/i915/display/intel_dp.c   | 11 ++++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 6372f533f65b..639941e332f3 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -49,7 +49,6 @@ void intel_alpm_init(struct intel_dp *intel_dp)
 		return;
 
 	intel_dp->alpm_dpcd = dpcd;
-	mutex_init(&intel_dp->alpm.lock);
 }
 
 static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0ec82fcbcf48..f995a98df2c3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6074,8 +6074,12 @@ intel_dp_detect(struct drm_connector *_connector,
 	if (ret == 1)
 		connector->base.epoch_counter++;
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (!intel_dp_is_edp(intel_dp)) {
+		if (DISPLAY_VER(display) >= 35)
+			intel_alpm_init(intel_dp);
+
 		intel_psr_init_dpcd(intel_dp);
+	}
 
 	intel_dp_detect_dsc_caps(intel_dp, connector);
 
@@ -6717,6 +6721,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	intel_hpd_enable_detection(encoder);
 
 	intel_alpm_init(intel_dp);
+	if (intel_dp->alpm_dpcd)
+		mutex_init(&intel_dp->alpm.lock);
 
 	/* Cache DPCD and EDID for edp. */
 	has_dpcd = intel_edp_init_dpcd(intel_dp, connector);
@@ -6932,6 +6938,9 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 
 	intel_psr_init(intel_dp);
 
+	if (DISPLAY_VER(display) >= 35)
+		mutex_init(&intel_dp->alpm.lock);
+
 	return true;
 
 fail:
-- 
2.29.0

