Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72EE79DFC3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C81710E467;
	Wed, 13 Sep 2023 06:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605CB10E3D7;
 Wed, 13 Sep 2023 06:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694585517; x=1726121517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7aWVugTgijQTtj9o6Yu8frpQp2jezZrUVtO8omL1zK0=;
 b=c1BZeMoi/ArrGYVpH451i+oAVqiBj0MkfQTLpp007J/bgJx2Xfs4/VYD
 6liXRS0n6HGV+taTBTDP+H7gyTfLUXSL6uzsS6gOhfRJhSML5IxrJDhNm
 LOmi8aD1MxNJr4PTYpbRpzq6Zur8jO2JKaACXlu/13FfX7mqmOAFT/21r
 o/kKREWSj2v7dO01dG3JEVq6oncATP8+P03Yufol4ciSYQftkC4LZredp
 aPEk5j1A05IyQx7NRfiduGG+iRJL9pYNCQL5Q3RIQdoGAfLGdR4KuMYYl
 3bbZXNnINO62IOhJQithzKr6M4sG7UOCG/kjBSc0Mr6spcOVZlPaql/Ho Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377482592"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="377482592"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 23:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693741776"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="693741776"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga003.jf.intel.com with ESMTP; 12 Sep 2023 23:11:47 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915/dsc: Allow DSC only with fractional bpp when
 forced from debugfs
Date: Wed, 13 Sep 2023 11:36:06 +0530
Message-Id: <20230913060606.1105349-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
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
index d6c29006b816..354d78593a5f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1906,6 +1906,9 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 	for (compressed_bppx16 = dsc_max_bpp;
 	     compressed_bppx16 >= dsc_min_bpp;
 	     compressed_bppx16 -= bppx16_step) {
+		if (intel_dp->force_dsc_fractional_bpp_en &&
+		    !intel_fractional_bpp_decimal(compressed_bppx16))
+			continue;
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
 					      limits,
@@ -1913,6 +1916,10 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
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

