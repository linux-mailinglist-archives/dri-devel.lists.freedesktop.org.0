Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0FDC5768C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2B310E80D;
	Thu, 13 Nov 2025 12:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihSe+uXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238ED10E80C;
 Thu, 13 Nov 2025 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036947; x=1794572947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FubivAmFeO/b5wU0GM6a8KRXIlwQ5H2/FGOHaVFVwOc=;
 b=ihSe+uXOchzdOAsYxfL3H7kOtbMdpyIEBhXCP8CUDSJR8Y90GhCK/5U+
 y+L+PKjZyVPiHu6BrRkmCUNZ4Wt+nldbyCHnMNymX21yJQTvp/rJZaMFw
 S3e9uQkFaeRf5jQFMDyFq1yXkloWKNUpBWqO1G7ZWfpMoHzEwVb5wOLlN
 Qb8BKBhjDq+itR5aPCWNTxlzfeBqV/Nm2TEpu6jTXix6aR9Vmgq9Ywcu1
 PHdfHp4fZI3O3BWlfs0F5D2+IvZoO37GIhW7QTr3AfqBkEWMG4sgvn3ip
 H/erNXTuF/lR83EWaSgetx4SbEt41DC5ChoK213frz0SdPSPwMEdq1qGY g==;
X-CSE-ConnectionGUID: LTmn9MX+SIG/zRiDJRUvKw==
X-CSE-MsgGUID: Jcd6SnulSJOGHpbEuCi65g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677916"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677916"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:29:07 -0800
X-CSE-ConnectionGUID: jMfypeyjQHumIJWejwco/Q==
X-CSE-MsgGUID: p9sZrAvmRaCrSwaz1BbhSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757743"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:29:05 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 06/10] drm/i915/alpm: Half LFPS cycle calculation
Date: Thu, 13 Nov 2025 17:31:15 +0530
Message-Id: <20251113120119.1437955-7-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251113120119.1437955-1-animesh.manna@intel.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
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

Add support for half LFPS cycle calculation for DP2.1 ALPM as dependent
parameters got changed.

v1: Initial version.
v2: Avoid returning early. [Jani]
v3: Use intel_crtc_has_type(). [Suraj]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 81472254ab73..33620f95ecc5 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -73,12 +73,20 @@ static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
 static void get_lfps_cycle_min_max_time(const struct intel_crtc_state *crtc_state,
 					int *min, int *max)
 {
-	if (crtc_state->port_clock < 540000) {
-		*min = 65 * LFPS_CYCLE_COUNT;
-		*max = 75 * LFPS_CYCLE_COUNT;
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
+		if (crtc_state->port_clock < 540000) {
+			*min = DISPLAY_VER(display) < 35 ? 65 * LFPS_CYCLE_COUNT : 140;
+			*max = DISPLAY_VER(display) < 35 ? 75 * LFPS_CYCLE_COUNT : 800;
+		} else {
+			*min = 140;
+			*max = 800;
+		}
 	} else {
-		*min = 140;
-		*max = 800;
+		*min = 320;
+		*max = 1600;
+		return;
 	}
 }
 
-- 
2.29.0

