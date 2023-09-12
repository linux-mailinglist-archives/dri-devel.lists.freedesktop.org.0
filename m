Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB479D6A0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43C410E44D;
	Tue, 12 Sep 2023 16:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B3410E44B;
 Tue, 12 Sep 2023 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694536997; x=1726072997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iPxi+9A7A29cjXv31zwo/frOJJIhIdS4yl4kgeo+Y1E=;
 b=HfXeoWwfchlvTZutN3POZjA319dojtlbA1lhc555J7YyIfp7Fx8wAHof
 tH/5advE1RBSLYEuSiu5T9n6RzjgDPpCURWp8XbRLb1Kh3NwCAjKxyZi2
 vG2AqwyxOIed9vfwb1EAa9DnLq/t8ObM1Xi2wn/MbiTRG4gSoPI64QVjQ
 j5A97YRTw3fk4TCDG8Pd3pFfFJVZFHMl5kUZem0sPnRIkF/W76EjssoWh
 E7I2O3KCeJiqd+wIoSTnXKWW9SeCsq4D5eoWaIjL3TGrFADpEvf44pKdQ
 6fXA2NW1RcW/FTNNnSr/Nq6k/AkwLTHiCYb+9an+4a30VZ1T/8E3B4dEG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442446905"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442446905"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743775799"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743775799"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 09:43:15 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915/dsc: Allow DSC only with fractional bpp when
 forced from debugfs
Date: Tue, 12 Sep 2023 22:07:35 +0530
Message-Id: <20230912163735.1075868-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

If force_dsc_fractional_bpp_en is set through debugfs allow DSC iff
compressed bpp is fractional. Continue if the computed compressed bpp
turns out to be a integer.

v2:
-Use helpers for fractional, integral bits of bits_per_pixel. (Suraj)
-Fix comment (Suraj)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 25d033622439..477d5f061633 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1905,6 +1905,9 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 	for (compressed_bppx16 = dsc_max_bpp;
 	     compressed_bppx16 >= dsc_min_bpp;
 	     compressed_bppx16 -= bppx16_step) {
+		if (intel_dp->force_dsc_fractional_bpp_en &&
+		    !intel_fractional_bpp_decimal(compressed_bppx16))
+			continue;
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
 					      limits,
@@ -1912,6 +1915,10 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 					      timeslots);
 		if (ret == 0) {
 			pipe_config->dsc.compressed_bpp_x16 = compressed_bppx16;
+			if (intel_dp->force_dsc_fractional_bpp_en &&
+			    intel_fractional_bpp_decimal(compressed_bppx16))
+				drm_dbg_kms(&i915->drm, "Forcing DSC fractional bpp\n");
+
 			return 0;
 		}
 	}
-- 
2.25.1

