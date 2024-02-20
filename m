Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4573C85C810
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FB510E565;
	Tue, 20 Feb 2024 21:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7NFfVtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0724189EFF;
 Tue, 20 Feb 2024 21:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463912; x=1739999912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=stnwMc6mQ3RTY402oB4l7+Lk8cQ4AeMSDVhPTcMT8Pk=;
 b=T7NFfVtrrFDl4zecnMkN/VN+hfqdC5sH+Vv95klO2RuCHwdhXgO7CFOz
 aYTTpSWbLZHPL6GDLqAaEy63LMDGO26dytYi4qbM3OjPxtZv2gHF5QF9i
 gk5ZF4VPNpciLpfDlaerF9Cdme8vY/8qnDu22X/v5JNTKb7DuOaiXpCX/
 YQFLR9NdnIean0GYBW6nH7C6Do3TC6Uq7JG77xwUzij+fkKH37qQUGiud
 8HB1veFnX84GIQ9ispbb5MmbAvejmc5t4rTuVBZH5kLSLFXfgFE3uPNry
 VA+Lw6J7EYgaYtxwyQRmG9oNbKZj04T/TSDWLyvqQPARitURUHa4vAchI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738657"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061594"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:30 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 07/21] drm/i915/dp: Export
 intel_dp_max_common_rate/lane_count()
Date: Tue, 20 Feb 2024 23:18:27 +0200
Message-Id: <20240220211841.448846-8-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export intel_dp_max_common_rate() and intel_dp_max_lane_count() used by
a follow-up patch enabling the DP tunnel BW allocation mode.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c7e3e4efc324e..20e04cbdffcae 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -309,7 +309,7 @@ static int intel_dp_common_rate(struct intel_dp *intel_dp, int index)
 }
 
 /* Theoretical max between source and sink */
-static int intel_dp_max_common_rate(struct intel_dp *intel_dp)
+int intel_dp_max_common_rate(struct intel_dp *intel_dp)
 {
 	return intel_dp_common_rate(intel_dp, intel_dp->num_common_rates - 1);
 }
@@ -326,7 +326,7 @@ static int intel_dp_max_source_lane_count(struct intel_digital_port *dig_port)
 }
 
 /* Theoretical max between source and sink */
-static int intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
+int intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	int source_max = intel_dp_max_source_lane_count(dig_port);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 4667870fed31a..ee0600b4425e1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -102,6 +102,8 @@ int intel_dp_max_link_rate(struct intel_dp *intel_dp);
 int intel_dp_max_lane_count(struct intel_dp *intel_dp);
 int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state);
 int intel_dp_rate_select(struct intel_dp *intel_dp, int rate);
+int intel_dp_max_common_rate(struct intel_dp *intel_dp);
+int intel_dp_max_common_lane_count(struct intel_dp *intel_dp);
 
 void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
 			   u8 *link_bw, u8 *rate_select);
-- 
2.39.2

