Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6E7E7B4E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C2010E97E;
	Fri, 10 Nov 2023 10:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3084010E977;
 Fri, 10 Nov 2023 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699611395; x=1731147395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uXKoTtlMBiAqtjnRrugq4BKRxwkUgZ/B/tZT8o45XQE=;
 b=H1q1pwu2RUyWvBh588YIjRjWspIxMuRVMHFJJ0azkCpJpl5tfdPFCnJK
 DHxJPwhB05BzgYc/1wdQswRLpOGeraTvS8UHNIjfJvVeBwl6/DqtmQ/xn
 C7XLwltQNBF5AxPY+ThFGKRKw4eIiPJN3fkNxjkreh+3BbkKEAqWivhch
 72TG4IZdmeq8KFLd1IkoiZSUJw8EHej7EYaDHHzSYWRHJaQDiI/jCp9W4
 p0R/hl7CoZPvYY38jJPpr2pHtaGtg8xUzOlAoDQ06/9XkMH/IiMqcgc34
 aGsFAyWHD8YE2E/nZB5VQsHS/gSyPEqaO8L4JaH8SlKKHJ8X/emCBTQr7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11712828"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11712828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4816424"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:33 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/11] drm/i915/dsc: Allow DSC only with fractional bpp when
 forced from debugfs
Date: Fri, 10 Nov 2023 15:40:17 +0530
Message-Id: <20231110101020.4067342-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, suraj.kandpal@intel.com,
 suijingfeng@loongson.cn, swati2.sharma@intel.com
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
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e53c87825194..607d03382db8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1928,6 +1928,9 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 	for (compressed_bppx16 = dsc_max_bpp;
 	     compressed_bppx16 >= dsc_min_bpp;
 	     compressed_bppx16 -= bppx16_step) {
+		if (intel_dp->force_dsc_fractional_bpp_en &&
+		    !to_bpp_frac(compressed_bppx16))
+			continue;
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
 					      limits,
@@ -1935,6 +1938,10 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 					      timeslots);
 		if (ret == 0) {
 			pipe_config->dsc.compressed_bpp_x16 = compressed_bppx16;
+			if (intel_dp->force_dsc_fractional_bpp_en &&
+			    to_bpp_frac(compressed_bppx16))
+				drm_dbg_kms(&i915->drm, "Forcing DSC fractional bpp\n");
+
 			return 0;
 		}
 	}
-- 
2.40.1

